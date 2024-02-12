
create table users (
    id_u int primary key not null,
    name_u varchar(25) not null,
    lastName_u varchar(25) not null,
    email_u varchar(50) not null,
    password_a varchar(20)  not null
);

create table admins(
    id_a int primary key not null,
    name_a varchar(25) not null,
    lastName_a varchar(25) not null,
    email_a varchar(50) not null,
    password_a varchar(20) not null
);

create table medications (
    id_med int primary key not null,
    name_med varchar(25) not null,
    quantity_med int(20) not null,
    measurement varchar(15) not null,
    sensebility int(11) not null
);

create table orders (
    id_ord int primary key not null,
    id_med ,

)