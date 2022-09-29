CREATE TABLE 
    paciente 
    ( 
        id_paciente SERIAL NOT NULL, 
        apellidos CHARACTER VARYING(70) NOT NULL, 
        direccion CHARACTER VARYING(150), 
        dni       CHARACTER VARYING(8) NOT NULL, 
        email     CHARACTER VARYING(55), 
        nombres   CHARACTER VARYING(70) NOT NULL, 
        telefono  CHARACTER VARYING(9), 
        PRIMARY KEY (id_paciente), 
        CONSTRAINT uk_wr6kxhpayd3jdludsytbn8ag UNIQUE (dni) 
    );