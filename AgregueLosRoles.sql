USE [master]
GO
/****** Object:  Database [WikiCEPDB]    Script Date: 27/12/2016 11:44:42 a.m. ******/
CREATE DATABASE [WikiCEPDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WikiCEPDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\WikiCEPDB.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WikiCEPDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\WikiCEPDB_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 27/12/2016 11:44:43 a.m. ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 27/12/2016 11:44:43 a.m. ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 27/12/2016 11:44:43 a.m. ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 27/12/2016 11:44:43 a.m. ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 27/12/2016 11:44:43 a.m. ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 27/12/2016 11:44:43 a.m. ******/
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
/****** Object:  Table [dbo].[Definiciones]    Script Date: 27/12/2016 11:44:43 a.m. ******/
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
/****** Object:  Table [dbo].[Ejemplo_Definicion]    Script Date: 27/12/2016 11:44:43 a.m. ******/
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
/****** Object:  Table [dbo].[Ejemplos]    Script Date: 27/12/2016 11:44:43 a.m. ******/
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
/****** Object:  Table [dbo].[Imagen_Definicion]    Script Date: 27/12/2016 11:44:43 a.m. ******/
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
/****** Object:  Table [dbo].[Imagenes]    Script Date: 27/12/2016 11:44:43 a.m. ******/
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
/****** Object:  Table [dbo].[Tema_Definicion]    Script Date: 27/12/2016 11:44:43 a.m. ******/
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
/****** Object:  Table [dbo].[Temas]    Script Date: 27/12/2016 11:44:43 a.m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tutorial_Definicion]    Script Date: 27/12/2016 11:44:43 a.m. ******/
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
/****** Object:  Table [dbo].[TutorialesYouTube]    Script Date: 27/12/2016 11:44:43 a.m. ******/
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
/****** Object:  View [dbo].[vDefiniciones]    Script Date: 27/12/2016 11:44:43 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vDefiniciones]
AS
SELECT D.IDDefinicion,D.Titulo AS Definicion, D.FechaCreacion AS [Fecha de Creacion], ISNULL(U.Email, 'Anónimo') AS Autor
FROM Definiciones AS D LEFT JOIN AspNetUsers AS U ON D.IDAutor=U.Id

GO
/****** Object:  View [dbo].[vDefinicionesRecientes]    Script Date: 27/12/2016 11:44:43 a.m. ******/
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
/****** Object:  View [dbo].[vEjemplos]    Script Date: 27/12/2016 11:44:43 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vEjemplos]
AS
SELECT E.IDEjemplo, E.Titulo, E.FechaCreacion, U.Email AS Autor
FROM Ejemplos AS E JOIN AspNetUsers AS U ON E.IDAutor=U.Id
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201612161237106_InitialCreate', N'WikiCEP.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FE3B6127E2FD0FF20E8A92D522B97EE624F60B7489DA40DBAB9609DEDE9DB82966887588952252A4D50F4979D87F393FA173A942859E245175BB19D628145440EBF190E87E47038F4DFFFFBFFF887A7C0B71E719C90904EECA3D1A16D61EA861EA1CB899DB2C5B7EFEC1FBEFFF28BF185173C59BF1674279C0E5AD264623F30169D3A4EE23EE00025A380B87198840B3672C3C0415EE81C1F1EFEC7393A723040D8806559E30F296524C0D9077C4E43EAE288A5C8BF0E3DEC27A21C6A6619AA7583029C44C8C513FBBFE433995EDC8D724ADB3AF309022966D85FD816A2346488818CA71F133C63714897B3080A907FFF1C61A05B203FC142F6D31579D76E1C1EF36E38AB8605949B262C0C7A021E9D08BD3872F3B5B46B977A03CD5D8086D933EF75A6BD897DE5E1ACE843E883026486A7533FE6C413FBBA6471964437988D8A86A31CF23206B83FC2F8F3A88A7860756E7750DAD1F1E890FF3BB0A6A9CFD2184F284E598CFC03EB2E9DFBC4FD053FDF879F319D9C1CCD1727EFDEBC45DEC9DBEFF0C99B6A4FA1AF40572B80A2BB388C700CB2E145D97FDB72EAED1CB961D9ACD226D70AD8124C09DBBA464FEF315DB207982CC7EF6CEB923C61AF2811C6F591129841D088C5297CDEA4BE8FE63E2EEB9D469EFCFF06AEC76FDE0EC2F5063D926536F4127F983831CCAB0FD8CF6A930712E5D3AB36DE9F04D9651C06FCBB6E5F79EDA75998C62EEF4C6824B947F112B3BA74636765BC9D4C9A430D6FD605EAFE9B369754356F2D29EFD03A33A160B1EDD950C8FBB27C3B5BDC5914C1E065A6C535D26470F58D6A24B53CB044FDCA648EBA9A0C85AEFC9B57C08B00117F8025B00317F03C16240E70D9CB1F433038447BCB7C8792045600EF67943C34880E7F0E20FA0CBB690C86396328885E9CDBDD4348F14D1ACCB9BD6F8FD7604373FF4778895C16C61794B7DA18EF7DE87E0E537641BD73C4F047E61680FCF39E04DD010611E7CC7571925C8231636F1A82635D005E517672DC1B8E2F4EBB7641A63E2281DE079196D14F05E9CA0FD15328BE88814CE78F3489FA3E5C12DA4DD482D42C6A4ED12AAA20EB2B2A07EB26A9A0340B9A11B4CA99530DE6E1652334BC8B97C1EEBF8FB7D9E66D5A0B2A6A9CC10A897FC214C7B08C797788311CD3D50874593776E12C64C3C799BEF8DE9471FA15F9E9D0ACD69A0DD92230FC6CC860F77F36646242F123F1B857D2E1E05310037C277AFD99AA7DCE49926D7B3AD4BAB96DE6DB59034CD3E52C49429764B34013F212018BBAFCE0C359EDD18BBC377204043A06864EF8960725D0375B36AA5B7A8E7DCCB075E6E621C1294A5CE4A96A840E793D042B76548D60AB48485DB86F149E60E938E68D103F042530530965EAB420D42511F25BB524B5ECB885F1BE973CE49A731C61CA19B66AA20B737DE0830B50F29106A54D4363A76271CD8668F05A4D63DEE6C2AEC65D89476CC5265B7C67835D0AFFED450CB359635B30CE66957411C018C4DB85818AB34A5703900F2EFB66A0D289C960A0C2A5DA8A81D635B60303ADABE4D519687E44ED3AFED27975DFCCB37E50DEFEB6DEA8AE1DD8664D1F7B669AB9EF096D18B4C0B16A9EE7735E899F98E67006728AF359225C5DD94438F80CB37AC866E5EF6AFD50A7194436A226C095A1B5808AEB3F054899503D842B62798DD2092FA2076C11776B84156BBF045BB10115BB7A0D5A21345F96CAC6D9E9F451F6ACB406C5C83B1D162A381A839017AF7AC73B28C514975515D3C517EEE30D573A2606A341412D9EAB4149456706D752619AED5AD239647D5CB28DB424B94F062D159D195C4BC246DB95A4710A7AB8051BA9A8BE850F34D98A4847B9DB94756327CF8C120563C7904235BE465144E8B29252254AAC599E4F35FD76D63FD928C8311C37D1E41C95D2969C5818A325966A8135487A49E2849D2386E688C779A65EA09069F756C3F25FB0AC6E9FEA2016FB4041CDFFCE5B4897F6B57D56754444FB4BE85DC0BD992C84AE197B7D738BA7B7211FC59AA8FD34F4D3809A9D2B73EBFCEEAEDA3E2F5111C68E24BFE23C299A525CDCBADA3B0D8A3A210618A0D26F597F90CC102655175E6755D9264FD48C5204A6AA28A660D5CE06CDE4C0741E28D92FEC3F4EAD082F339F44324A154014F5C4A8E433286095BAEEA8F594932A66BDA63BA29457528594AA7A4859CD1EA90959AD580BCFA0513D45770E6ABE48155DADED8EACC91CA9426BAAD7C0D6C82CD77547D52497548135D5DDB1579926F202BAC73B96F1B4B2D696951F6637DBB30C182FB31A0EB3E555EEECAB4095E29E58E2565E0113E57B6949C613DD5A9694C72F36B324038679C5A9DD74D7179CC6EB793366EDFABAB6A8375DDF9BF1FAD9EB8B5A85729893494AEEE5A14E3ABC8DC541AAFD918C72B2CA496CAB50236CE8CF09C3C188138C66BFFB539F60BE7C1704D78892054E589EB2611F1F1E1D4B6F6DF6E7DD8B93249EAF39889A1EBFD4C76C0BD957F411C5EE038AD55C880DDE86AC409530F315F5F0D3C4FE336B759A452CF85F59F18175957CA4E4F7142AEEE3145B7FA9B99DC3E4CA371FACF6F4654377AD5EFDF6296F7A60DDC630634EAD434997EB8C70FDBD432F69F2A61B48B3F62B88D73BA16A4F0DB4A8D28458FF65C19CB0415E1514527E15A0A7AFFB8AA67D39B011A2E675C0507883A8D094FDBF0E9631F3DF834F9665FEF7EBACFE25C03AA2195F0110DA1F4C7E03D07D192A5AEE70ABD19C87B6B124657A6ECDA1DE28A172D77B93926ABDD14457D3A97BC06D9032BD8665BCB26CE3C176474D32F160D8BB34ED17CF20DE97A4E1553AC76E7385B7991EDC7015F4AFCA0ADE833C364D5ECEEE737FB76D6BA618EE9E2750F6CBF0DD336313D95ABBCFE3DDB6B199C2BC7B6E6CBDB275F7CCD676B57FEED8D23A6FA13BCFBD55D3880C7731BA58705B6E6D1E388713FE3C0423C83DCAFC49A43E99AB2911B585E18AC4CCD49C45263356268EC257A16866DBAFAF62C36FECACA069666BC8BD6CE22DD6FF46DE82A699B721A3711759C1DA9C425DA676CB3AD694F8F49AB2806B3D69493A6FF3591B2FD65F53D2EF204AA9CD1EC31DF1EBC9F11D4425434E9D1E39BDEA752FEC9D955F4E84FD3B21CB1504FF1D458ADDDAAE59D25CD145586CDE9244058914A1B9C60C79B0A59EC58C2C90CBA09AC798B337DD59DC8EDF74CCB177456F5316A50CBA8C83B95F0B787127A0897F96B85C97797C1B653F4F324417404CC263F3B7F4C794F85E29F7A526266480E0DE8588E8F2B1643CB2BB7C2E916E42DA1148A8AF748AEE7110F90096DCD2197AC4EBC806E6F71E2F91FBBC8A009A40DA07A2AEF6F13941CB180589C058B5874FB0612F78FAFE1FB715AA4840540000, N'6.1.3-40302')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1', N'Administrador')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'2', N'Usuario')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'62f68e57-589e-4511-822b-0d7c10445f9f', N'1')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'5bff2859-af18-458e-8e4b-898175e09497', N'diieegogoonzalez@gmail.com', 0, N'ABE4sexPL2Gu78qjR1TNiEzYAp/WbW7HXSbXS0JSnXQvBw7nKWvJ6vLReA7RgExFOA==', N'e50ee2c6-8655-4265-a0a5-7a0c1d868d04', NULL, 0, 0, NULL, 1, 0, N'diieegogoonzalez@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'62f68e57-589e-4511-822b-0d7c10445f9f', N'admin@gmail.com.ar', 0, N'AFiT0SG/Ea90sF96WkGkCcYDklN6ERSORr4p31NM6VCjQ3z+NJVco987E7WQNvSnmw==', N'82e3cbf3-e480-4667-a95a-ca0208f1b638', NULL, 0, 0, NULL, 1, 0, N'admin@gmail.com.ar')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'95eb3f0d-81cf-4322-b00a-0ad2d8e538ec', N'dmgonzalez@sofrecom.com', 0, N'AATYuuf/glLFFD7Cnwdqkfh3wPff+joq/R3+pvF2RMssowSoBR03QpAgaeYSu3Q/kw==', N'4cab8680-5c1a-417a-bc0f-89bb19d8c1c3', NULL, 0, 0, NULL, 1, 0, N'dmgonzalez@sofrecom.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'9ab18093-5b07-4f12-b364-2ec90a19bcdf', N'diego@gmail.com', 0, N'AInJE7Hix6GrpQb4dqlNCPfh3RsYzmRX3fPiMnyFMerunif4sIi2bsUHlJO8sPxu8A==', N'deb689cf-bd2c-4a41-ba1c-ccd8263056f5', NULL, 0, 0, NULL, 1, 0, N'diego@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a0445bd0-d6cb-4aa4-bb1c-70512ae551a8', N'DiegoG@sofrecom.com', 0, N'ADJxYstExz3D9RBWfZbkZQ5580WTOyPN+Ey04nyJAhyZfznZOpbMnXB3V9DGwPh52g==', N'50a2b3d6-68cc-4d84-ab75-a31ed5f8afa1', NULL, 0, 0, NULL, 1, 0, N'DiegoG@sofrecom.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e45a01ba-3f6d-4c06-83cd-7f2b9dcb1a29', N'diego@sofrecom.com', 0, N'AEEd4S9hX7z4Kuumj72piP0WGllQNL0B1jhXCv5A7tHhRTXTVMacpZtxlnxKJWrtHA==', N'539a008d-a77a-4322-a2bc-793a89b874b4', NULL, 0, 0, NULL, 1, 0, N'diego@sofrecom.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'fcc0190b-dbc2-40ab-99af-e8cdaa88c88e', N'pepa@sofrecom.com.ar', 0, N'ABwkMk6fk1i9Bt9qmxbnC9FU+x7o+a62h0FRmcUuLWRHOPaWWCFUENjGHLqU9Tc5Uw==', N'09c594e8-e4de-45bd-a508-48e763371abb', NULL, 0, 0, NULL, 1, 0, N'pepa@sofrecom.com.ar')
SET IDENTITY_INSERT [dbo].[Definiciones] ON 

INSERT [dbo].[Definiciones] ([IDDefinicion], [Titulo], [IDAutor], [FechaCreacion], [Texto]) VALUES (2, N'.NET', N'5bff2859-af18-458e-8e4b-898175e09497', CAST(N'2016-12-20 16:14:27.687' AS DateTime), N'.NET es un framework de Microsoft que hace un énfasis en la transparencia de redes, con independencia de plataforma de hardware y que permita un rápido desarrollo de aplicaciones. Basado en ella, la empresa intenta desarrollar una estrategia horizontal que integre todos sus productos, desde el sistema operativo hasta las herramientas de mercado.  .NET podría considerarse una respuesta de Microsoft al creciente mercado de los negocios en entornos Web, como competencia a la plataforma Java de Oracle Corporation y a los diversos framework de desarrollo web basados en PHP. Su propuesta es ofrecer una manera rápida y económica, a la vez que segura y robusta, de desarrollar aplicaciones –o como la misma plataforma las denomina, soluciones– permitiendo una integración más rápida y ágil entre empresas y un acceso más simple y universal a todo tipo de información desde cualquier tipo de dispositivo.')
INSERT [dbo].[Definiciones] ([IDDefinicion], [Titulo], [IDAutor], [FechaCreacion], [Texto]) VALUES (3, N'Microsoft SQL Server', N'5bff2859-af18-458e-8e4b-898175e09497', CAST(N'2016-12-20 16:16:39.360' AS DateTime), N'Microsoft SQL Server es un sistema de manejo de bases de datos del modelo relacional, desarrollado por la empresa Microsoft.  El lenguaje de desarrollo utilizado (por línea de comandos o mediante la interfaz gráfica de Management Studio) es Transact-SQL (TSQL), una implementación del estándar ANSI del lenguaje SQL, utilizado para manipular y recuperar datos (DML), crear tablas y definir relaciones entre ellas (DDL).  Dentro de los competidores más destacados de SQL Server están: Oracle, MariaDB, MySQL, PostgreSQL. SQL Server solo está disponible para sistemas operativos Windows de Microsoft.  Puede ser configurado para utilizar varias instancias en el mismo servidor físico, la primera instalación lleva generalmente el nombre del servidor, y las siguientes - nombres específicos (con un guion invertido entre el nombre del servidor y el nombre de la instalación).')
INSERT [dbo].[Definiciones] ([IDDefinicion], [Titulo], [IDAutor], [FechaCreacion], [Texto]) VALUES (4, N'Programacion Orientada a Objetos', N'5bff2859-af18-458e-8e4b-898175e09497', CAST(N'2016-12-20 16:18:27.337' AS DateTime), N'La programación orientada a objetos (POO, u OOP según sus siglas en inglés) es un paradigma de programación que viene a innovar la forma de obtener resultados. Los objetos manipulan los datos de entrada para la obtención de datos de salida específicos, donde cada objeto ofrece una funcionalidad especial.  Muchos de los objetos pre-diseñados de los lenguajes de programación actuales permiten la agrupación en bibliotecas o librerías, sin embargo, muchos de estos lenguajes permiten al usuario la creación de sus propias bibliotecas.  Está basada en varias técnicas, incluyendo herencia, cohesión, abstracción, polimorfismo, acoplamiento y encapsulamiento.  Su uso se popularizó a principios de la década de 1990. En la actualidad, existe una gran variedad de lenguajes de programación que soportan la orientación a objetos. Un objeto contiene toda la información que permite definirlo e identificarlo frente a otros objetos pertenecientes a otras clases e incluso frente a objetos de una misma clase, al poder tener valores bien diferenciados en sus atributos. A su vez, los objetos disponen de mecanismos de interacción llamados métodos, que favorecen la comunicación entre ellos. Esta comunicación favorece a su vez el cambio de estado en los propios objetos. Esta característica lleva a tratarlos como unidades indivisibles, en las que no se separa el estado y el comportamiento.')
INSERT [dbo].[Definiciones] ([IDDefinicion], [Titulo], [IDAutor], [FechaCreacion], [Texto]) VALUES (5, N'Metodos ', N'5bff2859-af18-458e-8e4b-898175e09497', CAST(N'2016-12-20 16:19:34.067' AS DateTime), N'En la programación, un método es una subrutina cuyo código es definido en una clase y puede pertenecer tanto a una clase, como es el caso de los métodos de clase o estáticos, como a un objeto, como es el caso de los métodos de instancia. Análogamente a los procedimientos en lenguajes imperativos, un método consiste generalmente de una serie de sentencias para llevar a cabo una acción, un juego de parámetros de entrada que regularán dicha acción o, posiblemente, un valor de salida (o valor de retorno) de algún tipo.  La diferencia entre un procedimiento (generalmente llamado función si devuelve un valor) y un método es que este último, al estar asociado con un objeto o clase en particular, puede acceder y modificar los datos privados del objeto correspondiente de forma tal que sea consistente con el comportamiento deseado para el mismo. Así, es recomendable entender a un método no como una secuencia de instrucciones sino como la forma en que el objeto es útil (el método para hacer su trabajo). Por lo tanto, podemos considerar al método como el pedido a un objeto para que realice una tarea determinada o como la vía para enviar un mensaje al objeto y que éste reaccione acorde a dicho mensaje. Como ya se mencionó, los métodos de instancia están relacionados con un objeto en particular, mientras que los métodos estáticos o de clase (también denominados métodos compartidos), están asociados a una clase en particular. En una implementación de constructores, siendo estos métodos de instancia especiales llamados automáticamente cuando se crea una instancia de alguna clase. En Java y C++ se distinguen por tener el mismo nombre de la clases a la que están asociados. Lenguajes como Smalltalk no requieren constructores ni destructores.')
INSERT [dbo].[Definiciones] ([IDDefinicion], [Titulo], [IDAutor], [FechaCreacion], [Texto]) VALUES (6, N'Capa de Datos', N'5bff2859-af18-458e-8e4b-898175e09497', CAST(N'2016-12-20 16:20:26.533' AS DateTime), N'Una capa de acceso a datos o DAL (del inglés data access layer) en los programas informáticos, es una capa de un programa informático que proporciona acceso simplificado a los datos almacenados en el almacenamiento persistente de algún tipo, tal como una entidad-relación de base de datos. Este acrónimo se usa predominantemente en entornos Microsoft ASP.NET.  Por ejemplo, el DAL podría devolver una referencia al objeto (en términos de programación orientada a objetos) completo con sus atributos en lugar de un registro de campos de una tabla de la base de datos. Esto permite que los módulos del cliente (o usuario) se crearan con un mayor nivel de abstracción. Este tipo de modelo puede ser implementado mediante la creación de una clase de métodos de acceso a datos que hacen referencia directamente a un conjunto correspondiente de procedimientos almacenados de base de datos. Otra aplicación potencial podría recuperar o escribir registros hacia o desde un sistema de archivos. El DAL esconde esa complejidad del almacén de datos subyacente del mundo externo.  Por ejemplo, en lugar de utilizar comandos tales como insertar, eliminar y actualizar para acceder a una tabla específica en una base de datos, una clase y unos procedimientos almacenados se podrían crear en la base de datos. Los procedimientos se han llamado de un método dentro de la clase, lo que devolvería un objeto que contiene los valores solicitados. O bien los comandos inserción, eliminación y actualización podría ser ejecutado en funciones simples como registerUser o loginUser almacenada dentro de la capa de acceso a datos.  Además, los métodos de la lógica de negocio de una aplicación se pueden asignar a la capa de acceso a datos. Así, por ejemplo, en vez de hacer una consulta en una base de datos en busca de todos los usuarios de varias tablas de la aplicación puede llamar a un solo método de una DAL que abstrae las llamadas bases de datos.  Las aplicaciones que utilizan una capa de acceso a datos puede ser cualquiera de los servidores de base de datos dependiente o independiente. Si la capa de acceso a datos es compatible con varios tipos de bases de datos, la aplicación se vuelve capaz de utilizar lo que las bases de datos de la CHA puede hablar. En cualquier circunstancia, que tiene una capa de acceso de datos proporciona una ubicación centralizada para todas las llamadas en la base de datos, y por lo tanto hace que sea más fácil de puerto de la aplicación a otros sistemas de bases de datos (suponiendo que el 100% de la interacción de base de datos se hace en la CHA para un dado aplicación).')
INSERT [dbo].[Definiciones] ([IDDefinicion], [Titulo], [IDAutor], [FechaCreacion], [Texto]) VALUES (7, N'Herencia', N'5bff2859-af18-458e-8e4b-898175e09497', CAST(N'2016-12-20 16:20:55.560' AS DateTime), N'En programación orientada a objetos, la herencia es, después de la agregación o composición, el mecanismo más utilizado para alcanzar algunos de los objetivos más preciados en el desarrollo de software como lo son la reutilización y la extensibilidad. A través de ella los diseñadores pueden crear nuevas clases partiendo de una clase o de una jerarquía de clases preexistente (ya comprobadas y verificadas) evitando con ello el rediseño, la modificación y verificación de la parte ya implementada. La herencia facilita la creación de objetos a partir de otros ya existentes e implica que una subclase obtiene todo el comportamiento (métodos) y eventualmente los atributos (variables) de su superclase.  Es la relación entre una clase general y otra clase más específica. Por ejemplo: Si declaramos una clase párrafo derivada de una clase texto, todos los métodos y variables asociadas con la clase texto, son automáticamente heredados por la subclase párrafo.  La herencia es uno de los mecanismos de los lenguajes de programación orientada a objetos basados en clases, por medio del cual una clase se deriva de otra de manera que extiende su funcionalidad. La clase de la que se hereda se suele denominar clase base, clase padre, superclase, clase ancestro (el vocabulario que se utiliza suele depender en gran medida del lenguaje de programación).  En los lenguajes que cuentan con un sistema de tipos fuerte y estrictamente restrictivo con el tipo de datos de las variables, la herencia suele ser un requisito fundamental para poder emplear el Polimorfismo, al igual que un mecanismo que permita decidir en tiempo de ejecución qué método debe invocarse en respuesta a la recepción de un mensaje, conocido como enlace tardío (late binding) o enlace dinámico (dynamic binding).')
INSERT [dbo].[Definiciones] ([IDDefinicion], [Titulo], [IDAutor], [FechaCreacion], [Texto]) VALUES (8, N'Objetos', N'5bff2859-af18-458e-8e4b-898175e09497', CAST(N'2016-12-20 16:21:28.720' AS DateTime), N'En el paradigma de programación orientada a objetos (POO, o bien OOP en inglés), un objeto es una unidad dentro de un programa de computadora que consta de un estado y de un comportamiento, que a su vez constan respectivamente de datos almacenados y de tareas realizables durante el tiempo de ejecución. Un objeto puede ser creado instanciando una clase, como ocurre en la programación orientada a objetos, o mediante escritura directa de código y la replicación otros objetos, como ocurre en la programación basada en prototipos.  Estos objetos interactúan unos con otros, en contraposición a la visión tradicional en la cual un programa es una colección de subrutinas (funciones o procedimientos), o simplemente una lista de instrucciones para el computador. Cada objeto es capaz de recibir mensajes, procesar datos y enviar mensajes a otros objetos de manera similar a un servicio.  En el mundo de la programación orientada a objetos (POO), un objeto es el resultado de la instanciación de una clase.1 Una clase es el anteproyecto que ofrece la funcionalidad en ella definida, pero ésta queda implementada sólo al crear una instancia de la clase, en la forma de un objeto. Por ejemplo: dado un plano para construir sillas (una clase de nombre clase_silla), entonces una silla concreta, en la que podemos sentarnos, construida a partir de este plano, sería un objeto de clase_silla. Es posible crear (construir) múltiples objetos (sillas) utilizando la definición de la clase (plano) anterior. Los conceptos de clase y objetos son análogos a los de tipo de datos y variable; es decir, definida una clase podemos crear objetos de esa clase, igual que disponiendo de un determinado tipo de dato (por ejemplo el tipo entero)')
INSERT [dbo].[Definiciones] ([IDDefinicion], [Titulo], [IDAutor], [FechaCreacion], [Texto]) VALUES (9, N'Base de Datos', N'5bff2859-af18-458e-8e4b-898175e09497', CAST(N'2016-12-20 16:22:35.933' AS DateTime), N'Se le llama base de datos a los bancos de información que contienen datos relativos a diversas temáticas y categorizados de distinta manera, pero que comparten entre sí algún tipo de vínculo o relación que busca ordenarlos y clasificarlos en conjunto.  Una base de datos o banco de datos es un conjunto de datos pertenecientes a un mismo contexto y almacenados sistemáticamente para su posterior uso. En este sentido; una biblioteca puede considerarse una base de datos compuesta en su mayoría por documentos y textos impresos en papel e indexados para su consulta. Actualmente, y debido al desarrollo tecnológico de campos como la informática y la electrónica, la mayoría de las bases de datos están en formato digital, siendo este un componente electrónico, por tanto se ha desarrollado y se ofrece un amplio rango de soluciones al problema del almacenamiento de datos.')
INSERT [dbo].[Definiciones] ([IDDefinicion], [Titulo], [IDAutor], [FechaCreacion], [Texto]) VALUES (10, N'Arquitectura de Capas', N'5bff2859-af18-458e-8e4b-898175e09497', CAST(N'2016-12-20 16:24:42.297' AS DateTime), N'La programación por capas es una arquitectura cliente-servidor en el que el objetivo primordial es la separación de la lógica de negocios de la lógica de diseño; un ejemplo básico de esto consiste en separar la capa de datos de la capa de presentación al usuario. La ventaja principal de este estilo es que el desarrollo se puede llevar a cabo en varios niveles y, en caso de que sobrevenga algún cambio, solo se ataca al nivel requerido sin tener que revisar entre código mezclado. Un buen ejemplo de este método de programación sería el modelo de interconexión de sistemas abiertos.  Además, permite distribuir el trabajo de creación de una aplicación por niveles; de este modo, cada grupo de trabajo está totalmente abstraído del resto de niveles, de forma que basta con conocer la API que existe entre niveles.  En el diseño de sistemas informáticos actual se suelen usar las arquitecturas multinivel o Programación por capas. En dichas arquitecturas a cada nivel se le confía una misión simple, lo que permite el diseño de arquitecturas escalables (que pueden ampliarse con facilidad en caso de que las necesidades aumenten).  El más utilizado actualmente es el diseño en tres niveles (o en tres capas).')
INSERT [dbo].[Definiciones] ([IDDefinicion], [Titulo], [IDAutor], [FechaCreacion], [Texto]) VALUES (11, N'Capa de Presentacion', N'5bff2859-af18-458e-8e4b-898175e09497', CAST(N'2016-12-21 14:26:30.837' AS DateTime), N'Es la que ve el usuario (también se la denomina "capa de usuario"), presenta el sistema al usuario, le comunica la información y captura la información del usuario en un mínimo de proceso (realiza un filtrado previo para comprobar que no hay errores de formato). También es conocida como interfaz gráfica y debe tener la característica de ser "amigable" (entendible y fácil de usar) para el usuario. Esta capa se comunica únicamente con la capa de logica.')
INSERT [dbo].[Definiciones] ([IDDefinicion], [Titulo], [IDAutor], [FechaCreacion], [Texto]) VALUES (13, N'ADO .NET', N'5bff2859-af18-458e-8e4b-898175e09497', CAST(N'2016-12-21 14:40:49.023' AS DateTime), N'Es un conjunto de componentes del software que pueden ser usados por los programadores para acceder a datos y a servicios de datos. Es una parte de la biblioteca de clases base que están incluidas en el Microsoft .NET Framework. Es comúnmente usado por los programadores para acceder y para modificar los datos almacenados en un Sistema Gestor de Bases de Datos Relacionales, aunque también puede ser usado para acceder a datos en fuentes no relacionales. ADO.NET es a veces considerado como una evolución de la tecnología ActiveX Data Objects (ADO), pero fue cambiado tan extensivamente que puede ser concebido como un producto enteramente nuevo.')
INSERT [dbo].[Definiciones] ([IDDefinicion], [Titulo], [IDAutor], [FechaCreacion], [Texto]) VALUES (14, N'Ajax', N'5bff2859-af18-458e-8e4b-898175e09497', CAST(N'2016-12-21 14:41:50.710' AS DateTime), N'Es un conjunto de extensiones para ASP.NET desarrollado por Microsoft para implementar la funcionalidad de Ajax.  Mediante componentes del lado del cliente y del servidor, ASP.NET AJAX permite al desarrollador crear aplicaciones web en ASP.NET 2.0 que pueden actualizar datos en la página web sin una recarga completa de la misma. La tecnología clave que permite esta funcionalidad es el objeto XMLHttpRequest, junto con Javascript y DHTML.  ASP.NET AJAX fue liberado en enero de 2007 después de un largo periodo de pruebas. Fue subsecuentemente incluido con la versión 3.5 del .NET Framework, que fue liberada junto con Visual Studio 2008 en noviembre de 2007.')
INSERT [dbo].[Definiciones] ([IDDefinicion], [Titulo], [IDAutor], [FechaCreacion], [Texto]) VALUES (15, N'ADO .NET Data Services', N'5bff2859-af18-458e-8e4b-898175e09497', CAST(N'2016-12-21 14:42:46.893' AS DateTime), N'Es una plataforma para que Microsoft llame a los servicios de datos, es una combinación del tiempo de ejecución y un servicio web a través del cual los servicios se exponen. Además, también incluye el Data Services Toolkit que permite a Astoria Data Services crearse desde dentro de ASP.NET. El proyecto fue anunciado en Astoria MIX 2007, y la primera vista previa para desarrolladores se puso a disposición el 30 de abril de 2007. El CTP primero se hizo disponible como parte de la ASP.NET 3.5 Vista previa de extensiones. El cambio de nombre de ADO.NET Data Services para WCF Data Services se anunció en 2009.')
INSERT [dbo].[Definiciones] ([IDDefinicion], [Titulo], [IDAutor], [FechaCreacion], [Texto]) VALUES (16, N'Web Config', N'5bff2859-af18-458e-8e4b-898175e09497', CAST(N'2016-12-21 14:45:12.940' AS DateTime), N'Es el archivo principal de opciones de configuración para una aplicación web en ASP.NET. El archivo es un documento XML que define información de configuración concerniente a la aplicación web. El archivo web.config contiene información que controla la carga de módulos, configuraciones de seguridad, configuraciones del estado de la sesión, opciones de compilación y el lenguaje de la aplicación. Los archivos web.config pueden contener también objetos específicos tales como cadenas de conexión a la base de datos.')
SET IDENTITY_INSERT [dbo].[Definiciones] OFF
SET IDENTITY_INSERT [dbo].[Ejemplos] ON 

INSERT [dbo].[Ejemplos] ([IDEjemplo], [Titulo], [Texto], [FechaCreacion], [IDAutor]) VALUES (1, N'Action Link', N'@Html.ActionLink("Titulo del Link", "Nombre de la Vista a la que Direcciona")', CAST(N'2016-12-22 10:28:02.230' AS DateTime), N'95eb3f0d-81cf-4322-b00a-0ad2d8e538ec')
INSERT [dbo].[Ejemplos] ([IDEjemplo], [Titulo], [Texto], [FechaCreacion], [IDAutor]) VALUES (2, N'Prueba', N'@Html.Prueba

@Html.PruebaEnter', CAST(N'2016-12-22 11:32:41.673' AS DateTime), N'5bff2859-af18-458e-8e4b-898175e09497')
SET IDENTITY_INSERT [dbo].[Ejemplos] OFF
SET IDENTITY_INSERT [dbo].[TutorialesYouTube] ON 

INSERT [dbo].[TutorialesYouTube] ([IDTutorial], [Titulo], [LinkYouTube]) VALUES (1, N'.NET', N'https://www.youtube.com/watch?v=pQ6Ezq72J5A')
INSERT [dbo].[TutorialesYouTube] ([IDTutorial], [Titulo], [LinkYouTube]) VALUES (2, N'mvc', N'https://www.youtube.com/watch?v=LxpsTYFanx4')
SET IDENTITY_INSERT [dbo].[TutorialesYouTube] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 27/12/2016 11:44:43 a.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 27/12/2016 11:44:44 a.m. ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 27/12/2016 11:44:44 a.m. ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 27/12/2016 11:44:44 a.m. ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 27/12/2016 11:44:44 a.m. ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 27/12/2016 11:44:44 a.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Temas__92C53B6C29A1ED3C]    Script Date: 27/12/2016 11:44:44 a.m. ******/
ALTER TABLE [dbo].[Temas] ADD UNIQUE NONCLUSTERED 
(
	[Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
