unit u_locais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls;

type
  TPagLocais = class(TForm)
    Panel1: TPanel;
    PopupLocais: TPopupMenu;
    Detalhar1: TMenuItem;
    N1: TMenuItem;
    N1Incluirnovoregistro1: TMenuItem;
    N2AlterarregistroatualF31: TMenuItem;
    N3ExcluirF41: TMenuItem;
    procedure N1Incluirnovoregistro1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PagLocais: TPagLocais;

implementation

{$R *.dfm}

uses u_infoLocal;

procedure TPagLocais.N1Incluirnovoregistro1Click(Sender: TObject);
begin
  FormLocal.FrameButtons.ModoEdit.Text := 'N';
  FormLocal.ShowModal;
end;

end.
