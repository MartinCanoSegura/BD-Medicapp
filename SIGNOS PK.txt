CREATE TABLE 
    signos 
    ( 
        pulso       CHARACTER VARYING(255) NOT NULL, 
        temperatura CHARACTER VARYING(255) NOT NULL, 
        fecha       TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL, 
        ritmo       CHARACTER VARYING(3) NOT NULL, 
        id_signos   INTEGER NOT NULL, 
        id_paciente INTEGER NOT NULL, 
        PRIMARY KEY (id_signos, id_paciente), 
        CONSTRAINT fk_paciente_signos FOREIGN KEY (id_paciente) REFERENCES "paciente" 
        ("id_paciente") 
    );


INSERT INTO signos (pulso, temperatura, fecha, ritmo, id_signos, id_paciente) VALUES ('87', '65', '2022-07-01 02:04:07', '56', 1, 6);
INSERT INTO signos (pulso, temperatura, fecha, ritmo, id_signos, id_paciente) VALUES ('110', '45', '2022-07-01 02:04:07', '98', 2, 6);
INSERT INTO signos (pulso, temperatura, fecha, ritmo, id_signos, id_paciente) VALUES ('44', '56', '2022-07-01 02:04:07', '77', 1, 7);
INSERT INTO signos (pulso, temperatura, fecha, ritmo, id_signos, id_paciente) VALUES ('44', '55', '2022-07-01 02:04:07', '55', 2, 7);
