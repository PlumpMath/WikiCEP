USE [master]
GO
/****** Object:  Database [WikiCEPDB]    Script Date: 19/12/2016 09:23:41 a.m. ******/
CREATE DATABASE [WikiCEPDB]
GO
USE [WikiCEPDB];
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
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 19/12/2016 09:23:41 a.m. ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 19/12/2016 09:23:41 a.m. ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 19/12/2016 09:23:41 a.m. ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 19/12/2016 09:23:41 a.m. ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 19/12/2016 09:23:41 a.m. ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 19/12/2016 09:23:41 a.m. ******/
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
/****** Object:  Table [dbo].[Definiciones]    Script Date: 19/12/2016 09:23:41 a.m. ******/
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
/****** Object:  Table [dbo].[Ejemplo_Definicion]    Script Date: 19/12/2016 09:23:41 a.m. ******/
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
/****** Object:  Table [dbo].[Ejemplos]    Script Date: 19/12/2016 09:23:41 a.m. ******/
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
/****** Object:  Table [dbo].[Imagen_Definicion]    Script Date: 19/12/2016 09:23:41 a.m. ******/
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
/****** Object:  Table [dbo].[Imagenes]    Script Date: 19/12/2016 09:23:41 a.m. ******/
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
PRIMARY KEY CLUSTERED 
(
	[IDImagen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tema_Definicion]    Script Date: 19/12/2016 09:23:41 a.m. ******/
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
/****** Object:  Table [dbo].[Temas]    Script Date: 19/12/2016 09:23:41 a.m. ******/
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
/****** Object:  Table [dbo].[Tutorial_Definicion]    Script Date: 19/12/2016 09:23:41 a.m. ******/
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
/****** Object:  Table [dbo].[TutorialesYouTube]    Script Date: 19/12/2016 09:23:41 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TutorialesYouTube](
	[IDTutorial] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](100) NULL,
	[LinkYouTube] [varchar](11) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDTutorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201612161237106_InitialCreate', N'WikiCEP.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FE3B6127E2FD0FF20E8A92D522B97EE624F60B7489DA40DBAB9609DEDE9DB82966887588952252A4D50F4979D87F393FA173A942859E245175BB19D628145440EBF190E87E47038F4DFFFFBFFF887A7C0B71E719C90904EECA3D1A16D61EA861EA1CB899DB2C5B7EFEC1FBEFFF28BF185173C59BF1674279C0E5AD264623F30169D3A4EE23EE00025A380B87198840B3672C3C0415EE81C1F1EFEC7393A723040D8806559E30F296524C0D9077C4E43EAE288A5C8BF0E3DEC27A21C6A6619AA7583029C44C8C513FBBFE433995EDC8D724ADB3AF309022966D85FD816A2346488818CA71F133C63714897B3080A907FFF1C61A05B203FC142F6D31579D76E1C1EF36E38AB8605949B262C0C7A021E9D08BD3872F3B5B46B977A03CD5D8086D933EF75A6BD897DE5E1ACE843E883026486A7533FE6C413FBBA6471964437988D8A86A31CF23206B83FC2F8F3A88A7860756E7750DAD1F1E890FF3BB0A6A9CFD2184F284E598CFC03EB2E9DFBC4FD053FDF879F319D9C1CCD1727EFDEBC45DEC9DBEFF0C99B6A4FA1AF40572B80A2BB388C700CB2E145D97FDB72EAED1CB961D9ACD226D70AD8124C09DBBA464FEF315DB207982CC7EF6CEB923C61AF2811C6F591129841D088C5297CDEA4BE8FE63E2EEB9D469EFCFF06AEC76FDE0EC2F5063D926536F4127F983831CCAB0FD8CF6A930712E5D3AB36DE9F04D9651C06FCBB6E5F79EDA75998C62EEF4C6824B947F112B3BA74636765BC9D4C9A430D6FD605EAFE9B369754356F2D29EFD03A33A160B1EDD950C8FBB27C3B5BDC5914C1E065A6C535D26470F58D6A24B53CB044FDCA648EBA9A0C85AEFC9B57C08B00117F8025B00317F03C16240E70D9CB1F433038447BCB7C8792045600EF67943C34880E7F0E20FA0CBB690C86396328885E9CDBDD4348F14D1ACCB9BD6F8FD7604373FF4778895C16C61794B7DA18EF7DE87E0E537641BD73C4F047E61680FCF39E04DD010611E7CC7571925C8231636F1A82635D005E517672DC1B8E2F4EBB7641A63E2281DE079196D14F05E9CA0FD15328BE88814CE78F3489FA3E5C12DA4DD482D42C6A4ED12AAA20EB2B2A07EB26A9A0340B9A11B4CA99530DE6E1652334BC8B97C1EEBF8FB7D9E66D5A0B2A6A9CC10A897FC214C7B08C797788311CD3D50874593776E12C64C3C799BEF8DE9471FA15F9E9D0ACD69A0DD92230FC6CC860F77F36646242F123F1B857D2E1E05310037C277AFD99AA7DCE49926D7B3AD4BAB96DE6DB59034CD3E52C49429764B34013F212018BBAFCE0C359EDD18BBC377204043A06864EF8960725D0375B36AA5B7A8E7DCCB075E6E621C1294A5CE4A96A840E793D042B76548D60AB48485DB86F149E60E938E68D103F042530530965EAB420D42511F25BB524B5ECB885F1BE973CE49A731C61CA19B66AA20B737DE0830B50F29106A54D4363A76271CD8668F05A4D63DEE6C2AEC65D89476CC5265B7C67835D0AFFED450CB359635B30CE66957411C018C4DB85818AB34A5703900F2EFB66A0D289C960A0C2A5DA8A81D635B60303ADABE4D519687E44ED3AFED27975DFCCB37E50DEFEB6DEA8AE1DD8664D1F7B669AB9EF096D18B4C0B16A9EE7735E899F98E67006728AF359225C5DD94438F80CB37AC866E5EF6AFD50A7194436A226C095A1B5808AEB3F054899503D842B62798DD2092FA2076C11776B84156BBF045BB10115BB7A0D5A21345F96CAC6D9E9F451F6ACB406C5C83B1D162A381A839017AF7AC73B28C514975515D3C517EEE30D573A2606A341412D9EAB4149456706D752619AED5AD239647D5CB28DB424B94F062D159D195C4BC246DB95A4710A7AB8051BA9A8BE850F34D98A4847B9DB94756327CF8C120563C7904235BE465144E8B29252254AAC599E4F35FD76D63FD928C8311C37D1E41C95D2969C5818A325966A8135487A49E2849D2386E688C779A65EA09069F756C3F25FB0AC6E9FEA2016FB4041CDFFCE5B4897F6B57D56754444FB4BE85DC0BD992C84AE197B7D738BA7B7211FC59AA8FD34F4D3809A9D2B73EBFCEEAEDA3E2F5111C68E24BFE23C299A525CDCBADA3B0D8A3A210618A0D26F597F90CC102655175E6755D9264FD48C5204A6AA28A660D5CE06CDE4C0741E28D92FEC3F4EAD082F339F44324A154014F5C4A8E433286095BAEEA8F594932A66BDA63BA29457528594AA7A4859CD1EA90959AD580BCFA0513D45770E6ABE48155DADED8EACC91CA9426BAAD7C0D6C82CD77547D52497548135D5DDB1579926F202BAC73B96F1B4B2D696951F6637DBB30C182FB31A0EB3E555EEECAB4095E29E58E2565E0113E57B6949C613DD5A9694C72F36B324038679C5A9DD74D7179CC6EB793366EDFABAB6A8375DDF9BF1FAD9EB8B5A85729893494AEEE5A14E3ABC8DC541AAFD918C72B2CA496CAB50236CE8CF09C3C188138C66BFFB539F60BE7C1704D78892054E589EB2611F1F1E1D4B6F6DF6E7DD8B93249EAF39889A1EBFD4C76C0BD957F411C5EE038AD55C880DDE86AC409530F315F5F0D3C4FE336B759A452CF85F59F18175957CA4E4F7142AEEE3145B7FA9B99DC3E4CA371FACF6F4654377AD5EFDF6296F7A60DDC630634EAD434997EB8C70FDBD432F69F2A61B48B3F62B88D73BA16A4F0DB4A8D28458FF65C19CB0415E1514527E15A0A7AFFB8AA67D39B011A2E675C0507883A8D094FDBF0E9631F3DF834F9665FEF7EBACFE25C03AA2195F0110DA1F4C7E03D07D192A5AEE70ABD19C87B6B124657A6ECDA1DE28A172D77B93926ABDD14457D3A97BC06D9032BD8665BCB26CE3C176474D32F160D8BB34ED17CF20DE97A4E1553AC76E7385B7991EDC7015F4AFCA0ADE833C364D5ECEEE737FB76D6BA618EE9E2750F6CBF0DD336313D95ABBCFE3DDB6B199C2BC7B6E6CBDB275F7CCD676B57FEED8D23A6FA13BCFBD55D3880C7731BA58705B6E6D1E388713FE3C0423C83DCAFC49A43E99AB2911B585E18AC4CCD49C45263356268EC257A16866DBAFAF62C36FECACA069666BC8BD6CE22DD6FF46DE82A699B721A3711759C1DA9C425DA676CB3AD694F8F49AB2806B3D69493A6FF3591B2FD65F53D2EF204AA9CD1EC31DF1EBC9F11D4425434E9D1E39BDEA752FEC9D955F4E84FD3B21CB1504FF1D458ADDDAAE59D25CD145586CDE9244058914A1B9C60C79B0A59EC58C2C90CBA09AC798B337DD59DC8EDF74CCB177456F5316A50CBA8C83B95F0B787127A0897F96B85C97797C1B653F4F324417404CC263F3B7F4C794F85E29F7A526266480E0DE8588E8F2B1643CB2BB7C2E916E42DA1148A8AF748AEE7110F90096DCD2197AC4EBC806E6F71E2F91FBBC8A009A40DA07A2AEF6F13941CB180589C058B5874FB0612F78FAFE1FB715AA4840540000, N'6.1.3-40302')
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 19/12/2016 09:23:41 a.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 19/12/2016 09:23:41 a.m. ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 19/12/2016 09:23:41 a.m. ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 19/12/2016 09:23:41 a.m. ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 19/12/2016 09:23:41 a.m. ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 19/12/2016 09:23:41 a.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Temas__92C53B6C08FEA797]    Script Date: 19/12/2016 09:23:41 a.m. ******/
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
CREATE VIEW vDefiniciones
AS
SELECT D.IDDefinicion,D.Titulo AS Definicion, D.FechaCreacion AS [Fecha de Creacion], ISNULL(U.Email, 'Anónimo') AS Autor
FROM Definiciones AS D LEFT JOIN AspNetUsers AS U ON D.IDAutor=U.Id
