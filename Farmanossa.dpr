program Farmanossa;

uses
  Vcl.Forms,
  u_login in 'u_login.pas' {FormLogin},
  u_dm1 in 'units\u_dm1.pas' {dm1: TDataModule},
  u_pag_inicial in 'units\u_pag_inicial.pas' {FormPrincipal},
  u_operadores in 'units\operadores\u_operadores.pas' {PagOperador},
  fm_buttons in 'units\frames\fm_buttons.pas' {FrameButtons: TFrame},
  u_infoProduto in 'units\produtos\u_infoProduto.pas' {FormProduto},
  u_produtos in 'units\produtos\u_produtos.pas' {PagProdutos},
  u_locais in 'units\locais\u_locais.pas' {PagLocais},
  u_infoLocal in 'units\locais\u_infoLocal.pas' {FormLocal},
  u_buscaLocal in 'units\entradas\u_buscaLocal.pas' {BuscaLocalForm},
  u_buscaProduto in 'units\entradas\u_buscaProduto.pas' {BuscaProdutoForm},
  u_entradas in 'units\entradas\u_entradas.pas' {PagEntradas},
  u_infoEntrada in 'units\entradas\u_infoEntrada.pas' {FormEntrada},
  u_controleForm in 'units\u_controleForm.pas',
  u_infoOperador in 'units\operadores\u_infoOperador.pas' {FormOperador},
  fr_estilo in 'units\frames\fr_estilo.pas' {FrameGrid: TFrame},
  fm_busca in 'units\frames\fm_busca.pas' {FrameBusca: TFrame},
  u_saidas in 'units\saidas\u_saidas.pas' {PagSaidas},
  u_infoSaida in 'units\saidas\u_infoSaida.pas' {FormSaida},
  u_selecionaLote in 'units\saidas\u_selecionaLote.pas' {SelecionaLoteForm},
  u_estoque in 'units\estoque\u_estoque.pas' {PagEstoque},
  u_lotesProduto in 'units\estoque\u_lotesProduto.pas' {LotesProdutoForm},
  u_detalharSaida in 'units\saidas\u_detalharSaida.pas' {DetalharSaidaForm},
  u_filtro_rel_1 in 'units\relatorios\filtros\u_filtro_rel_1.pas' {FormRel1},
  u_filtro_rel_2 in 'units\relatorios\filtros\u_filtro_rel_2.pas' {FormRel2},
  u_filtro_rel_3 in 'units\relatorios\filtros\u_filtro_rel_3.pas' {FormRel3},
  u_filtro_rel_4 in 'units\relatorios\filtros\u_filtro_rel_4.pas' {FormRel4},
  u_relatorios in 'units\relatorios\u_relatorios.pas',
  fm_filtroDataCod in 'units\frames\fm_filtroDataCod.pas' {FiltroDataCod: TFrame},
  u_selecionaProdutos in 'units\relatorios\u_selecionaProdutos.pas' {SelecionaProdutosForm},
  u_selecionarLocais in 'units\relatorios\u_selecionarLocais.pas' {SelecionarLocaisForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(Tdm1, dm1);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.

