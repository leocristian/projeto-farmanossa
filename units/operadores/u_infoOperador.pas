unit u_infoOperador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TOperadorForm = class(TForm)
    pn_btns: TPanel;
    pn_form: TPanel;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit5: TEdit;
    Label5: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Edit4: TEdit;
    Label4: TLabel;
    ModoEdit: TEdit;
    SalvarBtn: TButton;
    CancelarBtn: TButton;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OperadorForm: TOperadorForm;

implementation

{$R *.dfm}

procedure TOperadorForm.FormShow(Sender: TObject);
begin
  if ModoEdit.Text = 'V' then
  begin
    Caption := 'Exibir Operador';
    pn_form.Enabled := False;
    SalvarBtn.Visible := False;
  end
  else if ModoEdit.Text = 'N' then
  begin
    Caption := 'Incluir Operador';
    pn_form.Enabled := True;
    SalvarBtn.Visible := True;
  end;
end;

end.
