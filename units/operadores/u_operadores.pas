unit u_operadores;

interface

uses
  Vcl.Menus, System.Classes, Vcl.Controls, Vcl.ExtCtrls, Vcl.Forms;

type
  TPagOperador = class(TForm)
    Panel1: TPanel;
    PopupOperador: TPopupMenu;
    Detalhar1: TMenuItem;
    N1: TMenuItem;
    N1Incluirnovoregistro1: TMenuItem;
    N2AlterarregistroatualF31: TMenuItem;
    N3ExcluirF41: TMenuItem;
    procedure Detalhar1Click(Sender: TObject);
    procedure N1Incluirnovoregistro1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PagOperador: TPagOperador;

implementation

{$R *.dfm}

uses u_infoOperador;

procedure TPagOperador.Detalhar1Click(Sender: TObject);
begin
  FormOperador.FrameButtons.ModoEdit.Text := 'V';
  FormOperador.Show;
end;

procedure TPagOperador.N1Incluirnovoregistro1Click(Sender: TObject);
begin
  FormOperador.FrameButtons.ModoEdit.Text := 'N';
  FormOperador.Show;
end;

end.
