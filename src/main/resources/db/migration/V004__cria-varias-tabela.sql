create table forma_pagamento
(
    id        bigint      not null auto_increment,
    descricao varchar(80) not null,
    primary key (id)
) engine = InnoDB
  default charset = utf8;

create table grupo
(
    id   bigint      not null auto_increment,
    nome varchar(80) not null,
    primary key (id)
) engine = InnoDB
  default charset = utf8;

create table permissao
(
    id        bigint      not null auto_increment,
    descricao varchar(80) not null,
    nome      varchar(80) not null,
    primary key (id)
) engine = InnoDB
  default charset = utf8;

create table grupo_permissao
(
    grupo_id     bigint not null,
    permissao_id bigint not null,
    constraint fk_grupo_permissao_permissao foreign key (permissao_id) references permissao (id),
    constraint fk_grupo_permissao_grupo foreign key (grupo_id) references grupo (id)
) engine = InnoDB
  default charset = utf8;

create table restaurante
(
    id                   bigint         not null auto_increment,
    data_atualizacao     datetime       not null,
    data_cadastro        datetime       not null,
    endereco_bairro      varchar(255),
    endereco_cep         varchar(100),
    endereco_complemento varchar(255),
    endereco_logradouro   varchar(255),
    endereco_numero      varchar(255),
    nome                 varchar(255)   not null,
    taxa_frete           decimal(19, 2) not null,
    cozinha_id           bigint         not null,
    endereco_cidade_id   bigint         not null,
    primary key (id),
    constraint fk_restaurante_cozinha foreign key (cozinha_id) references cozinha (id),
    constraint fk_restaurante_cidade foreign key (endereco_cidade_id) references cidade (id)
) engine = InnoDB
  default charset = utf8;

create table produto
(
    id             bigint         not null auto_increment,
    ativo          bit            not null,
    descricao      varchar(255)   not null,
    nome           varchar(100)   not null,
    preco          decimal(19, 2) not null,
    restaurante_id bigint         not null,
    primary key (id),
    constraint fk_produto_restaurante foreign key (restaurante_id) references restaurante (id)

) engine = InnoDB
  default charset = utf8;


create table restaurante_forma_pagamento
(
    restaurante_id     bigint not null,
    forma_pagamento_id bigint not null,
    constraint fk_restaurante_f_pagamento_forma_pagamento foreign key (forma_pagamento_id) references forma_pagamento (id),
    constraint fk_restaurante_f_pagamento_restaurante foreign key (restaurante_id) references restaurante (id)
) engine = InnoDB
  default charset = utf8;

create table usuario
(
    id            bigint       not null auto_increment,
    data_cadastro datetime     not null,
    email         varchar(255) not null,
    nome          varchar(255) not null,
    senha         varchar(255) not null,
    primary key (id)
) engine = InnoDB
  default charset = utf8;

create table usuario_grupo
(
    usuario_id bigint not null,
    grupo_id   bigint not null,
    constraint fk_usuario_grupo_grupo foreign key (grupo_id) references grupo (id),
    constraint fk_usuario_grupo_usuario foreign key (usuario_id) references usuario (id)
) engine = InnoDB
  default charset = utf8;
