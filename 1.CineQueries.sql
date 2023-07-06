-- 1. Mostrar el nombre de todas las pel�cula
SELECT Nombre FROM PELICULAS


-- 2. Mostrar las distintas calificaciones de edad que existe
SELECT DISTINCT(CalificacionEdad) FROM PELICULAS

-- 3. Mostrar todas las pel�culas que no han sido calificadas
SELECT * FROM PELICULAS WHERE CalificacionEdad IS NULL

-- 4. Mostrar todas las salas que no proyectan pel�culas
SELECT * FROM SALAS WHERE Pelicula IS NULL

-- 5. Mostrar la informaci�n de todas las salas, y si se proyecta alguna pel�cula en la 
-- sala, mostrar tambi�n la informaci�n de la pel�cula,
SELECT * FROM SALAS S
LEFT JOIN PELICULAS P ON S.Pelicula = P.Codigo

-- 6. Mostrar la informaci�n de todas las pel�culas, y si se proyecta en alguna sala, 
-- mostrar tambi�n la informaci�n de la sala
SELECT * FROM SALAS S
RIGHT JOIN PELICULAS P ON S.Pelicula = P.Codigo

SELECT * FROM PELICULAS P
LEFT JOIN SALAS S ON S.Pelicula = P.Codigo

-- 7. Mostrar los nombres de las pel�culas que no se proyectan en ninguna sala,
SELECT * FROM PELICULAS P
LEFT JOIN SALAS S ON S.Pelicula = P.Codigo
WHERE S.Pelicula IS NULL

-- 8. A�adir una nueva pel�cula �Uno, dos, tres� para mayores de 7 a�os,

INSERT INTO [dbo].[PELICULAS]
           ([Nombre]
           ,[CalificacionEdad])
     VALUES
           ('Uno, dos, tres', 7)