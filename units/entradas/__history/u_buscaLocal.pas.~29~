unit u_buscaLocal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, fm_buttons, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, MemDS, DBAccess, Uni, fr_estilo;

type
  TBuscaLocalForm = class(TForm)
    ImageList1: TImageList;
    pn_buscaProd: TPanel;
    CampoBusca: TComboBox;
    CampoEdit: TEdit;
    BuscaBtn: TBitBtn;
    FrameButtons1: TFrameButtons;
    gridLocaisDBTableView1: TcxGridDBTableView;
    gridLocaisLevel1: TcxGridLevel;
    gridLocais: TcxGrid;
    tb_locais: TUniTable;
    ds_locais: TDataSource;
    loc_codigo: TcxGridDBColumn;
    loc_descricao: TcxGridDBColumn;
    loc_status: TcxGridDBColumn;
    FrameGrid1: TFrameGrid;
    procedure BuscaBtnClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure gridLocaisDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FrameButtons1CancelarBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FrameButtons1SalvarBtnClick(Sender: TObject);
    procedure CampoBuscaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BuscaLocalForm: TBuscaLocalForm;

implementation

{$R *.dfm}

uses u_dm1, u_controleForm, u_infoSaida, u_infoEntrada, u_filtro_rel_1;

procedure TBuscaLocalForm.BuscaBtnClick(Sender: TObject);
var
  str_busca: String;

begin

  str_busca := CampoBusca.Text;

  tb_locais.Close;
  tb_locais.Connection := dm1.con1;

  if str_busca = 'CÓDIGO' then
  begin
    if CampoEdit.Text = '' then
    begin
      tb_locais.SQL.Text := 'select * from tb_locais_estoque';
    end
    else
    begin
      tb_locais.SQL.Text := 'select * from tb_locais_estoque where loc_codigo = :codigo';
      tb_locais.ParamByName('codigo').Value := StrToInt(CampoEdit.Text);
    end;
  end
  else if str_busca = 'DESCRIÇÃO' then
  begin
    tb_locais.SQL.Text := 'select * from tb_locais_estoque where loc_descricao like :descricao';
    tb_locais.ParamByName('descricao').Value := '%' + CampoEdit.Text + '%';
  end;

  ds_locais.DataSet := tb_locais;
  tb_locais.Open;

end;

procedure TBuscaLocalForm.CampoBuscaChange(Sender: TObject);
begin
  CampoEdit.Clear;
  if CampoBusca.Text = 'CÓDIGO' then
  begin
    CampoEdit.NumbersOnly := True;
    CampoEdit.MaxLength := 5;
  end
  else
  begin
    CampoEdit.NumbersOnly := False;
    CampoEdit.MaxLength := 50;
  end;
end;

procedure TBuscaLocalForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tb_locais.Close;
end;

procedure TBuscaLocalForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(wm_nextdlgctl, 0, 0);
  end
  else if key = #27 then close
end;

procedure TBuscaLocalForm.FormShow(Sender: TObject);
begin
  CampoEdit.Clear;
  CampoEdit.SetFocus;
  CampoBusca.ItemIndex := 0;
  tb_locais.Close;
  FrameButtons1.SalvarBtn.Font.Color := clRed;
end;

procedure TBuscaLocalForm.FrameButtons1CancelarBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TBuscaLocalForm.FrameButtons1SalvarBtnClick(Sender: TObject);
var
  indexLoc, codLoc: Integer;
  descLoc, statusLoc: String;

begin
  if FrameButtons1.SalvarBtn.Font.Color = clRed then
  begin
    Aviso('Selecione um produto para dar entrada!');
    Exit;
  end;

  indexLoc := gridLocaisDBTableView1.DataController.GetSelectedRowIndex(0);
  codLoc := gridLocaisDBTableView1.ViewData.Records[indexLoc].Values[0];
  descLoc := gridLocaisDBTableView1.ViewData.Records[indexLoc].Values[1];
  statusLoc := gridLocaisDBTableView1.ViewData.Records[indexLoc].Values[2];

  if (FrameButtons1.ModoEdit.Text = 'E') or (FrameButtons1.ModoEdit.Text = 'S') then
  begin
    if statusLoc = 'INATIVO' then
    begin
      Aviso('O Local de Estoque ' + descLoc + ' está INATIVO!');
      Exit;
    end;
    if FrameButtons1.ModoEdit.Text = 'E' then
    begin
      FormEntrada.CodLocalEdit.Text := IntToStr(codLoc);
      FormEntrada.DescLocalEdit.Text := descLoc;
      if FormEntrada.LoteEdit.Enabled then
        FormEntrada.LoteEdit.SetFocus;
    end
    else if FrameButtons1.ModoEdit.Text = 'S' then
    begin
      FormSaida.CodLocalEdit.Text := IntToStr(codLoc);
      FormSaida.DescLocalEdit.Text := descLoc;
      FormSaida.QtdProdEdit.SetFocus;
    end
  end
  else if FrameButtons1.ModoEdit.Text = 'R1' then
  begin
    FormRel1.CodLocalEdit.Text := IntToStr(codLoc);
    FormRel1.DescLocalEdit.Text := descLoc;
    FormRel1.Rel1Btn.SetFocus;
  end;
  Close;
end;


procedure TBuscaLocalForm.gridLocaisDBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  FrameButtons1.SalvarBtn.Font.Color := clGreen;
end;

end.
