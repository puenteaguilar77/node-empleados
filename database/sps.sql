//sp para insertar nuevos registros a la tabla de empleado

DELIMITER //
Create PROCEDURE insert_newemp(
IN _name 			varchar(255),
IN _last_name 		varchar(255), 
IN _job_title 		varchar(255),
IN _age 			int,
IN _email 			varchar (255),
IN _photo 			varchar(255),
IN _adress 			varchar(255),
IN _phone			varchar(25)
)
BEGIN
	insert into empleado(id, name, last_name, job_title, age, email, photo, adress, phone, deleted_at, updated_at, created_at, user_id, estatus) 
		values (md5(UUID()), _name, _last_name, _job_title, _age, _email, _photo, _adress, _phone, NULL, NULL, curdate(), 1, 'ALTA');
	select* from empleado;
END //

DROP PROCEDURE insert_newemp

call insert_newemp('jorge', 'Lando', 'trapeador', 15, 'hola@gmail.com', 'foto.jpg', 'la valle', '558485-6598')

select * from empleado;

delete from empleado where id= ''

// PROCEDURE para obtener todos los empleados

DELIMITER //
Create PROCEDURE get_empleados(
_ready boolean
)
BEGIN
	select* from empleado;
END //

DROP PROCEDURE get_empleados

call get_empleados(true)