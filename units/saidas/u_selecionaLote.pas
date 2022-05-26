unit u_selecionaLote;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations,
  Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  Vcl.StdCtrls, fm_buttons, Vcl.ExtCtrls, MemDS, DBAccess, Uni, fr_estilo,
  VirtualTable;

type
  TSelecionaLoteForm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    gridLotesDBTableView1: TcxGridDBTableView;
    gridLotesLevel1: TcxGridLevel;
    gridLotes: TcxGrid;
    ds_lotes: TDataSource;
    lote_codigo: TcxGridDBColumn;
    lote_dtfabricacao: TcxGridDBColumn;
    lote_dtvencimento: TcxGridDBColumn;
    FrameGrid1: TFrameGrid;
    lote_quantidade: TcxGridDBColumn;
    tb_lotes: TUniTable;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FrameButtons1CancelarBtnClick(Sender: TObject);
    procedure FrameButtons1SalvarBtnClick(Sender: TObject);
    procedure gridLotesDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelecionaLoteForm: TSelecionaLoteForm;

implementation

{$R *.dfm}

uses u_dm1, u_controleForm, u_infoSaida;

procedure TSelecionaLoteForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  begin
    if Key = #13 then
    begin
      Key := #0;
      Perform(wm_nextdlgctl, 0, 0);
    end
    else if key = #27 then close
  end;
end;


procedure TSelecionaLoteForm.FormShow(Sender: TObject);
begin
  tb_lotes.Close;
  tb_lotes.Connection := dm1.con1;

  tb_lotes.sql.Clear;
  tb_lotes.SQL.Add('select lote_codigo, lote_dtfabricacao, lote_dtvencimento, lote_quantidade ');
  tb_lotes.SQL.Add('from tb_lotes ');
  tb_lotes.SQL.Add('where lote_produto = :prod_codigo and lote_local = :loc_codigo order by lote_dtvencimento');

  tb_lotes.ParamByName('prod_codigo').Value := FormSaida.CodProdEdit.Text;
  tb_lotes.ParamByName('loc_codigo').Value := FormSaida.CodLocalEdit.Text;
  tb_lotes.Open;

  if tb_lotes.RecordCount = 0 then
  begin
    Aviso('Produto não está em nenhum lote!');
    PostMessage(Self.Handle, WM_CLOSE, 0, 0); // Fechar grid
    FormSaida.CodProdEdit.SetFocus;
  end;

  ds_lotes.DataSet := tb_lotes;
  tb_lotes.Open;
end;

procedure TSelecionaLoteForm.FrameButtons1CancelarBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TSelecionaLoteForm.FrameButtons1SalvarBtnClick(Sender: TObject);
var
  index: Integer;
  lote: Variant;
  qtd_lote: Integer;

begin

  index := gridLotesDBTableView1.DataController.GetSelectedRowIndex(0);
  lote := gridLotesDBTableView1.ViewData.Records[index].Values[0];
  qtd_lote := gridLotesDBTableView1.ViewData.Records[index].Values[3];

  if FormSaida.QtdProdEdit.Value > qtd_lote  then
  begin
    Aviso('Quantidade de produtos está acima do permitido pelo lote selecionado!');
    Exit;
  end;

//  FormSaida.Label4.Visible := True;
//
//  FormSaida.LoteLabel.Caption := lote;
//  FormSaida.LoteLabel.Visible := True;
//
//  FormSaida.FrameButtons1.Visible := True;
//  FormSaida.SelecionaLote.Visible := False;

  Close;
end;

procedure TSelecionaLoteForm.gridLotesDBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  FormSaida.ConfirmarBtn.Font.Color := clGreen;
end;

end.
