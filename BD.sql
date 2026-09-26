CREATE DATABASE cinedb;
GO
USE cinedb;
GO

CREATE TABLE pelicula (
    id_pelicula INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(200) NOT NULL,
    duracion INT NOT NULL,
    activo BIT NOT NULL DEFAULT 1
);

CREATE TABLE sala_cine (
    id_sala INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    estado BIT NOT NULL DEFAULT 1
);

CREATE TABLE pelicula_salacine (
    id_pelicula_sala INT IDENTITY(1,1) PRIMARY KEY,
    id_sala_cine INT NOT NULL,
    fecha_publicacion DATE NULL,
    fecha_fin DATE NULL,
    id_pelicula INT NOT NULL,
    CONSTRAINT FK_pelisala_sala FOREIGN KEY (id_sala_cine) REFERENCES sala_cine(id_sala),
    CONSTRAINT FK_pelisala_peli FOREIGN KEY (id_pelicula) REFERENCES pelicula(id_pelicula)
);
GO

CREATE PROCEDURE SP_ContarPeliculasPorSala
    @nombreSala NVARCHAR(100)
AS
BEGIN
    SELECT COUNT(*) AS Total
    FROM pelicula_salacine ps
    INNER JOIN sala_cine s ON ps.id_sala_cine = s.id_sala
    WHERE s.nombre = @nombreSala;
END
GO

-- Datos de prueba
INSERT INTO sala_cine (nombre, estado) VALUES ('Sala A', 1);
INSERT INTO sala_cine (nombre, estado) VALUES ('Sala B', 1);
INSERT INTO sala_cine (nombre, estado) VALUES ('Sala C', 1);

INSERT INTO pelicula (nombre, duracion, activo) VALUES ('Matrix', 136, 1);
INSERT INTO pelicula (nombre, duracion, activo) VALUES ('Interstellar', 169, 1);
INSERT INTO pelicula (nombre, duracion, activo) VALUES ('El Padrino', 175, 1);
INSERT INTO pelicula (nombre, duracion, activo) VALUES ('Titanic', 195, 1);
INSERT INTO pelicula (nombre, duracion, activo) VALUES ('Avatar', 162, 1);
INSERT INTO pelicula (nombre, duracion, activo) VALUES ('Coco', 105, 1);

INSERT INTO pelicula_salacine (id_sala_cine, fecha_publicacion, fecha_fin, id_pelicula)
VALUES (1, '2026-10-01', '2026-10-15', 1);

INSERT INTO pelicula_salacine (id_sala_cine, fecha_publicacion, fecha_fin, id_pelicula)
VALUES (2, '2026-10-02', '2026-10-16', 2);
INSERT INTO pelicula_salacine (id_sala_cine, fecha_publicacion, fecha_fin, id_pelicula)
VALUES (2, '2026-10-02', '2026-10-16', 3);
INSERT INTO pelicula_salacine (id_sala_cine, fecha_publicacion, fecha_fin, id_pelicula)
VALUES (2, '2026-10-03', '2026-10-17', 4);
INSERT INTO pelicula_salacine (id_sala_cine, fecha_publicacion, fecha_fin, id_pelicula)
VALUES (2, '2026-10-03', '2026-10-17', 5);

INSERT INTO pelicula_salacine (id_sala_cine, fecha_publicacion, fecha_fin, id_pelicula)
VALUES (3, '2026-10-05', '2026-10-20', 1);
INSERT INTO pelicula_salacine (id_sala_cine, fecha_publicacion, fecha_fin, id_pelicula)
VALUES (3, '2026-10-05', '2026-10-20', 2);
INSERT INTO pelicula_salacine (id_sala_cine, fecha_publicacion, fecha_fin, id_pelicula)
VALUES (3, '2026-10-05', '2026-10-20', 3);
INSERT INTO pelicula_salacine (id_sala_cine, fecha_publicacion, fecha_fin, id_pelicula)
VALUES (3, '2026-10-06', '2026-10-21', 4);
INSERT INTO pelicula_salacine (id_sala_cine, fecha_publicacion, fecha_fin, id_pelicula)
VALUES (3, '2026-10-06', '2026-10-21', 5);
INSERT INTO pelicula_salacine (id_sala_cine, fecha_publicacion, fecha_fin, id_pelicula)
VALUES (3, '2026-10-07', '2026-10-22', 6);
GO