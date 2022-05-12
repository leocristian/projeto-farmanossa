unit u_pag_login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage, IniFiles;

type
  TFormLogin = class(TForm)
    ImageList1: TImageList;
    pn_form: TPanel;
    LoginInput: TEdit;
    SenhaInput: TEdit;
    label_nome: TLabel;
    btn_ajuda: TSpeedButton;
    label_senha: TLabel;
    Label1: TLabel;
    EntrarBtn: TBitBtn;
    CancelarBtn: TBitBtn;
    procedure CancelarBtnClick(Sender: TObject);
    procedure EntrarBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLogin: TFormLogin;

implementation

{$R *.dfm}

uses u_dm1, u_pag_inicial;

//uses u_pag_inicial;

procedure TFormLogin.CancelarBtnClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFormLogin.EntrarBtnClick(Sender: TObject);
begin
  FormPrincipal.Show;
end;

procedure TFormLogin.FormShow(Sender: TObject);
var
  arq_ini: TIniFile;
  nome_arq_ini: String;
  login_usuario: String;

begin
  dm1.con1.close;
  nome_arq_ini := ExtractFilePath(Application.ExeName) + 'config.ini';

  if FileExists(nome_arq_ini) then
  begin
    arq_ini := TIniFile.Create(nome_arq_ini);
    try
      // Configurar conexão e verificar último login
      dm1.con1.ProviderName := arq_ini.ReadString('conexao', 'provider', '');
      dm1.con1.Port := arq_ini.ReadInteger('conexao', 'port', 5433);
      dm1.con1.Username := arq_ini.ReadString('conexao', 'username', '');
      dm1.con1.Password := arq_ini.ReadString('conexao', 'password', '');
      dm1.con1.Database := arq_ini.ReadString('conexao', 'database', '');

      try
        dm1.con1.Open;
      except on E: Exception do
        begin
          ShowMessage('Erro ao conectar no banco de dados!' + #13 + E.Message);
          Application.Terminate;
        end;
      end;

      login_usuario := arq_ini.ReadString('usuario', 'login', '');
      
      if login_usuario = '' then
      begin
        LoginInput.SetFocus;
      end
      else
      begin
        LoginInput.Text := login_usuario;
        SenhaInput.SetFocus;
      end;
    finally
      arq_ini.Free;
    end;
  end;
end;

end.
