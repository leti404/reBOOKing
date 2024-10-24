USE [master]
GO
/****** Object:  Database [TP_REBOOKING]    Script Date: 23/10/2024 08:56:37 ******/
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
/****** Object:  User [alumno]    Script Date: 23/10/2024 08:56:37 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[favoritos]    Script Date: 23/10/2024 08:56:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[favoritos](
	[usuario_id] [int] NOT NULL,
	[publicacion_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[usuario_id] ASC,
	[publicacion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[libros]    Script Date: 23/10/2024 08:56:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[libros](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[materia] [varchar](255) NOT NULL,
	[descripcion] [text] NULL,
	[año] [int] NULL,
	[autor_id] [int] NULL,
	[editorial_id] [int] NULL,
	[categoria_id] [int] NULL,
 CONSTRAINT [PK__libros__3213E83FBEDA1B22] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 23/10/2024 08:56:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre_usuario] [varchar](255) NOT NULL,
	[contraseña] [varchar](255) NOT NULL,
	[gmail] [varchar](255) NOT NULL,
	[fecha_nacimiento] [date] NULL,
	[publicaciones] [int] NULL,
 CONSTRAINT [PK__usuarios__3213E83FD43C3002] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[publicaciones]    Script Date: 23/10/2024 08:56:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[publicaciones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[libro] [int] NOT NULL,
	[precio] [decimal](10, 2) NOT NULL,
	[usuario] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[imagen] [varchar](200) NULL,
 CONSTRAINT [PK__publicac__3213E83FE22AE627] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VerTodosLosFavoritos]    Script Date: 23/10/2024 08:56:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VerTodosLosFavoritos] AS
SELECT 
    usuarios.id AS UsuarioID,
    publicaciones.id AS PublicacionID,
	usuarios.nombre_usuario, libros.nombre
FROM Favoritos
JOIN usuarios ON favoritos.usuario_id = usuarios.id
JOIN publicaciones ON favoritos.publicacion_id = publicaciones.id
JOIN libros ON publicaciones.libro = libros.id;
GO
/****** Object:  Table [dbo].[reviews]    Script Date: 23/10/2024 08:56:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reviews](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[publicacion_id] [int] NOT NULL,
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
/****** Object:  View [dbo].[VerTodasLasReviews]    Script Date: 23/10/2024 08:56:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VerTodasLasReviews] AS
SELECT r.id AS ReviewID, p.id AS PublicacionID, p.libro, r.descripcion, r.estrellas, u.nombre_usuario, libros.nombre
FROM reviews r
JOIN publicaciones p ON r.publicacion_id = p.id
JOIN usuarios u ON r.usuario_escritor = u.id
JOIN libros libros ON p.libro = libros.id;
GO
/****** Object:  View [dbo].[VerPublicacionesDeUsuario]    Script Date: 23/10/2024 08:56:37 ******/
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
FROM publicaciones p
JOIN usuarios u ON p.usuario = u.id
JOIN libros l ON p.libro = l.id;
GO
/****** Object:  View [dbo].[TraerTodasPublicaciones]    Script Date: 23/10/2024 08:56:37 ******/
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
FROM publicaciones p
JOIN usuarios u ON p.usuario = u.id 
JOIN libros l ON p.libro = l.id; 
GO
/****** Object:  View [dbo].[TraerTodosLosDatosDeUsuario]    Script Date: 23/10/2024 08:56:37 ******/
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
FROM usuarios u
LEFT JOIN publicaciones p ON u.id = p.usuario
LEFT JOIN libros l ON p.libro = l.id;
GO
/****** Object:  Table [dbo].[autores]    Script Date: 23/10/2024 08:56:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[autores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
 CONSTRAINT [PK__autores__3213E83F0FB56947] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categorias]    Script Date: 23/10/2024 08:56:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categorias](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
 CONSTRAINT [PK__categori__3213E83F75758F86] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[editoriales]    Script Date: 23/10/2024 08:56:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[editoriales](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
 CONSTRAINT [PK__editoria__3213E83F8720F3DC] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[etiquetas]    Script Date: 23/10/2024 08:56:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[etiquetas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
 CONSTRAINT [PK__etiqueta__3213E83F119A57A7] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[publicaciones_etiquetas]    Script Date: 23/10/2024 08:56:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[publicaciones_etiquetas](
	[publicacion_id] [int] NOT NULL,
	[etiqueta_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[publicacion_id] ASC,
	[etiqueta_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[autores] ON 

INSERT [dbo].[autores] ([id], [nombre]) VALUES (1, N'David Grossman')
INSERT [dbo].[autores] ([id], [nombre]) VALUES (2, N'Sholem Aleichem')
INSERT [dbo].[autores] ([id], [nombre]) VALUES (3, N'Jack London')
INSERT [dbo].[autores] ([id], [nombre]) VALUES (4, N'Ray Bradbury')
INSERT [dbo].[autores] ([id], [nombre]) VALUES (5, N'J.D. Salinger')
INSERT [dbo].[autores] ([id], [nombre]) VALUES (6, N'Art Spiegelman')
INSERT [dbo].[autores] ([id], [nombre]) VALUES (7, N'Rafael Fischer')
INSERT [dbo].[autores] ([id], [nombre]) VALUES (8, N'Mariano Mores')
SET IDENTITY_INSERT [dbo].[autores] OFF
GO
SET IDENTITY_INSERT [dbo].[categorias] ON 

INSERT [dbo].[categorias] ([id], [nombre]) VALUES (1, N'Historia')
INSERT [dbo].[categorias] ([id], [nombre]) VALUES (2, N'Literatura')
INSERT [dbo].[categorias] ([id], [nombre]) VALUES (3, N'Lengua')
INSERT [dbo].[categorias] ([id], [nombre]) VALUES (4, N'Ciencias Sociales')
INSERT [dbo].[categorias] ([id], [nombre]) VALUES (5, N'Ficción')
INSERT [dbo].[categorias] ([id], [nombre]) VALUES (6, N'Cómic')
SET IDENTITY_INSERT [dbo].[categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[editoriales] ON 

INSERT [dbo].[editoriales] ([id], [nombre]) VALUES (1, N'Editorial Sudamericana')
INSERT [dbo].[editoriales] ([id], [nombre]) VALUES (2, N'Ediciones B')
INSERT [dbo].[editoriales] ([id], [nombre]) VALUES (3, N'Penguin Random House')
INSERT [dbo].[editoriales] ([id], [nombre]) VALUES (4, N'Anagrama')
INSERT [dbo].[editoriales] ([id], [nombre]) VALUES (5, N'Alianza Editorial')
SET IDENTITY_INSERT [dbo].[editoriales] OFF
GO
SET IDENTITY_INSERT [dbo].[etiquetas] ON 

INSERT [dbo].[etiquetas] ([id], [nombre]) VALUES (5, N'Aventura')
INSERT [dbo].[etiquetas] ([id], [nombre]) VALUES (4, N'Ficción')
INSERT [dbo].[etiquetas] ([id], [nombre]) VALUES (1, N'Historia Judía')
INSERT [dbo].[etiquetas] ([id], [nombre]) VALUES (3, N'Lengua Hebrea')
INSERT [dbo].[etiquetas] ([id], [nombre]) VALUES (2, N'Literatura Clásica')
SET IDENTITY_INSERT [dbo].[etiquetas] OFF
GO
INSERT [dbo].[favoritos] ([usuario_id], [publicacion_id]) VALUES (1, 1)
INSERT [dbo].[favoritos] ([usuario_id], [publicacion_id]) VALUES (1, 3)
INSERT [dbo].[favoritos] ([usuario_id], [publicacion_id]) VALUES (2, 2)
INSERT [dbo].[favoritos] ([usuario_id], [publicacion_id]) VALUES (2, 4)
INSERT [dbo].[favoritos] ([usuario_id], [publicacion_id]) VALUES (3, 1)
INSERT [dbo].[favoritos] ([usuario_id], [publicacion_id]) VALUES (4, 5)
INSERT [dbo].[favoritos] ([usuario_id], [publicacion_id]) VALUES (5, 2)
GO
SET IDENTITY_INSERT [dbo].[libros] ON 

INSERT [dbo].[libros] ([id], [nombre], [materia], [descripcion], [año], [autor_id], [editorial_id], [categoria_id]) VALUES (1, N'Historia del pueblo de Israel II', N'Historia', N'Un análisis sobre la historia del pueblo judío.', 2000, 1, 1, 1)
INSERT [dbo].[libros] ([id], [nombre], [materia], [descripcion], [año], [autor_id], [editorial_id], [categoria_id]) VALUES (2, N'Fuentes del judaísmo II', N'Historia', N'Exploración de las fuentes del judaísmo.', 2005, 1, 1, 1)
INSERT [dbo].[libros] ([id], [nombre], [materia], [descripcion], [año], [autor_id], [editorial_id], [categoria_id]) VALUES (3, N'Ivrit Baderej-Alef', N'Lengua', N'Un manual de hebreo para principiantes.', 2010, 2, 2, 3)
INSERT [dbo].[libros] ([id], [nombre], [materia], [descripcion], [año], [autor_id], [editorial_id], [categoria_id]) VALUES (4, N'Avanza: Ambientes y población del mundo', N'Geografía', N'Estudio sobre la demografía y geografía mundial.', 2015, 3, 3, 4)
INSERT [dbo].[libros] ([id], [nombre], [materia], [descripcion], [año], [autor_id], [editorial_id], [categoria_id]) VALUES (5, N'La llamada de lo salvaje', N'Literatura', N'Novela sobre la lucha por la supervivencia.', 1903, 4, 4, 2)
INSERT [dbo].[libros] ([id], [nombre], [materia], [descripcion], [año], [autor_id], [editorial_id], [categoria_id]) VALUES (6, N'Tres portugueses bajo un paraguas (sin contar al muerto)', N'Literatura', N'Una novela sobre la vida de tres amigos.', 1992, 4, 4, 2)
INSERT [dbo].[libros] ([id], [nombre], [materia], [descripcion], [año], [autor_id], [editorial_id], [categoria_id]) VALUES (7, N'En defensa propia', N'Literatura', N'Una novela de suspenso y acción.', 2012, 5, 5, 2)
INSERT [dbo].[libros] ([id], [nombre], [materia], [descripcion], [año], [autor_id], [editorial_id], [categoria_id]) VALUES (8, N'Ivrit Baderej-Gimel', N'Lengua', N'Continuación del manual de hebreo.', 2014, 2, 2, 3)
INSERT [dbo].[libros] ([id], [nombre], [materia], [descripcion], [año], [autor_id], [editorial_id], [categoria_id]) VALUES (9, N'Ivrit Baderej-Bet', N'Lengua', N'Continuación del manual de hebreo.', 2013, 2, 2, 3)
INSERT [dbo].[libros] ([id], [nombre], [materia], [descripcion], [año], [autor_id], [editorial_id], [categoria_id]) VALUES (10, N'Historia del pueblo de Israel III', N'Historia', N'Un análisis más profundo sobre la historia judía.', 2012, 1, 1, 1)
INSERT [dbo].[libros] ([id], [nombre], [materia], [descripcion], [año], [autor_id], [editorial_id], [categoria_id]) VALUES (11, N'El extraño caso del Dr. Jekyll y Mr. Hyde', N'Literatura', N'Una novela sobre la dualidad de la naturaleza humana.', 1886, 4, 4, 2)
INSERT [dbo].[libros] ([id], [nombre], [materia], [descripcion], [año], [autor_id], [editorial_id], [categoria_id]) VALUES (12, N'Fahrenheit 451', N'Literatura', N'Un futuro distópico donde los libros son prohibidos.', 1953, 5, 5, 2)
INSERT [dbo].[libros] ([id], [nombre], [materia], [descripcion], [año], [autor_id], [editorial_id], [categoria_id]) VALUES (13, N'Cuadernillo de apuntes teóricos de lengua y literatura 2do', N'Literatura', N'Apuntes sobre teoría literaria.', 2020, 1, 1, 2)
INSERT [dbo].[libros] ([id], [nombre], [materia], [descripcion], [año], [autor_id], [editorial_id], [categoria_id]) VALUES (14, N'El caballero de la armadura oxidada', N'Literatura', N'Una fábula sobre la búsqueda del ser interior.', 1994, 3, 3, 2)
INSERT [dbo].[libros] ([id], [nombre], [materia], [descripcion], [año], [autor_id], [editorial_id], [categoria_id]) VALUES (15, N'Toldot III', N'Historia', N'Estudio sobre las generaciones del pueblo judío.', 2008, 1, 1, 1)
INSERT [dbo].[libros] ([id], [nombre], [materia], [descripcion], [año], [autor_id], [editorial_id], [categoria_id]) VALUES (16, N'Un guardián entre el centeno', N'Literatura', N'La historia de un joven en Nueva York.', 1951, 4, 4, 2)
INSERT [dbo].[libros] ([id], [nombre], [materia], [descripcion], [año], [autor_id], [editorial_id], [categoria_id]) VALUES (17, N'Maus', N'Literatura', N'Una representación gráfica de la experiencia del Holocausto.', 1986, 4, 4, 2)
INSERT [dbo].[libros] ([id], [nombre], [materia], [descripcion], [año], [autor_id], [editorial_id], [categoria_id]) VALUES (18, N'Un hombre sin suerte', N'Literatura', N'Una novela sobre la fatalidad de la vida.', 2010, 2, 2, 2)
INSERT [dbo].[libros] ([id], [nombre], [materia], [descripcion], [año], [autor_id], [editorial_id], [categoria_id]) VALUES (19, N'El juguete', N'Literatura', N'Una historia que explora la infancia.', 2009, 5, 5, 2)
INSERT [dbo].[libros] ([id], [nombre], [materia], [descripcion], [año], [autor_id], [editorial_id], [categoria_id]) VALUES (20, N'Aguas fuertes porteñas', N'Literatura', N'Una obra que refleja la vida en Buenos Aires.', 2001, 3, 3, 2)
INSERT [dbo].[libros] ([id], [nombre], [materia], [descripcion], [año], [autor_id], [editorial_id], [categoria_id]) VALUES (21, N'Toldot IV', N'Historia', N'Continuación del estudio de las generaciones judías.', 2009, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[libros] OFF
GO
SET IDENTITY_INSERT [dbo].[publicaciones] ON 

INSERT [dbo].[publicaciones] ([id], [libro], [precio], [usuario], [fecha], [imagen]) VALUES (1, 1, CAST(200.00 AS Decimal(10, 2)), 1, CAST(N'2000-01-15' AS Date), N'https://lh6.googleusercontent.com/proxy/WE8ty6bhHjkVfbhodHNtlozS3HiEarnKOAmeswYHW2jYVLKyqhGv65kcyNuXO8l96dsSgOr5Rl13sLBZ26bwUwh8AgSYca_FAyGNHORfffJo')
INSERT [dbo].[publicaciones] ([id], [libro], [precio], [usuario], [fecha], [imagen]) VALUES (2, 2, CAST(250.00 AS Decimal(10, 2)), 2, CAST(N'2005-02-20' AS Date), N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRibTbICAVgpjuG4qeRuywDlFu3YzdM9rr6Jg&s')
INSERT [dbo].[publicaciones] ([id], [libro], [precio], [usuario], [fecha], [imagen]) VALUES (3, 3, CAST(150.00 AS Decimal(10, 2)), 3, CAST(N'2010-03-25' AS Date), N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzqcfFkqii7-0_Mp8n-h6NGedn3xD9d1OF3A&s')
INSERT [dbo].[publicaciones] ([id], [libro], [precio], [usuario], [fecha], [imagen]) VALUES (4, 4, CAST(180.00 AS Decimal(10, 2)), 4, CAST(N'2015-04-30' AS Date), N'https://contentv2.tap-commerce.com//cover/large/9789501325843_1.jpg?id_com=717')
INSERT [dbo].[publicaciones] ([id], [libro], [precio], [usuario], [fecha], [imagen]) VALUES (5, 5, CAST(300.00 AS Decimal(10, 2)), 5, CAST(N'1903-05-10' AS Date), N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2B5FXhZLfeO0S-pGO47TyWKN5INspE_D55Q&s')
INSERT [dbo].[publicaciones] ([id], [libro], [precio], [usuario], [fecha], [imagen]) VALUES (6, 6, CAST(220.00 AS Decimal(10, 2)), 1, CAST(N'1992-06-15' AS Date), N'https://acdn.mitiendanube.com/stores/002/119/730/products/diseno-sin-titulo-231-b57c67d7e552941d8d16809066563634-1024-1024.jpg')
INSERT [dbo].[publicaciones] ([id], [libro], [precio], [usuario], [fecha], [imagen]) VALUES (7, 7, CAST(270.00 AS Decimal(10, 2)), 2, CAST(N'2012-07-20' AS Date), N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvurSV8qW6Z555cLBgTrbvy1YrsUOFFr9xlw&s')
INSERT [dbo].[publicaciones] ([id], [libro], [precio], [usuario], [fecha], [imagen]) VALUES (8, 8, CAST(130.00 AS Decimal(10, 2)), 3, CAST(N'2014-08-25' AS Date), N'https://kehot.com.ar/Image/0/450_450-majzor-kipur-sucat-david.jpg')
INSERT [dbo].[publicaciones] ([id], [libro], [precio], [usuario], [fecha], [imagen]) VALUES (9, 9, CAST(160.00 AS Decimal(10, 2)), 4, CAST(N'2013-09-30' AS Date), N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRx6XuudMs743NTkjwNvpQsoiDyRblUjFmuIw&s')
INSERT [dbo].[publicaciones] ([id], [libro], [precio], [usuario], [fecha], [imagen]) VALUES (10, 10, CAST(190.00 AS Decimal(10, 2)), 5, CAST(N'2012-10-05' AS Date), N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxNGljX70KecKdRWqymru2CN86MzQwSBc7Mw&s')
INSERT [dbo].[publicaciones] ([id], [libro], [precio], [usuario], [fecha], [imagen]) VALUES (11, 11, CAST(210.00 AS Decimal(10, 2)), 1, CAST(N'1886-11-01' AS Date), NULL)
INSERT [dbo].[publicaciones] ([id], [libro], [precio], [usuario], [fecha], [imagen]) VALUES (12, 12, CAST(250.00 AS Decimal(10, 2)), 2, CAST(N'1953-12-02' AS Date), NULL)
INSERT [dbo].[publicaciones] ([id], [libro], [precio], [usuario], [fecha], [imagen]) VALUES (13, 13, CAST(140.00 AS Decimal(10, 2)), 3, CAST(N'2020-01-05' AS Date), NULL)
INSERT [dbo].[publicaciones] ([id], [libro], [precio], [usuario], [fecha], [imagen]) VALUES (14, 14, CAST(175.00 AS Decimal(10, 2)), 4, CAST(N'1994-02-10' AS Date), NULL)
INSERT [dbo].[publicaciones] ([id], [libro], [precio], [usuario], [fecha], [imagen]) VALUES (15, 15, CAST(185.00 AS Decimal(10, 2)), 5, CAST(N'2008-03-15' AS Date), NULL)
INSERT [dbo].[publicaciones] ([id], [libro], [precio], [usuario], [fecha], [imagen]) VALUES (16, 16, CAST(195.00 AS Decimal(10, 2)), 1, CAST(N'1951-04-20' AS Date), NULL)
INSERT [dbo].[publicaciones] ([id], [libro], [precio], [usuario], [fecha], [imagen]) VALUES (17, 17, CAST(200.00 AS Decimal(10, 2)), 2, CAST(N'1986-05-30' AS Date), NULL)
INSERT [dbo].[publicaciones] ([id], [libro], [precio], [usuario], [fecha], [imagen]) VALUES (18, 18, CAST(180.00 AS Decimal(10, 2)), 3, CAST(N'2010-06-15' AS Date), NULL)
INSERT [dbo].[publicaciones] ([id], [libro], [precio], [usuario], [fecha], [imagen]) VALUES (19, 19, CAST(210.00 AS Decimal(10, 2)), 4, CAST(N'2009-07-25' AS Date), NULL)
INSERT [dbo].[publicaciones] ([id], [libro], [precio], [usuario], [fecha], [imagen]) VALUES (20, 20, CAST(160.00 AS Decimal(10, 2)), 5, CAST(N'2001-08-30' AS Date), NULL)
INSERT [dbo].[publicaciones] ([id], [libro], [precio], [usuario], [fecha], [imagen]) VALUES (21, 21, CAST(190.00 AS Decimal(10, 2)), 1, CAST(N'2009-08-30' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[publicaciones] OFF
GO
INSERT [dbo].[publicaciones_etiquetas] ([publicacion_id], [etiqueta_id]) VALUES (1, 1)
INSERT [dbo].[publicaciones_etiquetas] ([publicacion_id], [etiqueta_id]) VALUES (2, 1)
INSERT [dbo].[publicaciones_etiquetas] ([publicacion_id], [etiqueta_id]) VALUES (3, 3)
INSERT [dbo].[publicaciones_etiquetas] ([publicacion_id], [etiqueta_id]) VALUES (4, 4)
INSERT [dbo].[publicaciones_etiquetas] ([publicacion_id], [etiqueta_id]) VALUES (5, 4)
INSERT [dbo].[publicaciones_etiquetas] ([publicacion_id], [etiqueta_id]) VALUES (6, 2)
INSERT [dbo].[publicaciones_etiquetas] ([publicacion_id], [etiqueta_id]) VALUES (7, 4)
INSERT [dbo].[publicaciones_etiquetas] ([publicacion_id], [etiqueta_id]) VALUES (8, 3)
INSERT [dbo].[publicaciones_etiquetas] ([publicacion_id], [etiqueta_id]) VALUES (9, 2)
INSERT [dbo].[publicaciones_etiquetas] ([publicacion_id], [etiqueta_id]) VALUES (10, 5)
INSERT [dbo].[publicaciones_etiquetas] ([publicacion_id], [etiqueta_id]) VALUES (11, 1)
INSERT [dbo].[publicaciones_etiquetas] ([publicacion_id], [etiqueta_id]) VALUES (12, 4)
INSERT [dbo].[publicaciones_etiquetas] ([publicacion_id], [etiqueta_id]) VALUES (13, 2)
INSERT [dbo].[publicaciones_etiquetas] ([publicacion_id], [etiqueta_id]) VALUES (14, 5)
INSERT [dbo].[publicaciones_etiquetas] ([publicacion_id], [etiqueta_id]) VALUES (15, 1)
INSERT [dbo].[publicaciones_etiquetas] ([publicacion_id], [etiqueta_id]) VALUES (16, 3)
INSERT [dbo].[publicaciones_etiquetas] ([publicacion_id], [etiqueta_id]) VALUES (17, 2)
INSERT [dbo].[publicaciones_etiquetas] ([publicacion_id], [etiqueta_id]) VALUES (18, 4)
INSERT [dbo].[publicaciones_etiquetas] ([publicacion_id], [etiqueta_id]) VALUES (19, 5)
INSERT [dbo].[publicaciones_etiquetas] ([publicacion_id], [etiqueta_id]) VALUES (20, 1)
INSERT [dbo].[publicaciones_etiquetas] ([publicacion_id], [etiqueta_id]) VALUES (21, 3)
GO
SET IDENTITY_INSERT [dbo].[reviews] ON 

INSERT [dbo].[reviews] ([id], [publicacion_id], [usuario_escritor], [usuario_recibidor], [estrellas], [descripcion]) VALUES (1, 1, 1, 2, 5, N'El libro llegó en perfecto estado.')
INSERT [dbo].[reviews] ([id], [publicacion_id], [usuario_escritor], [usuario_recibidor], [estrellas], [descripcion]) VALUES (2, 2, 2, 1, 4, N'Buena organización, solo un poco de retraso.')
INSERT [dbo].[reviews] ([id], [publicacion_id], [usuario_escritor], [usuario_recibidor], [estrellas], [descripcion]) VALUES (3, 3, 3, 4, 3, N'El libro llegó algo dañado, pero legible.')
INSERT [dbo].[reviews] ([id], [publicacion_id], [usuario_escritor], [usuario_recibidor], [estrellas], [descripcion]) VALUES (4, 4, 4, 5, 5, N'Excelente estado, entrega rápida.')
INSERT [dbo].[reviews] ([id], [publicacion_id], [usuario_escritor], [usuario_recibidor], [estrellas], [descripcion]) VALUES (5, 5, 1, 3, 2, N'Desorganización en la entrega, el libro estaba sucio.')
SET IDENTITY_INSERT [dbo].[reviews] OFF
GO
SET IDENTITY_INSERT [dbo].[usuarios] ON 

INSERT [dbo].[usuarios] ([id], [nombre_usuario], [contraseña], [gmail], [fecha_nacimiento], [publicaciones]) VALUES (1, N'usuario1', N'pass1', N'user1@gmail.com', CAST(N'1990-01-01' AS Date), 0)
INSERT [dbo].[usuarios] ([id], [nombre_usuario], [contraseña], [gmail], [fecha_nacimiento], [publicaciones]) VALUES (2, N'usuario2', N'pass2', N'user2@gmail.com', CAST(N'1991-02-02' AS Date), 0)
INSERT [dbo].[usuarios] ([id], [nombre_usuario], [contraseña], [gmail], [fecha_nacimiento], [publicaciones]) VALUES (3, N'usuario3', N'pass3', N'user3@gmail.com', CAST(N'1992-03-03' AS Date), 0)
INSERT [dbo].[usuarios] ([id], [nombre_usuario], [contraseña], [gmail], [fecha_nacimiento], [publicaciones]) VALUES (4, N'usuario4', N'pass4', N'user4@gmail.com', CAST(N'1993-04-04' AS Date), 0)
INSERT [dbo].[usuarios] ([id], [nombre_usuario], [contraseña], [gmail], [fecha_nacimiento], [publicaciones]) VALUES (5, N'usuario5', N'pass5', N'user5@gmail.com', CAST(N'1994-05-05' AS Date), 0)
SET IDENTITY_INSERT [dbo].[usuarios] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__etiqueta__72AFBCC63A152E46]    Script Date: 23/10/2024 08:56:37 ******/
ALTER TABLE [dbo].[etiquetas] ADD  CONSTRAINT [UQ__etiqueta__72AFBCC63A152E46] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__usuarios__493D0C0A08091FC8]    Script Date: 23/10/2024 08:56:37 ******/
ALTER TABLE [dbo].[usuarios] ADD  CONSTRAINT [UQ__usuarios__493D0C0A08091FC8] UNIQUE NONCLUSTERED 
(
	[gmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__usuarios__D4D22D748EF2A315]    Script Date: 23/10/2024 08:56:37 ******/
ALTER TABLE [dbo].[usuarios] ADD  CONSTRAINT [UQ__usuarios__D4D22D748EF2A315] UNIQUE NONCLUSTERED 
(
	[nombre_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[usuarios] ADD  CONSTRAINT [DF__usuarios__public__440B1D61]  DEFAULT ((0)) FOR [publicaciones]
GO
ALTER TABLE [dbo].[favoritos]  WITH CHECK ADD  CONSTRAINT [FK_favoritos_publicacion] FOREIGN KEY([publicacion_id])
REFERENCES [dbo].[publicaciones] ([id])
GO
ALTER TABLE [dbo].[favoritos] CHECK CONSTRAINT [FK_favoritos_publicacion]
GO
ALTER TABLE [dbo].[favoritos]  WITH CHECK ADD  CONSTRAINT [FK_favoritos_usuario] FOREIGN KEY([usuario_id])
REFERENCES [dbo].[usuarios] ([id])
GO
ALTER TABLE [dbo].[favoritos] CHECK CONSTRAINT [FK_favoritos_usuario]
GO
ALTER TABLE [dbo].[libros]  WITH CHECK ADD  CONSTRAINT [FK__libros__autor_id__3D5E1FD2] FOREIGN KEY([autor_id])
REFERENCES [dbo].[autores] ([id])
GO
ALTER TABLE [dbo].[libros] CHECK CONSTRAINT [FK__libros__autor_id__3D5E1FD2]
GO
ALTER TABLE [dbo].[libros]  WITH CHECK ADD  CONSTRAINT [FK__libros__categori__3F466844] FOREIGN KEY([categoria_id])
REFERENCES [dbo].[categorias] ([id])
GO
ALTER TABLE [dbo].[libros] CHECK CONSTRAINT [FK__libros__categori__3F466844]
GO
ALTER TABLE [dbo].[libros]  WITH CHECK ADD  CONSTRAINT [FK__libros__editoria__3E52440B] FOREIGN KEY([editorial_id])
REFERENCES [dbo].[editoriales] ([id])
GO
ALTER TABLE [dbo].[libros] CHECK CONSTRAINT [FK__libros__editoria__3E52440B]
GO
ALTER TABLE [dbo].[publicaciones]  WITH CHECK ADD  CONSTRAINT [FK__publicaci__libro__46E78A0C] FOREIGN KEY([libro])
REFERENCES [dbo].[libros] ([id])
GO
ALTER TABLE [dbo].[publicaciones] CHECK CONSTRAINT [FK__publicaci__libro__46E78A0C]
GO
ALTER TABLE [dbo].[publicaciones]  WITH CHECK ADD  CONSTRAINT [FK_publicaciones_usuarios] FOREIGN KEY([usuario])
REFERENCES [dbo].[usuarios] ([id])
GO
ALTER TABLE [dbo].[publicaciones] CHECK CONSTRAINT [FK_publicaciones_usuarios]
GO
ALTER TABLE [dbo].[publicaciones_etiquetas]  WITH CHECK ADD  CONSTRAINT [FK__publicaci__etiqu__4E88ABD4] FOREIGN KEY([etiqueta_id])
REFERENCES [dbo].[etiquetas] ([id])
GO
ALTER TABLE [dbo].[publicaciones_etiquetas] CHECK CONSTRAINT [FK__publicaci__etiqu__4E88ABD4]
GO
ALTER TABLE [dbo].[publicaciones_etiquetas]  WITH CHECK ADD  CONSTRAINT [FK__publicaci__publi__4D94879B] FOREIGN KEY([publicacion_id])
REFERENCES [dbo].[publicaciones] ([id])
GO
ALTER TABLE [dbo].[publicaciones_etiquetas] CHECK CONSTRAINT [FK__publicaci__publi__4D94879B]
GO
ALTER TABLE [dbo].[reviews]  WITH CHECK ADD  CONSTRAINT [FK_reviews_publicacion] FOREIGN KEY([publicacion_id])
REFERENCES [dbo].[publicaciones] ([id])
GO
ALTER TABLE [dbo].[reviews] CHECK CONSTRAINT [FK_reviews_publicacion]
GO
ALTER TABLE [dbo].[reviews]  WITH CHECK ADD  CONSTRAINT [FK_reviews_usuario_escritor] FOREIGN KEY([usuario_escritor])
REFERENCES [dbo].[usuarios] ([id])
GO
ALTER TABLE [dbo].[reviews] CHECK CONSTRAINT [FK_reviews_usuario_escritor]
GO
ALTER TABLE [dbo].[reviews]  WITH CHECK ADD  CONSTRAINT [FK_reviews_usuario_recibidor] FOREIGN KEY([usuario_recibidor])
REFERENCES [dbo].[usuarios] ([id])
GO
ALTER TABLE [dbo].[reviews] CHECK CONSTRAINT [FK_reviews_usuario_recibidor]
GO
ALTER TABLE [dbo].[libros]  WITH CHECK ADD  CONSTRAINT [CK__libros__año__4E88ABD4] CHECK  (([año]>=(0)))
GO
ALTER TABLE [dbo].[libros] CHECK CONSTRAINT [CK__libros__año__4E88ABD4]
GO
ALTER TABLE [dbo].[libros]  WITH CHECK ADD  CONSTRAINT [CK__libros__año__571DF1D5] CHECK  (([año]>=(0)))
GO
ALTER TABLE [dbo].[libros] CHECK CONSTRAINT [CK__libros__año__571DF1D5]
GO
ALTER TABLE [dbo].[reviews]  WITH CHECK ADD CHECK  (([estrellas]>=(1) AND [estrellas]<=(5)))
GO
/****** Object:  StoredProcedure [dbo].[AgregarPublicacion]    Script Date: 23/10/2024 08:56:37 ******/
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

    INSERT INTO publicaciones (libro, precio, usuario, fecha)
    VALUES (@LibroID, @Precio, @UsuarioID, @Fecha);

END;
GO
/****** Object:  StoredProcedure [dbo].[AgregarPublicacionFavoritos]    Script Date: 23/10/2024 08:56:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AgregarPublicacionFavoritos]
    @UsuarioID INT,
    @PublicacionID INT
AS
BEGIN
    INSERT INTO favoritos (usuario_id, publicacion_id)
    VALUES (@UsuarioID, @PublicacionID);
END;
GO
/****** Object:  StoredProcedure [dbo].[EliminarPublicacion]    Script Date: 23/10/2024 08:56:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EliminarPublicacion]
    @PublicacionID INT
AS
BEGIN
    
    DELETE FROM publicaciones_etiquetas
    WHERE publicacion_id = @PublicacionID;
    
    
    DELETE FROM favoritos
    WHERE publicacion_id = @PublicacionID;

    
    DELETE FROM reviews
    WHERE publicacion_id = @PublicacionID;

    
    DELETE FROM publicaciones
    WHERE id = @PublicacionID;
END;
GO
/****** Object:  StoredProcedure [dbo].[EliminarPublicacionFavoritos]    Script Date: 23/10/2024 08:56:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EliminarPublicacionFavoritos]
    @UsuarioID INT,
    @PublicacionID INT
AS
BEGIN
    
    DELETE FROM favoritos
    WHERE usuario_id = @UsuarioID AND publicacion_id = @PublicacionID;
END;
GO
/****** Object:  StoredProcedure [dbo].[EliminarUsuario]    Script Date: 23/10/2024 08:56:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EliminarUsuario]
    @UsuarioID INT
AS
BEGIN
    
    DELETE FROM favoritos
    WHERE usuario_id = @UsuarioID;
	    DELETE FROM publicaciones
    WHERE usuario = @UsuarioID;
    
    
    DELETE FROM reviews
    WHERE usuario_escritor = @UsuarioID;
    
    
    DELETE FROM reviews
    WHERE usuario_recibidor = @UsuarioID;
    
    
    DELETE FROM usuarios
    WHERE id = @UsuarioID;
END;

GO
/****** Object:  StoredProcedure [dbo].[ModificarDatosUsuario]    Script Date: 23/10/2024 08:56:37 ******/
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
    UPDATE Usuarios
    SET 
        nombre_usuario = @NuevoNombreUsuario,
        contraseña = @NuevaContraseña,
        gmail = @NuevoGmail,
        fecha_nacimiento = @NuevaFechaNacimiento
    WHERE id = @UsuarioID;
END;
GO
/****** Object:  StoredProcedure [dbo].[ModificarPublicacion]    Script Date: 23/10/2024 08:56:37 ******/
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
    UPDATE publicaciones
    SET 
        libro = @NuevoLibro,
        precio = @NuevoPrecio,
        usuario = @NuevoUsuario,
        fecha = @NuevaFecha
    WHERE id = @PublicacionID;
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtenerNombreLibroPorPublicacionID]    Script Date: 23/10/2024 08:56:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerNombreLibroPorPublicacionID]
    @PublicacionID INT
AS
BEGIN
    SELECT l.nombre 
    FROM publicaciones p
    JOIN libros l ON p.libro = l.id
    WHERE p.id = @PublicacionID;
END;
GO
USE [master]
GO
ALTER DATABASE [TP_REBOOKING] SET  READ_WRITE 
GO
