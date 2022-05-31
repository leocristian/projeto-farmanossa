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
    FrameButtons: TFrameButtons;
    pnLogin: TPanel;
    SenhaCheckEdit: TEdit;
    Label5: TLabel;
    Label4: TLabel;
    SenhaEdit: TEdit;
    LoginEdit: TEdit;
    Label3: TLabel;
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

uses u_dm1, u_controleForm, u_operadores;

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
var
  codigo, index: Integer;
  q1: TUniQuery;

begin

  if FrameButtons.ModoEdit.Text = 'V' then
  begin
    Caption := 'Exibir Operador';
    pn_form.Enabled := False;
    FrameButtons.SalvarBtn.Visible := False;
    pnLogin.Visible := False;

    index := PagOperador.gridOperadoresDBTableView1.DataController.GetSelectedRowIndex(0);
    codigo := PagOperador.gridOperadoresDBTableView1.ViewData.Records[index].Values[0];

    try
      q1 := TUniQuery.Create(q1);
      q1.Connection := dm1.con1;

      q1.SQL.Text := 'select ope_codigo, ope_nome from tb_operadores where ope_codigo = :codigo';
      q1.ParamByName('codigo').Value := codigo;

      q1.Open;

      CodEdit.Text := q1.FieldByName('ope_codigo').Value;
      NomeEdit.Text := q1.FieldByName('ope_nome').Value;
    finally
      q1.Close;
      FreeAndNil(q1);
    end;
  end
  else if FrameButtons.ModoEdit.Text = 'N' then
  begin
    Caption := 'Incluir Operador';
    pn_form.Enabled := True;
    CodEdit.Text := '00';
    NomeEdit.SetFocus;
    NomeEdit.Clear;
    LoginEdit.Clear;
    SenhaEdit.Clear;
    SenhaCheckEdit.Clear;
    pnLogin.Visible := True;

    FrameButtons.SalvarBtn.Visible := True;
  end
  else if FrameButtons.ModoEdit.Text = 'A' then
  begin
    Caption := 'Alterar Operador';
    pn_form.Enabled := True;
    NomeEdit.SetFocus;
    pnLogin.Visible := False;

    FrameButtons.SalvarBtn.Visible := True;

    index := PagOperador.gridOperadoresDBTableView1.DataController.GetSelectedRowIndex(0);
    codigo := PagOperador.gridOperadoresDBTableView1.ViewData.Records[index].Values[0];

    try
      q1 := TUniQuery.Create(q1);
      q1.Connection := dm1.con1;

      q1.SQL.Text := 'select ope_codigo, ope_nome from tb_operadores where ope_codigo = :codigo';
      q1.ParamByName('codigo').Value := codigo;

      q1.Open;

      CodEdit.Text := q1.FieldByName('ope_codigo').Value;
      NomeEdit.Text := q1.FieldByName('ope_nome').Value;
    finally
      q1.Close;
      FreeAndNil(q1);
    end;
  end;
end;

procedure TFormOperador.SalvarBtnClick(Sender: TObject);
var
  q1: TUniQuery;
  ope_cod: Integer;

begin

  try
    q1 := TUniQuery.Create(q1);
    q1.Connection := dm1.con1;

    if FrameButtons.ModoEdit.Text = 'N' then
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

      q1.SQL.Text := 'select nextval(''tb_operadores_cod_seq'') as ope_cod';

      q1.Open;
      ope_cod := q1.FieldByName('ope_cod').Value;
      q1.Close;

      q1.SQL.Clear;

      q1.SQL.Add('insert into tb_operadores');
      q1.SQL.Add(' values (:ope_codigo, :ope_nome, md5(:ope_login), md5(:ope_senha))');

      q1.ParamByName('ope_codigo').Value := ope_cod;
      q1.ParamByName('ope_login').Value := AdicionarSemente(LoginEdit.Text);
      q1.ParamByName('ope_senha').Value := AdicionarSemente(SenhaEdit.Text);
    end
    else if FrameButtons.ModoEdit.Text = 'A' then
    begin
      if NomeEdit.Text = '' then
      begin
        Aviso('Informe o novo nome!');
        NomeEdit.SetFocus;
        exit;
      end;

      q1.SQL.Clear;
      q1.SQL.Add('update tb_operadores set ');
      q1.SQL.Add('ope_nome = :ope_nome');
      q1.SQL.Add('where ope_codigo = :ope_codigo');
      q1.ParamByName('ope_nome').Value := NomeEdit.Text;
      q1.ParamByName('ope_codigo').Value := CodEdit.Text;
    end;

    if Confirma('Confirmar operação?') then
    try
      q1.ExecSQL;
      Mensagem('Operação realizada com sucesso!');
      PagOperador.gridOperadoresDBTableView1.DataController.RefreshExternalData;
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
