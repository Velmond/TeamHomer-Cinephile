USE [master]
GO
/****** Object:  Database [CinephileDb]    Script Date: 20.10.2014 г. 22:24:31 ч. ******/
CREATE DATABASE [CinephileDb]
 CONTAINMENT = NONE
GO
ALTER DATABASE [CinephileDb] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CinephileDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CinephileDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CinephileDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CinephileDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CinephileDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CinephileDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [CinephileDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CinephileDb] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [CinephileDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CinephileDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CinephileDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CinephileDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CinephileDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CinephileDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CinephileDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CinephileDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CinephileDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CinephileDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CinephileDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CinephileDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CinephileDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CinephileDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CinephileDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [CinephileDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CinephileDb] SET RECOVERY FULL 
GO
ALTER DATABASE [CinephileDb] SET  MULTI_USER 
GO
ALTER DATABASE [CinephileDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CinephileDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CinephileDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CinephileDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CinephileDb', N'ON'
GO
USE [CinephileDb]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 20.10.2014 г. 22:24:31 ч. ******/
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
/****** Object:  Table [dbo].[Artists]    Script Date: 20.10.2014 г. 22:24:31 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artists](
	[Id] [uniqueidentifier] NOT NULL,
	[FullName] [nvarchar](200) NOT NULL,
	[BirthDate] [date] NULL,
	[CounryId] [int] NOT NULL,
	[PicturePath] [nvarchar](256) NULL,
 CONSTRAINT [PK_Artists] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 20.10.2014 г. 22:24:31 ч. ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 20.10.2014 г. 22:24:31 ч. ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 20.10.2014 г. 22:24:31 ч. ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 20.10.2014 г. 22:24:31 ч. ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 20.10.2014 г. 22:24:31 ч. ******/
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
/****** Object:  Table [dbo].[Coutries]    Script Date: 20.10.2014 г. 22:24:31 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coutries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Coutries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Genres]    Script Date: 20.10.2014 г. 22:24:31 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Languages]    Script Date: 20.10.2014 г. 22:24:31 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Movies]    Script Date: 20.10.2014 г. 22:24:31 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Storyline] [nvarchar](1000) NOT NULL,
	[ReleseDate] [date] NOT NULL,
	[RunningTime] [int] NOT NULL,
	[LanguageId] [int] NOT NULL,
	[PosterPath] [nvarchar](256) NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MoviesActors]    Script Date: 20.10.2014 г. 22:24:31 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MoviesActors](
	[MovieId] [uniqueidentifier] NOT NULL,
	[ActorId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_MoviesActors] PRIMARY KEY CLUSTERED 
(
	[MovieId] ASC,
	[ActorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MoviesCountries]    Script Date: 20.10.2014 г. 22:24:31 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MoviesCountries](
	[MovieId] [uniqueidentifier] NOT NULL,
	[CountryId] [int] NOT NULL,
 CONSTRAINT [PK_MoviesCountries] PRIMARY KEY CLUSTERED 
(
	[MovieId] ASC,
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MoviesDirectors]    Script Date: 20.10.2014 г. 22:24:31 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MoviesDirectors](
	[MovieId] [uniqueidentifier] NOT NULL,
	[DirectorId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_MoviesDirectors] PRIMARY KEY CLUSTERED 
(
	[MovieId] ASC,
	[DirectorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MoviesGenres]    Script Date: 20.10.2014 г. 22:24:31 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MoviesGenres](
	[MovieId] [uniqueidentifier] NOT NULL,
	[GenreId] [int] NOT NULL,
 CONSTRAINT [PK_MoviesGenres] PRIMARY KEY CLUSTERED 
(
	[MovieId] ASC,
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ratings]    Script Date: 20.10.2014 г. 22:24:31 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ratings](
	[UserId] [nvarchar](128) NOT NULL,
	[MovieId] [uniqueidentifier] NOT NULL,
	[RatingValue] [int] NOT NULL,
 CONSTRAINT [PK_Ratings_1] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 20.10.2014 г. 22:24:31 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[UserId] [nvarchar](128) NOT NULL,
	[MovieId] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Body] [nvarchar](2000) NOT NULL,
	[DatePosted] [date] NOT NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201410201729590_InitialCreate', N'Cinephile.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FE3B6127E3FC0F90F829E7A0E522B97B38B6D60EF2275929EA09B0BD6D9A26F0B5AA21D62254A95A83441D15FD687FEA4FE850E254A9678D1C5566CA758601191C36F86C321391C0EFDD71F7F8E3F3C05BEF588E3848474621F8D0E6D0B5337F4085D4EEC942DBE7D677F78FFEF7F8D2FBCE0C9FAA9A03BE174D0922613FB81B1E8D47112F70107281905C48DC3245CB0911B060EF242E7F8F0F03BE7E8C8C100610396658D3FA5949100671FF0390DA98B239622FF3AF4B09F8872A89965A8D60D0A701221174FEC29A1387A203E1EE5B4B675E6130472CCB0BFB02D4469C81003294F3F2778C6E2902E67111420FFFE39C240B7407E8285F4A72BF2AE1D393CE61D71560D0B28374D5818F4043C3A119A71E4E66BE9D72E3507BABB001DB367DEEB4C7F13FBCAC359D1A7D00705C80C4FA77ECC8927F675C9E22C896E301B150D4739E4650C70BF86F1D75115F1C0EADCEEA0B4A4E3D121FF77604D539FA5319E509CB218F907D65D3AF789FB237EBE0FBF623A39399A2F4EDEBD798BBC93B7FFC3276FAA3D85BE025DAD008AEEE230C231C8861765FF6DCBA9B773E48665B34A9B5C2B604B30296CEB1A3D7DC474C91E60BA1CBFB3AD4BF284BDA24418D7674A600E412316A7F07993FA3E9AFBB8AC771A79F2FF1BB81EBF793B08D71BF44896D9D04BFC61E2C430AF3E613FAB4D1E48944FAFDA787F1164977118F0EFBA7DE5B55F66611ABBBC33A191E41EC54BCCEAD28D9D95F17632690E35BC5917A8FB6FDA5C52D5BCB5A4BC43EBCC8482C5B6674321EFCBF2ED6C7167510483979916D74893C1C95BD5486A0BA65150ACCCE6A8ABD950E8CE3F7915BC0810F10758063B7001FF6341E20097BDFC3E04A343B4B7CC7728496015F0FE8F928706D1E1CF01449F61378DC138670C05D18B73BB7B0829BE498339B7F9EDF11A6C68EE7F0D2F91CBC2F882F2561BE37D0CDDAF61CA2EA8778E18FECCDC02907FDE93A03BC020E29CB92E4E924B3066EC4D4370AF0BC02BCA4E8E7BC3F1E569D76EC8D44724D0FB21D242FAA5205DF9227A0AC51F3190E97C9226513F864B42BB895A909A45CD295A4515647D45E560DD24159466413382563973AAC1BCBC6C848677F332D8FDF7F336DBBC4D6B41458D335821F10F98E2189631EF0E318663BA1A812EEBC62E9C856CF838D317DF9B324E3F213F1D9AD55AB3215B04869F0D19ECFECF864C4C287E241EF74A3A1C7E0A6280EF44AF3F57B5CF3949B26D4F875A37B7CD7C3B6B8069BA9C2549E8926C1668C25E226851971F7C38AB3D8291F7468E8240C7C0D009DFF2A004FA66CB46754BCFB18F19B6CEDC3C2C3845898B3C558DD021AF8760C58EAA116C150DA90BF75F8527583A8E7923C40F4109CC5442993A2D08754984FC562D492D3B6E61BCEF250FB9E61C47987286AD9AE8C25C1FFCE002947CA44169D3D0D8A9585CB3211ABC56D398B7B9B0AB715762125BB1C916DFD96097C27F7B11C36CD6D8168CB359255D043006F27661A0E2ACD2D500E483CBBE19A874623218A870A9B662A0758DEDC040EB2A7975069A1F51BB8EBF745EDD37F3AC1F94B7BFAD37AA6B07B659D3C79E9966EE7B421B062D70AC9AE7F99C57E227A6399C819CE27C9608575736110E3EC3AC1EB259F9BB5A3FD46906918DA8097065682DA0E20A50015226540FE18A585EA374C28BE8015BC4DD1A61C5DA2FC1566C40C5AE5E855608CD17A6B271763A7D943D2BAD4131F24E87850A8EC620E4C5ABDEF10E4A31C56555C574F185FB78C3958E89C16850508BE76A5052D199C1B5549866BB96740E591F976C232D49EE93414B456706D792B0D17625699C821E6EC1462AAA6FE1034DB622D251EE3665DDD8C9F3A344C1D83124528DAF511411BAAC245689126B26B2AABE9DF54F380A720CC74D347947A5B4252716C66889A55A600D925E923861E788A139E2719EA9172864DABDD5B0FC172CABDBA73A88C53E5050F3BF458C57BEB8AFEDB4AA2B22102EA17F01F767B220BA66F4F5CD2D9EE6867C146BE2F6D3D04F036A76AFCCADF3DBBB6AFBBC4445183B92FC8AFBA4E84A7172EB8AEF342CEA941864884ADF65FD61324398945D789E55759BBC51334A119CAAA29802563B1B369313D363A864EFB0FF48B522BCCC9C122929550051D413A392D5A08055EABAA3D6134FAA98F59AEE885276491552AAEA21653587A42664B5622D3C8346F514DD39A859235574B5B63BB2267FA40AADA95E035B23B35CD71D5593625205D65477C75EE59BC84BE81EEF5AC633CB9ADB567EA8DD6CDF3260BCCC7A38CCB657B9BBAF02558A7B6289DB79054C94EFA52D194F766BDA521EC9D8CC960C18E655A776E75D5F741A2FEACD98B58BECDAC2DE74916FC6EB67B12F6A17CAB14E2629B997C73BE918371647AA0E8F66E433564E625B851A61537F4E180E469C6034FBC59FFA04F325BC20B846942C70C2F2E40DFBF8F0E8587A79B33FAF609C24F17CCD91D4F414A63E665BC8C3A28F28761F50AC66456CF0526405AA049CAFA8879F26F66F59ABD32C76C1FFCA8A0FACABE43325BFA450711FA7D8FA5DCDF21C2673BEF978B5A7EF1CBA6BF5EAE72F79D303EB368619736A1D4ABA5C6784EBAF1F7A499337DD409AB5DF44BCDE09557B74A0459526C4FA6F0CE6840DF2BEA090F29B003DFDA7AF68DA37041B216ADE090C8537880A4DEF00D6C132BE01F0E093656F00FA7556FF26601DD18CEF0108ED0F26BF06E8BE0C152D77B8D5684E44DB5892323DB766536F945AB9EBBD4949BADE68A2AB89D53DE036489E5EC3325E59DEF160BBA326AD7830EC5D9AF68BE712EF4BFAF02AB163B759C3DB4C146EB810FA47E507EF41469B264367F759C0DBB635531477CF5329FBE5FAEE99B189BCADDD67F46EDBD84C61DE3D37B65E79BB7B666BBBDA3F776C699DB7D09D67E1AA094586DB185D2CB82DCB360F9CC3097F1E8211E41E65FE38529FD6D59492DAC2704562666ACE2793192B1347E1AB5034B3EDD757B1E1377656D034B335646136F116EB7F236F41D3CCDB90DBB88BFC606D76A12E67BB651D6B4A7F7A4DF9C0B59EB4A49FB7F9AC8D57EBAF29FD7710A5D4668FE18EF8F564FB0EA29221A74E8FEC5EF5BA17F6CECA2F29C2FE9D90E50A82FFAE22C56E6DD72C69AEE8222C366F49A282448AD05C63863CD852CF624616C86550CD63CCD9EBEE2C6EC76F3AE6D8BBA2B7298B52065DC6C1DCAF05BCB813D0C43F4B61AECB3CBE8DB21F2A19A20B2026E1B1F95BFA7D4A7CAF94FB521313324070EF424474F958321ED95D3E97483721ED0824D4573A45F738887C004B6EE90C3DE2756403F3FB8897C87D5E45004D20ED035157FBF89CA0658C824460ACDAC327D8B0173CBDFF1B989EAA7650540000, N'6.1.1-30610')
SET IDENTITY_INSERT [dbo].[Coutries] ON 

INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (2, N'Afghanistan
')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (3, N'Albania')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (4, N'Algeria')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (5, N'American Samoa')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (6, N'Andorra')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (7, N'Angola')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (8, N'Anguilla')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (9, N'Antarctica')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (10, N'Antigua and Barbuda')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (11, N'Argentina')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (12, N'Armenia')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (13, N'Aruba')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (14, N'Australia')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (15, N'Austria')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (16, N'Azerbaijan')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (17, N'Bahamas')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (18, N'Bahrain')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (19, N'Bangladesh')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (20, N'Barbados')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (21, N'Belarus')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (22, N'Belgium')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (23, N'Belize')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (24, N'Benin')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (25, N'Bermuda')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (26, N'Bhutan')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (27, N'Bolivia')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (28, N'Bosnia and Herzegovina')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (29, N'Botswana')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (30, N'Brazil')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (31, N'Brunei Darussalam')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (32, N'Bulgaria')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (33, N'Burkina Faso')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (34, N'Burundi')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (35, N'Cambodia')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (36, N'Cameroon')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (37, N'Canada')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (38, N'Cape Verde')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (39, N'Cayman Islands')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (40, N'Central African Republic')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (41, N'Chad')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (42, N'Chile')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (43, N'China')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (44, N'Christmas Island')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (45, N'Cocos (Keeling) Islands')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (46, N'Colombia')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (47, N'Comoros')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (48, N'Democratic Republic of the Congo')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (49, N'Republic of Congo')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (50, N'Cook Islands')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (51, N'Costa Rica')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (52, N'Ivory Coast')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (53, N'Croatia')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (54, N'Cuba')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (55, N'Cyprus')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (56, N'Czech Republic')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (57, N'Denmark')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (58, N'Djibouti')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (59, N'Dominica')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (60, N'Dominican Republic')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (61, N'East Timor')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (62, N'Ecuador')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (63, N'Egypt')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (64, N'El Salvador')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (65, N'Equatorial Guinea')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (66, N'Eritrea')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (67, N'Estonia')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (68, N'Ethiopia')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (69, N'Falkland Islands')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (70, N'Faroe Islands')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (71, N'Fiji')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (72, N'Finland')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (73, N'France')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (74, N'French Guiana')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (75, N'French Polynesia')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (76, N'French Southern Territories')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (77, N'Gabon')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (78, N'Gambia')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (79, N'Georgia')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (80, N'Germany')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (81, N'Ghana')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (82, N'Gibraltar')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (84, N'Greece')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (85, N'Greenland')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (86, N'Grenada')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (87, N'Guadeloupe')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (88, N'Guam')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (89, N'Guatemala')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (90, N'Guinea')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (91, N'Guinea-Bissau')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (92, N'Guyana')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (93, N'Haiti')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (95, N'Honduras')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (96, N'Hong Kong')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (97, N'Hungary')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (98, N'Iceland')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (99, N'India')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (100, N'Indonesia')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (101, N'Iran')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (102, N'Iraq')
GO
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (103, N'Ireland')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (104, N'Israel')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (105, N'Italy')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (106, N'Jamaica')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (107, N'Japan')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (108, N'Jordan')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (109, N'Kazakhstan')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (110, N'Kenya')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (111, N'Kiribati')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (112, N'North Korea')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (113, N'South Korea')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (114, N'Kosovo')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (115, N'Kuwait')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (116, N'Kyrgyzstan')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (117, N'Lao')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (118, N'Latvia')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (119, N'Lebanon')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (120, N'Lesotho')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (121, N'Liberia')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (122, N'Libya')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (123, N'Liechtenstein')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (124, N'Lithuania')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (125, N'Luxembourg')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (126, N'Macau')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (127, N'FYR Macedonia')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (128, N'Madagascar')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (129, N'Malawi')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (130, N'Malaysia')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (131, N'Maldives')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (132, N'Mali')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (133, N'Malta')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (134, N'Marshall Islands')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (135, N'Martinique')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (136, N'Mauritania')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (137, N'Mauritius')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (138, N'Mayotte')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (139, N'Mexico')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (140, N'Micronesia')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (141, N'Moldova')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (142, N'Monaco')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (143, N'Mongolia')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (144, N'Montenegro')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (145, N'Montserrat')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (146, N'Morocco')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (147, N'Mozambique')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (148, N'Myanmar')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (149, N'Namibia')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (150, N'Nauru')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (151, N'Nepal')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (152, N'Netherlands')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (153, N'Netherlands Antilles')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (154, N'New Caledonia')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (155, N'New Zealand')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (156, N'Nicaragua')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (157, N'Niger')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (158, N'Nigeria')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (159, N'Niue')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (160, N'Northern Mariana Islands')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (161, N'Norway')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (162, N'Oman')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (163, N'Pakistan')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (164, N'Palau')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (165, N'Palestinian territories')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (166, N'Panama')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (167, N'Papua New Guinea')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (168, N'Paraguay')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (169, N'Peru')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (170, N'Philippines')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (171, N'Pitcairn Island')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (172, N'Poland')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (173, N'Portugal')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (174, N'Puerto Rico')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (175, N'Qatar')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (176, N'Reunion Island')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (177, N'Romania')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (178, N'Russian Federation')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (179, N'Rwanda')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (180, N'Saint Kitts and Nevis')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (181, N'Saint Lucia')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (182, N'Saint Vincent and the Grenadines')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (183, N'Samoa')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (184, N'San Marino')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (185, N'Sao Tome and Principe')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (186, N'Saudi Arabia')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (187, N'Senegal')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (188, N'Serbia')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (189, N'Seychelles')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (190, N'Sierra Leone')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (191, N'Singapore')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (192, N'Slovakia')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (193, N'Slovenia')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (194, N'Solomon Islands')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (195, N'Somalia')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (196, N'South Africa')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (197, N'South Sudan')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (198, N'Spain')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (199, N'Sri Lanka')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (200, N'Sudan')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (201, N'Suriname')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (202, N'Swaziland')
GO
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (203, N'Sweden')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (204, N'Switzerland')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (205, N'Syria')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (206, N'Taiwan')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (207, N'Tajikistan')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (208, N'Tanzania')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (209, N'Thailand')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (210, N'Tibet')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (211, N'Timor-Leste')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (212, N'Togo')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (213, N'Tokelau')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (214, N'Tonga')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (215, N'Trinidad and Tobago')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (216, N'Tunisia')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (217, N'Turkey')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (218, N'Turkmenistan')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (219, N'Turks and Caicos Islands')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (220, N'Tuvalu')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (221, N'Uganda')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (222, N'Ukraine')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (223, N'United Arab Emirates')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (224, N'United Kingdom')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (225, N'United States')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (226, N'Uruguay')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (227, N'Uzbekistan')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (228, N'Vanuatu')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (229, N'Venezuela')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (230, N'Vietnam')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (231, N'Vatican City State')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (232, N'Virgin Islands (British)')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (233, N'Virgin Islands (U.S.)')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (234, N'Wallis and Futuna Islands')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (235, N'Western Sahara')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (236, N'Yemen')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (237, N'Zambia')
INSERT [dbo].[Coutries] ([Id], [Name]) VALUES (238, N'Zimbabwe')
SET IDENTITY_INSERT [dbo].[Coutries] OFF
SET IDENTITY_INSERT [dbo].[Genres] ON 

INSERT [dbo].[Genres] ([Id], [Name]) VALUES (1, N'Action')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (2, N'Adult')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (3, N'Adventure')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (4, N'Avant-garde/Experimental')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (5, N'Animation')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (6, N'Comedy')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (7, N'Crime')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (8, N'Culture/Society')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (9, N'Dance')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (10, N'Drama')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (11, N'Education')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (12, N'Epic')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (13, N'Fantasy')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (14, N'Health/Fitness')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (15, N'Historical')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (16, N'Horror')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (17, N'Musical')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (18, N'Mystery')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (19, N'Nature')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (20, N'Romance')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (21, N'Science Fiction')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (22, N'Theater')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (23, N'Biography')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (24, N'Thriller')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (25, N'Travel')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (26, N'War')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (27, N'Western')
SET IDENTITY_INSERT [dbo].[Genres] OFF
SET IDENTITY_INSERT [dbo].[Languages] ON 

INSERT [dbo].[Languages] ([Id], [Name]) VALUES (1, N'Mandarin')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (2, N'Spanish')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (3, N'English')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (4, N'Hindi')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (5, N'Arabic')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (6, N'Portuguese')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (7, N'Bengali')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (8, N'Russian')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (9, N'Japanese')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (10, N'Punjabi')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (11, N'German')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (12, N'Javanese')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (13, N'Wu')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (14, N'Malay/Indonesian')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (15, N'Telugu')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (16, N'Vietnamese')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (17, N'Korean')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (18, N'French')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (19, N'Marathi')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (20, N'Tamil')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (21, N'Urdu')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (22, N'Turkish')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (23, N'Italian')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (24, N'Cantonese')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (25, N'Persian')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (26, N'Thai')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (27, N'Gujarati')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (28, N'Jin')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (29, N'Min Nan')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (30, N'Polish')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (31, N'Pashto')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (32, N'Kannada')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (33, N'Xiang')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (34, N'Malayalam')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (35, N'Sundanese')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (36, N'Hausa')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (37, N'Oriya')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (38, N'Burmese')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (39, N'Hakka')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (40, N'Ukrainian')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (41, N'Bhojpuri')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (42, N'Tagalog')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (43, N'Yoruba')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (44, N'Maithili')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (45, N'Swahili')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (46, N'Uzbek')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (47, N'Sindhi')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (48, N'Amharic')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (49, N'Fula')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (50, N'Romanian')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (51, N'Oromo')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (52, N'Igbo')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (53, N'Azerbaijani')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (54, N'Awadhi')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (55, N'Gan')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (56, N'Cebuano')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (57, N'Dutch')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (58, N'Kurdish')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (59, N'Lao')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (60, N'Serbo-Croatian')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (61, N'Malagasy')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (62, N'Saraiki')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (63, N'Nepali')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (64, N'Sinhalese')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (65, N'Chittagonian')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (66, N'Zhuang')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (67, N'Khmer')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (68, N'Assamese')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (69, N'Madurese')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (70, N'Somali')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (71, N'Marwari')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (72, N'Magahi')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (73, N'Haryanvi')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (74, N'Hungarian')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (75, N'Chhattisgarhi')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (76, N'Greek')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (77, N'Chewa')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (78, N'Deccan')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (79, N'Akan')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (80, N'Kazakh')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (81, N'Min Bei')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (82, N'Sylheti')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (83, N'Zulu')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (84, N'Czech')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (85, N'Kinyarwanda')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (86, N'Dhundhari')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (87, N'Haitian Creole')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (88, N'Min Dong')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (89, N'Ilokano')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (90, N'Quechua')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (91, N'Kirundi')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (92, N'Swedish')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (93, N'Hmong')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (94, N'Shona')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (95, N'Uyghur')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (96, N'Hiligaynon')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (97, N'Mossi')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (98, N'Xhosa')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (99, N'Belarusian')
GO
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (100, N'Balochi')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (101, N'Bulgarian')
SET IDENTITY_INSERT [dbo].[Languages] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 20.10.2014 г. 22:24:32 ч. ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 20.10.2014 г. 22:24:32 ч. ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 20.10.2014 г. 22:24:32 ч. ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 20.10.2014 г. 22:24:32 ч. ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 20.10.2014 г. 22:24:32 ч. ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 20.10.2014 г. 22:24:32 ч. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Artists]  WITH CHECK ADD  CONSTRAINT [FK_Artists_Coutries] FOREIGN KEY([CounryId])
REFERENCES [dbo].[Coutries] ([Id])
GO
ALTER TABLE [dbo].[Artists] CHECK CONSTRAINT [FK_Artists_Coutries]
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
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD  CONSTRAINT [FK_Movies_Languages] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Languages] ([Id])
GO
ALTER TABLE [dbo].[Movies] CHECK CONSTRAINT [FK_Movies_Languages]
GO
ALTER TABLE [dbo].[MoviesActors]  WITH CHECK ADD  CONSTRAINT [FK_MoviesActors_Artists] FOREIGN KEY([ActorId])
REFERENCES [dbo].[Artists] ([Id])
GO
ALTER TABLE [dbo].[MoviesActors] CHECK CONSTRAINT [FK_MoviesActors_Artists]
GO
ALTER TABLE [dbo].[MoviesActors]  WITH CHECK ADD  CONSTRAINT [FK_MoviesActors_Movies] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([Id])
GO
ALTER TABLE [dbo].[MoviesActors] CHECK CONSTRAINT [FK_MoviesActors_Movies]
GO
ALTER TABLE [dbo].[MoviesCountries]  WITH CHECK ADD  CONSTRAINT [FK_MoviesCountries_Coutries] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Coutries] ([Id])
GO
ALTER TABLE [dbo].[MoviesCountries] CHECK CONSTRAINT [FK_MoviesCountries_Coutries]
GO
ALTER TABLE [dbo].[MoviesCountries]  WITH CHECK ADD  CONSTRAINT [FK_MoviesCountries_Movies] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([Id])
GO
ALTER TABLE [dbo].[MoviesCountries] CHECK CONSTRAINT [FK_MoviesCountries_Movies]
GO
ALTER TABLE [dbo].[MoviesDirectors]  WITH CHECK ADD  CONSTRAINT [FK_MoviesDirectors_Artists] FOREIGN KEY([DirectorId])
REFERENCES [dbo].[Artists] ([Id])
GO
ALTER TABLE [dbo].[MoviesDirectors] CHECK CONSTRAINT [FK_MoviesDirectors_Artists]
GO
ALTER TABLE [dbo].[MoviesDirectors]  WITH CHECK ADD  CONSTRAINT [FK_MoviesDirectors_Movies] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([Id])
GO
ALTER TABLE [dbo].[MoviesDirectors] CHECK CONSTRAINT [FK_MoviesDirectors_Movies]
GO
ALTER TABLE [dbo].[MoviesGenres]  WITH CHECK ADD  CONSTRAINT [FK_MoviesGenres_Genres] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genres] ([Id])
GO
ALTER TABLE [dbo].[MoviesGenres] CHECK CONSTRAINT [FK_MoviesGenres_Genres]
GO
ALTER TABLE [dbo].[MoviesGenres]  WITH CHECK ADD  CONSTRAINT [FK_MoviesGenres_Movies] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([Id])
GO
ALTER TABLE [dbo].[MoviesGenres] CHECK CONSTRAINT [FK_MoviesGenres_Movies]
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [FK_Ratings_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [FK_Ratings_AspNetUsers]
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [FK_Ratings_Movies] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([Id])
GO
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [FK_Ratings_Movies]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_AspNetUsers]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Movies] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([Id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Movies]
GO
USE [master]
GO
ALTER DATABASE [CinephileDb] SET  READ_WRITE 
GO
