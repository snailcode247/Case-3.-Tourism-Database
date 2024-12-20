create database туризм;
use туризм;

create table Клиенты (
	id int auto_increment primary key,
    имя varchar(100) not null,
    телефон varchar(15),
    email varchar(100)
    );

create table Туры (
	id int auto_increment primary key,
    название varchar(100) not null,
    описание text,
    цена decimal(10,2) not null
    );

create table Услуги (
	id int auto_increment primary key,
    название varchar(100) not null,
    стоимость decimal(10,2)
    );
    
create table Гиды (
	id int auto_increment primary key,
    имя varchar(100) not null,
    контакт varchar(50),
    опыт int
    );
    
create table Заказы (
	id int auto_increment primary key,
    клиент_id int not null,
    тур_id int not null,
    услуга_id int,
    дата_заказа date not null,
    foreign key (клиент_id) references Клиенты(id),
    foreign key (тур_id) references Туры(id),
    foreign key (услуга_id) references Услуги(id)
    );
    
insert into Клиенты (имя, телефон, email) values
    ("Михаил Михайлов", "+79991111111", "mih@mail.com"),
    ("Дарья Дариева", "+79992222222", "dar@mail.com");
    
insert into Туры (название, описание, цена) values
	("Тур по ближнему востоку", "4 недели", 400000),
    ("Путёвка с санаторий", "7 дней", 50000);

insert into Услуги (название, стоимость) values
	("Трансфер", 10000),
    ("Экскурсия", 5000);

insert into Заказы (клиент_id, тур_id, услуга_id, дата_заказа) values
	(1,1,2, "2025-01-01"),
    (2,2,null, "2024-04-1");
    
SELECT 
    Заказы.id, 
    Клиенты.имя AS Клиент, 
    Туры.название AS Тур, 
    Услуги.название AS Услуга, 
    Заказы.дата_заказа
FROM 
    Заказы
LEFT JOIN Клиенты ON Заказы.клиент_id = Клиенты.id
LEFT JOIN Туры ON Заказы.тур_id = Туры.id
LEFT JOIN Услуги ON Заказы.услуга_id = Услуги.id;
    
    