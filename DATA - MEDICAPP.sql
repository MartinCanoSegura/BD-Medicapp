CREATE TABLE 
    oauth_access_token 
    ( 
        token_id CHARACTER VARYING(256), 
        token BYTEA, 
        authentication_id CHARACTER VARYING(256), 
        user_name         CHARACTER VARYING(256), 
        client_id         CHARACTER VARYING(256), 
        authentication BYTEA, 
        refresh_token CHARACTER VARYING(256) 
    );

CREATE TABLE 
    oauth_refresh_token 
    ( 
        token_id CHARACTER VARYING(256), 
        token BYTEA, 
        authentication BYTEA 
    );



INSERT INTO archivo (id_archivo, filename, filetype) VALUES (1, 'IMG_0525.JPG', 'image/jpeg');
INSERT INTO archivo (id_archivo, filename, filetype) VALUES (2, 'Lavadora Lg.txt', 'text/plain');
INSERT INTO archivo (id_archivo, filename, filetype) VALUES (3, 'Refrigerador Lg Sears.png', 'image/png');
INSERT INTO archivo (id_archivo, filename, filetype) VALUES (4, 'Refrigerador Lg Sears.png', 'image/png');
INSERT INTO archivo (id_archivo, filename, filetype) VALUES (5, 'Refrigerador Lg Sears.png', 'image/png');

INSERT INTO especialidad (id_especialidad, descripcion, nombre) VALUES (1, 'NEUROLOGIA', 'ENFERMEDADES DEL CEREBRO');
INSERT INTO especialidad (id_especialidad, descripcion, nombre) VALUES (2, 'CARDIOLOGIA', 'ENFERMEDADES DEL CORAZON');

INSERT INTO examen (id_examen, descripcion, nombre) VALUES (1, 'CON CONTRASTE', 'RAYOS X ');
INSERT INTO examen (id_examen, descripcion, nombre) VALUES (2, 'DE 27 ELEMTOS', 'SANGRE');

INSERT INTO medico (id_medico, cmp, apellidos, foto_url, nombres) VALUES (3, '123456788', 'laure', 'https://www.eluniverso.com/resizer/B1PGGb6MaTVzQstULdDgzl-zxdY=/994x670/smart/filters:quality(70)/cloudfront-us-east-1.images.arcpublishing.com/eluniverso/AQL7EUBHGRAJJGBWOBMECISNMY.jpg', 'House');
INSERT INTO medico (id_medico, cmp, apellidos, foto_url, nombres) VALUES (4, '1234567', 'Diaz Mamacita', 'https://ktarsis.files.wordpress.com/2009/09/ktjennifermorrisonpic.jpg?w=584', 'Cameron');
INSERT INTO medico (id_medico, cmp, apellidos, foto_url, nombres) VALUES (2, '123456789', 'Gomez Bolaños Chess', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJ144IwL_b5kc5KxH76CMMLwmFD6bXBKzXDg&usqp=CAU', 'Chapatin');
INSERT INTO medico (id_medico, cmp, apellidos, foto_url, nombres) VALUES (7, '192837465', 'DR', 'https://www.yotambien.mx/wp-content/uploads/2022/01/Doctor-Octopus-yotambienmx.jpg', 'Octopus');
INSERT INTO medico (id_medico, cmp, apellidos, foto_url, nombres) VALUES (5, '1234767', 'Ranch', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScaINnsTQrsaszxJqZfCR6YllVMxRwkOqMSQ&usqp=CAU', 'Quinn');
INSERT INTO medico (id_medico, cmp, apellidos, foto_url, nombres) VALUES (8, '198273645', 'Ratodimy', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTj8q6atBf9nTbitJms0W7cbpik7q9r4TqTQ&usqp=CAU', 'Franchesca');
INSERT INTO medico (id_medico, cmp, apellidos, foto_url, nombres) VALUES (1, '123456789132', 'Stanger', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAYqq_jrUQ8T_-Bpilgr3TLPIj2-Xn5JcYJA&usqp=CAU', 'Stranger');
INSERT INTO medico (id_medico, cmp, apellidos, foto_url, nombres) VALUES (9, '101010101010', 'Cano Segura', 'c:/users/mcs/pictures/mcs.png', 'Martin');

INSERT INTO menu (id_menu, icono, nombre, url) VALUES (1, 'search', 'Buscar', '/buscar');
INSERT INTO menu (id_menu, icono, nombre, url) VALUES (2, 'insert_drive_file', 'Registrar', '/consulta');
INSERT INTO menu (id_menu, icono, nombre, url) VALUES (3, 'insert_drive_file', 'Registrar E.', '/consulta-especial');
INSERT INTO menu (id_menu, icono, nombre, url) VALUES (4, 'view_carousel', 'Registrar W.', '/consulta-wizard');
INSERT INTO menu (id_menu, icono, nombre, url) VALUES (5, 'star_rate', 'Especialiades', '/especialidad');
INSERT INTO menu (id_menu, icono, nombre, url) VALUES (7, 'assignment', 'Examenes', '/examen');
INSERT INTO menu (id_menu, icono, nombre, url) VALUES (8, 'accessibility', 'Pacientes', '/paciente');
INSERT INTO menu (id_menu, icono, nombre, url) VALUES (9, 'assessment', 'Reportes', '/reporte');
INSERT INTO menu (id_menu, icono, nombre, url) VALUES (10, 'home', 'Indice', '/indice');
INSERT INTO menu (id_menu, icono, nombre, url) VALUES (6, 'healing', 'Medicos', '/medico');

INSERT INTO rol (id_rol, descripcion, nombre) VALUES (2, 'USUARIO', 'USER');
INSERT INTO rol (id_rol, descripcion, nombre) VALUES (3, 'ADMINISTRADOR DE BD', 'DBA');
INSERT INTO rol (id_rol, descripcion, nombre) VALUES (1, 'ADMINISTRADOR', 'ADMIN');
INSERT INTO rol (id_rol, descripcion, nombre) VALUES (4, 'GERENTE DE SUCURSAL', 'GERENTE');

INSERT INTO menu_rol (id_menu, id_rol) VALUES (1, 1);
INSERT INTO menu_rol (id_menu, id_rol) VALUES (3, 1);
INSERT INTO menu_rol (id_menu, id_rol) VALUES (4, 1);
INSERT INTO menu_rol (id_menu, id_rol) VALUES (7, 1);
INSERT INTO menu_rol (id_menu, id_rol) VALUES (9, 1);
INSERT INTO menu_rol (id_menu, id_rol) VALUES (3, 2);
INSERT INTO menu_rol (id_menu, id_rol) VALUES (4, 2);
INSERT INTO menu_rol (id_menu, id_rol) VALUES (2, 1);
INSERT INTO menu_rol (id_menu, id_rol) VALUES (6, 1);
INSERT INTO menu_rol (id_menu, id_rol) VALUES (6, 4);
INSERT INTO menu_rol (id_menu, id_rol) VALUES (8, 2);
INSERT INTO menu_rol (id_menu, id_rol) VALUES (8, 1);
INSERT INTO menu_rol (id_menu, id_rol) VALUES (8, 4);
INSERT INTO menu_rol (id_menu, id_rol) VALUES (5, 2);
INSERT INTO menu_rol (id_menu, id_rol) VALUES (5, 1);
INSERT INTO menu_rol (id_menu, id_rol) VALUES (5, 4);
INSERT INTO menu_rol (id_menu, id_rol) VALUES (10, 1);

INSERT INTO paciente (id_paciente, apellidos, direccion, dni, email, nombres, telefono, total_signos) VALUES (14, 'RUIZ', null, '72301309', 'carlos@gmail.com', 'ROBERTO', '991855522', null);
INSERT INTO paciente (id_paciente, apellidos, direccion, dni, email, nombres, telefono, total_signos) VALUES (16, 'RUIZ', null, '72301322', 'carlos@gmail.com', 'JEREMY', '991855557', null);
INSERT INTO paciente (id_paciente, apellidos, direccion, dni, email, nombres, telefono, total_signos) VALUES (22, 'RUIZ', null, '72301801', 'carlos@gmail.com', 'CARLOS', '991855564', null);
INSERT INTO paciente (id_paciente, apellidos, direccion, dni, email, nombres, telefono, total_signos) VALUES (23, 'RUIZ', null, '72308301', 'carlos@gmail.com', 'EDUARDO', '991855565', null);
INSERT INTO paciente (id_paciente, apellidos, direccion, dni, email, nombres, telefono, total_signos) VALUES (24, 'RUIZ', null, '72301901', 'carlos@gmail.com', 'LESTER', '991855566', null);
INSERT INTO paciente (id_paciente, apellidos, direccion, dni, email, nombres, telefono, total_signos) VALUES (25, 'RUIZ', null, '72301381', 'carlos@gmail.com', 'ERIKA', '991855567', null);
INSERT INTO paciente (id_paciente, apellidos, direccion, dni, email, nombres, telefono, total_signos) VALUES (26, 'RUIZ', null, '72301311', 'carlos@gmail.com', 'TOMAS', '991855568', null);
INSERT INTO paciente (id_paciente, apellidos, direccion, dni, email, nombres, telefono, total_signos) VALUES (27, 'RUIZ', null, '72301491', 'carlos@gmail.com', 'TOMASA', '991855569', null);
INSERT INTO paciente (id_paciente, apellidos, direccion, dni, email, nombres, telefono, total_signos) VALUES (28, 'RUIZ', null, '72301384', 'carlos@gmail.com', 'TITO', '991855570', null);
INSERT INTO paciente (id_paciente, apellidos, direccion, dni, email, nombres, telefono, total_signos) VALUES (29, 'RUIZ', null, '72301341', 'carlos@gmail.com', 'YAHAIRA', '991855571', null);
INSERT INTO paciente (id_paciente, apellidos, direccion, dni, email, nombres, telefono, total_signos) VALUES (30, 'RUIZ', null, '72301342', 'carlos@gmail.com', 'BRAYAN', '991855572', null);
INSERT INTO paciente (id_paciente, apellidos, direccion, dni, email, nombres, telefono, total_signos) VALUES (31, 'RUIZ', null, '72301343', 'carlos@gmail.com', 'KEVIN', '991855573', null);
INSERT INTO paciente (id_paciente, apellidos, direccion, dni, email, nombres, telefono, total_signos) VALUES (32, 'RUIZ', null, '72301344', 'carlos@gmail.com', 'BRITTANY', '991855574', null);
INSERT INTO paciente (id_paciente, apellidos, direccion, dni, email, nombres, telefono, total_signos) VALUES (33, 'RUIZ', null, '72301345', 'carlos@gmail.com', 'JULIO', '991855575', null);
INSERT INTO paciente (id_paciente, apellidos, direccion, dni, email, nombres, telefono, total_signos) VALUES (36, 'RUIZ', null, '72301348', 'carlos@gmail.com', 'PAOLO', '991855578', null);
INSERT INTO paciente (id_paciente, apellidos, direccion, dni, email, nombres, telefono, total_signos) VALUES (37, 'RUIZ', null, '72301349', 'carlos@gmail.com', 'PAOLA', '991855579', null);
INSERT INTO paciente (id_paciente, apellidos, direccion, dni, email, nombres, telefono, total_signos) VALUES (2, 'RUIZ', 'conocidaa', '72381302', 'carlos@gmail.com', 'ANDRES', '991855512', null);
INSERT INTO paciente (id_paciente, apellidos, direccion, dni, email, nombres, telefono, total_signos) VALUES (3, 'RUIZ', 'conocida', '72371303', 'carlos@gmail.com', 'ANA', '991855513', null);
INSERT INTO paciente (id_paciente, apellidos, direccion, dni, email, nombres, telefono, total_signos) VALUES (35, 'RUIZ', 'conocido', '72301347', 'carlos@gmail.com', 'CESAR', '991855577', null);
INSERT INTO paciente (id_paciente, apellidos, direccion, dni, email, nombres, telefono, total_signos) VALUES (20, 'RUIZ', 'conocida', '72301316', 'carlos@gmail.com', 'MARCOS', '991855562', 1);
INSERT INTO paciente (id_paciente, apellidos, direccion, dni, email, nombres, telefono, total_signos) VALUES (1, 'RUIZ', 'conocidaa', '72392301', 'carlos@gmail.com', 'CARLOS', '991855511', 3);
INSERT INTO paciente (id_paciente, apellidos, direccion, dni, email, nombres, telefono, total_signos) VALUES (4, 'RUIZ', 'conocida', '72361304', 'carlos@gmail.com', 'MARIA', '991855514', 3);
INSERT INTO paciente (id_paciente, apellidos, direccion, dni, email, nombres, telefono, total_signos) VALUES (5, 'RUIZ', 'comnocida', '72351305', 'carlos@gmail.com', 'KAREN', '991855512', 2);
INSERT INTO paciente (id_paciente, apellidos, direccion, dni, email, nombres, telefono, total_signos) VALUES (21, 'RUIZ', 'conocida', '72301391', 'carlos@gmail.com', 'KARLA', '991855563', 1);
INSERT INTO paciente (id_paciente, apellidos, direccion, dni, email, nombres, telefono, total_signos) VALUES (19, 'RUIZ', null, '72301314', 'carlos@gmail.com', 'MANUEL', '991855561', 2);

INSERT INTO signos (id_signos, fecha, pulso, ritmo, temperatura, id_paciente) VALUES (5, '2022-08-10 13:00:13', '111', '111', '33', 2);
INSERT INTO signos (id_signos, fecha, pulso, ritmo, temperatura, id_paciente) VALUES (30, '2022-08-10 13:03:43', '111', '111', '33', 3);
INSERT INTO signos (id_signos, fecha, pulso, ritmo, temperatura, id_paciente) VALUES (31, '2022-08-10 13:08:02', '222', '222', '44', 3);
INSERT INTO signos (id_signos, fecha, pulso, ritmo, temperatura, id_paciente) VALUES (33, '2022-08-10 13:09:49', '222', '222', '44', 3);
INSERT INTO signos (id_signos, fecha, pulso, ritmo, temperatura, id_paciente) VALUES (41, '2022-08-10 20:23:40', '22', '22', '22', 4);
INSERT INTO signos (id_signos, fecha, pulso, ritmo, temperatura, id_paciente) VALUES (44, '2022-08-10 20:51:46', '222', '222', '22', 4);
INSERT INTO signos (id_signos, fecha, pulso, ritmo, temperatura, id_paciente) VALUES (45, '2022-08-10 20:54:35', '44', '44', '44', 4);
INSERT INTO signos (id_signos, fecha, pulso, ritmo, temperatura, id_paciente) VALUES (46, '2022-08-10 21:01:47', '111', '111', '11', 1);
INSERT INTO signos (id_signos, fecha, pulso, ritmo, temperatura, id_paciente) VALUES (47, '2022-08-10 21:02:09', '55', '55', '55', 2);
INSERT INTO signos (id_signos, fecha, pulso, ritmo, temperatura, id_paciente) VALUES (1, '2022-07-21 18:19:23', '110', '98', '34', 1);
INSERT INTO signos (id_signos, fecha, pulso, ritmo, temperatura, id_paciente) VALUES (51, '2022-08-10 21:13:23', '66', '66', '66', 1);
INSERT INTO signos (id_signos, fecha, pulso, ritmo, temperatura, id_paciente) VALUES (52, '2022-08-11 20:32:06', '52', '52', '52', 5);
INSERT INTO signos (id_signos, fecha, pulso, ritmo, temperatura, id_paciente) VALUES (54, '2022-08-15 22:53:36', '222', '222', '44', 20);
INSERT INTO signos (id_signos, fecha, pulso, ritmo, temperatura, id_paciente) VALUES (56, '2022-08-16 08:13:15', '111', '111', '33', 19);
INSERT INTO signos (id_signos, fecha, pulso, ritmo, temperatura, id_paciente) VALUES (57, '2022-08-16 08:20:40', '22', '22', '22', 2);
INSERT INTO signos (id_signos, fecha, pulso, ritmo, temperatura, id_paciente) VALUES (58, '2022-08-16 08:33:13', '11', '11', '11', 5);
INSERT INTO signos (id_signos, fecha, pulso, ritmo, temperatura, id_paciente) VALUES (59, '2022-08-16 08:34:13', '222', '222', '44', 21);
INSERT INTO signos (id_signos, fecha, pulso, ritmo, temperatura, id_paciente) VALUES (60, '2022-08-16 08:35:39', '333', '333', '33', 19);

INSERT INTO usuario (id_usuario, estado, clave, nombre) VALUES (1, true, '$2a$10$TGz5YTa8wyqhSYNI..lRCemA6VS/UQZ1slponS9FUhGjnm6fE66ha', 'chilinssky@yahoo.com.mx');
INSERT INTO usuario (id_usuario, estado, clave, nombre) VALUES (2, true, '$2a$10$dYs5nUJEnFcY5xpwfabTGu2/fPD2js2EPfvAMbrgTMSw9NSD.MYMS', 'mecano_mcs@hotmail.com');
INSERT INTO usuario (id_usuario, estado, clave, nombre) VALUES (3, true, '$2a$10$LFWOakAFPEI6s6ssjcHP4uXt8Is.azCwzeXA6a0SMMBXd/DbulRCO', 'chilinsskyc@gmail.com');
INSERT INTO usuario (id_usuario, estado, clave, nombre) VALUES (4, true, '$2a$10$9WYiCUFsx27PaMbMzEyZzOe1Wf76pr1/XQXSk2wYiu1LY8vObe.YG', 'INVITADO');

INSERT INTO usuario_rol (id_usuario, id_rol) VALUES (1, 1);
INSERT INTO usuario_rol (id_usuario, id_rol) VALUES (1, 2);
INSERT INTO usuario_rol (id_usuario, id_rol) VALUES (1, 3);
INSERT INTO usuario_rol (id_usuario, id_rol) VALUES (2, 3);
INSERT INTO usuario_rol (id_usuario, id_rol) VALUES (3, 4);
INSERT INTO usuario_rol (id_usuario, id_rol) VALUES (4, 2);
INSERT INTO usuario_rol (id_usuario, id_rol) VALUES (4, 3);
INSERT INTO usuario_rol (id_usuario, id_rol) VALUES (4, 1);
INSERT INTO usuario_rol (id_usuario, id_rol) VALUES (4, 4);

INSERT INTO consulta (id_consulta, fecha, num_consultorio, id_especialidad, id_medico, id_paciente) VALUES (1, '2022-07-01 02:04:07', 'C1', 1, 3, 1);
INSERT INTO consulta (id_consulta, fecha, num_consultorio, id_especialidad, id_medico, id_paciente) VALUES (2, '2022-07-01 21:26:25', 'C4', 1, 3, 2);
INSERT INTO consulta (id_consulta, fecha, num_consultorio, id_especialidad, id_medico, id_paciente) VALUES (3, '2022-07-02 08:48:58', 'C1', 2, 9, 3);
INSERT INTO consulta (id_consulta, fecha, num_consultorio, id_especialidad, id_medico, id_paciente) VALUES (4, '2022-07-02 09:00:27', 'C1', 1, 3, 4);
INSERT INTO consulta (id_consulta, fecha, num_consultorio, id_especialidad, id_medico, id_paciente) VALUES (5, '2022-07-02 12:26:01', 'C1', 2, 7, 5);
INSERT INTO consulta (id_consulta, fecha, num_consultorio, id_especialidad, id_medico, id_paciente) VALUES (11, '2022-08-16 10:47:43', 'C1', 1, 4, 5);

INSERT INTO consulta_examen (id_consulta, id_examen) VALUES (1, 1);
INSERT INTO consulta_examen (id_consulta, id_examen) VALUES (2, 2);
INSERT INTO consulta_examen (id_consulta, id_examen) VALUES (3, 2);
INSERT INTO consulta_examen (id_consulta, id_examen) VALUES (4, 1);
INSERT INTO consulta_examen (id_consulta, id_examen) VALUES (5, 1);
INSERT INTO consulta_examen (id_consulta, id_examen) VALUES (11, 1);
INSERT INTO consulta_examen (id_consulta, id_examen) VALUES (11, 2);

INSERT INTO detalle_consulta (id_detalle, diagnostico, tratamiento, id_consulta) VALUES (1, 'Alcoholismo', 'Anexo', 1);
INSERT INTO detalle_consulta (id_detalle, diagnostico, tratamiento, id_consulta) VALUES (2, 'cirrosis', 'anexo', 2);
INSERT INTO detalle_consulta (id_detalle, diagnostico, tratamiento, id_consulta) VALUES (3, 'Inflamacion en la prostata', 'Postaliv', 3);
INSERT INTO detalle_consulta (id_detalle, diagnostico, tratamiento, id_consulta) VALUES (4, 'Tarado', 'Tratamiento Psicologico', 4);
INSERT INTO detalle_consulta (id_detalle, diagnostico, tratamiento, id_consulta) VALUES (5, 'Ernia', 'Operar', 5);
INSERT INTO detalle_consulta (id_detalle, diagnostico, tratamiento, id_consulta) VALUES (6, 'asd', 'asd', 11);
	