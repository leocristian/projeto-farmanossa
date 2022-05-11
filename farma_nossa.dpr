program farma_nossa;

uses
  Vcl.Forms,
  u_pag_inicial in 'u_pag_inicial.pas' {pag_inicial},
  u_pag_login in 'u_pag_login.pas' {pag_login};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tpag_inicial, pag_inicial);
  Application.CreateForm(Tpag_login, pag_login);
  Application.Run;
end.
