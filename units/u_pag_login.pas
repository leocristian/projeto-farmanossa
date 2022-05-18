unit u_pag_login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage, IniFiles, Uni;

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
    Label2: TLabel;
    label_qtdTentativas: TLabel;
    procedure CancelarBtnClick(Sender: TObject);
    procedure EntrarBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLogin: TFormLogin;
  qtd_tentativas: Integer;

implementation

{$R *.dfm}

uses u_dm1, u_pag_inicial, u_controleForm;

//uses u_pag_inicial;

procedure TFormLogin.CancelarBtnClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFormLogin.EntrarBtnClick(Sender: TObject);
var
  q1: TUniQuery;
  arq_ini: TIniFile;
  nome_arq_ini: String;
begin

  if ExisteInputVazio(self) then
  begin
    Aviso('Preencha todos os campos!');
    LoginInput.SetFocus;
    exit;
  end;

  try
    q1 := TUniQuery.Create(q1);
    q1.connection := dm1.con1;

    q1.SQL.Text := 'select ope_codigo, ope_nome, ope_login, ope_senha from tb_operadores where ope_login = md5(:login) and ope_senha = md5(:senha)';

    q1.ParamByName('login').Value := AdicionarSemente(LoginInput.Text);
    q1.ParamByName('senha').Value := AdicionarSemente(SenhaInput.Text);

    q1.Open;

    if q1.RecordCount = 1 then
    begin
      nome_arq_ini := ExtractFilePath(Application.ExeName) + 'config.ini';
      arq_ini := TIniFile.Create(nome_arq_ini);
      arq_ini.WriteString('usuario', 'login', LoginInput.Text);
      LimparInputs(self);
      FormPrincipal.Show;
      qtd_tentativas := 3;
      label_qtdTentativas.Caption := qtd_tentativas.ToString;
    end
    else if q1.RecordCount = 0 then
    begin
      qtd_tentativas := qtd_tentativas - 1;
 

      if qtd_tentativas = 0 then
      begin
        Aviso('Operador atingiu o limite máximo de tentativas. ' + #13 + 'O sistema será encerrado.');
        close;
      end
      else
      begin
        Aviso('Operador não encontrado!');
        label_qtdTentativas.Caption := qtd_tentativas.ToString;
      end;
      LoginInput.SetFocus;
    end;
  finally
    q1.Close;
    FreeAndNil(q1);

  end;
end;

procedure TFormLogin.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TFormLogin.FormShow(Sender: TObject);
var
  arq_ini: TIniFile;
  nome_arq_ini: String;
  login_usuario: String;

begin
  dm1.con1.close;
  nome_arq_ini := ExtractFilePath(Application.ExeName) + 'config.ini';

  qtd_tentativas := 3;
  label_qtdTentativas.Caption := qtd_tentativas.ToString;

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
          Erro('Erro ao conectar no banco de dados!' + #13 + E.Message);
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
