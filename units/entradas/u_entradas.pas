unit u_entradas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, MemDS, DBAccess, Uni, fr_estilo, fm_busca, System.ImageList,
  Vcl.ImgList, Vcl.Buttons, Vcl.StdCtrls, Vcl.NumberBox, Vcl.ComCtrls,
  cxContainer, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, fm_filtroDataCod;

type
  TPagEntradas = class(TForm)
    PopupEntradas: TPopupMenu;
    NovaEntrada: TMenuItem;
    gridEntradasDBTableView1: TcxGridDBTableView;
    gridEntradasLevel1: TcxGridLevel;
    gridEntradas: TcxGrid;
    ds_entradas: TDataSource;
    ent_codigo: TcxGridDBColumn;
    ent_produto: TcxGridDBColumn;
    ent_local: TcxGridDBColumn;
    ent_lote: TcxGridDBColumn;
    ent_quantidade: TcxGridDBColumn;
    ent_data_hora: TcxGridDBColumn;
    CancelarEntrada1: TMenuItem;
    N1: TMenuItem;
    Detalhar1: TMenuItem;
    prod_descricao: TcxGridDBColumn;
    loc_descricao: TcxGridDBColumn;
    ImageList1: TImageList;
    FiltroDataCod1: TFiltroDataCod;
    FrameGrid1: TFrameGrid;
    qEnt: TUniQuery;
    procedure NovaEntradaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CancelarEntrada1Click(Sender: TObject);
    procedure Detalhar1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure AlterarEntradaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BuscarBtnClick(Sender: TObject);
    procedure FiltroDataCod1SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PagEntradas: TPagEntradas;

implementation

{$R *.dfm}

uses u_infoEntrada, u_dm1, u_controleForm;

procedure TPagEntradas.AlterarEntradaClick(Sender: TObject);
begin
  if not qEnt.Active then exit;
  if qEnt.RecordCount = 0 then exit;

  FormEntrada.FrameButtons1.ModoEdit.Text := 'A';
  FormEntrada.ShowModal;
end;

procedure TPagEntradas.BuscarBtnClick(Sender: TObject);
begin

  qEnt.Close;
  qEnt.Connection := dm1.con1;

  qEnt.SQL.Clear;
  qEnt.SQL.Add('select ent_codigo, ent_produto, prod_descricao, ent_local, loc_descricao, ent_lote, ent_quantidade, ent_data_hora from tb_entradas');
  qEnt.SQL.Add('inner join tb_produtos on prod_codigo = ent_produto');
  qEnt.SQL.Add('inner join tb_locais_estoque on loc_codigo = ent_local');

  if (FiltroDataCod1.DataInicialEdit.Text <> '') and (FiltroDataCod1.DataFinalEdit.Text <> '') and
     (FiltroDataCod1.CodInicialEdit.Text <> '') and (FiltroDataCod1.CodFinalEdit.Text <> '') then
  begin
    qEnt.SQL.Add('where ent_data_hora::date >= :dataInicial and ent_data_hora::date <= :dataFinal');
    qEnt.SQL.Add('and (ent_codigo >= :codigoInicial and ent_codigo <= :codigoFinal)');

    qEnt.ParamByName('dataInicial').Value := FiltroDataCod1.DataInicialEdit.Date;
    qEnt.ParamByName('dataFinal').Value := FiltroDataCod1.DataFinalEdit.Date;
    qEnt.ParamByName('codigoInicial').Value := FiltroDataCod1.CodInicialEdit.Value;
    qEnt.ParamByName('codigoFInal').Value := FiltroDataCod1.CodFinalEdit.Value;
  end
  else
  begin
    if (FiltroDataCod1.DataInicialEdit.Text <> '') and (FiltroDataCod1.DataFinalEdit.Text <> '') then
    begin
      qEnt.SQL.Add('where ent_data_hora::date >= :dataInicial and ent_data_hora::date <= :dataFinal');

      qEnt.ParamByName('dataInicial').Value := FiltroDataCod1.DataInicialEdit.Date;
      qEnt.ParamByName('dataFinal').Value := FiltroDataCod1.DataFinalEdit.Date;
    end;

    if (FiltroDataCod1.CodInicialEdit.Text <> '') and (FiltroDataCod1.CodFinalEdit.Text <> '') then
    begin
      qEnt.SQL.Add('where ent_codigo >= :codigoInicial and ent_codigo <= :codigoFinal');

      qEnt.ParamByName('codigoInicial').Value := FiltroDataCod1.CodInicialEdit.Value;
      qEnt.ParamByName('codigoFinal').Value := FiltroDataCod1.CodFinalEdit.Value;
    end;
  end;

  ds_entradas.DataSet := qEnt;
  qEnt.Open;
end;

procedure TPagEntradas.CancelarEntrada1Click(Sender: TObject);
begin
  if not qEnt.Active then exit;
  if qEnt.RecordCount = 0 then exit;

  if Confirma('Confirmar cancelamento de entrada?' + #13 + 'Esta operação será irreversível!') then
  begin
    try

      {
  try
    dm1.con1.StartTransaction;

     //CÓDIGO AQUI

    dm1.con1.Commit;

  except
    on e : Exception do
    begin
      dm1.con1.Rollback;
    end;
  end;

  }

      try
        dm1.con1.StartTransaction;

        dm1.q1.SQL.Text := 'delete from tb_entradas where ent_codigo = :codigo';
        dm1.q1.ParamByName('codigo').Value := qEnt.FieldByName('ent_codigo').AsInteger;
        dm1.q1.ExecSQL;

        dm1.q1.SQL.Text := 'delete from tb_movimentacoes where mov_cod_operacao = :entrada';
        dm1.q1.ParamByName('entrada').Value := qEnt.FieldByName('ent_codigo').AsInteger;
        dm1.q1.ExecSQL;

        dm1.q1.SQL.Clear;
        dm1.q1.SQL.Add('update tb_lotes set lote_quantidade = lote_quantidade - :quantidade');
        dm1.q1.SQL.Add('where lote_codigo = :lote');
        dm1.q1.ParamByName('lote').Value := qEnt.FieldByName('ent_lote').AsInteger;
        dm1.q1.ParamByName('quantidade').Value := qEnt.FieldByName('ent_quantidade').AsInteger;

        dm1.q1.ExecSQL;

        dm1.con1.Commit;
        Mensagem('Entrada cancelada com sucesso!');
        gridEntradasDBTableView1.DataController.RefreshExternalData;
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

procedure TPagEntradas.Detalhar1Click(Sender: TObject);
begin
  if not qEnt.Active then exit;
  if qEnt.RecordCount = 0 then exit;

  FormEntrada.FrameButtons1.ModoEdit.Text := 'V';
  FormEntrada.ShowModal;
end;

procedure TPagEntradas.FiltroDataCod1SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TPagEntradas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
    Detalhar1Click(Sender)
  else if Key = VK_F2 then
    NovaEntradaClick(Sender)
  else if Key = VK_F3 then
    CancelarEntrada1Click(Sender);
end;

procedure TPagEntradas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(wm_nextdlgctl, 0, 0);
  end
  else if key = #27 then close
end;

procedure TPagEntradas.FormShow(Sender: TObject);
begin
  qEnt.Close;

  qEnt.SQL.Clear;
  qEnt.SQL.Add('select ent_codigo, ent_produto, prod_descricao, ent_local, loc_descricao, ent_lote, ent_quantidade, ent_data_hora');
  qEnt.SQl.Add('from tb_entradas');
  qEnt.SQL.Add('left join tb_produtos');
  qEnt.SQL.Add('on ent_produto = prod_codigo');
  qEnt.SQL.Add('left join tb_locais_estoque');
  qEnt.SQL.Add('on ent_local = loc_codigo');
  qEnt.SQL.Add('where ent_data_hora::date = :data');

  qEnt.ParamByName('data').Value := Date;

  qEnt.Open;

  FiltroDataCod1.DataInicialEdit.Date := Date;
  FiltroDataCod1.DataFinalEdit.Date := Date;
  FiltroDataCod1.CodInicialEdit.Clear;
  FiltroDataCod1.CodFinalEdit.Clear;
end;

procedure TPagEntradas.NovaEntradaClick(Sender: TObject);
begin
  FormEntrada.FrameButtons1.ModoEdit.Text := 'N';
  FormEntrada.ShowModal;
end;

end.
