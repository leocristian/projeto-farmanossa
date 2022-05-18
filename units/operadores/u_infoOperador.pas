unit u_infoOperador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Uni,
  fm_buttons;

type
  TFormOperador = class(TForm)
    pn_form: TPanel;
    CodEdit: TEdit;
    Label1: TLabel;
    NomeEdit: TEdit;
    Label2: TLabel;
    SenhaCheckEdit: TEdit;
    Label5: TLabel;
    LoginEdit: TEdit;
    Label3: TLabel;
    SenhaEdit: TEdit;
    Label4: TLabel;
    FrameButtons: TFrameButtons;
    procedure FormShow(Sender: TObject);
    procedure CancelarBtnClick(Sender: TObject);
    procedure SalvarBtnClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormOperador: TFormOperador;

implementation

{$R *.dfm}

uses u_dm1, u_controleForm;

procedure TFormOperador.CancelarBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TFormOperador.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TFormOperador.FormShow(Sender: TObject);
begin

  if FrameButtons.ModoEdit.Text = 'V' then
  begin
    Caption := 'Exibir Operador';
    pn_form.Enabled := False;
    FrameButtons.SalvarBtn.Visible := False;
  end
  else if FrameButtons.ModoEdit.Text = 'N' then
  begin
    Caption := 'Incluir Operador';
    pn_form.Enabled := True;
    NomeEdit.SetFocus;
    NomeEdit.Clear;
    LoginEdit.Clear;
    SenhaEdit.Clear;
    SenhaCheckEdit.Clear;

    FrameButtons.SalvarBtn.Visible := True;
  end;
end;

procedure TFormOperador.SalvarBtnClick(Sender: TObject);
var
  q1: TUniQuery;
  ope_cod: Integer;

begin

  if ExisteInputVazio(Self) then
  begin
    Aviso('Preencha todos os campos!');
    NomeEdit.SetFocus;
    exit;
  end;

  if SenhaEdit.Text <> SenhaCheckEdit.Text then
  begin
    Aviso('Senhas devem ser iguais!');
    SenhaEdit.SetFocus;
    exit;
  end;

  try
    q1 := TUniQuery.Create(q1);
    q1.Connection := dm1.con1;

    if FrameButtons.ModoEdit.Text = 'N' then
    begin
      q1.SQL.Text := 'select nextval(''tb_operadores_cod_seq'') as ope_cod';

      q1.Open;
      ope_cod := q1.FieldByName('ope_cod').Value;
      q1.Close;

      q1.SQL.Clear;

      q1.SQL.Add('insert into tb_operadores');
      q1.SQL.Add(' values (:ope_codigo, :ope_nome, md5(:ope_login), md5(:ope_senha))');

      q1.ParamByName('ope_codigo').Value := ope_cod;
    end
    else if FrameButtons.ModoEdit.Text = 'A' then
    begin
      q1.SQL.Clear;
      q1.SQL.Add('update tb_operadores set ');
      q1.SQL.Add('ope_nome = :ope_nome, ope_login = md5(:ope_login), ope_senha = md5(:ope_senha)');
      q1.SQL.Add('where ope_codigo = :ope_codigo');
      q1.ParamByName('ope_codigo').Value := CodEdit.Text;
    end;

    q1.ParamByName('ope_nome').Value := NomeEdit.Text;
    q1.ParamByName('ope_login').Value := AdicionarSemente(LoginEdit.Text);
    q1.ParamByName('ope_senha').Value := AdicionarSemente(SenhaEdit.Text);

    if Confirma('Confirmar cadastro de operador?') then
    try
      q1.ExecSQL;
      Mensagem('Operador cadastrado com sucesso!');
      Close;
    except on e:exception do
      if e.Message.Contains('ope_login_key') then
      begin
        Erro('Operador já está cadastrado!');
        exit;
      end
      else
      begin
        Erro('Erro: ' + #13 + e.Message);
      end;

    end;

  finally
    q1.Close;
    FreeAndNil(q1);
  end;
end;

end.
