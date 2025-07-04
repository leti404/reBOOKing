USE [master]
GO
/****** Object:  Database [TP_REBOOKING]    Script Date: 28/4/2025 14:32:24 ******/
CREATE DATABASE [TP_REBOOKING]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TP_REBOOKING', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TP_REBOOKING.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TP_REBOOKING_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TP_REBOOKING_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TP_REBOOKING] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TP_REBOOKING].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TP_REBOOKING] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TP_REBOOKING] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TP_REBOOKING] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TP_REBOOKING] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TP_REBOOKING] SET ARITHABORT OFF 
GO
ALTER DATABASE [TP_REBOOKING] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TP_REBOOKING] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TP_REBOOKING] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TP_REBOOKING] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TP_REBOOKING] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TP_REBOOKING] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TP_REBOOKING] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TP_REBOOKING] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TP_REBOOKING] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TP_REBOOKING] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TP_REBOOKING] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TP_REBOOKING] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TP_REBOOKING] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TP_REBOOKING] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TP_REBOOKING] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TP_REBOOKING] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TP_REBOOKING] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TP_REBOOKING] SET RECOVERY FULL 
GO
ALTER DATABASE [TP_REBOOKING] SET  MULTI_USER 
GO
ALTER DATABASE [TP_REBOOKING] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TP_REBOOKING] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TP_REBOOKING] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TP_REBOOKING] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TP_REBOOKING] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TP_REBOOKING', N'ON'
GO
ALTER DATABASE [TP_REBOOKING] SET QUERY_STORE = OFF
GO
USE [TP_REBOOKING]
GO
/****** Object:  User [alumno]    Script Date: 28/4/2025 14:32:24 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Favorito]    Script Date: 28/4/2025 14:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorito](
	[id_usuario] [int] NOT NULL,
	[id_publicacion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC,
	[id_publicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libro]    Script Date: 28/4/2025 14:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libro](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[descripcion] [text] NULL,
	[año] [int] NULL,
	[id_autor] [int] NULL,
	[id_editorial] [int] NULL,
	[id_materia] [int] NULL,
 CONSTRAINT [PK__libros__3213E83FBEDA1B22] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publicacion]    Script Date: 28/4/2025 14:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publicacion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_libro] [int] NOT NULL,
	[precio] [decimal](10, 2) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[imagen] [varchar](200) NOT NULL,
 CONSTRAINT [PK__publicac__3213E83FE22AE627] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 28/4/2025 14:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[apellido] [varchar](255) NOT NULL,
	[nombre_usuario] [varchar](255) NOT NULL,
	[contraseña] [varchar](255) NOT NULL,
	[gmail] [varchar](255) NOT NULL,
	[fecha_nacimiento] [date] NOT NULL,
	[nombre_escuela] [varchar](255) NULL,
	[año_escolar] [int] NULL,
 CONSTRAINT [PK__usuarios__3213E83FD43C3002] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VerTodosLosFavoritos]    Script Date: 28/4/2025 14:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[VerTodosLosFavoritos] AS
SELECT 
    Usuario.id AS UsuarioID,
    Publicacion.id AS PublicacionID,
	Usuario.nombre_usuario, Libro.nombre
FROM Favorito
JOIN Usuario ON Favorito.id_usuario = Usuario.id
JOIN Publicacion ON Favorito.id_publicacion = Publicacion.id
JOIN Libro ON Publicacion.id_libro = Libro.id;
GO
/****** Object:  Table [dbo].[Review]    Script Date: 28/4/2025 14:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_publicacion] [int] NOT NULL,
	[usuario_escritor] [int] NOT NULL,
	[usuario_recibidor] [int] NOT NULL,
	[estrellas] [int] NULL,
	[descripcion] [text] NULL,
 CONSTRAINT [PK__reviews__3213E83F0FB56947] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[VerTodasLasReviews]    Script Date: 28/4/2025 14:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[VerTodasLasReviews] AS
SELECT r.id AS ReviewID, p.id AS PublicacionID, p.id_libro, r.descripcion, r.estrellas, u.nombre_usuario, libros.nombre
FROM Review r
JOIN Publicacion p ON r.id_publicacion = p.id
JOIN Usuario u ON r.usuario_escritor = u.id
JOIN Libro libros ON p.id_libro = libros.id;
GO
/****** Object:  View [dbo].[VerPublicacionesDeUsuario]    Script Date: 28/4/2025 14:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[VerPublicacionesDeUsuario] AS
SELECT 
    p.id AS PublicacionID, 
    l.nombre AS NombreLibro, 
    u.id AS UsuarioID, 
    u.nombre_usuario AS NombreUsuario,
    p.fecha AS FechaCreacion
FROM Publicacion p
JOIN Usuario u ON p.id_usuario = u.id
JOIN Libro l ON p.id_libro = l.id;
GO
/****** Object:  View [dbo].[TraerTodasPublicaciones]    Script Date: 28/4/2025 14:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[TraerTodasPublicaciones] AS
SELECT 
    p.id AS PublicacionID, 
    l.nombre AS NombreLibro,
    u.id AS UsuarioID, 
    u.nombre_usuario AS NombreUsuario,
    p.fecha AS FechaCreacion
FROM Publicacion p
JOIN Usuario u ON p.id_usuario = u.id 
JOIN Libro l ON p.id_libro = l.id; 
GO
/****** Object:  View [dbo].[TraerTodosLosDatosDeUsuario]    Script Date: 28/4/2025 14:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[TraerTodosLosDatosDeUsuario] AS
SELECT 
    u.id AS UsuarioID,
    u.nombre_usuario AS NombreUsuario,
    p.id AS PublicacionID, 
    l.nombre AS NombreLibro,
    p.fecha AS FechaCreacion
FROM Usuario u
LEFT JOIN Publicacion p ON u.id = p.id_usuario
LEFT JOIN Libro l ON p.id_libro = l.id;
GO
/****** Object:  Table [dbo].[Autor]    Script Date: 28/4/2025 14:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
 CONSTRAINT [PK__autores__3213E83F0FB56947] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carrito]    Script Date: 28/4/2025 14:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carrito](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[id_publicacion] [int] NOT NULL,
 CONSTRAINT [PK_Carrito] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Editorial]    Script Date: 28/4/2025 14:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Editorial](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
 CONSTRAINT [PK__editoria__3213E83F8720F3DC] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Etiqueta]    Script Date: 28/4/2025 14:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Etiqueta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
 CONSTRAINT [PK__etiqueta__3213E83F119A57A7] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materia]    Script Date: 28/4/2025 14:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
 CONSTRAINT [PK__categori__3213E83F75758F86] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PublicacionXetiqueta]    Script Date: 28/4/2025 14:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PublicacionXetiqueta](
	[id_publicacion] [int] NOT NULL,
	[id_etiqueta] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_publicacion] ASC,
	[id_etiqueta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Autor] ON 

INSERT [dbo].[Autor] ([id], [nombre]) VALUES (1, N'David Grossman')
INSERT [dbo].[Autor] ([id], [nombre]) VALUES (2, N'Sholem Aleichem')
INSERT [dbo].[Autor] ([id], [nombre]) VALUES (3, N'Jack London')
INSERT [dbo].[Autor] ([id], [nombre]) VALUES (4, N'Ray Bradbury')
INSERT [dbo].[Autor] ([id], [nombre]) VALUES (5, N'J.D. Salinger')
INSERT [dbo].[Autor] ([id], [nombre]) VALUES (6, N'Art Spiegelman')
INSERT [dbo].[Autor] ([id], [nombre]) VALUES (7, N'Rafael Fischer')
INSERT [dbo].[Autor] ([id], [nombre]) VALUES (8, N'Mariano Mores')
INSERT [dbo].[Autor] ([id], [nombre]) VALUES (9, N'Anonimo')
SET IDENTITY_INSERT [dbo].[Autor] OFF
GO
SET IDENTITY_INSERT [dbo].[Editorial] ON 

INSERT [dbo].[Editorial] ([id], [nombre]) VALUES (1, N'Editorial Sudamericana')
INSERT [dbo].[Editorial] ([id], [nombre]) VALUES (2, N'Ediciones B')
INSERT [dbo].[Editorial] ([id], [nombre]) VALUES (3, N'Penguin Random House')
INSERT [dbo].[Editorial] ([id], [nombre]) VALUES (4, N'Anagrama')
INSERT [dbo].[Editorial] ([id], [nombre]) VALUES (5, N'Alianza Editorial')
INSERT [dbo].[Editorial] ([id], [nombre]) VALUES (6, N'Anonimo')
SET IDENTITY_INSERT [dbo].[Editorial] OFF
GO
SET IDENTITY_INSERT [dbo].[Etiqueta] ON 

INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (3, N'Bueno')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (5, N'Excelente')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (4, N'Muy Bueno')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (1, N'Muy Usado')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (2, N'Regular')
SET IDENTITY_INSERT [dbo].[Etiqueta] OFF
GO
INSERT [dbo].[Favorito] ([id_usuario], [id_publicacion]) VALUES (2, 2)
INSERT [dbo].[Favorito] ([id_usuario], [id_publicacion]) VALUES (2, 4)
INSERT [dbo].[Favorito] ([id_usuario], [id_publicacion]) VALUES (3, 1)
INSERT [dbo].[Favorito] ([id_usuario], [id_publicacion]) VALUES (4, 5)
INSERT [dbo].[Favorito] ([id_usuario], [id_publicacion]) VALUES (5, 2)
GO
SET IDENTITY_INSERT [dbo].[Libro] ON 

INSERT [dbo].[Libro] ([id], [nombre], [descripcion], [año], [id_autor], [id_editorial], [id_materia]) VALUES (1, N'Historia del pueblo de Israel II', N'Un análisis sobre la historia del pueblo judío.', 2, 1, 1, 4)
INSERT [dbo].[Libro] ([id], [nombre], [descripcion], [año], [id_autor], [id_editorial], [id_materia]) VALUES (2, N'Fuentes del judaísmo II', N'Exploración de las fuentes del judaísmo.', 2, 1, 1, 4)
INSERT [dbo].[Libro] ([id], [nombre], [descripcion], [año], [id_autor], [id_editorial], [id_materia]) VALUES (3, N'Ivrit Baderej-Alef', N'Un manual de hebreo para principiantes.', 1, 2, 2, 12)
INSERT [dbo].[Libro] ([id], [nombre], [descripcion], [año], [id_autor], [id_editorial], [id_materia]) VALUES (4, N'Avanza: Ambientes y población del mundo', N'Estudio sobre la demografía y geografía mundial.', 5, 3, 3, 7)
INSERT [dbo].[Libro] ([id], [nombre], [descripcion], [año], [id_autor], [id_editorial], [id_materia]) VALUES (5, N'La llamada de lo salvaje', N'Novela sobre la lucha por la supervivencia.', 3, 4, 4, 9)
INSERT [dbo].[Libro] ([id], [nombre], [descripcion], [año], [id_autor], [id_editorial], [id_materia]) VALUES (6, N'Tres portugueses bajo un paraguas (sin contar al muerto)', N'Una novela sobre la vida de tres amigos.', 5, 4, 4, 9)
INSERT [dbo].[Libro] ([id], [nombre], [descripcion], [año], [id_autor], [id_editorial], [id_materia]) VALUES (7, N'En defensa propia', N'Una novela de suspenso y acción.', 1, 5, 5, 9)
INSERT [dbo].[Libro] ([id], [nombre], [descripcion], [año], [id_autor], [id_editorial], [id_materia]) VALUES (8, N'Ivrit Baderej-Gimel', N'Continuación del manual de hebreo.', 1, 2, 2, 12)
INSERT [dbo].[Libro] ([id], [nombre], [descripcion], [año], [id_autor], [id_editorial], [id_materia]) VALUES (9, N'Ivrit Baderej-Bet', N'Continuación del manual de hebreo.', 2, 2, 2, 12)
INSERT [dbo].[Libro] ([id], [nombre], [descripcion], [año], [id_autor], [id_editorial], [id_materia]) VALUES (10, N'Historia del pueblo de Israel III', N'Un análisis más profundo sobre la historia judía.', 3, 1, 1, 4)
INSERT [dbo].[Libro] ([id], [nombre], [descripcion], [año], [id_autor], [id_editorial], [id_materia]) VALUES (11, N'El extraño caso del Dr. Jekyll y Mr. Hyde', N'Una novela sobre la dualidad de la naturaleza humana.', 2, 4, 4, 9)
INSERT [dbo].[Libro] ([id], [nombre], [descripcion], [año], [id_autor], [id_editorial], [id_materia]) VALUES (12, N'Fahrenheit 451', N'Un futuro distópico donde los libros son prohibidos.', 2, 5, 5, 9)
INSERT [dbo].[Libro] ([id], [nombre], [descripcion], [año], [id_autor], [id_editorial], [id_materia]) VALUES (13, N'Cuadernillo de apuntes teóricos de lengua y literatura 2do', N'Apuntes sobre teoría literaria.', 2, 1, 1, 9)
INSERT [dbo].[Libro] ([id], [nombre], [descripcion], [año], [id_autor], [id_editorial], [id_materia]) VALUES (14, N'El caballero de la armadura oxidada', N'Una fábula sobre la búsqueda del ser interior.', 3, 3, 3, 4)
INSERT [dbo].[Libro] ([id], [nombre], [descripcion], [año], [id_autor], [id_editorial], [id_materia]) VALUES (15, N'Toldot III', N'Estudio sobre las generaciones del pueblo judío.', 3, 1, 1, 4)
INSERT [dbo].[Libro] ([id], [nombre], [descripcion], [año], [id_autor], [id_editorial], [id_materia]) VALUES (16, N'Un guardián entre el centeno', N'La historia de un joven en Nueva York.', 3, 4, 4, 9)
INSERT [dbo].[Libro] ([id], [nombre], [descripcion], [año], [id_autor], [id_editorial], [id_materia]) VALUES (17, N'Maus', N'Una representación gráfica de la experiencia del Holocausto.', 3, 4, 4, 9)
INSERT [dbo].[Libro] ([id], [nombre], [descripcion], [año], [id_autor], [id_editorial], [id_materia]) VALUES (18, N'Un hombre sin suerte', N'Una novela sobre la fatalidad de la vida.', 1, 2, 2, 9)
INSERT [dbo].[Libro] ([id], [nombre], [descripcion], [año], [id_autor], [id_editorial], [id_materia]) VALUES (19, N'El juguete', N'Una historia que explora la infancia.', 4, 5, 5, 9)
INSERT [dbo].[Libro] ([id], [nombre], [descripcion], [año], [id_autor], [id_editorial], [id_materia]) VALUES (20, N'Aguas fuertes porteñas', N'Una obra que refleja la vida en Buenos Aires.', 4, 3, 3, 9)
INSERT [dbo].[Libro] ([id], [nombre], [descripcion], [año], [id_autor], [id_editorial], [id_materia]) VALUES (21, N'Toldot IV', N'Continuación del estudio de las generaciones judías.', 4, 1, 1, 4)
SET IDENTITY_INSERT [dbo].[Libro] OFF
GO
SET IDENTITY_INSERT [dbo].[Materia] ON 

INSERT [dbo].[Materia] ([id], [nombre]) VALUES (1, N'Educacion Física')
INSERT [dbo].[Materia] ([id], [nombre]) VALUES (2, N'Arte')
INSERT [dbo].[Materia] ([id], [nombre]) VALUES (3, N'Biología')
INSERT [dbo].[Materia] ([id], [nombre]) VALUES (4, N'Educación Judía')
INSERT [dbo].[Materia] ([id], [nombre]) VALUES (5, N'Educacion Tecnológica')
INSERT [dbo].[Materia] ([id], [nombre]) VALUES (6, N'Formación Ética y Ciudadana')
INSERT [dbo].[Materia] ([id], [nombre]) VALUES (7, N'Geografía')
INSERT [dbo].[Materia] ([id], [nombre]) VALUES (8, N'Historia')
INSERT [dbo].[Materia] ([id], [nombre]) VALUES (9, N'Lengua y Literatura')
INSERT [dbo].[Materia] ([id], [nombre]) VALUES (10, N'Matemática')
INSERT [dbo].[Materia] ([id], [nombre]) VALUES (11, N'Inglés')
INSERT [dbo].[Materia] ([id], [nombre]) VALUES (12, N'Hebreo')
INSERT [dbo].[Materia] ([id], [nombre]) VALUES (13, N'Filosofía')
SET IDENTITY_INSERT [dbo].[Materia] OFF
GO
SET IDENTITY_INSERT [dbo].[Publicacion] ON 

INSERT [dbo].[Publicacion] ([id], [id_libro], [precio], [id_usuario], [fecha], [imagen]) VALUES (1, 1, CAST(15000.00 AS Decimal(10, 2)), 1, CAST(N'2000-01-15' AS Date), N'https://lh6.googleusercontent.com/proxy/WE8ty6bhHjkVfbhodHNtlozS3HiEarnKOAmeswYHW2jYVLKyqhGv65kcyNuXO8l96dsSgOr5Rl13sLBZ26bwUwh8AgSYca_FAyGNHORfffJo')
INSERT [dbo].[Publicacion] ([id], [id_libro], [precio], [id_usuario], [fecha], [imagen]) VALUES (2, 2, CAST(25000.00 AS Decimal(10, 2)), 2, CAST(N'2005-02-20' AS Date), N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRibTbICAVgpjuG4qeRuywDlFu3YzdM9rr6Jg&s')
INSERT [dbo].[Publicacion] ([id], [id_libro], [precio], [id_usuario], [fecha], [imagen]) VALUES (3, 3, CAST(15000.00 AS Decimal(10, 2)), 3, CAST(N'2010-03-25' AS Date), N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzqcfFkqii7-0_Mp8n-h6NGedn3xD9d1OF3A&s')
INSERT [dbo].[Publicacion] ([id], [id_libro], [precio], [id_usuario], [fecha], [imagen]) VALUES (4, 4, CAST(18000.00 AS Decimal(10, 2)), 4, CAST(N'2015-04-30' AS Date), N'https://contentv2.tap-commerce.com//cover/large/9789501325843_1.jpg?id_com=717')
INSERT [dbo].[Publicacion] ([id], [id_libro], [precio], [id_usuario], [fecha], [imagen]) VALUES (5, 5, CAST(30000.00 AS Decimal(10, 2)), 5, CAST(N'1903-05-10' AS Date), N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2B5FXhZLfeO0S-pGO47TyWKN5INspE_D55Q&s')
INSERT [dbo].[Publicacion] ([id], [id_libro], [precio], [id_usuario], [fecha], [imagen]) VALUES (6, 6, CAST(22000.00 AS Decimal(10, 2)), 1, CAST(N'1992-06-15' AS Date), N'https://acdn.mitiendanube.com/stores/002/119/730/products/diseno-sin-titulo-231-b57c67d7e552941d8d16809066563634-1024-1024.jpg')
INSERT [dbo].[Publicacion] ([id], [id_libro], [precio], [id_usuario], [fecha], [imagen]) VALUES (7, 7, CAST(27000.00 AS Decimal(10, 2)), 2, CAST(N'2012-07-20' AS Date), N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvurSV8qW6Z555cLBgTrbvy1YrsUOFFr9xlw&s')
INSERT [dbo].[Publicacion] ([id], [id_libro], [precio], [id_usuario], [fecha], [imagen]) VALUES (8, 8, CAST(13000.00 AS Decimal(10, 2)), 3, CAST(N'2014-08-25' AS Date), N'https://kehot.com.ar/Image/0/450_450-majzor-kipur-sucat-david.jpg')
INSERT [dbo].[Publicacion] ([id], [id_libro], [precio], [id_usuario], [fecha], [imagen]) VALUES (9, 9, CAST(16000.00 AS Decimal(10, 2)), 4, CAST(N'2013-09-30' AS Date), N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRx6XuudMs743NTkjwNvpQsoiDyRblUjFmuIw&s')
INSERT [dbo].[Publicacion] ([id], [id_libro], [precio], [id_usuario], [fecha], [imagen]) VALUES (10, 10, CAST(19000.00 AS Decimal(10, 2)), 5, CAST(N'2012-10-05' AS Date), N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxNGljX70KecKdRWqymru2CN86MzQwSBc7Mw&s')
INSERT [dbo].[Publicacion] ([id], [id_libro], [precio], [id_usuario], [fecha], [imagen]) VALUES (11, 11, CAST(21000.00 AS Decimal(10, 2)), 1, CAST(N'1886-11-01' AS Date), N'https://colihue.com.ar/wp-content/uploads/2022/12/COLCI-104561-89789876845618.jpg')
INSERT [dbo].[Publicacion] ([id], [id_libro], [precio], [id_usuario], [fecha], [imagen]) VALUES (12, 12, CAST(25000.00 AS Decimal(10, 2)), 2, CAST(N'1953-12-02' AS Date), N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRB1CfAKdVXrpBT2YiqNbnSJr9cRzV3-3LN1A&s')
INSERT [dbo].[Publicacion] ([id], [id_libro], [precio], [id_usuario], [fecha], [imagen]) VALUES (13, 13, CAST(14000.00 AS Decimal(10, 2)), 3, CAST(N'2020-01-05' AS Date), N'https://dad.uncuyo.edu.ar/cache/cuadrlen_546_966.jpg')
INSERT [dbo].[Publicacion] ([id], [id_libro], [precio], [id_usuario], [fecha], [imagen]) VALUES (14, 14, CAST(17500.00 AS Decimal(10, 2)), 4, CAST(N'1994-02-10' AS Date), N'https://labordeeditor.com.ar/web/image/product.template/36743/image_1024?unique=c4285b1')
INSERT [dbo].[Publicacion] ([id], [id_libro], [precio], [id_usuario], [fecha], [imagen]) VALUES (15, 15, CAST(18500.00 AS Decimal(10, 2)), 5, CAST(N'2008-03-15' AS Date), N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMuGGqffoDQ8z0UHm-o8pFulIRClw2GsEJsg&s')
INSERT [dbo].[Publicacion] ([id], [id_libro], [precio], [id_usuario], [fecha], [imagen]) VALUES (16, 16, CAST(19500.00 AS Decimal(10, 2)), 1, CAST(N'1951-04-20' AS Date), N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuTQkTUqdcwrXQnTAqEnpQWhtcWO1xvf9-hg&s')
INSERT [dbo].[Publicacion] ([id], [id_libro], [precio], [id_usuario], [fecha], [imagen]) VALUES (17, 17, CAST(20000.00 AS Decimal(10, 2)), 2, CAST(N'1986-05-30' AS Date), N'https://acdn.mitiendanube.com/stores/001/575/892/products/978607312581921-ae69cbeee3dfaad74b16212853658774-640-0.jpg')
INSERT [dbo].[Publicacion] ([id], [id_libro], [precio], [id_usuario], [fecha], [imagen]) VALUES (18, 18, CAST(18000.00 AS Decimal(10, 2)), 3, CAST(N'2010-06-15' AS Date), N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgxUJum1QRjrO-znJXz1Lj6BMzsbc3fbYImA&s')
INSERT [dbo].[Publicacion] ([id], [id_libro], [precio], [id_usuario], [fecha], [imagen]) VALUES (19, 19, CAST(21000.00 AS Decimal(10, 2)), 4, CAST(N'2009-07-25' AS Date), N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCnMP2cmnnqO4PFgVX53VtTmlVaYNewZGlrw&s')
INSERT [dbo].[Publicacion] ([id], [id_libro], [precio], [id_usuario], [fecha], [imagen]) VALUES (20, 20, CAST(16000.00 AS Decimal(10, 2)), 5, CAST(N'2001-08-30' AS Date), N'https://acdn.mitiendanube.com/stores/001/351/376/products/97898737625291-ae1ae6e108520320b116080839363899-640-0.jpg')
INSERT [dbo].[Publicacion] ([id], [id_libro], [precio], [id_usuario], [fecha], [imagen]) VALUES (21, 21, CAST(19000.00 AS Decimal(10, 2)), 1, CAST(N'2009-08-30' AS Date), N'https://united-jed.org/wp-content/uploads/sites/3/Screenshot-2024-03-12-142550.png')
SET IDENTITY_INSERT [dbo].[Publicacion] OFF
GO
INSERT [dbo].[PublicacionXetiqueta] ([id_publicacion], [id_etiqueta]) VALUES (1, 1)
INSERT [dbo].[PublicacionXetiqueta] ([id_publicacion], [id_etiqueta]) VALUES (2, 1)
INSERT [dbo].[PublicacionXetiqueta] ([id_publicacion], [id_etiqueta]) VALUES (3, 3)
INSERT [dbo].[PublicacionXetiqueta] ([id_publicacion], [id_etiqueta]) VALUES (4, 4)
INSERT [dbo].[PublicacionXetiqueta] ([id_publicacion], [id_etiqueta]) VALUES (5, 4)
INSERT [dbo].[PublicacionXetiqueta] ([id_publicacion], [id_etiqueta]) VALUES (6, 2)
INSERT [dbo].[PublicacionXetiqueta] ([id_publicacion], [id_etiqueta]) VALUES (7, 4)
INSERT [dbo].[PublicacionXetiqueta] ([id_publicacion], [id_etiqueta]) VALUES (8, 3)
INSERT [dbo].[PublicacionXetiqueta] ([id_publicacion], [id_etiqueta]) VALUES (9, 2)
INSERT [dbo].[PublicacionXetiqueta] ([id_publicacion], [id_etiqueta]) VALUES (10, 5)
INSERT [dbo].[PublicacionXetiqueta] ([id_publicacion], [id_etiqueta]) VALUES (11, 1)
INSERT [dbo].[PublicacionXetiqueta] ([id_publicacion], [id_etiqueta]) VALUES (12, 4)
INSERT [dbo].[PublicacionXetiqueta] ([id_publicacion], [id_etiqueta]) VALUES (13, 2)
INSERT [dbo].[PublicacionXetiqueta] ([id_publicacion], [id_etiqueta]) VALUES (14, 5)
INSERT [dbo].[PublicacionXetiqueta] ([id_publicacion], [id_etiqueta]) VALUES (15, 1)
INSERT [dbo].[PublicacionXetiqueta] ([id_publicacion], [id_etiqueta]) VALUES (16, 3)
INSERT [dbo].[PublicacionXetiqueta] ([id_publicacion], [id_etiqueta]) VALUES (17, 2)
INSERT [dbo].[PublicacionXetiqueta] ([id_publicacion], [id_etiqueta]) VALUES (18, 4)
INSERT [dbo].[PublicacionXetiqueta] ([id_publicacion], [id_etiqueta]) VALUES (19, 5)
INSERT [dbo].[PublicacionXetiqueta] ([id_publicacion], [id_etiqueta]) VALUES (20, 1)
INSERT [dbo].[PublicacionXetiqueta] ([id_publicacion], [id_etiqueta]) VALUES (21, 3)
GO
SET IDENTITY_INSERT [dbo].[Review] ON 

INSERT [dbo].[Review] ([id], [id_publicacion], [usuario_escritor], [usuario_recibidor], [estrellas], [descripcion]) VALUES (1, 1, 1, 2, 5, N'El libro llegó en perfecto estado.')
INSERT [dbo].[Review] ([id], [id_publicacion], [usuario_escritor], [usuario_recibidor], [estrellas], [descripcion]) VALUES (2, 2, 2, 1, 4, N'Buena organización, solo un poco de retraso.')
INSERT [dbo].[Review] ([id], [id_publicacion], [usuario_escritor], [usuario_recibidor], [estrellas], [descripcion]) VALUES (3, 3, 3, 4, 3, N'El libro llegó algo dañado, pero legible.')
INSERT [dbo].[Review] ([id], [id_publicacion], [usuario_escritor], [usuario_recibidor], [estrellas], [descripcion]) VALUES (4, 4, 4, 5, 5, N'Excelente estado, entrega rápida.')
INSERT [dbo].[Review] ([id], [id_publicacion], [usuario_escritor], [usuario_recibidor], [estrellas], [descripcion]) VALUES (5, 5, 1, 3, 2, N'Desorganización en la entrega, el libro estaba sucio.')
SET IDENTITY_INSERT [dbo].[Review] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([id], [nombre], [apellido], [nombre_usuario], [contraseña], [gmail], [fecha_nacimiento], [nombre_escuela], [año_escolar]) VALUES (1, N'Ian', N'Segade', N'ianse', N'pass1', N'user1@gmail.com', CAST(N'1990-01-01' AS Date), N'ORT', 4)
INSERT [dbo].[Usuario] ([id], [nombre], [apellido], [nombre_usuario], [contraseña], [gmail], [fecha_nacimiento], [nombre_escuela], [año_escolar]) VALUES (2, N'Lucas', N'Dagostino', N'lukitass', N'pass2', N'user2@gmail.com', CAST(N'1991-02-02' AS Date), N'ORT', 4)
INSERT [dbo].[Usuario] ([id], [nombre], [apellido], [nombre_usuario], [contraseña], [gmail], [fecha_nacimiento], [nombre_escuela], [año_escolar]) VALUES (3, N'Leticia', N'Passer', N'lechu_pass', N'pass3', N'user3@gmail.com', CAST(N'1992-03-03' AS Date), N'ORT', 4)
INSERT [dbo].[Usuario] ([id], [nombre], [apellido], [nombre_usuario], [contraseña], [gmail], [fecha_nacimiento], [nombre_escuela], [año_escolar]) VALUES (4, N'Michelle', N'Garber', N'michelin', N'pass4', N'user4@gmail.com', CAST(N'1993-04-04' AS Date), N'ORT', 4)
INSERT [dbo].[Usuario] ([id], [nombre], [apellido], [nombre_usuario], [contraseña], [gmail], [fecha_nacimiento], [nombre_escuela], [año_escolar]) VALUES (5, N'Tomas', N'Cabral Rios', N'cabrooo', N'pass5', N'user5@gmail.com', CAST(N'1994-05-05' AS Date), N'ORT', 4)
INSERT [dbo].[Usuario] ([id], [nombre], [apellido], [nombre_usuario], [contraseña], [gmail], [fecha_nacimiento], [nombre_escuela], [año_escolar]) VALUES (6, N'Juan', N'Pérez', N'juan123', N'MiContraseña123', N'juan@gmail.com', CAST(N'2009-01-01' AS Date), N'ORT', 12)
INSERT [dbo].[Usuario] ([id], [nombre], [apellido], [nombre_usuario], [contraseña], [gmail], [fecha_nacimiento], [nombre_escuela], [año_escolar]) VALUES (7, N'sw', N'wsw', N'swsw', N'sw', N'wswd@gmail.com', CAST(N'2013-04-09' AS Date), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__etiqueta__72AFBCC63A152E46]    Script Date: 28/4/2025 14:32:24 ******/
ALTER TABLE [dbo].[Etiqueta] ADD  CONSTRAINT [UQ__etiqueta__72AFBCC63A152E46] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__usuarios__493D0C0A08091FC8]    Script Date: 28/4/2025 14:32:24 ******/
ALTER TABLE [dbo].[Usuario] ADD  CONSTRAINT [UQ__usuarios__493D0C0A08091FC8] UNIQUE NONCLUSTERED 
(
	[gmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__usuarios__D4D22D748EF2A315]    Script Date: 28/4/2025 14:32:24 ******/
ALTER TABLE [dbo].[Usuario] ADD  CONSTRAINT [UQ__usuarios__D4D22D748EF2A315] UNIQUE NONCLUSTERED 
(
	[nombre_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Carrito]  WITH CHECK ADD  CONSTRAINT [FK_Carrito_Publicacion] FOREIGN KEY([id_publicacion])
REFERENCES [dbo].[Publicacion] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Carrito] CHECK CONSTRAINT [FK_Carrito_Publicacion]
GO
ALTER TABLE [dbo].[Carrito]  WITH CHECK ADD  CONSTRAINT [FK_Carrito_Usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuario] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Carrito] CHECK CONSTRAINT [FK_Carrito_Usuario]
GO
ALTER TABLE [dbo].[Favorito]  WITH CHECK ADD  CONSTRAINT [FK_favoritos_publicacion] FOREIGN KEY([id_publicacion])
REFERENCES [dbo].[Publicacion] ([id])
GO
ALTER TABLE [dbo].[Favorito] CHECK CONSTRAINT [FK_favoritos_publicacion]
GO
ALTER TABLE [dbo].[Favorito]  WITH CHECK ADD  CONSTRAINT [FK_favoritos_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[Favorito] CHECK CONSTRAINT [FK_favoritos_usuario]
GO
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK__libros__autor_id__3D5E1FD2] FOREIGN KEY([id_autor])
REFERENCES [dbo].[Autor] ([id])
GO
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [FK__libros__autor_id__3D5E1FD2]
GO
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK__libros__editoria__3E52440B] FOREIGN KEY([id_editorial])
REFERENCES [dbo].[Editorial] ([id])
GO
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [FK__libros__editoria__3E52440B]
GO
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK_Libro_Materia1] FOREIGN KEY([id_materia])
REFERENCES [dbo].[Materia] ([id])
GO
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [FK_Libro_Materia1]
GO
ALTER TABLE [dbo].[Publicacion]  WITH CHECK ADD  CONSTRAINT [FK__publicaci__libro__46E78A0C] FOREIGN KEY([id_libro])
REFERENCES [dbo].[Libro] ([id])
GO
ALTER TABLE [dbo].[Publicacion] CHECK CONSTRAINT [FK__publicaci__libro__46E78A0C]
GO
ALTER TABLE [dbo].[Publicacion]  WITH CHECK ADD  CONSTRAINT [FK_publicaciones_usuarios] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[Publicacion] CHECK CONSTRAINT [FK_publicaciones_usuarios]
GO
ALTER TABLE [dbo].[PublicacionXetiqueta]  WITH CHECK ADD  CONSTRAINT [FK__publicaci__etiqu__4E88ABD4] FOREIGN KEY([id_etiqueta])
REFERENCES [dbo].[Etiqueta] ([id])
GO
ALTER TABLE [dbo].[PublicacionXetiqueta] CHECK CONSTRAINT [FK__publicaci__etiqu__4E88ABD4]
GO
ALTER TABLE [dbo].[PublicacionXetiqueta]  WITH CHECK ADD  CONSTRAINT [FK__publicaci__publi__4D94879B] FOREIGN KEY([id_publicacion])
REFERENCES [dbo].[Publicacion] ([id])
GO
ALTER TABLE [dbo].[PublicacionXetiqueta] CHECK CONSTRAINT [FK__publicaci__publi__4D94879B]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_reviews_publicacion] FOREIGN KEY([id_publicacion])
REFERENCES [dbo].[Publicacion] ([id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_reviews_publicacion]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_reviews_usuario_escritor] FOREIGN KEY([usuario_escritor])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_reviews_usuario_escritor]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_reviews_usuario_recibidor] FOREIGN KEY([usuario_recibidor])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_reviews_usuario_recibidor]
GO
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [CK__libros__año__4E88ABD4] CHECK  (([año]>=(0)))
GO
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [CK__libros__año__4E88ABD4]
GO
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [CK__libros__año__571DF1D5] CHECK  (([año]>=(0)))
GO
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [CK__libros__año__571DF1D5]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD CHECK  (([estrellas]>=(1) AND [estrellas]<=(5)))
GO
/****** Object:  StoredProcedure [dbo].[AgregarPublicacion]    Script Date: 28/4/2025 14:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AgregarPublicacion]
    @LibroID INT,
    @Precio DECIMAL(10, 2),
    @UsuarioID INT,       
    @Fecha DATE           
AS
BEGIN

    INSERT INTO Publicacion (id_libro, precio, id_usuario, fecha)
    VALUES (@LibroID, @Precio, @UsuarioID, @Fecha);

END;
GO
/****** Object:  StoredProcedure [dbo].[AgregarPublicacionFavoritos]    Script Date: 28/4/2025 14:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AgregarPublicacionFavoritos]
    @UsuarioID INT,
    @PublicacionID INT
AS
BEGIN
    INSERT INTO Favorito (id_usuario, id_publicacion)
    VALUES (@UsuarioID, @PublicacionID);
END;
GO
/****** Object:  StoredProcedure [dbo].[EliminarPublicacion]    Script Date: 28/4/2025 14:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EliminarPublicacion]
    @PublicacionID INT
AS
BEGIN
    
    DELETE FROM PublicacionXetiqueta
    WHERE id_publicacion = @PublicacionID;
    
    
    DELETE FROM Favorito
    WHERE id_publicacion = @PublicacionID;

    
    DELETE FROM Review
    WHERE id_publicacion = @PublicacionID;

    
    DELETE FROM Publicacion
    WHERE id = @PublicacionID;
END;
GO
/****** Object:  StoredProcedure [dbo].[EliminarPublicacionFavoritos]    Script Date: 28/4/2025 14:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EliminarPublicacionFavoritos]
    @UsuarioID INT,
    @PublicacionID INT
AS
BEGIN
    
    DELETE FROM Favorito
    WHERE id_usuario = @UsuarioID AND id_publicacion = @PublicacionID;
END;
GO
/****** Object:  StoredProcedure [dbo].[EliminarUsuario]    Script Date: 28/4/2025 14:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EliminarUsuario]
    @UsuarioID INT
AS
BEGIN
    
    DELETE FROM Favorito
    WHERE id_usuario = @UsuarioID;
	    DELETE FROM publicaciones
    WHERE id_usuario = @UsuarioID;
    
    
    DELETE FROM Review
    WHERE usuario_escritor = @UsuarioID;
    
    
    DELETE FROM Review
    WHERE usuario_recibidor = @UsuarioID;
    
    
    DELETE FROM Usuario
    WHERE id = @UsuarioID;
END;

GO
/****** Object:  StoredProcedure [dbo].[FiltrarLibros]    Script Date: 28/4/2025 14:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[FiltrarLibros](
    @MateriaId INT = NULL,
    @Anio INT = NULL,
    @PrecioMin DECIMAL(18, 2) = NULL,
    @PrecioMax DECIMAL(18, 2) = NULL,
    @EtiquetaId INT = NULL
)
AS
BEGIN
    SELECT p.id AS PublicacionId, p.id_libro, p.precio, p.fecha, p.imagen
    FROM Publicacion p
    INNER JOIN Libro l ON l.id = p.id_libro
    INNER JOIN Editorial e ON l.id_editorial = e.id
    INNER JOIN Autor a ON l.id_autor = a.id
    LEFT JOIN Materia m ON l.id_materia = m.id
    LEFT JOIN PublicacionXetiqueta pe ON p.id = pe.id_publicacion
    LEFT JOIN Etiqueta et ON pe.id_etiqueta = et.id
    WHERE 
        (@MateriaId IS NULL OR @MateriaId = 0 OR m.id = @MateriaId)
        AND (@Anio IS NULL OR @Anio = 0 OR l.año = @Anio)
        AND (@PrecioMin IS NULL OR @PrecioMin = 0 OR p.precio >= @PrecioMin)
        AND (@PrecioMax IS NULL OR @PrecioMax = 0 OR p.precio <= @PrecioMax)
        AND (@EtiquetaId IS NULL OR @EtiquetaId = 0 OR et.id = @EtiquetaId)
    ORDER BY p.fecha DESC;
END;
GO
/****** Object:  StoredProcedure [dbo].[FiltrarPublicacionesPorNombreLibro]    Script Date: 28/4/2025 14:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FiltrarPublicacionesPorNombreLibro]
    @BusquedaTexto NVARCHAR(255) = NULL  -- Parámetro de búsqueda por nombre del libro, por defecto NULL
AS
BEGIN
    SELECT p.id AS PublicacionId, 
           p.id_libro, 
           p.precio, 
           p.fecha, 
           p.imagen
    FROM Publicacion p
    INNER JOIN Libro l ON l.id = p.id_libro
    INNER JOIN Editorial e ON l.id_editorial = e.id
    INNER JOIN Autor a ON l.id_autor = a.id
    LEFT JOIN Materia m ON l.id_materia = m.id
    LEFT JOIN PublicacionXetiqueta pe ON p.id = pe.id_publicacion
    LEFT JOIN Etiqueta et ON pe.id_etiqueta = et.id
    WHERE 
        (
            @BusquedaTexto IS NULL OR @BusquedaTexto = ''  -- Si el parámetro es NULL o vacío, no filtra por nombre
            OR l.nombre LIKE '%' + @BusquedaTexto + '%'  -- Si el parámetro tiene valor, filtra por nombre
        )
    ORDER BY p.fecha DESC;  -- Ordena las publicaciones por fecha en orden descendente
END;
GO
/****** Object:  StoredProcedure [dbo].[IniciarSesion]    Script Date: 28/4/2025 14:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IniciarSesion]
(
    @Identificador NVARCHAR(255), -- Puede ser nombre_usuario o gmail
    @Contrasena NVARCHAR(255)    -- Contraseña en texto plano
)
AS
BEGIN
    -- Buscar al usuario que coincida con el identificador (nombre_usuario o gmail) y la contraseña
    SELECT id, nombre, apellido, nombre_usuario, gmail, año_escolar
    FROM Usuario
    WHERE 
        (nombre_usuario = @Identificador OR gmail = @Identificador)
        AND contraseña = @Contrasena; -- Comparar directamente la contraseña
END;
GO
/****** Object:  StoredProcedure [dbo].[ListarLibros]    Script Date: 28/4/2025 14:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListarLibros]
AS
BEGIN
    SELECT 
        id,
        nombre,
        descripcion,
        año,
        id_autor,
        id_editorial,
        id_materia
    FROM Libro;
END;
GO
/****** Object:  StoredProcedure [dbo].[LoginUsuario]    Script Date: 28/4/2025 14:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoginUsuario]
(
    @Identificador NVARCHAR(255), -- Puede ser nombre_usuario o gmail
    @Contrasena NVARCHAR(255)    -- Contraseña en texto plano
)
AS
BEGIN
    -- Buscar al usuario que coincida con el identificador (nombre_usuario o gmail) y la contraseña
    SELECT id, nombre, apellido, nombre_usuario, gmail, año_escolar
    FROM Usuario
    WHERE 
        (nombre_usuario = @Identificador OR gmail = @Identificador)
        AND contraseña = HASHBYTES('SHA2_256', @Contrasena); -- Comparar la contraseña encriptada
END;
GO
/****** Object:  StoredProcedure [dbo].[ModificarDatosUsuario]    Script Date: 28/4/2025 14:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ModificarDatosUsuario]
    @UsuarioID INT,
    @NuevoNombreUsuario NVARCHAR(100),
    @NuevaContraseña NVARCHAR(100),
    @NuevoGmail NVARCHAR(255),
    @NuevaFechaNacimiento DATE = NULL
AS
BEGIN
    UPDATE Usuario
    SET 
        nombre_usuario = @NuevoNombreUsuario,
        contraseña = @NuevaContraseña,
        gmail = @NuevoGmail,
        fecha_nacimiento = @NuevaFechaNacimiento
    WHERE id = @UsuarioID;
END;
GO
/****** Object:  StoredProcedure [dbo].[ModificarPublicacion]    Script Date: 28/4/2025 14:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ModificarPublicacion]
    @PublicacionID INT,
    @NuevoLibro INT,
    @NuevoPrecio DECIMAL(10, 2),
    @NuevoUsuario INT,
    @NuevaFecha DATE
AS
BEGIN
    UPDATE Publicacion
    SET 
        id_libro = @NuevoLibro,
        precio = @NuevoPrecio,
        id_usuario = @NuevoUsuario,
        fecha = @NuevaFecha
    WHERE id = @PublicacionID;
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtenerEtiquetas]    Script Date: 28/4/2025 14:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerEtiquetas]
AS
BEGIN
    SELECT 
        id, 
        nombre
    FROM 
        Etiqueta;
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtenerMaterias]    Script Date: 28/4/2025 14:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerMaterias]
AS
BEGIN
    SELECT 
        id, 
        nombre
    FROM 
        Materia;
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtenerNombreLibroPorPublicacionID]    Script Date: 28/4/2025 14:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerNombreLibroPorPublicacionID]
    @PublicacionID INT
AS
BEGIN
    SELECT l.nombre 
    FROM Publicacion p
    JOIN Libro l ON p.id_libro = l.id
    WHERE p.id = @PublicacionID;
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtenerPublicacionesPorId]    Script Date: 28/4/2025 14:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerPublicacionesPorId] (
    @id_publicacion INT
)
AS
BEGIN
    SELECT 
        p.id,
        p.id_libro,
        p.precio,
        p.id_usuario,
        p.fecha,
        p.imagen
    FROM 
        Publicacion p
    WHERE 
        p.id = @id_publicacion;
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtenerPublicacionesPorUsuario]    Script Date: 28/4/2025 14:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerPublicacionesPorUsuario]
    @id_usuario INT
AS
BEGIN
    SELECT 
        p.id AS id_publicacion,
        p.id_libro,
        p.precio,
        p.fecha,
        p.imagen
    FROM 
        Publicacion p
    WHERE 
        p.id_usuario = @id_usuario;
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerReviewsPorUsuario]    Script Date: 28/4/2025 14:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerReviewsPorUsuario]
    @id_usuario int
AS
BEGIN
    SELECT 
        id,
        id_publicacion,
        usuario_escritor,
        usuario_recibidor,
        estrellas,
        descripcion
    FROM 
        Review
    WHERE 
        usuario_recibidor = @id_usuario
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerUsuarioPorId]    Script Date: 28/4/2025 14:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerUsuarioPorId]
    @IdUsuario INT
AS
BEGIN
    -- Seleccionar los datos del usuario por Id
    SELECT 
        id,
        nombre,
        apellido,
        nombre_usuario,
        contraseña,
        gmail,
        fecha_nacimiento,
        nombre_escuela,
        año_escolar
    FROM Usuario
    WHERE Id = @IdUsuario;
END;
GO
/****** Object:  StoredProcedure [dbo].[Registrar]    Script Date: 28/4/2025 14:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Registrar](
    @Nombre NVARCHAR(255),
    @Apellido NVARCHAR(255),
    @NombreUsuario NVARCHAR(255),
    @Contrasena NVARCHAR(255),
    @Gmail NVARCHAR(255),
    @FechaNacimiento DATE
)
AS
BEGIN
    -- Verificar si ya existe un usuario con el mismo nombre_usuario o gmail
    IF EXISTS (
        SELECT 1 
        FROM Usuario 
        WHERE nombre_usuario = @NombreUsuario OR gmail = @Gmail
    )
    BEGIN
        -- Retornar un mensaje de error si el usuario ya existe
        RAISERROR ('El nombre de usuario o correo electrónico ya está en uso.', 16, 1);
        RETURN;
    END

    -- Insertar el nuevo usuario
    INSERT INTO Usuario (nombre, apellido, nombre_usuario, contraseña, gmail, fecha_nacimiento)
    VALUES (@Nombre, @Apellido, @NombreUsuario, @Contrasena, @Gmail, @FechaNacimiento);
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_ListarFAvoritos]    Script Date: 28/4/2025 14:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ListarFAvoritos] @idUsuario INT
AS
BEGIN
	SELECT * FROM Favorito WHERE id_usuario = @idUsuario;
END
GO
/****** Object:  StoredProcedure [dbo].[VerificarFavorito]    Script Date: 28/4/2025 14:32:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VerificarFavorito]
    @id_usuario INT,
    @id_publicacion INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Favorito WHERE id_usuario = @id_usuario AND id_publicacion = @id_publicacion)
    BEGIN
        SELECT CAST(1 AS BIT) AS EstaEnFavoritos;
    END
    ELSE
    BEGIN
        SELECT CAST(0 AS BIT) AS EstaEnFavoritos;
    END
END
GO
USE [master]
GO
ALTER DATABASE [TP_REBOOKING] SET  READ_WRITE 
GO
