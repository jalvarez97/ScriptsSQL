USE [NOMBRE DE LA BASE DE DATOS AQUI]
GO

/****** Object:  Table [dbo].[Actividad]    Script Date: 06/07/2023 15:36:05 ******/
BEGIN TRAN

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Actividad](
	[IdActividad] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Actividad] PRIMARY KEY CLUSTERED 
(
	[IdActividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Actividad] UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Cliente](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[NIF] [char](9) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Domicilio] [varchar](255) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_NIF] UNIQUE NONCLUSTERED 
(
	[NIF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ClienteActividad](
	[IdClienteActividad] [int] IDENTITY(1,1) NOT NULL,
	[RIdCliente] [int] NOT NULL,
	[RIdActividad] [int] NOT NULL,
 CONSTRAINT [PK_ClienteActividad] PRIMARY KEY CLUSTERED 
(
	[IdClienteActividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TipoLimpieza](
	[IdTipoLimpieza] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[CodigoServicio] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Servicio] PRIMARY KEY CLUSTERED 
(
	[IdTipoLimpieza] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ContratoPeriodicidad](
	[IdPeriodicidad] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ContratoPeriodicidad] PRIMARY KEY CLUSTERED 
(
	[IdPeriodicidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Contrato](
	[IdContrato] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[RIdPeriodicidad] [int] NOT NULL,
	[ImportePactado] [money] NOT NULL,
	[RIdCliente] [int] NOT NULL,
 CONSTRAINT [PK_Contrato] PRIMARY KEY CLUSTERED 
(
	[IdContrato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ContratoTipoLimpieza](
	[IdContratoTipoLimpieza] [int] IDENTITY(1,1) NOT NULL,
	[RIdContrato] [int] NOT NULL,
	[RIdTipoLimpieza] [int] NOT NULL,
 CONSTRAINT [PK_ContratoTipoLimpieza] PRIMARY KEY CLUSTERED 
(
	[IdContratoTipoLimpieza] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Factura](
	[IdFactura] [int] IDENTITY(1,1) NOT NULL,
	[NumeroFactura] [varchar](10) NOT NULL,
	[ImporteTotal] [float] NOT NULL,
	[Fecha] [smalldatetime] NOT NULL,
	[Estado] [int] NOT NULL,
	[RIdContrato] [int] NOT NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[IdFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Visita](
	[IdVisita] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [smalldatetime] NOT NULL,
	[RIdContratoLimpieza] [int] NOT NULL,
	[RIdFactura] [int] NOT NULL,
 CONSTRAINT [PK_Visita] PRIMARY KEY CLUSTERED 
(
	[IdVisita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Limpiador](
	[IdLimpiador] [int] IDENTITY(1,1) NOT NULL,
	[NIF] [char](9) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Domicilio] [varchar](50) NULL,
	[Telefono] [varchar](10) NULL,
 CONSTRAINT [PK_Limpiador] PRIMARY KEY CLUSTERED 
(
	[IdLimpiador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_NIF_LIMP] UNIQUE NONCLUSTERED 
(
	[NIF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[LimpiadorVisita](
	[IdLimpiadorVisita] [int] IDENTITY(1,1) NOT NULL,
	[RIdLimpiador] [int] NOT NULL,
	[RIdVisita] [int] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Contrato] FOREIGN KEY([RIdContrato])
REFERENCES [dbo].[Contrato] ([IdContrato])
GO

ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Contrato]
GO


ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Contrato]
GO

ALTER TABLE [dbo].[ClienteActividad]  WITH CHECK ADD  CONSTRAINT [FK_ClienteActividad_Actividad] FOREIGN KEY([RIdActividad])
REFERENCES [dbo].[Actividad] ([IdActividad])
GO

ALTER TABLE [dbo].[ClienteActividad] CHECK CONSTRAINT [FK_ClienteActividad_Actividad]
GO

ALTER TABLE [dbo].[ClienteActividad]  WITH CHECK ADD  CONSTRAINT [FK_ClienteActividad_Cliente] FOREIGN KEY([RIdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO

ALTER TABLE [dbo].[ClienteActividad] CHECK CONSTRAINT [FK_ClienteActividad_Cliente]
GO

ALTER TABLE [dbo].[Contrato]  WITH CHECK ADD  CONSTRAINT [FK_Contrato_Cliente] FOREIGN KEY([RIdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO

ALTER TABLE [dbo].[Contrato] CHECK CONSTRAINT [FK_Contrato_Cliente]
GO

ALTER TABLE [dbo].[Contrato]  WITH CHECK ADD  CONSTRAINT [FK_Contrato_ContratoPeriodicidad] FOREIGN KEY([RIdPeriodicidad])
REFERENCES [dbo].[ContratoPeriodicidad] ([IdPeriodicidad])
GO

ALTER TABLE [dbo].[Contrato] CHECK CONSTRAINT [FK_Contrato_ContratoPeriodicidad]
GO


ALTER TABLE [dbo].[ContratoTipoLimpieza]  WITH CHECK ADD  CONSTRAINT [FK_ContratoTipoLimpieza_Contrato1] FOREIGN KEY([RIdContrato])
REFERENCES [dbo].[Contrato] ([IdContrato])
GO

ALTER TABLE [dbo].[ContratoTipoLimpieza] CHECK CONSTRAINT [FK_ContratoTipoLimpieza_Contrato1]
GO

ALTER TABLE [dbo].[ContratoTipoLimpieza]  WITH CHECK ADD  CONSTRAINT [FK_ContratoTipoLimpieza_TipoLimpieza1] FOREIGN KEY([RIdTipoLimpieza])
REFERENCES [dbo].[TipoLimpieza] ([IdTipoLimpieza])
GO

ALTER TABLE [dbo].[ContratoTipoLimpieza] CHECK CONSTRAINT [FK_ContratoTipoLimpieza_TipoLimpieza1]
GO

ALTER TABLE [dbo].[Visita]  WITH CHECK ADD  CONSTRAINT [FK_Visita_ContratoTipoLimpieza] FOREIGN KEY([RIdContratoLimpieza])
REFERENCES [dbo].[ContratoTipoLimpieza] ([IdContratoTipoLimpieza])
GO

ALTER TABLE [dbo].[Visita] CHECK CONSTRAINT [FK_Visita_ContratoTipoLimpieza]
GO

ALTER TABLE [dbo].[Visita]  WITH CHECK ADD  CONSTRAINT [FK_Visita_Factura] FOREIGN KEY([RIdFactura])
REFERENCES [dbo].[Factura] ([IdFactura])
GO

ALTER TABLE [dbo].[Visita] CHECK CONSTRAINT [FK_Visita_Factura]
GO

ALTER TABLE [dbo].[LimpiadorVisita]  WITH CHECK ADD  CONSTRAINT [FK_LimpiadorVisita_Limpiador1] FOREIGN KEY([RIdLimpiador])
REFERENCES [dbo].[Limpiador] ([IdLimpiador])
GO

ALTER TABLE [dbo].[LimpiadorVisita] CHECK CONSTRAINT [FK_LimpiadorVisita_Limpiador1]
GO

ALTER TABLE [dbo].[LimpiadorVisita]  WITH CHECK ADD  CONSTRAINT [FK_LimpiadorVisita_Visita1] FOREIGN KEY([RIdVisita])
REFERENCES [dbo].[Visita] ([IdVisita])
GO

ALTER TABLE [dbo].[LimpiadorVisita] CHECK CONSTRAINT [FK_LimpiadorVisita_Visita1]
GO


INSERT INTO [dbo].[Actividad]
           ([Nombre])
     VALUES
           ('Buffet Abogado'),
		   ('Comunidad de Vecinos'),
		   ('Piscina')
GO

INSERT INTO [dbo].[Cliente]
           ([NIF]
           ,[Nombre]
           ,[Domicilio])
     VALUES
           ('87796608L'
           ,'Javier Alvarez'
           ,'C/ Reinaxement, 23, Terrassa'),
		   ('61585162V'
           ,'Oscar Gonzalez'
           ,'C/ Marinel-lo Bosch, 32, Terrassa'),
		   ('40949618G'
           ,'Alexander Perez'
           ,'Av Barcelona, 32, Terrassa')
GO

INSERT INTO [dbo].[ClienteActividad]
           ([RIdCliente]
           ,[RIdActividad])
     VALUES
           (1,1),
		   (2,3),
		   (3,1)
GO

INSERT INTO [dbo].[TipoLimpieza]
           ([Nombre]
           ,[CodigoServicio])
     VALUES
           ('Limpieza Inmueble','0001') ,
		   ('Limpieza Aguas', '0002')
GO

INSERT INTO [dbo].[ContratoPeriodicidad]
           ([Descripcion])
     VALUES
           ('Mensual'),
		   ('Trimestral'),
		   ('Semestral'),
		   ('Anual')
GO

INSERT INTO [dbo].[Contrato]
           ([Nombre]
           ,[RIdPeriodicidad]
           ,[ImportePactado]
           ,[RIdCliente])
     VALUES
           ('JA ABOGADOS SL BUFFET', 2, 50, 1),
		   ('OG PISCINAS', 1, 75, 2),
		   ('AP VECINOS', 4, 100, 3)
GO


INSERT INTO [dbo].[ContratoTipoLimpieza]
           ([RIdContrato]
           ,[RIdTipoLimpieza])
     VALUES
           (1,1),
		   (2,2),
		   (3,1)
GO

INSERT INTO [dbo].[Factura]
           ([NumeroFactura]
           ,[ImporteTotal]
           ,[Fecha]
           ,[Estado]
           ,[RIdContrato])
     VALUES
           ('0001',270,'2023-04-26', 1, 1),
		   ('0002',400,'2023-04-14', 1, 2),
		   ('0002',340,'2023-05-03', 1, 3)
GO

INSERT INTO [dbo].[Visita]
           ([Fecha]
           ,[RIdContratoLimpieza]
           ,[RIdFactura])
     VALUES
           ('2023-04-26',1,1),
		   ('2023-04-14',2,2),
		   ('2023-05-03',3,3)
GO

INSERT INTO [dbo].[Limpiador]
           ([NIF]
           ,[Nombre]
           ,[Domicilio]
           ,[Telefono])
     VALUES
           ('94976023F','Joseba',null,null),
		   ('04175694K','Leticia Sabater',null,null),
		   ('12372625M','Blanca Nieves',null,null)
GO

INSERT INTO [dbo].[LimpiadorVisita]
           ([RIdLimpiador]
           ,[RIdVisita])
     VALUES
           (1,1),
		   (2,2),
		   (3,3)
GO

Select * from Actividad
Select * from Cliente
Select * from ClienteActividad
Select * from TipoLimpieza
Select * from [ContratoPeriodicidad]
select * from Contrato
Select * from [ContratoTipoLimpieza]
Select * from [Factura]
Select * from [Visita]
Select * from [Limpiador]
Select * from [LimpiadorVisita]

COMMIT TRAN
/* Borrar todos los registros de la BBDD
Delete from [LimpiadorVisita]
Delete from [Limpiador]
Delete from [Visita]
Delete from [Factura]
Delete from [ContratoTipoLimpieza]
Delete from Contrato
Delete from [ContratoPeriodicidad]
Delete from TipoLimpieza
Delete from ClienteActividad
Delete from Cliente
Delete from Actividad
*/

/* Bloque para resetear Identitys
DBCC CHECKIDENT (Actividad, RESEED, 0)
DBCC CHECKIDENT (Cliente, RESEED, 0)
DBCC CHECKIDENT (ClienteActividad, RESEED, 0)
DBCC CHECKIDENT (TipoLimpieza, RESEED, 0)
DBCC CHECKIDENT ([ContratoPeriodicidad], RESEED, 0)
DBCC CHECKIDENT (Contrato, RESEED, 0)
DBCC CHECKIDENT ([ContratoTipoLimpieza], RESEED, 0)
DBCC CHECKIDENT ([Factura], RESEED, 0)
DBCC CHECKIDENT ([Visita], RESEED, 0)
DBCC CHECKIDENT ([Limpiador], RESEED, 0)
DBCC CHECKIDENT ([LimpiadorVisita], RESEED, 0)
*/