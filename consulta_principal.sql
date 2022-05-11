create table tb_operador
(
  ope_codigo serial primary key,
  ope_nome varchar(50),
  ope_login varchar(20) unique,
  ope_senha varchar(20)
);
create table tb_produtos
(
  prod_codigo serial primary key,
  prod_descricao varchar(150),
  prod_estoque_negativo boolean,
  prod_status_entrada boolean,
  prod_status_saida boolean
);
create table tb_locais_estoque
(
  loc_codigo serial primary key,
  loc_descricao varchar(150),
  loc_status varchar(7)
);
create table tb_entrada
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
create table tb_saida
(
  sai_codigo serial primary key,
  sai_produto integer references tb_produtos(prod_codigo),
  sai_local integer references tb_locais_estoque(loc_codigo),
  sai_lote integer,
  sai_quantidade integer,
  sai_data_hora timestamp default current_timestamp
);