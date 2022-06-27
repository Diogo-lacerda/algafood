insert into cozinha (nome) values ('Tailandesa')
insert into cozinha (nome) values ('Indiana')
insert into cozinha (nome) values ('Brasileira')
insert into cozinha (nome) values ('Coreana')

insert into forma_pagamento (nome ) values ('Cartão Credito')
insert into forma_pagamento (nome ) values ('Cartão Debito')
insert into forma_pagamento (nome ) values ('Dinheiro')
insert into forma_pagamento (nome ) values ('Pix')

insert into permissao (nome ) values ('Aprovado')
insert into permissao (nome ) values ('Cancelado')
insert into permissao (nome ) values ('Em Andamento')
insert into permissao (nome ) values ('Saiu Para Entrega ')

insert into estado (nome, cep) values ('Tocantins', '77000000')
insert into estado (nome, cep) values ('Pernambuco', '77700080')
insert into estado (nome, cep) values ('Para', '77006000')
insert into estado (nome, cep) values ('Minas Gerais', '77006000')

insert into cidade (nome, cep ,estado_id ) values ('Palmas', '77006030', 1)
insert into cidade (nome, cep, estado_id) values ('Recife', '77006040', 2)
insert into cidade (nome, cep, estado_id) values ('Belem', '77006930', 3)
insert into cidade (nome, cep, estado_id) values ('Uberlandia', '77006670', 4)

insert into restaurante (data_atualizacao, data_cadastro, nome, taxa_frete, cozinha_id,  permissao_id, endereco_cep, endereco_lograduro, endereco_numero, endereco_complemento, endereco_bairro, endereco_cidade_id ) values ('2022-06-07 15:05:41.000000', '2022-06-07 15:05:41.000000','Thai Gourmet', 10, 1, 3, '7800483467', 'rua 2 QD 41', 'Nº 3', 'CS 2', 'Taquaralto', 1);
insert into restaurante (nome, taxa_frete, cozinha_id,  permissao_id, endereco_cep, endereco_lograduro, endereco_numero, endereco_complemento, endereco_bairro, endereco_cidade_id ) values ( ' Thai Delivery', 9, 1, 2,'780048567', 'rua 21 QD 40', 'Nº 1', 'CS 23', 'Jacauna', 3 );
insert into restaurante (nome, taxa_frete, cozinha_id,  permissao_id, endereco_cep, endereco_lograduro, endereco_numero, endereco_complemento, endereco_bairro, endereco_cidade_id  ) values ( ' Tuk Tuk Comida Indiana', 15, 2, 1,'7460048567', 'rua 10 QD 34', 'Nº 1', 'CS 3', 'Serra dourada', 4 );
--
insert into restaurante_forma_pagamento  (restaurante_id, forma_pagamento_id) values (1, 1);
insert into restaurante_forma_pagamento  (restaurante_id, forma_pagamento_id) values (1, 2);
insert into restaurante_forma_pagamento  (restaurante_id, forma_pagamento_id) values (1, 3);
insert into restaurante_forma_pagamento  (restaurante_id, forma_pagamento_id) values (1, 4);

insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (2, 1);
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (2, 2);
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (2, 4);

insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (3, 2);
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (3, 3);

insert into produto (nome, descricao, preco, ativo,  restaurante_id) values ('coca_cola 2 litros', 'bebida ', '10.99', true, 2);
insert into produto (nome, descricao, preco, ativo,  restaurante_id) values ('Suco laranja 2 litros', 'bebida', '13.99', true, 1);