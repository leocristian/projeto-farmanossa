program farma_nossa;

uses
  Vcl.Forms,
  u_pag_inicial in 'units\u_pag_inicial.pas' {FormPrincipal},
  u_pag_login in 'units\u_pag_login.pas' {FormLogin},
  u_operadores in 'units\operadores\u_operadores.pas' {PagOperador},
  u_infoOperador in 'units\operadores\u_infoOperador.pas' {FormOperador},
  u_dm1 in 'units\u_dm1.pas' {dm1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TPagOperador, PagOperador);
  Application.CreateForm(TFormOperador, FormOperador);
  Application.CreateForm(Tdm1, dm1);
  Application.Run;
end.
