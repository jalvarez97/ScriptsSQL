
CREATE TABLE PELICULAS
(
	Codigo int identity(1,1) CONSTRAINT CodigoPeli_PK PRIMARY KEY,
	Nombre nvarchar(100),
	CalificacionEdad int
)

CREATE TABLE SALAS
(
	Codigo int identity(1,1) CONSTRAINT Codigo_Salas_FK PRIMARY KEY,
	Nombre nvarchar(100),
	Pelicula int CONSTRAINT CodigoPeli_FK FOREIGN KEY REFERENCES PELICULAS (Codigo)
)

INSERT INTO PELICULAS VALUES
('Lobo de Wall Street',16),
('El Bueno, el feo y el malo', 7),
('Y se armó la gorda', 7),
('Rambo', 16),
('Rambo II', 13),
('Rambo III', 16),
('Rocky I', 7),
('Rocky II', 7),
('Rocky III', 7),
('Rocky IV', 18),
('Rocky IV', null),
('Rocky V', 0)


INSERT INTO SALAS VALUES
('Yelmo Cast 1', 1),
('Yelmo Cast 2', 2),
('Yelmo Cast 3', 5),
('Yelmo Cast 4', 5),
('Yelmo Cast 5', 5),
('Yamagushi 1', 4),
('Yamagushi 2', 4),
('Yamagushi 3', 9),
('Yamagushi 4', 9),
('Yamagushi 5', 9),
('Yamagushi 6', 10),
('Yamagushi 7', null),
('Yelmo Gava 1', 12),
('Yelmo Gava 2', 12)
