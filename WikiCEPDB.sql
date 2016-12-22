USE [master]
GO
/****** Object:  Database [WikiCEPDB]    Script Date: 22/12/2016 10:07:03 a.m. ******/
CREATE DATABASE [WikiCEPDB]
GO
ALTER DATABASE [WikiCEPDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WikiCEPDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WikiCEPDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WikiCEPDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WikiCEPDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WikiCEPDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WikiCEPDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [WikiCEPDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [WikiCEPDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WikiCEPDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WikiCEPDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WikiCEPDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WikiCEPDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WikiCEPDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WikiCEPDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WikiCEPDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WikiCEPDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WikiCEPDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WikiCEPDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WikiCEPDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WikiCEPDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WikiCEPDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WikiCEPDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WikiCEPDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WikiCEPDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WikiCEPDB] SET  MULTI_USER 
GO
ALTER DATABASE [WikiCEPDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WikiCEPDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WikiCEPDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WikiCEPDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WikiCEPDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [WikiCEPDB]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 22/12/2016 10:07:03 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 22/12/2016 10:07:03 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 22/12/2016 10:07:03 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 22/12/2016 10:07:03 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 22/12/2016 10:07:03 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 22/12/2016 10:07:03 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Definiciones]    Script Date: 22/12/2016 10:07:03 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Definiciones](
	[IDDefinicion] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](100) NULL,
	[IDAutor] [nvarchar](128) NULL,
	[FechaCreacion] [datetime] NULL,
	[Texto] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDDefinicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ejemplo_Definicion]    Script Date: 22/12/2016 10:07:03 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ejemplo_Definicion](
	[IDEjemplo] [int] NOT NULL,
	[IDDefinicion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDEjemplo] ASC,
	[IDDefinicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ejemplos]    Script Date: 22/12/2016 10:07:03 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ejemplos](
	[IDEjemplo] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](100) NULL,
	[Texto] [text] NULL,
	[FechaCreacion] [datetime] NULL,
	[IDAutor] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDEjemplo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Imagen_Definicion]    Script Date: 22/12/2016 10:07:03 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Imagen_Definicion](
	[IDImagen] [int] NOT NULL,
	[IDDefinicion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDImagen] ASC,
	[IDDefinicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Imagenes]    Script Date: 22/12/2016 10:07:03 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Imagenes](
	[IDImagen] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](100) NULL,
	[FechaCreacion] [datetime] NULL,
	[IDAutor] [nvarchar](128) NULL,
	[Imagen] [varbinary](max) NULL,
	[ImageMimeType] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDImagen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tema_Definicion]    Script Date: 22/12/2016 10:07:03 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tema_Definicion](
	[IDTema] [int] NOT NULL,
	[IDDefinicion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDTema] ASC,
	[IDDefinicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Temas]    Script Date: 22/12/2016 10:07:03 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Temas](
	[IDTema] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDTema] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tutorial_Definicion]    Script Date: 22/12/2016 10:07:03 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tutorial_Definicion](
	[IDTutorial] [int] NOT NULL,
	[IDDefinicion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDTutorial] ASC,
	[IDDefinicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TutorialesYouTube]    Script Date: 22/12/2016 10:07:03 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TutorialesYouTube](
	[IDTutorial] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](100) NULL,
	[LinkYouTube] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDTutorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[vDefiniciones]    Script Date: 22/12/2016 10:07:03 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vDefiniciones]
AS
SELECT D.IDDefinicion,D.Titulo AS Definicion, D.FechaCreacion AS [Fecha de Creacion], ISNULL(U.Email, 'Anónimo') AS Autor
FROM Definiciones AS D LEFT JOIN AspNetUsers AS U ON D.IDAutor=U.Id
GO
/****** Object:  View [dbo].[vDefinicionesRecientes]    Script Date: 22/12/2016 10:07:03 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vDefinicionesRecientes]
AS
SELECT TOP 3 D.IDDefinicion, D.Titulo, D.Texto, D.FechaCreacion
FROM Definiciones AS D
ORDER BY D.FechaCreacion DESC
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 22/12/2016 10:07:03 a.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 22/12/2016 10:07:03 a.m. ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 22/12/2016 10:07:03 a.m. ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 22/12/2016 10:07:03 a.m. ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 22/12/2016 10:07:03 a.m. ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 22/12/2016 10:07:03 a.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Definiciones]  WITH CHECK ADD FOREIGN KEY([IDAutor])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Ejemplo_Definicion]  WITH CHECK ADD FOREIGN KEY([IDDefinicion])
REFERENCES [dbo].[Definiciones] ([IDDefinicion])
GO
ALTER TABLE [dbo].[Ejemplo_Definicion]  WITH CHECK ADD FOREIGN KEY([IDEjemplo])
REFERENCES [dbo].[Ejemplos] ([IDEjemplo])
GO
ALTER TABLE [dbo].[Ejemplos]  WITH CHECK ADD FOREIGN KEY([IDAutor])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Imagen_Definicion]  WITH CHECK ADD FOREIGN KEY([IDDefinicion])
REFERENCES [dbo].[Definiciones] ([IDDefinicion])
GO
ALTER TABLE [dbo].[Imagen_Definicion]  WITH CHECK ADD FOREIGN KEY([IDImagen])
REFERENCES [dbo].[Imagenes] ([IDImagen])
GO
ALTER TABLE [dbo].[Imagenes]  WITH CHECK ADD FOREIGN KEY([IDAutor])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Tema_Definicion]  WITH CHECK ADD FOREIGN KEY([IDDefinicion])
REFERENCES [dbo].[Definiciones] ([IDDefinicion])
GO
ALTER TABLE [dbo].[Tema_Definicion]  WITH CHECK ADD FOREIGN KEY([IDTema])
REFERENCES [dbo].[Temas] ([IDTema])
GO
ALTER TABLE [dbo].[Tutorial_Definicion]  WITH CHECK ADD FOREIGN KEY([IDDefinicion])
REFERENCES [dbo].[Definiciones] ([IDDefinicion])
GO
ALTER TABLE [dbo].[Tutorial_Definicion]  WITH CHECK ADD FOREIGN KEY([IDTutorial])
REFERENCES [dbo].[TutorialesYouTube] ([IDTutorial])
GO
USE [master]
GO
ALTER DATABASE [WikiCEPDB] SET  READ_WRITE 
GO
