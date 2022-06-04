unit u_saidas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_busca, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, Vcl.Menus, MemDS, DBAccess, Uni,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, fr_estilo, Vcl.ExtCtrls, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Buttons, Vcl.StdCtrls, Vcl.NumberBox,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, System.ImageList,
  Vcl.ImgList, fm_filtroDataCod;

type
  TPagSaidas = class(TForm)
    ds_saidas: TDataSource;
    PopupSaidas: TPopupMenu;
    Detalhar1: TMenuItem;
    NovaSaida: TMenuItem;
    N1: TMenuItem;
    CancelarSaida: TMenuItem;
    FrameGrid1: TFrameGrid;
    gridSaidas: TcxGrid;
    gridSaidasDBTableView1: TcxGridDBTableView;
    gridSaidasLevel1: TcxGridLevel;
    sai_codigo: TcxGridDBColumn;
    sai_produto: TcxGridDBColumn;
    sai_local: TcxGridDBColumn;
    sai_lote: TcxGridDBColumn;
    sai_quantidade: TcxGridDBColumn;
    sai_data_hora: TcxGridDBColumn;
    ImageList1: TImageList;
    prod_descricao: TcxGridDBColumn;
    loc_descricao: TcxGridDBColumn;
    FiltroDataCod1: TFiltroDataCod;
    qSai: TUniQuery;
    procedure FormShow(Sender: TObject);
    procedure NovaSaidaClick(Sender: TObject);
    procedure Detalhar1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure AlterarSaidaClick(Sender: TObject);
    procedure CancelarSaidaClick(Sender: TObject);
    procedure BuscarBtnClick(Sender: TObject);
    procedure MostrarTudoBtnClick(Sender: TObject);
    procedure FiltroDataCod1CodInicialEditClick(Sender: TObject);
    procedure FiltroDataCod1SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PagSaidas: TPagSaidas;

implementation

{$R *.dfm}

uses u_dm1, u_infoSaida, u_detalharSaida, u_controleForm;

procedure TPagSaidas.AlterarSaidaClick(Sender: TObject);
begin
  if not qSai.Active then exit;
  if qSai.RecordCount = 0 then exit;

  DetalharSaidaForm.FrameButtons1.ModoEdit.Text := 'A';
  DetalharSaidaForm.ShowModal;
end;

procedure TPagSaidas.BuscarBtnClick(Sender: TObject);
begin
  qSai.Close;
  qSai.Connection := dm1.con1;

  qSai.SQL.Clear;
  qSai.SQL.Add('select sai_codigo, sai_produto, prod_descricao, sai_local, loc_descricao, sai_lote, sai_quantidade, sai_data_hora from tb_saidas');
  qSai.SQL.Add('inner join tb_produtos on prod_codigo = sai_produto');
  qSai.SQL.Add('inner join tb_locais_estoque on loc_codigo = sai_local');

  if (FiltroDataCod1.DataInicialEdit.Text <> '') and (FiltroDataCod1.DataFinalEdit.Text <> '') and
     (FiltroDataCod1.CodInicialEdit.Text <> '') and (FiltroDataCod1.CodFinalEdit.Text <> '') then
  begin
    qSai.SQL.Add('where sai_data_hora::date >= :dataInicial and sai_data_hora::date <= :dataFinal');
    qSai.SQL.Add('and sai_codigo >= :codigoInicial and sai_codigo <= :codigoFinal');

    qSai.ParamByName('dataInicial').Value := FiltroDataCod1.DataInicialEdit.Date;
    qSai.ParamByName('dataFinal').Value := FiltroDataCod1.DataFinalEdit.Date;
    qSai.ParamByName('codigoInicial').Value := FiltroDataCod1.CodInicialEdit.Value;
    qSai.ParamByName('codigoFinal').Value := FiltroDataCod1.CodFinalEdit.Value;
  end
  else
  begin  
    if (FiltroDataCod1.DataInicialEdit.Text <> '') and (FiltroDataCod1.DataFinalEdit.Text <> '') then
    begin
      qSai.SQL.Add('where sai_data_hora::date >= :dataInicial and sai_data_hora::date <= :dataFinal');

      qSai.ParamByName('dataInicial').Value := FiltroDataCod1.DataInicialEdit.Date;
      qSai.ParamByName('dataFinal').Value := FiltroDataCod1.DataFinalEdit.Date;
    end;

    if (FiltroDataCod1.CodInicialEdit.Text <> '') and (FiltroDataCod1.CodFinalEdit.Text <> '') then
    begin
      qSai.SQL.Add('where sai_codigo >= :codigoInicial and sai_codigo <= :codigoFinal');

      qSai.ParamByName('codigoInicial').Value := FiltroDataCod1.CodInicialEdit.Value;
      qSai.ParamByName('codigoFinal').Value := FiltroDataCod1.CodFinalEdit.Value;
    end;
  end;

  qSai.Open;
end;

procedure TPagSaidas.CancelarSaidaClick(Sender: TObject);
begin
  if not qSai.Active then exit;
  if qSai.RecordCount = 0 then exit;

  if Confirma('Confirmar cancelamento de saída? Operação irreversível!') then
  begin
    try
      try
        dm1.con1.StartTransaction;

        dm1.q1.SQL.Clear;

        // Atualizar lote
        dm1.q1.SQL.Add('update tb_lotes set lote_quantidade = (lote_quantidade + :quantidade) where lote_codigo = :lote;');

        dm1.q1.ParamByName('lote').Value := qSai.FieldByName('sai_lote').AsInteger;
        dm1.q1.ParamByName('quantidade').Value := qSai.FieldByName('sai_quantidade').AsInteger;
        dm1.q1.ExecSQL;

        // Deletar Saída
        dm1.q1.SQL.Add('delete from tb_saidas where sai_codigo = :saida');

        dm1.q1.ParamByName('saida').Value := qSai.FieldByName('sai_codigo').AsInteger;
        dm1.q1.ExecSQL;

        // Gerar movimentação de entrada
        dm1.q1.SQL.Clear;
        dm1.q1.SQL.Add('insert into tb_movimentacoes (mov_produto, mov_local, mov_lote, mov_operacao, mov_quantidade) values');
        dm1.q1.SQL.Add('(:produto, :local, :lote, :operacao, :quantidade)');

        dm1.q1.ParamByName('produto').Value := qSai.FieldByName('sai_produto').AsInteger;
        dm1.q1.ParamByName('local').Value := qSai.FieldByName('sai_local').AsInteger;
        dm1.q1.ParamByName('lote').Value := qSai.FieldByName('sai_lote').AsInteger;
        dm1.q1.ParamByName('operacao').Value := 'E';
        dm1.q1.ParamByName('quantidade').Value := qSai.FieldByName('sai_quantidade').AsInteger;
        dm1.q1.ExecSQL;

        dm1.con1.Commit;

        Mensagem('Saída cancelada com sucesso!');
        PagSaidas.gridSaidasDBTableView1.DataController.RefreshExternalData;
      except on e:exception do
        begin
          Erro('Erro!' + #13 + e.Message);
          dm1.con1.Rollback;
        end;
      end;
    finally
      dm1.q1.Close;
    end;
  end;
end;

procedure TPagSaidas.Detalhar1Click(Sender: TObject);
begiN
  if not qSai.Active then exit;
  if qSai.RecordCount = 0 then exit;

  DetalharSaidaForm.FrameButtons1.ModoEdit.Text := 'V';
  DetalharSaidaForm.ShowModal;
end;

procedure TPagSaidas.FiltroDataCod1CodInicialEditClick(Sender: TObject);
begin
  FiltroDataCod1.CodInicialEditClick(Sender);
end;

procedure TPagSaidas.FiltroDataCod1SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TPagSaidas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
    Detalhar1Click(Sender)
  else if Key = VK_F2 then
    NovaSaidaClick(Sender)
  else if Key = VK_F3 then
    CancelarSaidaClick(Sender);
end;

procedure TPagSaidas.FormShow(Sender: TObject);
begin
  qSai.Close;
  qSai.Connection := dm1.con1;

  qSai.SQL.Clear;
  qSai.SQL.Add('select sai_codigo, sai_produto, prod_descricao, sai_local, loc_descricao, sai_lote, sai_quantidade, sai_data_hora from tb_saidas');
  qSai.SQL.Add('inner join tb_produtos on prod_codigo = sai_produto');
  qSai.SQL.Add('inner join tb_locais_estoque on loc_codigo = sai_local');

  qSai.Open;

  FiltroDataCod1.DataInicialEdit.Date := Date;
  FiltroDataCod1.DataFinalEdit.Date := Date;
  FiltroDataCod1.CodInicialEdit.Clear;
  FiltroDataCod1.CodFinalEdit.Clear;
end;

procedure TPagSaidas.MostrarTudoBtnClick(Sender: TObject);
begin
  qSai.Close;
  qSai.Connection := dm1.con1;

  qSai.SQL.Clear;
  qSai.SQL.Add('select sai_codigo, sai_produto, prod_descricao, sai_local, loc_descricao, sai_lote, sai_quantidade, sai_data_hora from tb_saidas');
  qSai.SQL.Add('inner join tb_produtos on prod_codigo = sai_produto');
  qSai.SQL.Add('inner join tb_locais_estoque on loc_codigo = sai_local');

  qSai.Open;
end;

procedure TPagSaidas.NovaSaidaClick(Sender: TObject);
begin
  FormSaida.ModoEdit.Text := 'N';
  FormSaida.ShowModal;
end;

end.
