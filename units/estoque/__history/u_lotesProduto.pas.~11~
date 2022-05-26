unit u_lotesProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations,
  Data.DB, cxDBData, MemDS, DBAccess, Uni, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.ExtCtrls, fr_estilo, Vcl.StdCtrls;

type
  TLotesProdutoForm = class(TForm)
    Panel1: TPanel;
    gridLotesDBTableView1: TcxGridDBTableView;
    gridLotesLevel1: TcxGridLevel;
    gridLotes: TcxGrid;
    tb_lotes: TUniTable;
    ds_lotes: TDataSource;
    lote_codigo: TcxGridDBColumn;
    lote_dtfabricacao: TcxGridDBColumn;
    lote_dtvencimento: TcxGridDBColumn;
    lote_quantidade: TcxGridDBColumn;
    FrameGrid1: TFrameGrid;
    FecharBtn: TButton;
    procedure FormShow(Sender: TObject);
    procedure FecharBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LotesProdutoForm: TLotesProdutoForm;

implementation

{$R *.dfm}

uses u_estoque, u_dm1;

procedure TLotesProdutoForm.FecharBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TLotesProdutoForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tb_lotes.Close;
end;

procedure TLotesProdutoForm.FormShow(Sender: TObject);
var
  index, prod_codigo: Integer;

begin
  index := PagEstoque.gridEstoqueDBTableView1.DataController.GetSelectedRowIndex(0);
  prod_codigo := PagEstoque.gridEstoqueDBTableView1.ViewData.Records[index].Values[0];

  tb_lotes.Close;
  tb_lotes.Connection := dm1.con1;

  tb_lotes.SQL.text := 'select * from tb_lotes where lote_produto = :cod_produto';
  tb_lotes.ParamByName('cod_produto').Value := prod_codigo;

  ds_lotes.DataSet := tb_lotes;
  tb_lotes.Open;
end;

end.
