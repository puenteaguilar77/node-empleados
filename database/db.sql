CREATE DATABASE empleados;
USE empleados;

CREATE TABLE users(
    id              int NOT NULL,
    username        varchar(25) NOT NULL,
    password        varchar(60) NOT NULL,
    fullname        varchar(150) NOT NULL
);

alter table users
    ADD PRIMARY KEY(id);

alter table users
    MODIFY id int NOT NULL AUTO_INCREMENT;

ALTER TABLE users
  add column role varchar(25) NOT NULL;
ALTER TABLE users
  add column created_at datetime NOT NULL;

select * from users;

create table if not exists empleado(
  `id` 			varchar(32) NOT NULL,
  `name` 		varchar(255) NOT NULL,
  `last_name` 	varchar(255) NOT NULL,
  `job_title` 	varchar(255) NOT NULL,
  `age`			int NOT NULL,
  `email`		varchar(255) NOT NULL,
  `photo` 		varchar(255) NOT NULL,
  `adress` 		varchar(255) NOT NULL,
  `phone`		varchar(10) DEFAULT NULL,
  `deleted_at` 	timestamp NULL DEFAULT NULL,
  `updated_at` 	timestamp NULL DEFAULT NULL,
  `created_at` 	timestamp NULL DEFAULT current_timestamp,
  `user_id`     int,
  CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id),
  PRIMARY KEY (`id`)
);

ALTER TABLE empleado
  MODIFY phone varchar(25);

ALTER TABLE empleado
  add column estatus varchar(25) DEFAULT 'ALTA';
  
select * from empleado;



insert into empleado(id, name, last_name, job_title, age, email, photo, adress, phone, deleted_at, updated_at, created_at, user_id, estatus) values ( 	 md5(UUID()),	'Norma',	'Rivas',	'Desarrollador',	25,	'norma.rivas@gmail.com',	'null',	'la calle 1',	'55175-46329',	null,	null,	CURDATE(), 1, 'ALTA');
insert into empleado(id, name, last_name, job_title, age, email, photo, adress, phone, deleted_at, updated_at, created_at, user_id, estatus) values ( 	 md5(UUID()),	'Marco',	'Arras',	'Contador General',	38,	'marco.arras@gmail.com',	'null',	'la calle 2',	'55175-8564',	null,	null, 	CURDATE(), 1, 'ALTA');
insert into empleado(id, name, last_name, job_title, age, email, photo, adress, phone, deleted_at, updated_at, created_at, user_id, estatus) values ( 	 md5(UUID()),	'Martin',	'Hernandez',	'Desarrollador Web',	28,	'martin.hernandez@gmail.com',	'null',	'la calle 3',	'557856-3294',	null,	null, 	CURDATE(), 1, 'ALTA');
insert into empleado(id, name, last_name, job_title, age, email, photo, adress, phone, deleted_at, updated_at, created_at, user_id, estatus) values ( 	 md5(UUID()),	'Carlos',	'Rosas',	'Gerente Mercadotecnia',	35,	'carlos.rosas@gmail.com',	'null',	'la calle 4',	'558549-8594',	null,	null, 	CURDATE(), 1, 'ALTA');
insert into empleado(id, name, last_name, job_title, age, email, photo, adress, phone, deleted_at, updated_at, created_at, user_id, estatus) values ( 	 md5(UUID()),	'Oswaldo',	'Pérez',	'Supervisor RH',	38,	'oswaldo.perez@gmail.com',	'null',	'la calle 5',	'552634-7895',	null,	null, 	CURDATE(), 1, 'ALTA');
insert into empleado(id, name, last_name, job_title, age, email, photo, adress, phone, deleted_at, updated_at, created_at, user_id, estatus) values ( 	 md5(UUID()),	'Jessica',	'Terán',	'Limpieza',	42,	'jessica.teran@gmail.com',	'null',	'la calle 6',	'559876-7548',	null,	null, 	CURDATE(), 1, 'ALTA');
insert into empleado(id, name, last_name, job_title, age, email, photo, adress, phone, deleted_at, updated_at, created_at, user_id, estatus) values ( 	 md5(UUID()),	'Patricia',	'Velez',	'Desarrollador',	23,	'patricia.velez@gmail.com',	'null',	'la calle 7',	'551757-1246',	null,	null, 	CURDATE(), 1, 'ALTA');
insert into empleado(id, name, last_name, job_title, age, email, photo, adress, phone, deleted_at, updated_at, created_at, user_id, estatus) values ( 	 md5(UUID()),	'Jorge',	'Sánchez',	'CP',	45,	'jorge.sanchez@gmail.com',	'null',	'la calle 8',	'559864-7514',	null,	null, 	CURDATE(), 1, 'ALTA');
insert into empleado(id, name, last_name, job_title, age, email, photo, adress, phone, deleted_at, updated_at, created_at, user_id, estatus) values ( 	 md5(UUID()),	'Javier',	'Rangel',	'Desarrollador',	32,	'javier.rangel@gmail.com',	'null',	'la calle 9',	'556324-9475',	null,	null, 	CURDATE(), 1, 'ALTA');


insert into users(id, username, password, fullname,role, created_at) values ( null, 'Juan',	'hola123',	'Juan Alberto Puente', 'ADMIN', curdate());
insert into users(id, username, password, fullname, role, created_at) values ( null, 'Karla',	'admin123',	'Karla Valencia', 'USER', curdate());


