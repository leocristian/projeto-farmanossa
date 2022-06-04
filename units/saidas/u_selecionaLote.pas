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
    qLote: TUniQuery;
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
  qLote.sql.Clear;
  qLote.SQL.Add('select lote_codigo, lote_dtfabricacao, lote_dtvencimento, lote_quantidade ');
  qLote.SQL.Add('from tb_lotes ');
  qLote.SQL.Add('where lote_produto = :prod_codigo and lote_local = :loc_codigo order by lote_dtvencimento');

  qLote.ParamByName('prod_codigo').Value := FormSaida.CodProdEdit.Text;
  qLote.ParamByName('loc_codigo').Value := FormSaida.CodLocalEdit.Text;
  qLote.Open;

  if qLote.RecordCount = 0 then
  begin
    Aviso('Produto não está em nenhum lote!');
    PostMessage(Self.Handle, WM_CLOSE, 0, 0); // Fechar grid
    FormSaida.CodProdEdit.SetFocus;
  end;

  ds_lotes.DataSet := qLote;
  qLote.Open;
end;

procedure TSelecionaLoteForm.FrameButtons1CancelarBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TSelecionaLoteForm.FrameButtons1SalvarBtnClick(Sender: TObject);
var
  qtd_lote: Integer;

begin

  qtd_lote := qLote.FieldByName('lote_quantidade').AsInteger;

  if FormSaida.QtdProdEdit.Value > qtd_lote  then
  begin
    Aviso('Quantidade de produtos está acima do permitido pelo lote selecionado!');
    Exit;
  end;

  Close;
end;

procedure TSelecionaLoteForm.gridLotesDBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  FormSaida.ConfirmarBtn.Font.Color := clGreen;
end;

end.
