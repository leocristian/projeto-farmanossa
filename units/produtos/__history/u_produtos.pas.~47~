unit u_produtos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Vcl.Menus, System.Classes, Vcl.Controls, Vcl.ExtCtrls, Vcl.Forms, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Dialogs, CRGrid, MemDS, VirtualTable, Uni,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, DBAccess, UniProvider, PostgreSQLUniProvider, fr_estilo, fm_busca;

type
  TPagProdutos = class(TForm)
    PopupProdutos: TPopupMenu;
    Detalhar1: TMenuItem;
    N1: TMenuItem;
    N1Incluirnovoregistro1: TMenuItem;
    N2AlterarregistroatualF31: TMenuItem;
    N3ExcluirF41: TMenuItem;
    ds_produtos: TDataSource;
    tb_produtos: TUniTable;
    gridProdutosDBTableView1: TcxGridDBTableView;
    gridProdutosLevel1: TcxGridLevel;
    gridProdutos: TcxGrid;
    prod_codigo: TcxGridDBColumn;
    prod_descricao: TcxGridDBColumn;
    prod_estoque_negativo: TcxGridDBColumn;
    prod_status_entrada: TcxGridDBColumn;
    prod_status_saida: TcxGridDBColumn;
    FrameGrid1: TFrameGrid;
    FrameBusca1: TFrameBusca;
    procedure N1Incluirnovoregistro1Click(Sender: TObject);
    procedure Detalhar1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N3ExcluirF41Click(Sender: TObject);
    procedure N2AlterarregistroatualF31Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PagProdutos: TPagProdutos;

implementation

{$R *.dfm}

uses u_infoProduto, u_dm1, u_controleForm;

procedure TPagProdutos.Detalhar1Click(Sender: TObject);
begin
  if not tb_produtos.Active then exit;
  if tb_produtos.RecordCount = 0 then exit;

  FormProduto.FrameButtons.ModoEdit.Text := 'V';
  FormProduto.ShowModal;
end;

procedure TPagProdutos.FormShow(Sender: TObject);
begin
  dm1.con1.Close;
  dm1.con1.Open;

  tb_produtos.Connection := dm1.con1;
  tb_produtos.TableName := 'tb_produtos';

  ds_produtos.DataSet := tb_produtos;
  tb_produtos.Active := True;
end;

procedure TPagProdutos.N1Incluirnovoregistro1Click(Sender: TObject);
begin
  FormProduto.FrameButtons.ModoEdit.Text := 'N';
  FormProduto.ShowModal;
end;

procedure TPagProdutos.N2AlterarregistroatualF31Click(Sender: TObject);
begin
  if not tb_produtos.Active then exit;
  if tb_produtos.RecordCount = 0 then exit;

  FormProduto.FrameButtons.ModoEdit.Text := 'A';
  FormProduto.ShowModal;
end;

procedure TPagProdutos.N3ExcluirF41Click(Sender: TObject);
var
  q1: TUniQuery;
  index, codigo: Integer;

begin
  if not tb_produtos.Active then exit;
  if tb_produtos.RecordCount = 0 then exit;

  if Confirma('Confirmar exclusão de produto?' + #13 + 'Esta operação será irreversível!') then
  begin
    try
      q1 := TUniQuery.Create(q1);
      q1.Connection := dm1.con1;

      index := gridProdutosDBTableView1.DataController.GetSelectedRowIndex(0);
      codigo := gridProdutosDBTableView1.ViewData.Records[index].Values[0];

      q1.SQL.Text := 'delete from tb_produtos where prod_codigo = :codigo';
      q1.ParamByName('codigo').Value := codigo;

      try
        q1.ExecSQL;
        Mensagem('Produto excluído com sucesso!');
        gridProdutosDBTableView1.DataController.RefreshExternalData;
      except on e:exception do
        Erro('Erro!' + #13 + e.Message);
      end;
    finally
      q1.Close;
      FreeAndNil(q1);
    end;
  end;
end;

end.
