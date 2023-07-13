USE [CompAerea]
GO

INSERT INTO [dbo].[Aeropuerto] ([NombreAeropuerto], [CodigoAeropuerto]) VALUES
('John F. Kennedy International Airport', 'JFK'),
('Los Angeles International Airport', 'LAX'),
('Heathrow Airport', 'LHR'),
('Charles de Gaulle Airport', 'CDG'),
('Tokyo Haneda Airport', 'HND'),
('Sydney Airport', 'SYD'),
('Dubai International Airport', 'DXB'),
('São Paulo–Guarulhos International Airport', 'GRU'),
('Changi Airport', 'SIN')

INSERT INTO [dbo].[CargoAuxiliar] ([Tipo]) VALUES
('Flight Attendant'),
('Cabin Crew'),
('Ground Staff'),
('Customer Service Agent'),
('Baggage Handler'),
('Ramp Agent'),
('Security Officer'),
('Cleaning Staff'),
('Maintenance Crew'),
('Dispatcher');

INSERT INTO [dbo].[PersonalAuxiliar] ([NIF], [Nombre], [RIdCargoAuxiliar]) VALUES
('1234567890', 'John Adams', 1),
('2345678901', 'Jane Jefferson', 2),
('3456789012', 'Robert Madison', 3),
('4567890123', 'Sarah Monroe', 2),
('5678901234', 'William Jackson', 1),
('6789012345', 'Emily Wilson', 3),
('7890123456', 'David Johnson', 2),
('8901234567', 'Sophia Clark', 1),
('9012345678', 'Michael Taylor', 3),
('0123456789', 'Olivia Adams', 2);

INSERT INTO [dbo].[Modelo] ([Codigo], [Capacidad]) VALUES
('A320', 180),
('B737', 160),
('A380', 550),
('B777', 350),
('E190', 100),
('B787', 250),
('A350', 300),
('CRJ900', 90),
('B747', 450),
('A330', 400);

INSERT INTO [dbo].[Avion] ([Nombre], [RIdModelo]) VALUES
('Boeing 737', 1),
('Airbus A320', 2),
('Boeing 777', 3),
('Airbus A380', 4),
('Embraer E190', 5),
('Boeing 787', 6),
('Airbus A350', 7),
('Bombardier CRJ900', 8),
('Boeing 747', 9),
('Airbus A330', 10);

INSERT INTO [dbo].[Clase] ([TipoClase]) VALUES
('Economy Class'),
('Business Class'),
('First Class');

INSERT INTO [dbo].[Piloto] ([NIF], [FechaAlta], [ServicioIntercontinental], [ServicioInternacional], [ServicioNacional]) VALUES
('9876543210', '2022-01-01', 1, 1, 0),
('8765432109', '2021-05-15', 0, 1, 1),
('7654321098', '2020-10-30', 1, 0, 1),
('6543210987', '2019-03-20', 0, 1, 0),
('5432109876', '2018-07-10', 1, 0, 0),
('4321098765', '2017-12-05', 1, 1, 1),
('3210987654', '2016-09-18', 0, 1, 1),
('2109876543', '2015-02-27', 1, 0, 1),
('1098765432', '2014-06-14', 1, 1, 0),
('0987654321', '2013-11-09', 0, 0, 1);

INSERT INTO [dbo].[TipoDocumento] ([NombreDocumento]) VALUES
('Passport'),
('Driver License'),
('National ID'),
('Social Security Number'),
('Residence Permit'),
('Birth Certificate'),
('Military ID'),
('Student ID'),
('Employee ID'),
('Health Insurance Card');

INSERT INTO [dbo].[Vuelo] ([Codigo], [Fecha], [Duracion], [RIdSalida], [RIdDestino], [RIdComandante], [RIdCoPiloto], [RIdAvion]) VALUES
('AA123', '2023-07-15', 240, 1, 2, 1, 2, 1),
('BB456', '2023-07-16', 180, 2, 3, 3, 4, 2),
('CC789', '2023-07-17', 120, 3, 4, 5, 6, 3),
('DD012', '2023-07-18', 200, 4, 5, 7, 8, 4),
('EE345', '2023-07-19', 150, 5, 6, 9, 10, 5),
('FF678', '2023-07-20', 160, 6, 7, 1, 2, 6),
('GG901', '2023-07-21', 130, 7, 8, 3, 4, 7),
('HH234', '2023-07-22', 190, 8, 9, 5, 6, 8),
('II567', '2023-07-23', 220, 4, 8, 7, 8, 9),
('JJ890', '2023-07-24', 170, 6, 1, 9, 10, 10);

INSERT INTO [dbo].[ClaseVuelo] ([Precio], [FilaInicial], [FilaFinal], [RIdVuelo], [RIdClase]) VALUES
(150.00, 1, 10, 1, 1),
(300.00, 11, 20, 1, 2),
(500.00, 1, 5, 2, 2),
(1000.00, 6, 10, 2, 3),
(200.00, 1, 15, 3, 1),
(400.00, 16, 30, 3, 2),
(250.00, 1, 5, 4, 1),
(600.00, 6, 10, 4, 3),
(180.00, 1, 20, 5, 1),
(800.00, 21, 40, 5, 3);

INSERT INTO [dbo].[Pasajero] ([NumeroAsiento], [NombrePasajero], [RIdTipoDoc], [NumeroDocumento], [FechaReserva], [RIdVuelo]) VALUES
('A12', 'John Smith', 1, '1234567890', '2023-07-15', 1),
('B15', 'Jane Doe', 2, '9876543210', '2023-07-15', 1),
('C18', 'Michael Johnson', 1, '4567891230', '2023-07-15', 2),
('D21', 'Sarah Williams', 3, '7890123456', '2023-07-15', 2),
('E24', 'David Johnson', 2, '3216549870', '2023-07-16', 3),
('F27', 'Jennifer Davis', 1, '6549873210', '2023-07-16', 3),
('G30', 'Robert Miller', 3, '8901234567', '2023-07-16', 4),
('H33', 'Emily Wilson', 2, '5678901234', '2023-07-16', 4),
('I36', 'Daniel Taylor', 1, '2345678901', '2023-07-17', 5),
('J39', 'Jessica Anderson', 3, '9012345678', '2023-07-17', 5);

INSERT INTO [dbo].[AuxiliarVuelo] ([RIdVuelo], [RIdAuxiliar]) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10);

-- COMPROBAMOS LOS INSERTS

SELECT * FROM [Aeropuerto]

SELECT * FROM [CargoAuxiliar]

SELECT * FROM [PersonalAuxiliar]

SELECT * FROM [Modelo]

SELECT * FROM [Avion]

SELECT * FROM [Clase]

SELECT * FROM [Piloto]

SELECT * FROM [TipoDocumento]

SELECT * FROM [Vuelo]

SELECT * FROM [ClaseVuelo]

SELECT * FROM [Pasajero]

SELECT * FROM [AuxiliarVuelo]

-- PARA BORRAR LOS REGISTROS Y RESTABLECER LOS IDENTITYS DE LAS TABLAS
-- EJECUTAR EL CODIGO COMENTADO
/* 

Delete from [AuxiliarVuelo]
DBCC CHECKIDENT ([AuxiliarVuelo], RESEED, 0)

Delete from [Pasajero]
DBCC CHECKIDENT ([Pasajero], RESEED, 0)

Delete from [ClaseVuelo]
DBCC CHECKIDENT ([ClaseVuelo], RESEED, 0)

Delete from [Vuelo]
DBCC CHECKIDENT ([Vuelo], RESEED, 0)

Delete from [TipoDocumento]
DBCC CHECKIDENT ([TipoDocumento], RESEED, 0)

Delete from [Piloto]
DBCC CHECKIDENT ([Piloto], RESEED, 0)

Delete from [Clase]
DBCC CHECKIDENT ([Clase], RESEED, 0)

Delete from [Avion]
DBCC CHECKIDENT ([Avion], RESEED, 0)

Delete from [Modelo]
DBCC CHECKIDENT ([Modelo], RESEED, 0)

Delete from [PersonalAuxiliar]
DBCC CHECKIDENT ([PersonalAuxiliar], RESEED, 0)

Delete from [CargoAuxiliar]
DBCC CHECKIDENT ([CargoAuxiliar], RESEED, 0)

Delete from [Aeropuerto]
DBCC CHECKIDENT ([Aeropuerto], RESEED, 0)

*/


