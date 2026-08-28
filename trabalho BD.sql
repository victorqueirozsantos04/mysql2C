create database if not exists app_nutrilIA;
use app_nutrilIA;

create table usuario (
    id_usuario      int auto_increment primary key,
    nome            varchar(120)    not null,
    email           varchar(150)    not null unique,
    peso_kg         decimal(5,2),
    altura_cm       decimal(5,2),
    data_nascimento date
);

create table ALIMENTO (
    id_alimento         int auto_increment primary key,
    nome                varchar(120)    not null,
    calorias_100g       decimal(6,2),
    proteina_100g       decimal(6,2),
    carboidrato_100g    decimal(6,2),
    gordura_100g        decimal(6,2)
);

create table refeicao (
    id_refeicao     int auto_increment primary key,
    id_usuario      int not null,
    tipo            varchar(30),
    data_hora       datetime,
    constraint fk_refeicao_usuario
        foreign key (id_usuario) references usuario (id_usuario)
        on update cascade
        on delete cascade
);

create table meta_nutricional(
    id_meta            int auto_increment key,
    id_usuario          int not null,
    calorias_diarias    int,
    proteina_g          decimal(6,2),
    carboidrato_g       decimal(6,2),
    gordura_g           decimal(6,2),
    data_inicio         date,
    constraint fk_meta_usuario
        foreign key (id_usuario) references usuario (id_usuario)
        on update cascade
        on delete cascade
);

create table refeicao_alimento(
    id_refeicao     int not null,
    id_alimento     int not null,
     quantidade_g    decimal(6,2),
    primary key (id_refeicao, id_alimento),
    constraint fk_ra_refeicao
        foreign key (id_refeicao) references refeicao (id_refeicao)
        on update cascade
        on delete cascade,
    constraint fk_ra_alimento
        foreign key (id_alimento) references alimentos (id_alimento)
        on update cascade
        on delete cascade
);