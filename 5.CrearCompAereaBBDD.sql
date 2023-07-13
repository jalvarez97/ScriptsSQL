USE CompAerea
GO

CREATE TABLE [dbo].[Aeropuerto](
	[IdAeropuerto] [int] NOT NULL IDENTITY(1,1),
	[NombreAeropuerto] [varchar](50) NOT NULL,
	[CodigoAeropuerto] [varchar](10) NOT NULL UNIQUE,
PRIMARY KEY CLUSTERED 
(
	[IdAeropuerto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[AuxiliarVuelo](
	[IdAuxiliarVuelo] [int] NOT NULL IDENTITY(1,1),
	[RIdVuelo] [int] NOT NULL,
	[RIdAuxiliar] [int] NOT NULL
PRIMARY KEY CLUSTERED
(
[IdAuxiliarVuelo] ASC 
) 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Avion](
	[IdAvion] [int] NOT NULL IDENTITY(1,1),
	[Nombre] [varchar](50) NOT NULL,
	[RIdModelo] [int] NOT NULL UNIQUE,
PRIMARY KEY CLUSTERED 
(
	[IdAvion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[CargoAuxiliar](
	[IdCargoAuxiliar] [int] NOT NULL IDENTITY(1,1),
	[Tipo] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCargoAuxiliar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Clase](
	[IdClase] [int] NOT NULL IDENTITY(1,1),
	[TipoClase] [varchar](50) NULL UNIQUE,
PRIMARY KEY CLUSTERED 
(
	[IdClase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ClaseVuelo](
	[IdClaseVuelo] [int] NOT NULL IDENTITY(1,1),
	[Precio] [float] NULL,
	[FilaInicial] [int] NULL,
	[FilaFinal] [int] NULL,
	[RIdVuelo] [int] NOT NULL,
	[RIdClase] [int] NOT NULL
PRIMARY KEY CLUSTERED 
(
	[IdClaseVuelo] ASC
)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Modelo](
	[IdModelo] [int] NOT NULL IDENTITY(1,1),
	[Codigo] [varchar](20) NOT NULL,
	[Capacidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdModelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Pasajero](
	[IdPasajero] [int] NOT NULL IDENTITY(1,1),
	[NumeroAsiento] [varchar](10) NULL,
	[NombrePasajero] [varchar](50) NULL,
	[RIdTipoDoc] [int] NOT NULL,
	[NumeroDocumento] [varchar](10) NULL,
	[FechaReserva] [date] NULL,
	[RIdVuelo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPasajero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PersonalAuxiliar](
	[IdAuxiliar] [int] NOT NULL IDENTITY(1,1),
	[NIF] [varchar](10) NULL,
	[Nombre] [varchar](50) NULL,
	[RIdCargoAuxiliar] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAuxiliar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Piloto](
	[IdPiloto] [int] NOT NULL IDENTITY(1,1),
	[NIF] [varchar](10) NULL,
	[FechaAlta] [date] NULL,
	[ServicioIntercontinental] [bit] NULL,
	[ServicioInternacional] [bit] NULL,
	[ServicioNacional] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPiloto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TipoDocumento](
	[IdTipoDocumento] [int] NOT NULL IDENTITY(1,1),
	[NombreDocumento] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTipoDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Vuelo](
	[IdVuelo] [int] NOT NULL IDENTITY(1,1),
	[Codigo] [varchar](10) NULL,
	[Fecha] [date] NULL,
	[Duracion] [int] NULL,
	[RIdSalida] [int] NOT NULL,
	[RIdDestino] [int] NOT NULL,
	[RIdComandante] [int] NOT NULL,
	[RIdCoPiloto] [int] NOT NULL,
	[RIdAvion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVuelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Vuelo]  WITH CHECK ADD FOREIGN KEY([RIdAvion])
REFERENCES [dbo].[Avion] ([IdAvion])
GO

ALTER TABLE [dbo].[Vuelo]  WITH CHECK ADD FOREIGN KEY([RIdComandante])
REFERENCES [dbo].[Piloto] ([IdPiloto])
GO

ALTER TABLE [dbo].[Vuelo]  WITH CHECK ADD FOREIGN KEY([RIdCoPiloto])
REFERENCES [dbo].[Piloto] ([IdPiloto])
GO

ALTER TABLE [dbo].[Vuelo]  WITH CHECK ADD FOREIGN KEY([RIdDestino])
REFERENCES [dbo].[Aeropuerto] ([IdAeropuerto])
GO

ALTER TABLE [dbo].[Vuelo]  WITH CHECK ADD FOREIGN KEY([RIdSalida])
REFERENCES [dbo].[Aeropuerto] ([IdAeropuerto])
GO

ALTER TABLE [dbo].[Pasajero]  ADD FOREIGN KEY([RIdTipoDoc])
REFERENCES [dbo].[TipoDocumento] ([IdTipoDocumento])
GO


ALTER TABLE [dbo].[PersonalAuxiliar]  WITH CHECK ADD FOREIGN KEY([RIdCargoAuxiliar])
REFERENCES [dbo].[CargoAuxiliar] ([IdCargoAuxiliar])
GO


ALTER TABLE [dbo].[Pasajero]  WITH CHECK ADD FOREIGN KEY([RIdVuelo])
REFERENCES [dbo].[Vuelo] ([IdVuelo])
GO

ALTER TABLE [dbo].[ClaseVuelo]  WITH CHECK ADD FOREIGN KEY([RIdClase])
REFERENCES [dbo].[Clase] ([IdClase])
GO

ALTER TABLE [dbo].[ClaseVuelo]  WITH CHECK ADD FOREIGN KEY([RIdVuelo])
REFERENCES [dbo].[Vuelo] ([IdVuelo])
GO

ALTER TABLE [dbo].[AuxiliarVuelo]  WITH CHECK ADD FOREIGN KEY([RIdAuxiliar])
REFERENCES [dbo].[PersonalAuxiliar] ([IdAuxiliar])
GO

ALTER TABLE [dbo].[AuxiliarVuelo]  WITH CHECK ADD FOREIGN KEY([RIdVuelo])
REFERENCES [dbo].[Vuelo] ([IdVuelo])
GO

ALTER TABLE [dbo].[Avion]  WITH CHECK ADD FOREIGN KEY([RIdModelo])
REFERENCES [dbo].[Modelo] ([IdModelo])
GO

--COMMIT