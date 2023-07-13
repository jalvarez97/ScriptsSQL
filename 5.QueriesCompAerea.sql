--lista de vuelos con nombre de piloto, ordenados por fecha

SELECT P.NIF, V.* FROM Vuelo V
INNER JOIN Piloto P ON V.RIdComandante = P.IdPiloto
ORDER BY v.Fecha DESC

--num. de pasajero en cada vuelo

SELECT COUNT(V.IdVuelo) NumPasajeros, v.Codigo
FROM Vuelo V 
INNER JOIN Pasajero P ON P.RIdVuelo = V.IdVuelo
GROUP BY V.Codigo

--lista de pilotos que hacen Intercontinental

SELECT * FROM Piloto WHERE ServicioIntercontinental = 1

--Total de asientos ocupados en cada clase para un vuelo

SELECT COUNT (TipoClase) AsientosOcupados, TipoClase
FROM VUELO V
INNER JOIN ClaseVuelo CV ON V.IdVuelo = CV.RIdVuelo
INNER JOIN Clase C ON C.IdClase = CV.RIdClase
INNER JOIN Pasajero P  ON V.IdVuelo = P.RIdVuelo 
WHERE V.IdVuelo = 3
GROUP BY TipoClase

-- lista de pilotos que no vuelan

SELECT * FROM Piloto P 
LEFT JOIN Vuelo V ON P.IdPiloto = V.RIdComandante
WHERE IdVuelo IS NULL

-- Lista de pilotos que no tienen servicio asociado

SELECT * FROM Piloto WHERE ServicioIntercontinental = 0 AND ServicioInternacional = 0  AND ServicioNacional = 0

-- Nombre de pilotos que hayan volado a MAD

SELECT V.*, A.NombreAeropuerto FROM Vuelo V
INNER JOIN Aeropuerto A ON V.RIdDestino =  A.IdAeropuerto
WHERE A.NombreAeropuerto LIKE '%MAD%'
					   --LIKE '%Tokyo%'

-- Nombre de pilotos que no hayan volado a BCN

SELECT V.*, A.NombreAeropuerto FROM Vuelo V
INNER JOIN Aeropuerto A ON V.RIdDestino =  A.IdAeropuerto
WHERE A.NombreAeropuerto NOT LIKE '%BCN%'

-- Numero de vuelos pilotados por pilotos intercontinentales

SELECT COUNT(*) FROM Vuelo V
INNER JOIN Piloto P ON V.RIdComandante = P.IdPiloto
WHERE P.ServicioIntercontinental = 1

-- Numero de vuelos con destino a BCN

SELECT COUNT(*) FROM Vuelo V
INNER JOIN Aeropuerto A ON V.RIdDestino =  A.IdAeropuerto
WHERE A.NombreAeropuerto LIKE '%BCN%'
