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
    prod_status: TcxGridDBColumn;
    procedure N1Incluirnovoregistro1Click(Sender: TObject);
    procedure Detalhar1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N3ExcluirF41Click(Sender: TObject);
    procedure N2AlterarregistroatualF31Click(Sender: TObject);
    procedure FrameBusca1BuscaSelectChange(Sender: TObject);
    procedure FrameBusca1BuscaEditClick(Sender: TObject);
    procedure FrameBusca1BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TPagProdutos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
    Detalhar1Click(Sender)
  else if Key = VK_F2 then
    N1Incluirnovoregistro1Click(Sender)
  else if Key = VK_F3 then
    N2AlterarregistroatualF31Click(Sender)
  else if Key = VK_F4 then
    N3ExcluirF41Click(Sender);
end;

procedure TPagProdutos.FormShow(Sender: TObject);
begin
//  dm1.con1.Close;

  tb_produtos.Close;
  tb_produtos.Connection := dm1.con1;
  tb_produtos.SQL.Text := 'select * from tb_produtos';

  ds_produtos.DataSet := tb_produtos;
  tb_produtos.Open;

//  dm1.con1.Open;
end;

procedure TPagProdutos.FrameBusca1BitBtn1Click(Sender: TObject);
var
  strBusca: String;

begin

  strBusca := FrameBusca1.BuscaEdit.Text;

  tb_produtos.Close;
  tb_produtos.Connection := dm1.con1;

  tb_produtos.SQL.Clear;
  tb_produtos.SQL.Add('select * from tb_produtos');

  if FrameBusca1.BuscaSelect.Text = 'CÓDIGO' then
    if FrameBusca1.BuscaEdit.Text = '' then
      tb_produtos.SQL.Add('where 1=1')
    else
      tb_produtos.SQL.Add('where prod_codigo = ' + strBusca)
  else if FrameBusca1.BuscaSelect.Text = 'DESCRIÇÃO' then
    tb_produtos.SQL.Add('where prod_descricao like ' + QuotedStr('%' + strBusca + '%'));

  ds_produtos.DataSet := tb_produtos;
  tb_produtos.Open;

end;

procedure TPagProdutos.FrameBusca1BuscaEditClick(Sender: TObject);
begin
  FrameBusca1.BuscaEdit.SetFocus;
end;

procedure TPagProdutos.FrameBusca1BuscaSelectChange(Sender: TObject);
begin
  FrameBusca1.BuscaEdit.Clear;
  if FrameBusca1.BuscaSelect.Text = 'CÓDIGO' then
  begin
    FrameBusca1.BuscaEdit.NumbersOnly := True;
    FrameBusca1.BuscaEdit.MaxLength := 5;
  end
  else
  begin
    FrameBusca1.BuscaEdit.NumbersOnly := False;
    FrameBusca1.BuscaEdit.MaxLength := 50;
  end;

  FrameBusca1.BuscaEdit.SetFocus;
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
      begin
        if e.message.contains('tb_saidas_sai_produto_fkey') then
        begin
          Aviso('Não é possível excluir pois o produto possui operações de entrada e/ou saída');
        end
        else
        begin
          Erro('Erro!' + #13 + e.Message);
        end;

      end;
      end;
    finally
      q1.Close;
      FreeAndNil(q1);
    end;
  end;
end;

end.
