unit u_controleForm;

interface
uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

procedure LimparInputs(const owner: TWinControl);
function ExisteInputVazio(const owner: TWinControl): Boolean;

function Confirma(texto: String): Boolean;
procedure Aviso(texto: String);
procedure Erro(texto: String);
procedure Mensagem(texto: String);

implementation

procedure LimparInputs(const owner: TWinControl);
var
  i: Integer;
begin
  for i := 0 to owner.ComponentCount - 1 do
    if owner.Components[i] is TEdit then
      TEdit(owner.Components[i]).Clear;
end;

function ExisteInputVazio(const owner: TWinControl): Boolean;
var
  i: Integer;
  countInputs: Integer;
begin
  countInputs := 0;
  for i := 0 to owner.ComponentCount - 1 do
  begin
    if owner.components[i] is TEdit then
    begin
      if TEdit(owner.Components[i]).Text = '' then
      begin
        countInputs := countInputs + 1;
      end;
    end;
  end;
  if countInputs > 0 then
    begin
      Result := True;
    end
  else
    begin
      Result := False;
    end;
end;

function Confirma(texto: String): Boolean;
begin
  Result := (MessageDlg(texto, mtConfirmation, mbYesNo, 0) = mrYes);
end;

procedure Aviso(texto: String);
begin
  MessageDlg(texto, mtWarning, [mbOk], 0);
end;
procedure Erro(texto: String);
begin
  MessageDlg(texto, mtError, [mbOk], 0);
end;
procedure Mensagem(texto: String);
begin
  MessageDlg(texto, mtConfirmation, [mbOk], 0);
end;

end.
