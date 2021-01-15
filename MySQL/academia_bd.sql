USE academia;
DROP TABLE IF EXIST actores;
DROP TABLE IF EXIST tipo_documento;
DROP TABLE IF EXIST tipo_actores;
DROP TABLE IF EXIST estado_actores;
DROP TABLE IF EXIST modulos;

CREATE TABLE tipo_documento(
    codigo VARCHAR(10) PRIMARY KEY,
    descripción VARCHAR(100) NOT NULL
);

CREATE TABLE tipo_actores(
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    perfil VARCHAR (100)
);

INSERT INTO tipo_actores VALUES(1,'alumno1')
INSERT INTO tipo_actores VALUES('Docente')

UPDATE tipo_actores SET perfil = 'Estudiantes' WHERE id = 1;

DELETE FROM tipo_actores WHERE id=1

TRUNCATE tipo_actores;

SELECT perfil, id, NOW() FROM tipo_actores;




CREATE TABLE estado_actores (  
id int (11) UNSIGNED AUTO_INCREMENT,  
estado VARCHAR (500),  
PRIMARY KEY (id)
) ENGINE=MyISAM;

CREATE TABLE modulos(
    id int(5),
    modulo VARCHAR(255),
    `mod` varchar(10)
    ) ENGINE=InnoDB;

    ALTER TABLE modulos
    ADD PRIMARY KEY(id);

CREATE TABLE actores(
    id INT(5) UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    documento VARCHAR(20) NOT NULL UNIQUE,
    tipo_documento VARCHAR(3) NOT NULL,
    nombres VARCHAR(55) NOT NULL,
    apellidos VARCHAR(55),
    contraseña VARCHAR(100) NOT NULL,
    correo VARCHAR(255) NOT NULL DEFAULT 'correo@dominio.com',
    telefono_celular VARCHAR(10) COMMENT'Telefono celolar del estudiante',
    num_expediente VARCHAR(255) NOT NULL UNIQUE,
    genero ENUM('femenino','masculino'),
    f_nacimiento date NOT NULL,
    estado_actor_id INT(5) UNSIGNED,
    institucion_id INT(5),
    tipo_actor_id INT(5) UNSIGNED,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_autorizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    )ENGINE=InnoDB;

    ALTER TABLE actores 
ADD CONSTRAINT `fk_estado_actor` 
FOREIGN KEY (`estado_actor_id`) 
REFERENCES `estado_actores` (`id`);