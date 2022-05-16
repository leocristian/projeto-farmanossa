create table tb_operadores
(
  ope_codigo serial primary key,
  ope_nome varchar(70),
  ope_login varchar(50) unique,
  ope_senha varchar(50)
);

select * from tb_operadores

create sequence tb_operadores_cod_seq
start with 1
increment by 1
owned by tb_operadores.ope_codigo;

create table tb_produtos
(
  prod_codigo serial primary key,
  prod_descricao varchar(70),
  prod_estoque_negativo varchar(8),
  prod_status_entrada varchar(7),
  prod_status_saida varchar(7)
);

create sequence tb_produtos_cod_seq
start with 1
increment by 1
owned by tb_produtos.prod_codigo;

create table tb_locais_estoque
(
  loc_codigo serial primary key,
  loc_descricao varchar(70),
  loc_status varchar(7)
);

create sequence tb_locais_cod_seq
start with 1
increment by 1
owned by tb_locais_estoque.loc_codigo;

create table tb_entradas
(
  ent_codigo serial primary key,
  ent_produto integer references tb_produtos(prod_codigo),
  ent_local integer references tb_locais_estoque(loc_codigo),
  ent_lote integer,
  ent_dtfabricacao date,
  ent_dtvencimento date,
  ent_quantidade integer,
  ent_data_hora timestamp default current_timestamp
);

create sequence tb_entradas_cod_seq
start with 1
increment by 1
owned by tb_entradas.ent_codigo;

create table tb_saidas
(
  sai_codigo serial primary key,
  sai_produto integer references tb_produtos(prod_codigo),
  sai_local integer references tb_locais_estoque(loc_codigo),
  sai_lote integer,
  sai_quantidade integer,
  sai_data_hora timestamp default current_timestamp
);

create sequence tb_saidas_cod_seq
start with 1
increment by 1
owned by tb_saidas.sai_codigo;