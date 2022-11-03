create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint not null, primary key (id)) engine=InnoDB;
create table cozinha (id bigint not null auto_increment, nome varchar(255) not null, primary key (id)) engine=InnoDB;
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB;
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB;
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB;
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB;
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB;
create table produto (id bigint not null auto_increment, ativo bit not null, descricao varchar(255) not null, nome varchar(255) not null, preco decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB;
create table restaurante (id bigint not null auto_increment, data_atualizacao datetime not null, data_cadastro datetime not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete decimal(19,2) not null, cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB;
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB;
create table usuario (id bigint not null auto_increment, data_cadastro datetime not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB;
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB;
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id);
alter table grupo_permissao add constraint FKh21kiw0y0hxg6birmdf2ef6vy foreign key (permissao_id) references permissao (id);
alter table grupo_permissao add constraint FKta4si8vh3f4jo3bsslvkscc2m foreign key (grupo_id) references grupo (id);
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id);
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id);
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id);
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id);
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id);
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id);
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id);
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint not null, primary key (id)) engine=InnoDB;
create table cozinha (id bigint not null auto_increment, nome varchar(255) not null, primary key (id)) engine=InnoDB;
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB;
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB;
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB;
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB;
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB;
create table produto (id bigint not null auto_increment, ativo bit not null, descricao varchar(255) not null, nome varchar(255) not null, preco decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB;
create table restaurante (id bigint not null auto_increment, data_atualizacao datetime not null, data_cadastro datetime not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete decimal(19,2) not null, cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB;
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB;
create table usuario (id bigint not null auto_increment, data_cadastro datetime not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB;
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB;
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id);
alter table grupo_permissao add constraint FKh21kiw0y0hxg6birmdf2ef6vy foreign key (permissao_id) references permissao (id);
alter table grupo_permissao add constraint FKta4si8vh3f4jo3bsslvkscc2m foreign key (grupo_id) references grupo (id);
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id);
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id);
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id);
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id);
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id);
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id);
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id);
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint not null, primary key (id)) engine=InnoDB;
create table cozinha (id bigint not null auto_increment, nome varchar(255) not null, primary key (id)) engine=InnoDB;
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB;
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB;
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB;
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB;
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB;
create table produto (id bigint not null auto_increment, ativo bit not null, descricao varchar(255) not null, nome varchar(255) not null, preco decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB;
create table restaurante (id bigint not null auto_increment, data_atualizacao datetime not null, data_cadastro datetime not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete decimal(19,2) not null, cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB;
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB;
create table usuario (id bigint not null auto_increment, data_cadastro datetime not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB;
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB;
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id);
alter table grupo_permissao add constraint FKh21kiw0y0hxg6birmdf2ef6vy foreign key (permissao_id) references permissao (id);
alter table grupo_permissao add constraint FKta4si8vh3f4jo3bsslvkscc2m foreign key (grupo_id) references grupo (id);
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id);
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id);
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id);
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id);
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id);
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id);
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id);
# insert into cozinha (nome);
# values ('Tailandesa');
#;
# insert into cozinha (nome);
# values ('Indiana');
#;
# insert into cozinha (nome);
# values ('Brasileira');
#;
# insert into cozinha (nome);
# values ('Coreana');
#;
#;
# insert into forma_pagamento (descricao);
# values ('Cartão Debito');
#;
# insert into forma_pagamento (descricao);
# values ('Dinheiro');
#;
# insert into forma_pagamento (descricao);
# values ('Pix');
#;
# insert into forma_pagamento (descricao);
# values ('Cartão Credito');
#;
#;
# insert into permissao (nome, descricao);
# values ('Andamento Pedido', 'Aprovado');
#;
# insert into permissao (nome, descricao);
# values ('Andamento Pedido', 'Cancelado');
#;
# insert into permissao (nome, descricao);
# values ('Andamento Pedido', 'Em Andamento');
#;
# insert into permissao (nome, descricao);
# values ('Andamento Pedido', 'Saiu Para Entrega ');
#;
#;
# insert into estado (nome);
# values ('Tocantins');
#;
# insert into estado (nome);
# values ('Pernambuco');
#;
# insert into estado (nome);
# values ('Para');
#;
# insert into estado (nome);
# values ('Minas Gerais');
#;
#;
# insert into cidade (nome_cidade, nome_estado, estado_id);
# values ('Palmas', 'Tocantins', 1);
#;
# insert into cidade (nome_cidade, nome_estado, estado_id);
# values ('Recife', 'Pernanbuco', 2);
#;
# insert into cidade (nome_cidade, nome_estado, estado_id);
# values ('Belem', 'Pára', 3);
#;
# insert into cidade (nome_cidade, nome_estado, estado_id);
# values ('Uberlandia', 'Minas Gerais', 4);
#;
#;
# insert into restaurante (data_atualizacao, data_cadastro, nome, taxa_frete, cozinha_id,;
#                          endereco_cep, endereco_logradouro, endereco_numero, endereco_complemento,;
#                          endereco_bairro, endereco_cidade_id);
# values ('2022-06-07 15:05:41.000000', '2022-06-07 15:05:41.000000', 'Tailandesa', 'R$10,00', 1, '77890720',;
#         'rua 2 QD 41', 'CS 2', 'S/C', 'Taquaralto', 1);
# insert into restaurante (data_atualizacao, data_cadastro, nome, taxa_frete, cozinha_id,;
#                          endereco_cep, endereco_logradouro, endereco_numero, endereco_complemento,;
#                          endereco_bairro, endereco_cidade_id);
# values ('2022-06-07 15:05:41.000000','2022-06-07 15:05:41.000000' , 'Indiana','R$10,00' , 2, '77890232',;
#         'Rua 03 Qd 41', 'CS 23', 'S/C', 'Jacauna',2);
# insert into restaurante (data_atualizacao, data_cadastro, nome, taxa_frete, cozinha_id,;
#                          endereco_cep, endereco_logradouro, endereco_numero, endereco_complemento,;
#                          endereco_bairro, endereco_cidade_id);
# values ('2022-06-07 15:05:41.000000', '2022-06-07 15:05:41.000000', 'Brasileira', 'R$10,00', 3, '78643521',;
#         'Rua 23 Qd 34', 'CS 3','S/C', 'Santa Tereza',3);
# --;
# insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id);
# values (1, 1);
# insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id);
# values (1, 2);
# insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id);
# values (1, 3);
# insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id);
# values (1, 4);
#;
# insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id);
# values (2, 1);
# insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id);
# values (2, 2);
# insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id);
# values (2, 4);
#;
# insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id);
# values (3, 2);
# insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id);
# values (3, 3);
#;
# insert into produto (nome, descricao, preco, ativo, restaurante_id);
# values ('coca_cola 2 litros', 'bebida ', '10.99', true, 2);
# insert into produto (nome, descricao, preco, ativo, restaurante_id);
# values ('Suco laranja 2 litros', 'bebida', '13.99', true, 1);
create table cidade (id bigint not null auto_increment, name_cidade varchar(255), estado_id bigint not null, primary key (id)) engine=InnoDB;
create table cozinha (id bigint not null auto_increment, nome varchar(255) not null, primary key (id)) engine=InnoDB;
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB;
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB;
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB;
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB;
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB;
create table produto (id bigint not null auto_increment, ativo bit not null, descricao varchar(255) not null, nome varchar(255) not null, preco decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB;
create table restaurante (id bigint not null auto_increment, data_atualizacao datetime not null, data_cadastro datetime not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete decimal(19,2) not null, cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB;
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB;
create table usuario (id bigint not null auto_increment, data_cadastro datetime not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB;
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB;
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id);
alter table grupo_permissao add constraint FKh21kiw0y0hxg6birmdf2ef6vy foreign key (permissao_id) references permissao (id);
alter table grupo_permissao add constraint FKta4si8vh3f4jo3bsslvkscc2m foreign key (grupo_id) references grupo (id);
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id);
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id);
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id);
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id);
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id);
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id);
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id);
insert into cozinha (nome);
values ('Tailandesa');
insert into cozinha (nome);
values ('Indiana');
insert into cozinha (nome);
values ('Brasileira');
insert into cozinha (nome);
values ('Coreana');
insert into forma_pagamento (descricao);
values ('Cartão Debito');
insert into forma_pagamento (descricao);
values ('Dinheiro');
insert into forma_pagamento (descricao);
values ('Pix');
insert into forma_pagamento (descricao);
values ('Cartão Credito');
insert into permissao (nome, descricao);
values ('Andamento Pedido', 'Aprovado');
insert into permissao (nome, descricao);
values ('Andamento Pedido', 'Cancelado');
insert into permissao (nome, descricao);
values ('Andamento Pedido', 'Em Andamento');
insert into permissao (nome, descricao);
values ('Andamento Pedido', 'Saiu Para Entrega ');
insert into estado (nome);
values ('Tocantins');
insert into estado (nome);
values ('Pernambuco');
insert into estado (nome);
values ('Para');
insert into estado (nome);
values ('Minas Gerais');
insert into cidade (nome_cidade, nome_estado, estado_id);
values ('Palmas', 'Tocantins', 1);
insert into cidade (nome_cidade, nome_estado, estado_id);
values ('Recife', 'Pernanbuco', 2);
insert into cidade (nome_cidade, nome_estado, estado_id);
values ('Belem', 'Pára', 3);
insert into cidade (nome_cidade, nome_estado, estado_id);
values ('Uberlandia', 'Minas Gerais', 4);
insert into restaurante (data_atualizacao, data_cadastro, nome, taxa_frete, cozinha_id,;
endereco_cep, endereco_logradouro, endereco_numero, endereco_complemento,;
endereco_bairro, endereco_cidade_id);
values ('2022-06-07 15:05:41.000000', '2022-06-07 15:05:41.000000', 'Tailandesa', 'R$10,00', 1, '77890720',;
'rua 2 QD 41', 'CS 2', 'S/C', 'Taquaralto', 1);
insert into restaurante (data_atualizacao, data_cadastro, nome, taxa_frete, cozinha_id,;
endereco_cep, endereco_logradouro, endereco_numero, endereco_complemento,;
endereco_bairro, endereco_cidade_id);
values ('2022-06-07 15:05:41.000000','2022-06-07 15:05:41.000000' , 'Indiana','R$10,00' , 2, '77890232',;
'Rua 03 Qd 41', 'CS 23', 'S/C', 'Jacauna',2);
insert into restaurante (data_atualizacao, data_cadastro, nome, taxa_frete, cozinha_id,;
endereco_cep, endereco_logradouro, endereco_numero, endereco_complemento,;
endereco_bairro, endereco_cidade_id);
values ('2022-06-07 15:05:41.000000', '2022-06-07 15:05:41.000000', 'Brasileira', 'R$10,00', 3, '78643521',;
'Rua 23 Qd 34', 'CS 3','S/C', 'Santa Tereza',3);
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id);
values (1, 1);
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id);
values (1, 2);
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id);
values (1, 3);
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id);
values (1, 4);
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id);
values (2, 1);
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id);
values (2, 2);
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id);
values (2, 4);
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id);
values (3, 2);
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id);
values (3, 3);
insert into produto (nome, descricao, preco, ativo, restaurante_id);
values ('coca_cola 2 litros', 'bebida ', '10.99', true, 2);
insert into produto (nome, descricao, preco, ativo, restaurante_id);
values ('Suco laranja 2 litros', 'bebida', '13.99', true, 1);
create table cidade (id bigint not null auto_increment, nome_cidade varchar(255), estado_id bigint not null, primary key (id)) engine=InnoDB;
create table cozinha (id bigint not null auto_increment, nome varchar(255) not null, primary key (id)) engine=InnoDB;
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB;
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB;
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB;
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB;
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB;
create table produto (id bigint not null auto_increment, ativo bit not null, descricao varchar(255) not null, nome varchar(255) not null, preco decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB;
create table restaurante (id bigint not null auto_increment, data_atualizacao datetime not null, data_cadastro datetime not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete decimal(19,2) not null, cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB;
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB;
create table usuario (id bigint not null auto_increment, data_cadastro datetime not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB;
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB;
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id);
alter table grupo_permissao add constraint FKh21kiw0y0hxg6birmdf2ef6vy foreign key (permissao_id) references permissao (id);
alter table grupo_permissao add constraint FKta4si8vh3f4jo3bsslvkscc2m foreign key (grupo_id) references grupo (id);
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id);
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id);
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id);
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id);
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id);
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id);
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id);
insert into cozinha (nome);
values ('Tailandesa');
insert into cozinha (nome);
values ('Indiana');
insert into cozinha (nome);
values ('Brasileira');
insert into cozinha (nome);
values ('Coreana');
insert into forma_pagamento (descricao);
values ('Cartão Debito');
insert into forma_pagamento (descricao);
values ('Dinheiro');
insert into forma_pagamento (descricao);
values ('Pix');
insert into forma_pagamento (descricao);
values ('Cartão Credito');
insert into permissao (nome, descricao);
values ('Andamento Pedido', 'Aprovado');
insert into permissao (nome, descricao);
values ('Andamento Pedido', 'Cancelado');
insert into permissao (nome, descricao);
values ('Andamento Pedido', 'Em Andamento');
insert into permissao (nome, descricao);
values ('Andamento Pedido', 'Saiu Para Entrega ');
insert into estado (nome);
values ('Tocantins');
insert into estado (nome);
values ('Pernambuco');
insert into estado (nome);
values ('Para');
insert into estado (nome);
values ('Minas Gerais');
insert into cidade (nome_cidade, nome_estado, estado_id);
values ('Palmas', 'Tocantins', 1);
insert into cidade (nome_cidade, nome_estado, estado_id);
values ('Recife', 'Pernanbuco', 2);
insert into cidade (nome_cidade, nome_estado, estado_id);
values ('Belem', 'Pára', 3);
insert into cidade (nome_cidade, nome_estado, estado_id);
values ('Uberlandia', 'Minas Gerais', 4);
insert into restaurante (data_atualizacao, data_cadastro, nome, taxa_frete, cozinha_id,;
endereco_cep, endereco_logradouro, endereco_numero, endereco_complemento,;
endereco_bairro, endereco_cidade_id);
values ('2022-06-07 15:05:41.000000', '2022-06-07 15:05:41.000000', 'Tailandesa', 'R$10,00', 1, '77890720',;
'rua 2 QD 41', 'CS 2', 'S/C', 'Taquaralto', 1);
insert into restaurante (data_atualizacao, data_cadastro, nome, taxa_frete, cozinha_id,;
endereco_cep, endereco_logradouro, endereco_numero, endereco_complemento,;
endereco_bairro, endereco_cidade_id);
values ('2022-06-07 15:05:41.000000','2022-06-07 15:05:41.000000' , 'Indiana','R$10,00' , 2, '77890232',;
'Rua 03 Qd 41', 'CS 23', 'S/C', 'Jacauna',2);
insert into restaurante (data_atualizacao, data_cadastro, nome, taxa_frete, cozinha_id,;
endereco_cep, endereco_logradouro, endereco_numero, endereco_complemento,;
endereco_bairro, endereco_cidade_id);
values ('2022-06-07 15:05:41.000000', '2022-06-07 15:05:41.000000', 'Brasileira', 'R$10,00', 3, '78643521',;
'Rua 23 Qd 34', 'CS 3','S/C', 'Santa Tereza',3);
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id);
values (1, 1);
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id);
values (1, 2);
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id);
values (1, 3);
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id);
values (1, 4);
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id);
values (2, 1);
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id);
values (2, 2);
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id);
values (2, 4);
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id);
values (3, 2);
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id);
values (3, 3);
insert into produto (nome, descricao, preco, ativo, restaurante_id);
values ('coca_cola 2 litros', 'bebida ', '10.99', true, 2);
insert into produto (nome, descricao, preco, ativo, restaurante_id);
values ('Suco laranja 2 litros', 'bebida', '13.99', true, 1);
create table cidade (id bigint not null auto_increment, nome_cidade varchar(255), estado_id bigint not null, primary key (id)) engine=InnoDB;
create table cozinha (id bigint not null auto_increment, nome varchar(255) not null, primary key (id)) engine=InnoDB;
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB;
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB;
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB;
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB;
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB;
create table produto (id bigint not null auto_increment, ativo bit not null, descricao varchar(255) not null, nome varchar(255) not null, preco decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB;
create table restaurante (id bigint not null auto_increment, data_atualizacao datetime not null, data_cadastro datetime not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete decimal(19,2) not null, cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB;
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB;
create table usuario (id bigint not null auto_increment, data_cadastro datetime not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB;
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB;
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id);
alter table grupo_permissao add constraint FKh21kiw0y0hxg6birmdf2ef6vy foreign key (permissao_id) references permissao (id);
alter table grupo_permissao add constraint FKta4si8vh3f4jo3bsslvkscc2m foreign key (grupo_id) references grupo (id);
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id);
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id);
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id);
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id);
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id);
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id);
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id);
insert into cozinha (nome);
values ('Tailandesa');
insert into cozinha (nome);
values ('Indiana');
insert into cozinha (nome);
values ('Brasileira');
insert into cozinha (nome);
values ('Coreana');
insert into forma_pagamento (descricao);
values ('Cartão Debito');
insert into forma_pagamento (descricao);
values ('Dinheiro');
insert into forma_pagamento (descricao);
values ('Pix');
insert into forma_pagamento (descricao);
values ('Cartão Credito');
insert into permissao (nome, descricao);
values ('Andamento Pedido', 'Aprovado');
insert into permissao (nome, descricao);
values ('Andamento Pedido', 'Cancelado');
insert into permissao (nome, descricao);
values ('Andamento Pedido', 'Em Andamento');
insert into permissao (nome, descricao);
values ('Andamento Pedido', 'Saiu Para Entrega ');
insert into estado (nome);
values ('Tocantins');
insert into estado (nome);
values ('Pernambuco');
insert into estado (nome);
values ('Para');
insert into estado (nome);
values ('Minas Gerais');
insert into cidade (nome_cidade, nome_estado, estado_id);
values ('Palmas', 'Tocantins', 1);
insert into cidade (nome_cidade, nome_estado, estado_id);
values ('Recife', 'Pernanbuco', 2);
insert into cidade (nome_cidade, nome_estado, estado_id);
values ('Belem', 'Pára', 3);
insert into cidade (nome_cidade, nome_estado, estado_id);
values ('Uberlandia', 'Minas Gerais', 4);
insert into restaurante (data_atualizacao, data_cadastro, nome, taxa_frete, cozinha_id,;
endereco_cep, endereco_logradouro, endereco_numero, endereco_complemento,;
endereco_bairro, endereco_cidade_id);
values ('2022-06-07 15:05:41.000000', '2022-06-07 15:05:41.000000', 'Tailandesa', 'R$10,00', 1, '77890720',;
'rua 2 QD 41', 'CS 2', 'S/C', 'Taquaralto', 1);
insert into restaurante (data_atualizacao, data_cadastro, nome, taxa_frete, cozinha_id,;
endereco_cep, endereco_logradouro, endereco_numero, endereco_complemento,;
endereco_bairro, endereco_cidade_id);
values ('2022-06-07 15:05:41.000000','2022-06-07 15:05:41.000000' , 'Indiana','R$10,00' , 2, '77890232',;
'Rua 03 Qd 41', 'CS 23', 'S/C', 'Jacauna',2);
insert into restaurante (data_atualizacao, data_cadastro, nome, taxa_frete, cozinha_id,;
endereco_cep, endereco_logradouro, endereco_numero, endereco_complemento,;
endereco_bairro, endereco_cidade_id);
values ('2022-06-07 15:05:41.000000', '2022-06-07 15:05:41.000000', 'Brasileira', 'R$10,00', 3, '78643521',;
'Rua 23 Qd 34', 'CS 3','S/C', 'Santa Tereza',3);
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id);
values (1, 1);
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id);
values (1, 2);
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id);
values (1, 3);
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id);
values (1, 4);
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id);
values (2, 1);
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id);
values (2, 2);
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id);
values (2, 4);
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id);
values (3, 2);
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id);
values (3, 3);
insert into produto (nome, descricao, preco, ativo, restaurante_id);
values ('coca_cola 2 litros', 'bebida ', '10.99', true, 2);
insert into produto (nome, descricao, preco, ativo, restaurante_id);
values ('Suco laranja 2 litros', 'bebida', '13.99', true, 1);
create table cidade (id bigint not null auto_increment, nome_cidade varchar(255), estado_id bigint not null, primary key (id)) engine=InnoDB;
create table cozinha (id bigint not null auto_increment, nome varchar(255) not null, primary key (id)) engine=InnoDB;
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB;
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB;
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB;
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB;
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB;
create table produto (id bigint not null auto_increment, ativo bit not null, descricao varchar(255) not null, nome varchar(255) not null, preco decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB;
create table restaurante (id bigint not null auto_increment, data_atualizacao datetime not null, data_cadastro datetime not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete decimal(19,2) not null, cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB;
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB;
create table usuario (id bigint not null auto_increment, data_cadastro datetime not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB;
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB;
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id);
alter table grupo_permissao add constraint FKh21kiw0y0hxg6birmdf2ef6vy foreign key (permissao_id) references permissao (id);
alter table grupo_permissao add constraint FKta4si8vh3f4jo3bsslvkscc2m foreign key (grupo_id) references grupo (id);
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id);
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id);
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id);
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id);
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id);
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id);
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id);
