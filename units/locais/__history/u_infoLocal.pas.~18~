unit u_infoLocal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Uni,
  fm_buttons;

type
  TFormLocal = class(TForm)
    pn_form: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    CodEdit: TEdit;
    DescricaoEdit: TEdit;
    StatusBox: TComboBox;
    FrameButtons: TFrameButtons;
    procedure CancelarBtnClick(Sender: TObject);
    procedure SalvarBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLocal: TFormLocal;

implementation

{$R *.dfm}

uses u_dm1, u_controleForm, u_locais;

procedure TFormLocal.CancelarBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TFormLocal.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TFormLocal.FormShow(Sender: TObject);
var
  q1: TUniQuery;
  index, codigo: Integer;

begin
  if FrameButtons.ModoEdit.Text = 'V' then
  begin
    Caption := 'Exibir Local de estoque';
    pn_form.Enabled := False;
    FrameButtons.SalvarBtn.Visible := False;

    index := PagLocais.gridLocaisDBTableView1.DataController.GetSelectedRowIndex(0);
    codigo := PagLocais.gridLocaisDBTableView1.ViewData.Records[index].Values[0];

    try
      q1 := TUniQuery.Create(q1);
      q1.Connection := dm1.con1;

      q1.SQL.Text := 'select * from tb_locais_estoque where loc_codigo = :codigo';
      q1.ParamByName('codigo').Value := codigo;

      q1.Open;

      CodEdit.Text := q1.FieldByName('loc_codigo').Value;
      DescricaoEdit.Text := q1.FieldByName('loc_descricao').Value;

      StatusBox.ItemIndex := StatusBox.Items.IndexOf(q1.FieldByName('loc_status').Value);

    finally
      q1.Close;
      FreeAndNil(q1);
    end;
  end
  else if FrameButtons.ModoEdit.Text = 'N' then
  begin
    Caption := 'Incluir Local de estoque';
    pn_form.Enabled := True;
    DescricaoEdit.SetFocus;
    CodEdit.text := '00';
    DescricaoEdit.Clear;
    FrameButtons.SalvarBtn.Visible := True;
    StatusBox.ItemIndex := 0;
  end
  else if FrameButtons.ModoEdit.Text = 'A' then
  begin
    pn_form.Enabled := True;
    DescricaoEdit.SetFocus;
    FrameButtons.SalvarBtn.Visible := True;

    index := PagLocais.gridLocaisDBTableView1.DataController.GetSelectedRowIndex(0);
    codigo := PagLocais.gridLocaisDBTableView1.ViewData.Records[index].Values[0];

    try
      q1 := TUniQuery.Create(q1);
      q1.Connection := dm1.con1;

      q1.SQL.Text := 'select * from tb_locais_estoque where loc_codigo = :codigo';
      q1.ParamByName('codigo').Value := codigo;

      q1.Open;

      CodEdit.Text := q1.FieldByName('loc_codigo').Value;
      DescricaoEdit.Text := q1.FieldByName('loc_descricao').Value;

      StatusBox.ItemIndex := StatusBox.Items.IndexOf(q1.FieldByName('loc_status').Value);

    finally
      q1.Close;
      FreeAndNil(q1);
    end;
  end;
end;

procedure TFormLocal.SalvarBtnClick(Sender: TObject);
var
  q1: TUniQuery;
  loc_codigo: Integer;
  msg_confirma: String;

begin
  if DescricaoEdit.Text = '' then
  begin
    Aviso('Preencha todos os campos!');
    DescricaoEdit.SetFocus;
    exit;
  end;

  try
    q1 := TUniQuery.Create(q1);
    q1.Connection := dm1.con1;

    if FrameButtons.ModoEdit.Text = 'N' then
    begin
      q1.SQL.Text := 'select nextval(''tb_locais_cod_seq'') as loc_codigo';

      q1.Open;
      loc_codigo := q1.FieldByName('loc_codigo').Value;
      q1.Close;

      q1.SQL.Clear;
      q1.SQL.Add('insert into tb_locais_estoque values ');
      q1.SQL.Add('(:loc_codigo, :loc_descricao, :loc_status)');

      q1.ParamByName('loc_codigo').Value := loc_codigo;
      msg_confirma := 'Confirmar inclusão do local de estoque?';
    end
    else if FrameButtons.ModoEdit.Text = 'A' then
    begin
      q1.SQL.Clear;
      q1.SQL.Add('update tb_locais_estoque set ');
      q1.SQL.Add('loc_descricao = :loc_descricao, loc_status = :loc_status ');
      q1.SQL.Add('where loc_codigo = :loc_codigo');
      q1.ParamByName('loc_codigo').Value := CodEdit.Text;
      msg_confirma := 'Salvar alterações?';
    end;

    q1.ParamByName('loc_descricao').Value := DescricaoEdit.Text;
    q1.ParamByName('loc_status').Value := StatusBox.Text;

    if Confirma(msg_confirma) then
    try
      q1.ExecSQL;
      Mensagem('Operação concluída!');
      PagLocais.gridLocaisDBTableView1.DataController.RefreshExternalData;
      Close;
    except on e:exception do
        Erro('Erro: ' + #13 + e.Message);
    end;
  finally
    q1.Close;
    FreeAndNil(q1);
end;


end;

end.
