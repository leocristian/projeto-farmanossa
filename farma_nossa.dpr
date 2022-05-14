program farma_nossa;

uses
  Vcl.Forms,
  u_pag_inicial in 'units\u_pag_inicial.pas' {FormPrincipal},
  u_pag_login in 'units\u_pag_login.pas' {FormLogin},
  u_operadores in 'units\operadores\u_operadores.pas' {PagOperador},
  u_infoOperador in 'units\operadores\u_infoOperador.pas' {FormOperador},
  u_dm1 in 'units\u_dm1.pas' {dm1: TDataModule},
  u_controleForm in 'units\u_controleForm.pas' {$R *.res},
  u_infoProduto in 'units\produtos\u_infoProduto.pas' {FormProduto},
  u_produtos in 'units\produtos\u_produtos.pas' {PagProdutos},
  u_infoLocal in 'units\locais\u_infoLocal.pas' {FormLocal},
  u_locais in 'units\locais\u_locais.pas' {PagLocais};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TPagOperador, PagOperador);
  Application.CreateForm(TPagProdutos, PagProdutos);
  Application.CreateForm(TFormOperador, FormOperador);
  Application.CreateForm(TFormProduto, FormProduto);
  Application.CreateForm(Tdm1, dm1);
  Application.CreateForm(TFormLocal, FormLocal);
  Application.CreateForm(TPagLocais, PagLocais);
  Application.Run;
end.
