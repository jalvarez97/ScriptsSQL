-- 1. Mostrar el nombre de todas las película
SELECT Nombre FROM PELICULAS


-- 2. Mostrar las distintas calificaciones de edad que existe
SELECT DISTINCT(CalificacionEdad) FROM PELICULAS

-- 3. Mostrar todas las películas que no han sido calificadas
SELECT * FROM PELICULAS WHERE CalificacionEdad IS NULL

-- 4. Mostrar todas las salas que no proyectan películas
SELECT * FROM SALAS WHERE Pelicula IS NULL

-- 5. Mostrar la información de todas las salas, y si se proyecta alguna película en la 
-- sala, mostrar también la información de la película,
SELECT * FROM SALAS S
LEFT JOIN PELICULAS P ON S.Pelicula = P.Codigo

-- 6. Mostrar la información de todas las películas, y si se proyecta en alguna sala, 
-- mostrar también la información de la sala
SELECT * FROM SALAS S
RIGHT JOIN PELICULAS P ON S.Pelicula = P.Codigo

SELECT * FROM PELICULAS P
LEFT JOIN SALAS S ON S.Pelicula = P.Codigo

-- 7. Mostrar los nombres de las películas que no se proyectan en ninguna sala,
SELECT * FROM PELICULAS P
LEFT JOIN SALAS S ON S.Pelicula = P.Codigo
WHERE S.Pelicula IS NULL

-- 8. Añadir una nueva película ‘Uno, dos, tres’ para mayores de 7 años,

INSERT INTO [dbo].[PELICULAS]
           ([Nombre]
           ,[CalificacionEdad])
     VALUES
           ('Uno, dos, tres', 7)