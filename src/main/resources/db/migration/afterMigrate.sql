set foreign_key_checks = 0;

delete from cidade;
delete from estado;
delete from cozinha;
delete from forma_pagamento;
delete from grupo;
delete from grupo_permissao;
delete from permissao;
delete from produto;
delete from restaurante_forma_pagamento;
delete from usuario;
delete from usuario_grupo;

set foreign_key_checks = 1;

alter table cidade auto_increment = 1;
alter table estado auto_increment = 1;
alter table cozinha auto_increment = 1;
alter table forma_pagamento auto_increment = 1;
alter table grupo auto_increment = 1;
alter table permissao auto_increment = 1;
alter table produto auto_increment = 1;
alter table usuario auto_increment = 1;

insert into cozinha (nome)
values ('Tailandesa');

insert into cozinha (nome)
values ('Indiana');

insert into cozinha (nome)
values ('Brasileira');

insert into cozinha (nome)
values ('Coreana');


insert into forma_pagamento (descricao)
values ('Cartão Debito');

insert into forma_pagamento (descricao)
values ('Dinheiro');

insert into forma_pagamento (descricao)
values ('Pix');

insert into forma_pagamento (descricao)
values ('Cartão Credito');


insert into permissao (nome, descricao)
values ('Andamento Pedido', 'Aprovado');

insert into permissao (nome, descricao)
values ('Andamento Pedido', 'Cancelado');

insert into permissao (nome, descricao)
values ('Andamento Pedido', 'Em Andamento');

insert into permissao (nome, descricao)
values ('Andamento Pedido', 'Saiu Para Entrega ');


insert into estado (nome)
values ('Tocantins');

insert into estado (nome)
values ('Pernambuco');

insert into estado (nome)
values ('Para');

insert into estado (nome)
values ('Minas Gerais');


insert into cidade (nome_cidade, nome_estado, estado_id)
values ('Palmas', 'Tocantins', 1);

insert into cidade (nome_cidade, nome_estado, estado_id)
values ('Recife', 'Pernanbuco', 2);

insert into cidade (nome_cidade, nome_estado, estado_id)
values ('Belem', 'Pára', 3);

insert into cidade (nome_cidade, nome_estado, estado_id)
values ('Uberlandia', 'Minas Gerais', 4);


insert into restaurante (data_atualizacao, data_cadastro, nome, taxa_frete, cozinha_id,
                         endereco_cep, endereco_lograduro, endereco_numero, endereco_complemento,
                         endereco_bairro, endereco_cidade_id)
values ('2022-06-07 15:05:41.000000', '2022-06-07 15:05:41.000000', 'Tailandesa', 10.00, 1, '77890720',
        'rua 2 QD 41', 'CS 2', 'S/C', 'Taquaralto', 1);
insert into restaurante (data_atualizacao, data_cadastro, nome, taxa_frete, cozinha_id,
                         endereco_cep, endereco_lograduro, endereco_numero, endereco_complemento,
                         endereco_bairro, endereco_cidade_id)
values ('2022-06-07 15:05:41.000000','2022-06-07 15:05:41.000000' , 'Indiana',10.00 , 2, '77890232',
        'Rua 03 Qd 41', 'CS 23', 'S/C', 'Jacauna',2);
insert into restaurante (data_atualizacao, data_cadastro, nome, taxa_frete, cozinha_id,
                         endereco_cep, endereco_lograduro, endereco_numero, endereco_complemento,
                         endereco_bairro, endereco_cidade_id)
values ('2022-06-07 15:05:41.000000', '2022-06-07 15:05:41.000000', 'Brasileira', 10.00, 3, '78643521',
        'Rua 23 Qd 34', 'CS 3','S/C', 'Santa Tereza',3);
--
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id)
values (1, 1);
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id)
values (1, 2);
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id)
values (1, 3);
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id)
values (1, 4);

insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id)
values (2, 1);
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id)
values (2, 2);
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id)
values (2, 4);

insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id)
values (3, 2);
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id)
values (3, 3);

insert into produto (nome, descricao, preco, ativo, restaurante_id)
values ('coca_cola 2 litros', 'bebida ', '10.99', true, 2);
insert into produto (nome, descricao, preco, ativo, restaurante_id)
values ('Suco laranja 2 litros', 'bebida', '13.99', true, 1);





