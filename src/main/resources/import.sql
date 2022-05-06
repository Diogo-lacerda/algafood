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

insert into cidade (nome, cep) values ('Palmas', '77006030')
insert into cidade (nome, cep) values ('Recife', '77006040')
insert into cidade (nome, cep) values ('Belem', '77006930')
insert into cidade (nome, cep) values ('Uberlandia', '77006670')

insert into restaurante (nome, taxa_frete, cozinha_id,  permissao_id, estado_id, cidade_id ) values (' Thai Gourmet', 10, 1, 3, 1, 1);
insert into restaurante (nome, taxa_frete, cozinha_id,  permissao_id, estado_id, cidade_id ) values (' Thai Delivery', 9.50, 1, 2, 3, 3);
insert into restaurante (nome, taxa_frete, cozinha_id,  permissao_id, estado_id, cidade_id ) values (' Tuk Tuk Comida Indiana', 15, 2, 1, 4, 4);

insert into restaurante_tem_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1);
insert into restaurante_tem_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 2);
insert into restaurante_tem_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 3);
insert into restaurante_tem_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 4);

insert into restaurante_tem_forma_pagamento (restaurante_id, forma_pagamento_id) values (2, 1);
insert into restaurante_tem_forma_pagamento (restaurante_id, forma_pagamento_id) values (2, 2);
insert into restaurante_tem_forma_pagamento (restaurante_id, forma_pagamento_id) values (2, 4);

insert into restaurante_tem_forma_pagamento (restaurante_id, forma_pagamento_id) values (3, 2);
insert into restaurante_tem_forma_pagamento (restaurante_id, forma_pagamento_id) values (3, 3);