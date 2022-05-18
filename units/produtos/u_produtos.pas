unit u_produtos;

interface

uses Vcl.Menus, System.Classes, Vcl.Controls, Vcl.ExtCtrls, Vcl.Forms,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid;

type
  TPagProdutos = class(TForm)
    Panel1: TPanel;
    PopupProdutos: TPopupMenu;
    Detalhar1: TMenuItem;
    N1: TMenuItem;
    N1Incluirnovoregistro1: TMenuItem;
    N2AlterarregistroatualF31: TMenuItem;
    N3ExcluirF41: TMenuItem;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    procedure N1Incluirnovoregistro1Click(Sender: TObject);
    procedure Detalhar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PagProdutos: TPagProdutos;

implementation

{$R *.dfm}

uses u_infoProduto;

procedure TPagProdutos.Detalhar1Click(Sender: TObject);
begin
  FormProduto.FrameButtons.ModoEdit.Text := 'V';
  FormProduto.ShowModal;
end;

procedure TPagProdutos.N1Incluirnovoregistro1Click(Sender: TObject);
begin
  FormProduto.FrameButtons.ModoEdit.Text := 'N';
  FormProduto.ShowModal;
end;

end.
