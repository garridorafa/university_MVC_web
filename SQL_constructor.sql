USE [master]
GO
/****** Object:  Database [dbInscripcion]    Script Date: 23/06/2019 12:36:10 p.m. ******/
CREATE DATABASE [dbInscripcion]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbInscripcion', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\dbInscripcion.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dbInscripcion_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\dbInscripcion_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [dbInscripcion] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbInscripcion].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbInscripcion] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbInscripcion] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbInscripcion] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbInscripcion] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbInscripcion] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbInscripcion] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbInscripcion] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbInscripcion] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbInscripcion] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbInscripcion] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbInscripcion] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbInscripcion] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbInscripcion] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbInscripcion] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbInscripcion] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbInscripcion] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbInscripcion] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbInscripcion] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbInscripcion] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbInscripcion] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbInscripcion] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbInscripcion] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbInscripcion] SET RECOVERY FULL 
GO
ALTER DATABASE [dbInscripcion] SET  MULTI_USER 
GO
ALTER DATABASE [dbInscripcion] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbInscripcion] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbInscripcion] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbInscripcion] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [dbInscripcion] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbInscripcion', N'ON'
GO
USE [dbInscripcion]
GO
/****** Object:  User [ESTUDIANTE-PC\ESTUDIANTE]    Script Date: 23/06/2019 12:36:11 p.m. ******/
CREATE USER [ESTUDIANTE-PC\ESTUDIANTE] FOR LOGIN [ESTUDIANTE-PC\ESTUDIANTE] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Schema [Inscripcion]    Script Date: 23/06/2019 12:36:11 p.m. ******/
CREATE SCHEMA [Inscripcion]
GO
/****** Object:  Schema [RRHH]    Script Date: 23/06/2019 12:36:11 p.m. ******/
CREATE SCHEMA [RRHH]
GO
/****** Object:  Table [Inscripcion].[DetalleSeleccion]    Script Date: 23/06/2019 12:36:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Inscripcion].[DetalleSeleccion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[matricula] [char](10) NULL,
	[idMateria] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Inscripcion].[estudiantes]    Script Date: 23/06/2019 12:36:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Inscripcion].[estudiantes](
	[matricula] [char](10) NOT NULL,
	[nombre] [varchar](200) NULL,
	[apellido] [varchar](200) NULL,
	[cedula] [varchar](200) NULL,
	[telefono] [char](11) NULL,
	[direccion] [char](250) NULL,
	[estatus] [char](10) NULL,
	[idnacionalidad] [int] NULL,
	[idprofesion] [int] NULL,
	[flag_becado] [bit] NULL,
	[usrcreaMod] [varchar](30) NULL,
	[fechaCreaMod] [datetime] NULL,
	[fechanacimiento] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Inscripcion].[MasterSeleccion]    Script Date: 23/06/2019 12:36:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Inscripcion].[MasterSeleccion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[matricula] [char](10) NULL,
	[fechaReg] [datetime] NULL,
	[usr] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Inscripcion].[Materias]    Script Date: 23/06/2019 12:36:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Inscripcion].[Materias](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NULL,
	[fechaReg] [datetime] NULL,
	[usr] [varchar](30) NULL,
	[cantidadCreditos] [int] NULL,
	[valorCreditos] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Inscripcion].[Nacionalidades]    Script Date: 23/06/2019 12:36:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Inscripcion].[Nacionalidades](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](200) NULL,
	[fechaReg] [datetime] NULL,
	[usr] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Inscripcion].[Profesiones]    Script Date: 23/06/2019 12:36:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Inscripcion].[Profesiones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](200) NULL,
	[fechaReg] [datetime] NULL,
	[usr] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Inscripcion].[Profesores]    Script Date: 23/06/2019 12:36:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Inscripcion].[Profesores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[apellidos] [varchar](100) NULL,
	[fechaReg] [datetime] NULL,
	[usr] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Inscripcion].[Usuarios]    Script Date: 23/06/2019 12:36:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Inscripcion].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](150) NULL,
	[apellidos] [varchar](150) NULL,
	[Usr] [varchar](30) NULL,
	[PassWord] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [Inscripcion].[estudiantes] ([matricula], [nombre], [apellido], [cedula], [telefono], [direccion], [estatus], [idnacionalidad], [idprofesion], [flag_becado], [usrcreaMod], [fechaCreaMod], [fechanacimiento]) VALUES (N'2019-01   ', N'RUDY', N'RODRIGUEZ', N'00102833861', N'8098637145 ', N'CALLE Z                                                                                                                                                                                                                                                   ', N'A         ', 39, 1, 1, N'rrodriguez', CAST(N'2019-01-01 00:00:00.000' AS DateTime), CAST(N'2019-01-01' AS Date))
GO
SET IDENTITY_INSERT [Inscripcion].[Materias] ON 

GO
INSERT [Inscripcion].[Materias] ([id], [descripcion], [fechaReg], [usr], [cantidadCreditos], [valorCreditos]) VALUES (16, N'matematicas', CAST(N'2019-05-19 12:39:20.073' AS DateTime), N'rrodriguez', 20, CAST(300.00 AS Decimal(18, 2)))
GO
INSERT [Inscripcion].[Materias] ([id], [descripcion], [fechaReg], [usr], [cantidadCreditos], [valorCreditos]) VALUES (18, N'INFORMATICA', CAST(N'2019-06-09 10:23:18.443' AS DateTime), N'rrodriguez', 10, CAST(200.00 AS Decimal(18, 2)))
GO
INSERT [Inscripcion].[Materias] ([id], [descripcion], [fechaReg], [usr], [cantidadCreditos], [valorCreditos]) VALUES (19, N'HISTORIA DE LA CIVILIZACION', CAST(N'2019-06-09 10:25:06.747' AS DateTime), N'rrodriguez', 5, CAST(150.00 AS Decimal(18, 2)))
GO
INSERT [Inscripcion].[Materias] ([id], [descripcion], [fechaReg], [usr], [cantidadCreditos], [valorCreditos]) VALUES (20, N'HISTORIA DE LA CIVILIZACION', CAST(N'2019-06-09 10:25:48.840' AS DateTime), N'rrodriguez', 5, CAST(150.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [Inscripcion].[Materias] OFF
GO
SET IDENTITY_INSERT [Inscripcion].[Nacionalidades] ON 

GO
INSERT [Inscripcion].[Nacionalidades] ([id], [descripcion], [fechaReg], [usr]) VALUES (29, N'Inglés', CAST(N'2019-06-23 10:44:05.407' AS DateTime), N'rrodriguez')
GO
INSERT [Inscripcion].[Nacionalidades] ([id], [descripcion], [fechaReg], [usr]) VALUES (31, N'Canadiense', CAST(N'2019-06-23 10:45:00.630' AS DateTime), N'rrodriguez')
GO
INSERT [Inscripcion].[Nacionalidades] ([id], [descripcion], [fechaReg], [usr]) VALUES (33, N'Neozelandés', CAST(N'2019-06-23 10:44:23.187' AS DateTime), N'rrodriguez')
GO
INSERT [Inscripcion].[Nacionalidades] ([id], [descripcion], [fechaReg], [usr]) VALUES (34, N'francés', CAST(N'2019-03-29 00:00:00.000' AS DateTime), N'rrodriguez')
GO
INSERT [Inscripcion].[Nacionalidades] ([id], [descripcion], [fechaReg], [usr]) VALUES (35, N'español', CAST(N'2019-03-30 00:00:00.000' AS DateTime), N'rrodriguez')
GO
INSERT [Inscripcion].[Nacionalidades] ([id], [descripcion], [fechaReg], [usr]) VALUES (36, N'portugués', CAST(N'2019-03-31 00:00:00.000' AS DateTime), N'rrodriguez')
GO
INSERT [Inscripcion].[Nacionalidades] ([id], [descripcion], [fechaReg], [usr]) VALUES (37, N'alemán', CAST(N'2019-04-01 00:00:00.000' AS DateTime), N'rrodriguez')
GO
INSERT [Inscripcion].[Nacionalidades] ([id], [descripcion], [fechaReg], [usr]) VALUES (38, N'holandés', CAST(N'2019-04-02 00:00:00.000' AS DateTime), N'rrodriguez')
GO
INSERT [Inscripcion].[Nacionalidades] ([id], [descripcion], [fechaReg], [usr]) VALUES (39, N'italiano', CAST(N'2019-04-03 00:00:00.000' AS DateTime), N'rrodriguez')
GO
INSERT [Inscripcion].[Nacionalidades] ([id], [descripcion], [fechaReg], [usr]) VALUES (40, N'griego', CAST(N'2019-04-04 00:00:00.000' AS DateTime), N'rrodriguez')
GO
INSERT [Inscripcion].[Nacionalidades] ([id], [descripcion], [fechaReg], [usr]) VALUES (41, N'sueco', CAST(N'2019-04-05 00:00:00.000' AS DateTime), N'rrodriguez')
GO
INSERT [Inscripcion].[Nacionalidades] ([id], [descripcion], [fechaReg], [usr]) VALUES (42, N'noruego', CAST(N'2019-04-06 00:00:00.000' AS DateTime), N'rrodriguez')
GO
INSERT [Inscripcion].[Nacionalidades] ([id], [descripcion], [fechaReg], [usr]) VALUES (43, N'danés', CAST(N'2019-04-07 00:00:00.000' AS DateTime), N'rrodriguez')
GO
INSERT [Inscripcion].[Nacionalidades] ([id], [descripcion], [fechaReg], [usr]) VALUES (44, N'islandés', CAST(N'2019-04-08 00:00:00.000' AS DateTime), N'rrodriguez')
GO
INSERT [Inscripcion].[Nacionalidades] ([id], [descripcion], [fechaReg], [usr]) VALUES (45, N'estonio', CAST(N'2019-04-09 00:00:00.000' AS DateTime), N'rrodriguez')
GO
INSERT [Inscripcion].[Nacionalidades] ([id], [descripcion], [fechaReg], [usr]) VALUES (46, N'letón', CAST(N'2019-04-10 00:00:00.000' AS DateTime), N'rrodriguez')
GO
INSERT [Inscripcion].[Nacionalidades] ([id], [descripcion], [fechaReg], [usr]) VALUES (47, N'lituano', CAST(N'2019-04-11 00:00:00.000' AS DateTime), N'rrodriguez')
GO
INSERT [Inscripcion].[Nacionalidades] ([id], [descripcion], [fechaReg], [usr]) VALUES (48, N'ruso', CAST(N'2019-04-12 00:00:00.000' AS DateTime), N'rrodriguez')
GO
INSERT [Inscripcion].[Nacionalidades] ([id], [descripcion], [fechaReg], [usr]) VALUES (49, N'polaco', CAST(N'2019-04-13 00:00:00.000' AS DateTime), N'rrodriguez')
GO
INSERT [Inscripcion].[Nacionalidades] ([id], [descripcion], [fechaReg], [usr]) VALUES (50, N'finés/finlandés', CAST(N'2019-04-14 00:00:00.000' AS DateTime), N'rrodriguez')
GO
INSERT [Inscripcion].[Nacionalidades] ([id], [descripcion], [fechaReg], [usr]) VALUES (51, N'japonés', CAST(N'2019-04-15 00:00:00.000' AS DateTime), N'rrodriguez')
GO
INSERT [Inscripcion].[Nacionalidades] ([id], [descripcion], [fechaReg], [usr]) VALUES (52, N'chino', CAST(N'2019-04-16 00:00:00.000' AS DateTime), N'rrodriguez')
GO
INSERT [Inscripcion].[Nacionalidades] ([id], [descripcion], [fechaReg], [usr]) VALUES (53, N'indio', CAST(N'2019-04-17 00:00:00.000' AS DateTime), N'rrodriguez')
GO
INSERT [Inscripcion].[Nacionalidades] ([id], [descripcion], [fechaReg], [usr]) VALUES (54, N'egipcio', CAST(N'2019-04-18 00:00:00.000' AS DateTime), N'rrodriguez')
GO
INSERT [Inscripcion].[Nacionalidades] ([id], [descripcion], [fechaReg], [usr]) VALUES (56, N'DOMINICANA', CAST(N'2019-01-01 00:00:00.000' AS DateTime), N'rrodriguez')
GO
SET IDENTITY_INSERT [Inscripcion].[Nacionalidades] OFF
GO
SET IDENTITY_INSERT [Inscripcion].[Profesiones] ON 

GO
INSERT [Inscripcion].[Profesiones] ([id], [descripcion], [fechaReg], [usr]) VALUES (1, N'Ingniería en Sistemas Computacionales', CAST(N'2019-06-23 12:06:38.000' AS DateTime), N'rrodriguez')
GO
INSERT [Inscripcion].[Profesiones] ([id], [descripcion], [fechaReg], [usr]) VALUES (2, N'Licenciatura en Mercadeo', CAST(N'2019-06-23 12:06:53.957' AS DateTime), N'rrodriguez')
GO
INSERT [Inscripcion].[Profesiones] ([id], [descripcion], [fechaReg], [usr]) VALUES (3, N'Ingeniero Agronomo', CAST(N'2019-06-23 12:07:05.850' AS DateTime), N'rrodriguez')
GO
INSERT [Inscripcion].[Profesiones] ([id], [descripcion], [fechaReg], [usr]) VALUES (4, N'Licenciatura en Contabilidad', CAST(N'2019-06-23 12:07:21.163' AS DateTime), N'rrodriguez')
GO
INSERT [Inscripcion].[Profesiones] ([id], [descripcion], [fechaReg], [usr]) VALUES (5, N'Licenciatura en Economía', CAST(N'2019-06-23 12:07:37.870' AS DateTime), N'rrodriguez')
GO
INSERT [Inscripcion].[Profesiones] ([id], [descripcion], [fechaReg], [usr]) VALUES (6, N'Licenciatura en Derecho', CAST(N'2019-06-23 12:07:52.963' AS DateTime), N'rrodriguez')
GO
INSERT [Inscripcion].[Profesiones] ([id], [descripcion], [fechaReg], [usr]) VALUES (7, N'Licenciatura en Lenguas Modernas', CAST(N'2019-06-23 12:08:14.727' AS DateTime), N'rrodriguez')
GO
SET IDENTITY_INSERT [Inscripcion].[Profesiones] OFF
GO
SET IDENTITY_INSERT [Inscripcion].[Profesores] ON 

GO
INSERT [Inscripcion].[Profesores] ([id], [nombre], [apellidos], [fechaReg], [usr]) VALUES (1, N'Rudy Ernesto', N'Rodriguez De Oleo', CAST(N'2019-06-23 12:21:47.117' AS DateTime), N'rrodriguez')
GO
INSERT [Inscripcion].[Profesores] ([id], [nombre], [apellidos], [fechaReg], [usr]) VALUES (2, N'Leonel Antonio', N'Fernandez Reyna', CAST(N'2019-06-23 12:28:54.870' AS DateTime), N'rrodriguez')
GO
INSERT [Inscripcion].[Profesores] ([id], [nombre], [apellidos], [fechaReg], [usr]) VALUES (3, N'Danilo', N'Medina', CAST(N'2019-06-23 12:22:47.873' AS DateTime), N'rrodriguez')
GO
INSERT [Inscripcion].[Profesores] ([id], [nombre], [apellidos], [fechaReg], [usr]) VALUES (4, N'Miguel', N'Vargas', CAST(N'2019-06-23 12:22:55.240' AS DateTime), N'rrodriguez')
GO
INSERT [Inscripcion].[Profesores] ([id], [nombre], [apellidos], [fechaReg], [usr]) VALUES (5, N'Jacinto Bienvenido', N'Peynado Garrigosa', CAST(N'2019-06-23 12:24:44.990' AS DateTime), N'rrodriguez')
GO
INSERT [Inscripcion].[Profesores] ([id], [nombre], [apellidos], [fechaReg], [usr]) VALUES (6, N'Hipolito', N'Mejia', CAST(N'2019-06-23 12:23:17.790' AS DateTime), N'rrodriguez')
GO
SET IDENTITY_INSERT [Inscripcion].[Profesores] OFF
GO
SET IDENTITY_INSERT [Inscripcion].[Usuarios] ON 

GO
INSERT [Inscripcion].[Usuarios] ([Id], [nombre], [apellidos], [Usr], [PassWord]) VALUES (1, N'Rudy', N'Rodriguez', N'rrodriguez', N'1')
GO
INSERT [Inscripcion].[Usuarios] ([Id], [nombre], [apellidos], [Usr], [PassWord]) VALUES (2, N'Leonel', N'Fernandez', N'lfernandez', N'1')
GO
SET IDENTITY_INSERT [Inscripcion].[Usuarios] OFF
GO
ALTER TABLE [Inscripcion].[DetalleSeleccion]  WITH CHECK ADD FOREIGN KEY([matricula])
REFERENCES [Inscripcion].[estudiantes] ([matricula])
GO
ALTER TABLE [Inscripcion].[DetalleSeleccion]  WITH CHECK ADD FOREIGN KEY([matricula])
REFERENCES [Inscripcion].[estudiantes] ([matricula])
GO
ALTER TABLE [Inscripcion].[DetalleSeleccion]  WITH CHECK ADD FOREIGN KEY([matricula])
REFERENCES [Inscripcion].[estudiantes] ([matricula])
GO
ALTER TABLE [Inscripcion].[DetalleSeleccion]  WITH CHECK ADD FOREIGN KEY([matricula])
REFERENCES [Inscripcion].[estudiantes] ([matricula])
GO
ALTER TABLE [Inscripcion].[DetalleSeleccion]  WITH CHECK ADD FOREIGN KEY([matricula])
REFERENCES [Inscripcion].[estudiantes] ([matricula])
GO
ALTER TABLE [Inscripcion].[estudiantes]  WITH CHECK ADD FOREIGN KEY([idnacionalidad])
REFERENCES [Inscripcion].[Nacionalidades] ([id])
GO
ALTER TABLE [Inscripcion].[estudiantes]  WITH CHECK ADD FOREIGN KEY([idnacionalidad])
REFERENCES [Inscripcion].[Nacionalidades] ([id])
GO
ALTER TABLE [Inscripcion].[estudiantes]  WITH CHECK ADD FOREIGN KEY([idnacionalidad])
REFERENCES [Inscripcion].[Nacionalidades] ([id])
GO
ALTER TABLE [Inscripcion].[estudiantes]  WITH CHECK ADD FOREIGN KEY([idnacionalidad])
REFERENCES [Inscripcion].[Nacionalidades] ([id])
GO
ALTER TABLE [Inscripcion].[estudiantes]  WITH CHECK ADD FOREIGN KEY([idnacionalidad])
REFERENCES [Inscripcion].[Nacionalidades] ([id])
GO
ALTER TABLE [Inscripcion].[estudiantes]  WITH CHECK ADD FOREIGN KEY([idprofesion])
REFERENCES [Inscripcion].[Profesiones] ([id])
GO
ALTER TABLE [Inscripcion].[estudiantes]  WITH CHECK ADD FOREIGN KEY([idprofesion])
REFERENCES [Inscripcion].[Profesiones] ([id])
GO
ALTER TABLE [Inscripcion].[estudiantes]  WITH CHECK ADD FOREIGN KEY([idprofesion])
REFERENCES [Inscripcion].[Profesiones] ([id])
GO
ALTER TABLE [Inscripcion].[estudiantes]  WITH CHECK ADD FOREIGN KEY([idprofesion])
REFERENCES [Inscripcion].[Profesiones] ([id])
GO
ALTER TABLE [Inscripcion].[estudiantes]  WITH CHECK ADD FOREIGN KEY([idprofesion])
REFERENCES [Inscripcion].[Profesiones] ([id])
GO
ALTER TABLE [Inscripcion].[MasterSeleccion]  WITH CHECK ADD FOREIGN KEY([matricula])
REFERENCES [Inscripcion].[estudiantes] ([matricula])
GO
ALTER TABLE [Inscripcion].[MasterSeleccion]  WITH CHECK ADD FOREIGN KEY([matricula])
REFERENCES [Inscripcion].[estudiantes] ([matricula])
GO
ALTER TABLE [Inscripcion].[MasterSeleccion]  WITH CHECK ADD FOREIGN KEY([matricula])
REFERENCES [Inscripcion].[estudiantes] ([matricula])
GO
ALTER TABLE [Inscripcion].[MasterSeleccion]  WITH CHECK ADD FOREIGN KEY([matricula])
REFERENCES [Inscripcion].[estudiantes] ([matricula])
GO
ALTER TABLE [Inscripcion].[MasterSeleccion]  WITH CHECK ADD FOREIGN KEY([matricula])
REFERENCES [Inscripcion].[estudiantes] ([matricula])
GO
/****** Object:  StoredProcedure [dbo].[spo_InsertarEstudiantes]    Script Date: 23/06/2019 12:36:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spo_InsertarEstudiantes]
  
  @matricula char(10)= null
 ,@nombre varchar(200)= null
 ,@apellido varchar(200)= null
 ,@cedula varchar(200)= null
 ,@telefono char(11)= null
 ,@direccion char(250)= null
 ,@estatus char(10)= null
 ,@idnacionalidad int= null
 ,@idprofesion int= null
 ,@flag_becado bit= null
 ,@usrcreaMod varchar(30)= null
 ,@fechaCreaMod datetime= null
 ,@fechanacimiento date= null 
 ,@accion int  =null
AS
--insertar/actualizar
if @accion = 1
if exists(select matricula from [Inscripcion].[Estudiantes]
             where matricula = @matricula)
begin
 UPDATE [Inscripcion].[Estudiantes]
   SET 
      
       [nombre] = @nombre  
      ,[apellido] = @apellido  
      ,[cedula] = @cedula  
      ,[telefono] = @telefono  
      ,[direccion] = @direccion  
      ,[estatus] = @estatus  
      ,[idnacionalidad] = @idnacionalidad  
      ,[idprofesion] = @idprofesion  
      ,[flag_becado] = @flag_becado  
      ,[usrcreaMod] = @usrcreaMod  
      ,[fechaCreaMod] = @fechaCreaMod  
      ,[fechanacimiento] = @fechanacimiento  
 WHERE  matricula = @matricula
end
else
   begin
   INSERT INTO [Inscripcion].[Estudiantes]
           ([matricula]
           ,[nombre]
           ,[apellido]
           ,[cedula]
           ,[telefono]
           ,[direccion]
           ,[estatus]
           ,[idnacionalidad]
           ,[idprofesion]
           ,[flag_becado]
           ,[usrcreaMod]
           ,[fechaCreaMod]
           ,[fechanacimiento])
     VALUES
           (
		    @matricula  
           ,@nombre  
           ,@apellido  
           ,@cedula  
           ,@telefono  
           ,@direccion  
           ,@estatus  
           ,@idnacionalidad  
           ,@idprofesion  
           ,@flag_becado  
           ,@usrcreaMod  
           ,@fechaCreaMod  
           ,@fechanacimiento)
   end

   --borrar registro
   else if @accion = 2
   begin 
      delete from [Inscripcion].[Estudiantes]
	    where matricula = @matricula
   end

   --consultar registro
   else if @accion = 3
   begin
      select * from [Inscripcion].[Estudiantes]
   end
GO
/****** Object:  StoredProcedure [dbo].[spo_InsertarMaterias]    Script Date: 23/06/2019 12:36:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spo_InsertarMaterias]
    @id int = null
   ,@descripcion varchar(100) = null
   ,@fechaReg datetime= null
   ,@usr varchar(30)= null
   ,@cantidadCreditos int= null
   ,@valorCreditos decimal(18,2)= null
   ,@accion int = null
AS
--insertar/actualizar
if @accion = 1
if exists(select id from Inscripcion.materias where id = @id )
begin
UPDATE [Inscripcion].[Materias]
   SET [descripcion] = @descripcion 
      ,[fechaReg] = @fechaReg 
      ,[usr] = @usr 
      ,[cantidadCreditos] = @cantidadCreditos 
      ,[valorCreditos] = @valorCreditos 
 WHERE id = @id
end
else

   begin
   INSERT INTO [Inscripcion].[Materias]
           ([descripcion]
           ,[fechaReg]
           ,[usr]
           ,[cantidadCreditos]
           ,[valorCreditos])
     VALUES
           (
		    @descripcion  
           ,@fechaReg  
           ,@usr  
           ,@cantidadCreditos  
           ,@valorCreditos  
		   )
   end
   --borrar registro 
   else if @accion = 2
   begin
      delete from Inscripcion.Materias
	   where id = @id
   end
   --consultar registro
   else if @accion = 3
    begin
		 select id,descripcion,cantidadCreditos,valorCreditos from Inscripcion.Materias
   end
GO
/****** Object:  StoredProcedure [dbo].[spo_InsertarNacionalidades]    Script Date: 23/06/2019 12:36:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spo_InsertarNacionalidades]
  @id  int = null
 ,@descripcion varchar(200) =null
 ,@fechaReg datetime =null
 ,@usr varchar(30) =null
 ,@accion int  =null
AS
--insertar/actualizar
if @accion = 1
if exists(select id from [Inscripcion].[Nacionalidades]
             where id = @id)
begin
UPDATE [Inscripcion].[Nacionalidades]
   SET [descripcion] = @descripcion 
      ,[fechaReg] = @fechaReg 
      ,[usr] = @usr 
 WHERE  id = @id
end
else
   begin
   INSERT INTO [Inscripcion].[Nacionalidades]
           ([descripcion]
           ,[fechaReg]
           ,[usr])
     VALUES
           (
		    @descripcion  
           ,@fechaReg  
           ,@usr 
		   ) 
   end

   --borrar registro
   else if @accion = 2
   begin 
      delete from [Inscripcion].[Nacionalidades]
	    where id = @id
   end

   --consultar registro
   else if @accion = 3
   begin
      select id,descripcion from [Inscripcion].[Nacionalidades]
   end
GO
/****** Object:  StoredProcedure [dbo].[spo_InsertarProfesiones]    Script Date: 23/06/2019 12:36:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spo_InsertarProfesiones]
  @id  int = null
 ,@descripcion varchar(200) =null
 ,@fechaReg datetime =null
 ,@usr varchar(30) =null
 ,@accion int  =null
AS
--insertar/actualizar
if @accion = 1
if exists(select id from [Inscripcion].[Profesiones]
             where id = @id)
begin
UPDATE [Inscripcion].[Profesiones]
   SET [descripcion] = @descripcion 
      ,[fechaReg] = @fechaReg 
      ,[usr] = @usr 
 WHERE  id = @id
end
else
   begin
   INSERT INTO [Inscripcion].[Profesiones]
           ([descripcion]
           ,[fechaReg]
           ,[usr])
     VALUES
           (
		    @descripcion  
           ,@fechaReg  
           ,@usr 
		   ) 
   end

   --borrar registro
   else if @accion = 2
   begin 
      delete from [Inscripcion].[Profesiones]
	    where id = @id
   end

   --consultar registro
   else if @accion = 3
   begin
      select id,descripcion from [Inscripcion].[Profesiones]
   end
GO
/****** Object:  StoredProcedure [dbo].[spo_InsertarProfesores]    Script Date: 23/06/2019 12:36:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spo_InsertarProfesores]
  @id  int = null
 ,@nombre varchar(200) =null
 ,@apellidos varchar(200) =null
 ,@fechaReg datetime =null
 ,@usr varchar(30) =null
 ,@accion int  =null
AS
--insertar/actualizar
if @accion = 1
if exists(select id from [Inscripcion].[Profesores]
             where id = @id)
begin
UPDATE [Inscripcion].[Profesores]
   SET [nombre] = @nombre
      ,[apellidos] = @apellidos
      ,[fechaReg] = @fechaReg 
      ,[usr] = @usr 
 WHERE  id = @id
end
else
   begin
   INSERT INTO [Inscripcion].[Profesores]
           ([nombre]
		   ,[apellidos]
           ,[fechaReg]
           ,[usr])
     VALUES
           (
		    @nombre
		   ,@apellidos
           ,@fechaReg  
           ,@usr 
		   ) 
   end

   --borrar registro
   else if @accion = 2
   begin 
      delete from [Inscripcion].[Profesores]
	    where id = @id
   end

   --consultar registro
   else if @accion = 3
   begin
      select id,nombre,apellidos from [Inscripcion].[Profesores]
   end
GO
USE [master]
GO
ALTER DATABASE [dbInscripcion] SET  READ_WRITE 
GO
