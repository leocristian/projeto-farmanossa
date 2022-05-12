unit u_pag_login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TFormLogin = class(TForm)
    ImageList1: TImageList;
    pn_form: TPanel;
    input_login: TEdit;
    input_senha: TEdit;
    label_nome: TLabel;
    btn_ajuda: TSpeedButton;
    label_senha: TLabel;
    Label1: TLabel;
    EntrarBtn: TBitBtn;
    CancelarBtn: TBitBtn;
    procedure CancelarBtnClick(Sender: TObject);
    procedure EntrarBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLogin: TFormLogin;

implementation

{$R *.dfm}

//uses u_pag_inicial;

procedure TFormLogin.CancelarBtnClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFormLogin.EntrarBtnClick(Sender: TObject);
begin
  close;
end;

end.
