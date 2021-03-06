USE [asepz]
GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'Themes', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Themes'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'Themes', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Themes'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'PaintingMediums', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PaintingMediums'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'PaintingMediums', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PaintingMediums'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'GeographicalLocations', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GeographicalLocations'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'GeographicalLocations', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GeographicalLocations'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'CreationYears', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CreationYears'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'CreationYears', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CreationYears'

GO
/****** Object:  View [dbo].[Themes]    Script Date: 30/6/2018 5:49:02 μμ ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Themes]'))
DROP VIEW [dbo].[Themes]
GO
/****** Object:  View [dbo].[PaintingMediums]    Script Date: 30/6/2018 5:49:02 μμ ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PaintingMediums]'))
DROP VIEW [dbo].[PaintingMediums]
GO
/****** Object:  View [dbo].[GeographicalLocations]    Script Date: 30/6/2018 5:49:02 μμ ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[GeographicalLocations]'))
DROP VIEW [dbo].[GeographicalLocations]
GO
/****** Object:  View [dbo].[CreationYears]    Script Date: 30/6/2018 5:49:02 μμ ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[CreationYears]'))
DROP VIEW [dbo].[CreationYears]
GO
/****** Object:  View [dbo].[CPanelActivityLog]    Script Date: 30/6/2018 5:49:02 μμ ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[CPanelActivityLog]'))
DROP VIEW [dbo].[CPanelActivityLog]
GO
/****** Object:  Table [dbo].[ThumbnailDimensions]    Script Date: 30/6/2018 5:49:02 μμ ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ThumbnailDimensions]') AND type in (N'U'))
DROP TABLE [dbo].[ThumbnailDimensions]
GO
/****** Object:  Table [dbo].[PressRoom]    Script Date: 30/6/2018 5:49:02 μμ ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PressRoom]') AND type in (N'U'))
DROP TABLE [dbo].[PressRoom]
GO
/****** Object:  Table [dbo].[PressItemCategories]    Script Date: 30/6/2018 5:49:02 μμ ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PressItemCategories]') AND type in (N'U'))
DROP TABLE [dbo].[PressItemCategories]
GO
/****** Object:  Table [dbo].[PhotoGalleries]    Script Date: 30/6/2018 5:49:02 μμ ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PhotoGalleries]') AND type in (N'U'))
DROP TABLE [dbo].[PhotoGalleries]
GO
/****** Object:  Table [dbo].[PageTypes]    Script Date: 30/6/2018 5:49:02 μμ ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PageTypes]') AND type in (N'U'))
DROP TABLE [dbo].[PageTypes]
GO
/****** Object:  Table [dbo].[PageItems]    Script Date: 30/6/2018 5:49:02 μμ ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PageItems]') AND type in (N'U'))
DROP TABLE [dbo].[PageItems]
GO
/****** Object:  Table [dbo].[ImageCategories]    Script Date: 30/6/2018 5:49:02 μμ ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ImageCategories]') AND type in (N'U'))
DROP TABLE [dbo].[ImageCategories]
GO
/****** Object:  Table [dbo].[ImageBase]    Script Date: 30/6/2018 5:49:02 μμ ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ImageBase]') AND type in (N'U'))
DROP TABLE [dbo].[ImageBase]
GO
/****** Object:  Table [dbo].[FileCategories]    Script Date: 30/6/2018 5:49:02 μμ ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FileCategories]') AND type in (N'U'))
DROP TABLE [dbo].[FileCategories]
GO
/****** Object:  Table [dbo].[FileBase]    Script Date: 30/6/2018 5:49:02 μμ ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FileBase]') AND type in (N'U'))
DROP TABLE [dbo].[FileBase]
GO
/****** Object:  Table [dbo].[DocumentCategories]    Script Date: 30/6/2018 5:49:02 μμ ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DocumentCategories]') AND type in (N'U'))
DROP TABLE [dbo].[DocumentCategories]
GO
/****** Object:  Table [dbo].[DocumentBase]    Script Date: 30/6/2018 5:49:02 μμ ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DocumentBase]') AND type in (N'U'))
DROP TABLE [dbo].[DocumentBase]
GO
/****** Object:  Table [dbo].[CPanelUsers]    Script Date: 30/6/2018 5:49:02 μμ ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CPanelUsers]') AND type in (N'U'))
DROP TABLE [dbo].[CPanelUsers]
GO
/****** Object:  Table [dbo].[CPanelUserPrivs]    Script Date: 30/6/2018 5:49:02 μμ ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CPanelUserPrivs]') AND type in (N'U'))
DROP TABLE [dbo].[CPanelUserPrivs]
GO
/****** Object:  Table [dbo].[CPanelPrivileges]    Script Date: 30/6/2018 5:49:02 μμ ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CPanelPrivileges]') AND type in (N'U'))
DROP TABLE [dbo].[CPanelPrivileges]
GO
/****** Object:  Table [dbo].[CPanelPrivGroups]    Script Date: 30/6/2018 5:49:02 μμ ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CPanelPrivGroups]') AND type in (N'U'))
DROP TABLE [dbo].[CPanelPrivGroups]
GO
/****** Object:  Table [dbo].[CPanelAccessLog]    Script Date: 30/6/2018 5:49:02 μμ ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CPanelAccessLog]') AND type in (N'U'))
DROP TABLE [dbo].[CPanelAccessLog]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 30/6/2018 5:49:02 μμ ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Countries]') AND type in (N'U'))
DROP TABLE [dbo].[Countries]
GO
/****** Object:  Table [dbo].[ArtWork]    Script Date: 30/6/2018 5:49:02 μμ ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ArtWork]') AND type in (N'U'))
DROP TABLE [dbo].[ArtWork]
GO
USE [master]
GO
/****** Object:  Database [asepz]    Script Date: 30/6/2018 5:49:02 μμ ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'asepz')
DROP DATABASE [asepz]
GO
/****** Object:  Database [asepz]    Script Date: 30/6/2018 5:49:02 μμ ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'asepz')
BEGIN
CREATE DATABASE [asepz]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GNRWEB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\asepz.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'GNRWEB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\asepz_log.ldf' , SIZE = 10240KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
ALTER DATABASE [asepz] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [asepz].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [asepz] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [asepz] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [asepz] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [asepz] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [asepz] SET ARITHABORT OFF 
GO
ALTER DATABASE [asepz] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [asepz] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [asepz] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [asepz] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [asepz] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [asepz] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [asepz] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [asepz] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [asepz] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [asepz] SET  DISABLE_BROKER 
GO
ALTER DATABASE [asepz] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [asepz] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [asepz] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [asepz] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [asepz] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [asepz] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [asepz] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [asepz] SET RECOVERY FULL 
GO
ALTER DATABASE [asepz] SET  MULTI_USER 
GO
ALTER DATABASE [asepz] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [asepz] SET DB_CHAINING OFF 
GO
ALTER DATABASE [asepz] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [asepz] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [asepz] SET DELAYED_DURABILITY = DISABLED 
GO
USE [asepz]
GO
/****** Object:  Table [dbo].[ArtWork]    Script Date: 30/6/2018 5:49:03 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ArtWork]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ArtWork](
	[ArtWorkID] [bigint] IDENTITY(1,1) NOT NULL,
	[ArtWorkTheme] [nvarchar](1024) NOT NULL,
	[CreationYear] [int] NOT NULL CONSTRAINT [DF_ArtWork_ProductionYear]  DEFAULT (datepart(year,getdate())),
	[PaintingMedium] [nvarchar](256) NOT NULL,
	[PaintingWidth] [int] NOT NULL,
	[PaintingHeight] [int] NOT NULL,
	[ArtWorkFullsizeURL] [nvarchar](1024) NOT NULL,
	[ArtWorkThumbnailURL] [nvarchar](1024) NOT NULL,
	[ArtistFullName] [nvarchar](256) NOT NULL,
	[ArtistBirthYear] [int] NOT NULL,
	[ArtistBYearUponCreation]  AS ([CreationYear]-[ArtistBirthYear]),
	[PlaceOfResidence] [nvarchar](128) NOT NULL,
	[SenderFullname] [nvarchar](256) NOT NULL CONSTRAINT [DF_ArtWork_SenderFullname]  DEFAULT (N'ΠΑΙΔΙΚΗ ΠΙΝΑΚΟΘΗΚΕ ΕΛΛΑΔΟΣ'),
	[SenderEmailAddress] [nvarchar](512) NOT NULL CONSTRAINT [DF_ArtWork_SenderEmailAddress]  DEFAULT (N'paidiki.pinakothiki.elladas@gmail.com'),
	[SenderPhone] [nvarchar](24) NOT NULL CONSTRAINT [DF_ArtWork_SenderPhone]  DEFAULT ((2241000000.)),
	[SenderCellPhune] [nvarchar](24) NOT NULL CONSTRAINT [DF_ArtWork_SenderCellPhune]  DEFAULT ((6900000000.)),
	[SenderRelationToArtist] [nvarchar](32) NOT NULL CONSTRAINT [DF_ArtWork_SenderRelationToArtist]  DEFAULT (N'ΓΟΝΕΑΣ'),
	[PaimentMethod] [nvarchar](64) NOT NULL CONSTRAINT [DF_ArtWork_PaimentMethod]  DEFAULT (N'bank transfer'),
	[SubmissionDate] [datetime] NOT NULL CONSTRAINT [DF_ArtWork_SubmissionDate]  DEFAULT (getdate()),
	[ShowInCollection] [bit] NOT NULL CONSTRAINT [DF_ArtWork_ShowInCollection]  DEFAULT ((1)),
 CONSTRAINT [PK_ArtWork] PRIMARY KEY CLUSTERED 
(
	[ArtWorkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 30/6/2018 5:49:03 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Countries]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Countries](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CPanelAccessLog]    Script Date: 30/6/2018 5:49:03 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CPanelAccessLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CPanelAccessLog](
	[AccessLogID] [int] IDENTITY(1,1) NOT NULL,
	[CPanelUserID] [int] NULL,
	[RemoteHost] [nvarchar](15) NOT NULL,
	[LogEntry] [nvarchar](255) NULL,
	[EventType] [nvarchar](32) NOT NULL,
	[LogEntryDate] [datetime] NOT NULL CONSTRAINT [DF_CPanelAccessLog_LogEntryDate]  DEFAULT (getdate()),
	[UserSessionID] [nvarchar](32) NULL,
 CONSTRAINT [PK_CPanelAccessLog] PRIMARY KEY CLUSTERED 
(
	[AccessLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CPanelPrivGroups]    Script Date: 30/6/2018 5:49:03 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CPanelPrivGroups]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CPanelPrivGroups](
	[PrivilegeGroupID] [int] NOT NULL,
	[PrivilegeGroupName] [nvarchar](128) NOT NULL,
	[DisplayOrder] [tinyint] NOT NULL,
	[IsEnabled] [bit] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CPanelPrivileges]    Script Date: 30/6/2018 5:49:03 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CPanelPrivileges]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CPanelPrivileges](
	[PrivilegeID] [int] NOT NULL,
	[PrivilegeDescription] [nvarchar](64) NULL,
	[DisplayOrder] [tinyint] NOT NULL,
	[StartupScript] [nvarchar](64) NOT NULL,
	[PrivilegeGroupID] [int] NOT NULL,
	[IsEnabled] [bit] NOT NULL,
 CONSTRAINT [PK_CPanelPrivileges] PRIMARY KEY CLUSTERED 
(
	[PrivilegeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CPanelUserPrivs]    Script Date: 30/6/2018 5:49:03 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CPanelUserPrivs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CPanelUserPrivs](
	[UserPrivilegeID] [int] IDENTITY(1,1) NOT NULL,
	[CPanelUserID] [int] NOT NULL,
	[PrivilegeID] [int] NOT NULL,
 CONSTRAINT [PK_CPanelUserPrivs] PRIMARY KEY CLUSTERED 
(
	[UserPrivilegeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CPanelUsers]    Script Date: 30/6/2018 5:49:03 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CPanelUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CPanelUsers](
	[CPanelUserID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](64) NULL,
	[UserName] [nvarchar](18) NOT NULL,
	[UserPass] [nvarchar](64) NOT NULL,
	[UserEmail] [nvarchar](128) NULL,
	[IPRestriction1] [nvarchar](15) NULL,
	[IPRestriction2] [nvarchar](15) NULL,
	[IPRestriction3] [nvarchar](15) NULL,
	[IsEnabled] [bit] NOT NULL,
 CONSTRAINT [PK_CPanelUsers] PRIMARY KEY CLUSTERED 
(
	[CPanelUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DocumentBase]    Script Date: 30/6/2018 5:49:03 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DocumentBase]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DocumentBase](
	[DocumentID] [int] IDENTITY(1,1) NOT NULL,
	[DocTitle] [nvarchar](255) NULL,
	[DocName] [nvarchar](255) NOT NULL,
	[DocContentType] [nvarchar](64) NOT NULL,
	[DocFileSize] [bigint] NOT NULL,
	[DocFileExt] [nvarchar](50) NOT NULL,
	[DocURL] [nvarchar](255) NOT NULL,
	[DocumentCategoryID] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_DocumentBase] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DocumentCategories]    Script Date: 30/6/2018 5:49:03 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DocumentCategories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DocumentCategories](
	[DocumentCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[DocumentCategory] [nvarchar](64) NOT NULL,
	[DocumentStoragePath] [nvarchar](512) NULL,
 CONSTRAINT [PK_DocumentCategories] PRIMARY KEY CLUSTERED 
(
	[DocumentCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[FileBase]    Script Date: 30/6/2018 5:49:03 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FileBase]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FileBase](
	[FileID] [int] IDENTITY(1,1) NOT NULL,
	[FileTitle] [nvarchar](255) NULL,
	[FileName] [nvarchar](255) NOT NULL,
	[FileContentType] [nvarchar](64) NOT NULL,
	[FileSize] [bigint] NOT NULL,
	[FileExt] [nchar](10) NOT NULL,
	[FileURL] [nvarchar](255) NOT NULL,
	[FileCategoryID] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_FileBase] PRIMARY KEY CLUSTERED 
(
	[FileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[FileCategories]    Script Date: 30/6/2018 5:49:03 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FileCategories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FileCategories](
	[FileCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[FileCategory] [nvarchar](64) NOT NULL,
	[FileStoragePath] [nvarchar](512) NOT NULL,
 CONSTRAINT [PK_FileCategories] PRIMARY KEY CLUSTERED 
(
	[FileCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ImageBase]    Script Date: 30/6/2018 5:49:03 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ImageBase]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ImageBase](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[ImageName] [nvarchar](255) NOT NULL,
	[ImageCaption] [nvarchar](255) NULL,
	[ImageFormat] [nvarchar](4) NOT NULL,
	[ImageWidth] [int] NOT NULL,
	[ImageHeight] [int] NOT NULL,
	[ImageSize] [bigint] NOT NULL,
	[ImageExtension] [nvarchar](4) NOT NULL,
	[ImageURL] [nvarchar](255) NOT NULL,
	[ThumbnailURL] [nvarchar](255) NULL,
	[ThumbnailWidth] [int] NULL,
	[ThumbnailHeight] [int] NULL,
	[ImageCategoryID] [int] NOT NULL CONSTRAINT [DF_ImageBase_ImageCategoryID]  DEFAULT ((1)),
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ImageBase] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ImageCategories]    Script Date: 30/6/2018 5:49:03 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ImageCategories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ImageCategories](
	[ImageCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[ImageCategory] [nvarchar](64) NOT NULL,
	[ImageFullsizeStoragePath] [nvarchar](512) NULL,
	[ImageThumbnailStoragePath] [nvarchar](512) NULL,
 CONSTRAINT [PK_ImageCategories] PRIMARY KEY CLUSTERED 
(
	[ImageCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PageItems]    Script Date: 30/6/2018 5:49:03 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PageItems]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PageItems](
	[PageItemID] [int] IDENTITY(1,1) NOT NULL,
	[PageTitle] [nvarchar](255) NOT NULL,
	[MetaDescription] [ntext] NULL,
	[MetaKeywords] [ntext] NULL,
	[PageBody] [ntext] NULL,
	[PageTypeID] [int] NOT NULL,
	[PublicationDate] [datetime] NOT NULL CONSTRAINT [DF_PageItems_PublicationDate]  DEFAULT (getdate()),
	[ExpirationDate] [datetime] NULL,
	[NeverExpires] [bit] NOT NULL,
	[DisplayInNavigation] [bit] NOT NULL CONSTRAINT [DF_PageItems_DisplayInNavigation]  DEFAULT ((1)),
	[DisplaySideNavigation] [bit] NOT NULL CONSTRAINT [DF_PageItems_DisplaySideNavigation]  DEFAULT ((1)),
	[RedirectURL] [nvarchar](255) NULL,
	[ContentSourceItemID] [int] NULL,
	[DisplayOrder] [int] NOT NULL CONSTRAINT [DF_PageItems_DisplayOrder]  DEFAULT ((1)),
	[ParentItemID] [int] NOT NULL,
	[AllowEditID] [int] NULL,
	[Published] [bit] NOT NULL CONSTRAINT [DF_PageItems_Published]  DEFAULT ((1)),
 CONSTRAINT [PK_PageItems] PRIMARY KEY CLUSTERED 
(
	[PageItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PageTypes]    Script Date: 30/6/2018 5:49:03 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PageTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PageTypes](
	[PageTypeID] [int] IDENTITY(1,1) NOT NULL,
	[PageType] [nvarchar](32) NOT NULL,
	[IsEnabled] [bit] NOT NULL,
 CONSTRAINT [PK_PageTypes] PRIMARY KEY CLUSTERED 
(
	[PageTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PhotoGalleries]    Script Date: 30/6/2018 5:49:03 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PhotoGalleries]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PhotoGalleries](
	[GalleryID] [int] IDENTITY(1,1) NOT NULL,
	[GalleryDescription] [nvarchar](255) NOT NULL,
	[ImageTotal] [int] NOT NULL,
	[LayoutType] [nvarchar](10) NOT NULL CONSTRAINT [DF_PhotoGalleries_LayoutType]  DEFAULT (N'grid'),
	[ImageCollection] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_PhotoGalleries_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_PhotoGalleries] PRIMARY KEY CLUSTERED 
(
	[GalleryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PressItemCategories]    Script Date: 30/6/2018 5:49:03 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PressItemCategories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PressItemCategories](
	[PressItemCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[PressItemCategory] [nvarchar](32) NOT NULL,
	[IsEnabled] [bit] NOT NULL,
 CONSTRAINT [PK_PressItemCategories] PRIMARY KEY CLUSTERED 
(
	[PressItemCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PressRoom]    Script Date: 30/6/2018 5:49:03 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PressRoom]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PressRoom](
	[PressItemID] [int] IDENTITY(1,1) NOT NULL,
	[PressItemTitle] [nvarchar](255) NOT NULL,
	[PressItemBody] [ntext] NOT NULL,
	[PublicationDate] [datetime] NOT NULL,
	[ExpirationDate] [datetime] NULL,
	[NeverExpires] [bit] NOT NULL,
	[DisplayOnFirstPage] [bit] NOT NULL,
	[PressItemCategoryID] [int] NOT NULL,
	[RelatedDocumentList] [nvarchar](255) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_PressRoom] PRIMARY KEY CLUSTERED 
(
	[PressItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ThumbnailDimensions]    Script Date: 30/6/2018 5:49:03 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ThumbnailDimensions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ThumbnailDimensions](
	[DimensionID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Dimensions] [nvarchar](32) NOT NULL,
	[DimensionLabel] [nvarchar](64) NOT NULL,
	[DisplayOrder] [tinyint] NOT NULL,
 CONSTRAINT [PK_ThumbnailDimensions] PRIMARY KEY CLUSTERED 
(
	[DimensionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[CPanelActivityLog]    Script Date: 30/6/2018 5:49:03 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[CPanelActivityLog]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[CPanelActivityLog] AS 
SELECT CPanelAccessLog.CPanelUserID, 
       CPanelUsers.FullName, 
	   CPanelUsers.UserName,
       CPanelAccessLog.RemoteHost, 
	   (SELECT MIN(cpl1.LogEntryDate) FROM CpanelAccessLog cpl1 WHERE cpl1.UserSessionID = CPanelAccessLog.UserSessionID) AS LoginTs, 
       (SELECT MAX(cpl2.LogEntryDate) FROM CpanelAccessLog cpl2 WHERE cpl2.UserSessionID = CPanelAccessLog.UserSessionID) AS LogoutTs,
       DATEDIFF(second, (SELECT MIN(cpl1.LogEntryDate) FROM CpanelAccessLog cpl1 WHERE cpl1.UserSessionID = CPanelAccessLog.UserSessionID), (SELECT MAX(cpl2.LogEntryDate) FROM CpanelAccessLog cpl2 WHERE cpl2.UserSessionID = CPanelAccessLog.UserSessionID)) / 60 AS SessionDurationMins, 
       DATEDIFF(second, (SELECT MIN(cpl1.LogEntryDate) FROM CpanelAccessLog cpl1 WHERE cpl1.UserSessionID = CPanelAccessLog.UserSessionID), (SELECT MAX(cpl2.LogEntryDate) FROM CpanelAccessLog cpl2 WHERE cpl2.UserSessionID = CPanelAccessLog.UserSessionID)) % 60 AS SessionDurationSecs,
       CAST((DATEDIFF(second, (SELECT MIN(cpl1.LogEntryDate) FROM CpanelAccessLog cpl1 WHERE cpl1.UserSessionID = CPanelAccessLog.UserSessionID), (SELECT MAX(cpl2.LogEntryDate) FROM CpanelAccessLog cpl2 WHERE cpl2.UserSessionID = CPanelAccessLog.UserSessionID)) / 60) AS VARCHAR) + '' mins '' +  
       CAST((DATEDIFF(second, (SELECT MIN(cpl1.LogEntryDate) FROM CpanelAccessLog cpl1 WHERE cpl1.UserSessionID = CPanelAccessLog.UserSessionID), (SELECT MAX(cpl2.LogEntryDate) FROM CpanelAccessLog cpl2 WHERE cpl2.UserSessionID = CPanelAccessLog.UserSessionID)) % 60) AS VARCHAR) + '' secs'' AS SessionDurationLabel,
	   CPanelAccessLog.UserSessionID
FROM CPanelAccessLog INNER JOIN CpanelUsers ON
     CPanelAccessLog.CPanelUserID = CpanelUsers.CPanelUserID  
WHERE CPanelAccessLog.UserSessionID IS NOT NULL 
GROUP BY CPanelAccessLog.CPanelUserID, 
         CPanelUsers.FullName, 
	     CPanelUsers.UserName,
         CPanelAccessLog.RemoteHost,  
		 CPanelAccessLog.UserSessionID' 
GO
/****** Object:  View [dbo].[CreationYears]    Script Date: 30/6/2018 5:49:03 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[CreationYears]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[CreationYears]
AS
SELECT DISTINCT CreationYear
FROM            dbo.ArtWork
' 
GO
/****** Object:  View [dbo].[GeographicalLocations]    Script Date: 30/6/2018 5:49:03 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[GeographicalLocations]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[GeographicalLocations]
AS
SELECT DISTINCT PlaceOfResidence AS GeoLocations
FROM            dbo.ArtWork
' 
GO
/****** Object:  View [dbo].[PaintingMediums]    Script Date: 30/6/2018 5:49:03 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PaintingMediums]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[PaintingMediums]
AS
SELECT DISTINCT PaintingMedium
FROM            dbo.ArtWork
' 
GO
/****** Object:  View [dbo].[Themes]    Script Date: 30/6/2018 5:49:03 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Themes]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Themes]
AS
SELECT DISTINCT ArtWorkTheme
FROM            dbo.ArtWork
' 
GO
SET IDENTITY_INSERT [dbo].[ArtWork] ON 

INSERT [dbo].[ArtWork] ([ArtWorkID], [ArtWorkTheme], [CreationYear], [PaintingMedium], [PaintingWidth], [PaintingHeight], [ArtWorkFullsizeURL], [ArtWorkThumbnailURL], [ArtistFullName], [ArtistBirthYear], [PlaceOfResidence], [SenderFullname], [SenderEmailAddress], [SenderPhone], [SenderCellPhune], [SenderRelationToArtist], [PaimentMethod], [SubmissionDate], [ShowInCollection]) VALUES (1, N'ΠΑΝΑΝΘΡΏΠΙΝΕΣ ΑΞΊΕΣ', 2016, N'ΑΚΟΥΑΡΈΛΑ', 40, 30, N'/resources/images/collection/fullsize/gerolimosgiorgos.jpg', N'/resources/images/collection/thumbnails/gerolimosgiorgos.jpg', N'ΓΕΡΟΛΥΜΟΣ ΓΙΩΡΓΟΣ', 2005, N'ΑΜΦΥΛΟΧΙΑ', N'ΠΑΙΔΙΚΗ ΠΙΝΑΚΟΘΗΚΕ ΕΛΛΑΔΟΣ', N'paidiki.pinakothiki.elladas@gmail.com', N'2241000000', N'6900000000', N'ΓΟΝΕΑΣ', N'bank transfer', CAST(N'2018-06-30 15:03:45.603' AS DateTime), 1)
INSERT [dbo].[ArtWork] ([ArtWorkID], [ArtWorkTheme], [CreationYear], [PaintingMedium], [PaintingWidth], [PaintingHeight], [ArtWorkFullsizeURL], [ArtWorkThumbnailURL], [ArtistFullName], [ArtistBirthYear], [PlaceOfResidence], [SenderFullname], [SenderEmailAddress], [SenderPhone], [SenderCellPhune], [SenderRelationToArtist], [PaimentMethod], [SubmissionDate], [ShowInCollection]) VALUES (2, N'ΠΑΝΑΝΘΡΏΠΙΝΕΣ ΑΞΊΕΣ', 2016, N'ΛΑΔΟΜΠΟΓΙΈΣ', 40, 30, N'/resources/images/collection/fullsize/beligiannisthanos.jpg', N'/resources/images/collection/thumbnails/beligiannisthanos.jpg', N'ΜΠΕΛΗΓΙAΝΝΗΣ ΘAΝΟΣ', 2013, N'ΕΥΒΟΙΑ', N'ΠΑΙΔΙΚΗ ΠΙΝΑΚΟΘΗΚΕ ΕΛΛΑΔΟΣ', N'paidiki.pinakothiki.elladas@gmail.com', N'2241000000', N'6900000000', N'ΓΟΝΕΑΣ', N'bank transfer', CAST(N'2018-06-30 15:03:45.650' AS DateTime), 1)
INSERT [dbo].[ArtWork] ([ArtWorkID], [ArtWorkTheme], [CreationYear], [PaintingMedium], [PaintingWidth], [PaintingHeight], [ArtWorkFullsizeURL], [ArtWorkThumbnailURL], [ArtistFullName], [ArtistBirthYear], [PlaceOfResidence], [SenderFullname], [SenderEmailAddress], [SenderPhone], [SenderCellPhune], [SenderRelationToArtist], [PaimentMethod], [SubmissionDate], [ShowInCollection]) VALUES (3, N'ΟΛΥΜΠΙΑΚΆ ΙΔΕΏΔΗ', 2016, N'ΑΚΟΥΑΡΈΛΑ', 30, 40, N'/resources/images/collection/fullsize/ouzouninektaria.jpg', N'/resources/images/collection/thumbnails/ouzouninektaria.jpg', N'ΟΥΖΟΥΝΗ ΝΕΚΤΑΡΙΑ', 2005, N'ΚΑΒΆΛΑ', N'ΠΑΙΔΙΚΗ ΠΙΝΑΚΟΘΗΚΕ ΕΛΛΑΔΟΣ', N'paidiki.pinakothiki.elladas@gmail.com', N'2241000000', N'6900000000', N'ΓΟΝΕΑΣ', N'bank transfer', CAST(N'2018-06-30 15:03:45.650' AS DateTime), 1)
INSERT [dbo].[ArtWork] ([ArtWorkID], [ArtWorkTheme], [CreationYear], [PaintingMedium], [PaintingWidth], [PaintingHeight], [ArtWorkFullsizeURL], [ArtWorkThumbnailURL], [ArtistFullName], [ArtistBirthYear], [PlaceOfResidence], [SenderFullname], [SenderEmailAddress], [SenderPhone], [SenderCellPhune], [SenderRelationToArtist], [PaimentMethod], [SubmissionDate], [ShowInCollection]) VALUES (4, N'ΑΝΘΡΏΠΙΝΑ ΔΙΚΑΙΏΜΑΤΑ', 2017, N'ΝΕΡΟΜΠΟΓΙΈΣ', 30, 40, N'/resources/images/collection/fullsize/goregiakorina.jpg', N'/resources/images/collection/thumbnails/goregiakorina.jpg', N'ΓΚΟΡΕΓΙΑ ΚΟΡΙΝΑ', 2006, N'ΕΥΒΟΙΑ', N'ΠΑΙΔΙΚΗ ΠΙΝΑΚΟΘΗΚΕ ΕΛΛΑΔΟΣ', N'paidiki.pinakothiki.elladas@gmail.com', N'2241000000', N'6900000000', N'ΓΟΝΕΑΣ', N'bank transfer', CAST(N'2018-06-30 15:03:45.650' AS DateTime), 1)
INSERT [dbo].[ArtWork] ([ArtWorkID], [ArtWorkTheme], [CreationYear], [PaintingMedium], [PaintingWidth], [PaintingHeight], [ArtWorkFullsizeURL], [ArtWorkThumbnailURL], [ArtistFullName], [ArtistBirthYear], [PlaceOfResidence], [SenderFullname], [SenderEmailAddress], [SenderPhone], [SenderCellPhune], [SenderRelationToArtist], [PaimentMethod], [SubmissionDate], [ShowInCollection]) VALUES (5, N'ΟΛΥΜΠΙΑΚΆ ΙΔΕΏΔΗ', 2016, N'ΛΑΔΟΜΠΟΓΙΈΣ', 30, 40, N'/resources/images/collection/fullsize/fanariotiandriana.jpg', N'/resources/images/collection/thumbnails/fanariotiandriana.jpg', N'ΦΑΝΑΡΙΩΤΗ ΑΝΔΡΙΑΝΑ', 2007, N'ΑΘΉΝΑ', N'ΠΑΙΔΙΚΗ ΠΙΝΑΚΟΘΗΚΕ ΕΛΛΑΔΟΣ', N'paidiki.pinakothiki.elladas@gmail.com', N'2241000000', N'6900000000', N'ΓΟΝΕΑΣ', N'bank transfer', CAST(N'2018-06-30 15:03:45.653' AS DateTime), 1)
INSERT [dbo].[ArtWork] ([ArtWorkID], [ArtWorkTheme], [CreationYear], [PaintingMedium], [PaintingWidth], [PaintingHeight], [ArtWorkFullsizeURL], [ArtWorkThumbnailURL], [ArtistFullName], [ArtistBirthYear], [PlaceOfResidence], [SenderFullname], [SenderEmailAddress], [SenderPhone], [SenderCellPhune], [SenderRelationToArtist], [PaimentMethod], [SubmissionDate], [ShowInCollection]) VALUES (6, N'ΑΝΘΡΏΠΙΝΑ ΔΙΚΑΙΏΜΑΤΑ', 2017, N'ΝΕΡΟΜΠΟΓΙΈΣ', 30, 40, N'/resources/images/collection/fullsize/safakasofia.jpg', N'/resources/images/collection/thumbnails/safakasofia.jpg', N'ΣΑΦΑΚΑ ΣΟΦΙΑ', 2004, N'ΑΜΦΥΛΟΧΙΑ', N'ΠΑΙΔΙΚΗ ΠΙΝΑΚΟΘΗΚΕ ΕΛΛΑΔΟΣ', N'paidiki.pinakothiki.elladas@gmail.com', N'2241000000', N'6900000000', N'ΓΟΝΕΑΣ', N'bank transfer', CAST(N'2018-06-30 15:03:45.653' AS DateTime), 1)
INSERT [dbo].[ArtWork] ([ArtWorkID], [ArtWorkTheme], [CreationYear], [PaintingMedium], [PaintingWidth], [PaintingHeight], [ArtWorkFullsizeURL], [ArtWorkThumbnailURL], [ArtistFullName], [ArtistBirthYear], [PlaceOfResidence], [SenderFullname], [SenderEmailAddress], [SenderPhone], [SenderCellPhune], [SenderRelationToArtist], [PaimentMethod], [SubmissionDate], [ShowInCollection]) VALUES (7, N'ΑΝΘΡΏΠΙΝΑ ΔΙΚΑΙΏΜΑΤΑ', 2017, N'ΝΕΡΟΜΠΟΓΙΈΣ', 30, 40, N'/resources/images/collection/fullsize/andrianourea.jpg', N'/resources/images/collection/thumbnails/andrianourea.jpg', N'ΑΝΔΡΙΑΝΟΥ ΡΕΑ', 2008, N'ΠΑΛΛΉΝΗ', N'ΠΑΙΔΙΚΗ ΠΙΝΑΚΟΘΗΚΕ ΕΛΛΑΔΟΣ', N'paidiki.pinakothiki.elladas@gmail.com', N'2241000000', N'6900000000', N'ΓΟΝΕΑΣ', N'bank transfer', CAST(N'2018-06-30 15:03:45.653' AS DateTime), 1)
INSERT [dbo].[ArtWork] ([ArtWorkID], [ArtWorkTheme], [CreationYear], [PaintingMedium], [PaintingWidth], [PaintingHeight], [ArtWorkFullsizeURL], [ArtWorkThumbnailURL], [ArtistFullName], [ArtistBirthYear], [PlaceOfResidence], [SenderFullname], [SenderEmailAddress], [SenderPhone], [SenderCellPhune], [SenderRelationToArtist], [PaimentMethod], [SubmissionDate], [ShowInCollection]) VALUES (8, N'ΑΝΘΡΏΠΙΝΑ ΔΙΚΑΙΏΜΑΤΑ', 2017, N'ΛΑΔΟΜΠΟΓΙΈΣ', 30, 40, N'/resources/images/collection/fullsize/tambouriolivia.jpg', N'/resources/images/collection/thumbnails/tambouriolivia.jpg', N'ΤΑΜΠΟΥΡΗ ΟΛΙΒΙΑ', 2013, N'ΑΜΦΥΛΟΧΙΑ', N'ΠΑΙΔΙΚΗ ΠΙΝΑΚΟΘΗΚΕ ΕΛΛΑΔΟΣ', N'paidiki.pinakothiki.elladas@gmail.com', N'2241000000', N'6900000000', N'ΓΟΝΕΑΣ', N'bank transfer', CAST(N'2018-06-30 15:03:45.657' AS DateTime), 1)
INSERT [dbo].[ArtWork] ([ArtWorkID], [ArtWorkTheme], [CreationYear], [PaintingMedium], [PaintingWidth], [PaintingHeight], [ArtWorkFullsizeURL], [ArtWorkThumbnailURL], [ArtistFullName], [ArtistBirthYear], [PlaceOfResidence], [SenderFullname], [SenderEmailAddress], [SenderPhone], [SenderCellPhune], [SenderRelationToArtist], [PaimentMethod], [SubmissionDate], [ShowInCollection]) VALUES (9, N'ΑΝΘΡΏΠΙΝΑ ΔΙΚΑΙΏΜΑΤΑ', 2017, N'ΑΚΟΥΑΡΈΛΑ', 30, 40, N'/resources/images/collection/fullsize/pantelidoukonstantina.jpg', N'/resources/images/collection/thumbnails/pantelidoukonstantina.jpg', N'ΠΑΝΤΕΛΙΔΟΥ ΚΩΝΣΤΑΝΤΙΝΑ', 2010, N'ΘΕΣΣΑΛΟΝΊΚΗ', N'ΠΑΙΔΙΚΗ ΠΙΝΑΚΟΘΗΚΕ ΕΛΛΑΔΟΣ', N'paidiki.pinakothiki.elladas@gmail.com', N'2241000000', N'6900000000', N'ΓΟΝΕΑΣ', N'bank transfer', CAST(N'2018-06-30 15:03:45.657' AS DateTime), 1)
INSERT [dbo].[ArtWork] ([ArtWorkID], [ArtWorkTheme], [CreationYear], [PaintingMedium], [PaintingWidth], [PaintingHeight], [ArtWorkFullsizeURL], [ArtWorkThumbnailURL], [ArtistFullName], [ArtistBirthYear], [PlaceOfResidence], [SenderFullname], [SenderEmailAddress], [SenderPhone], [SenderCellPhune], [SenderRelationToArtist], [PaimentMethod], [SubmissionDate], [ShowInCollection]) VALUES (10, N'ΟΙ ΝΈΟΙ ΖΩΓΡΑΦΊΖΟΥΝ', 2017, N'ΝΕΡΟΜΠΟΓΙΈΣ', 30, 40, N'/resources/images/collection/fullsize/makriantonia.jpg', N'/resources/images/collection/thumbnails/makriantonia.jpg', N'ΜΑΚΡΗ ΑΝΤΩΝΙΑ', 2007, N'ΙΣΤΙΑΊΑ', N'ΠΑΙΔΙΚΗ ΠΙΝΑΚΟΘΗΚΕ ΕΛΛΑΔΟΣ', N'paidiki.pinakothiki.elladas@gmail.com', N'2241000000', N'6900000000', N'ΓΟΝΕΑΣ', N'bank transfer', CAST(N'2018-06-30 15:03:45.657' AS DateTime), 1)
INSERT [dbo].[ArtWork] ([ArtWorkID], [ArtWorkTheme], [CreationYear], [PaintingMedium], [PaintingWidth], [PaintingHeight], [ArtWorkFullsizeURL], [ArtWorkThumbnailURL], [ArtistFullName], [ArtistBirthYear], [PlaceOfResidence], [SenderFullname], [SenderEmailAddress], [SenderPhone], [SenderCellPhune], [SenderRelationToArtist], [PaimentMethod], [SubmissionDate], [ShowInCollection]) VALUES (11, N'ΑΝΘΡΏΠΙΝΑ ΔΙΚΑΙΏΜΑΤΑ', 2017, N'ΛΑΔΟΜΠΟΓΙΈΣ', 30, 40, N'/resources/images/collection/fullsize/skoulatakisrafail.jpg', N'/resources/images/collection/thumbnails/skoulatakisrafail.jpg', N'ΣΚΟΥΛΑΤΑΚΗΣ ΡΑΦΑΗΛ- ΕΜΜΑΝΟΥΗΛ ', 2011, N'ΚΡΉΤΗ', N'ΠΑΙΔΙΚΗ ΠΙΝΑΚΟΘΗΚΕ ΕΛΛΑΔΟΣ', N'paidiki.pinakothiki.elladas@gmail.com', N'2241000000', N'6900000000', N'ΓΟΝΕΑΣ', N'bank transfer', CAST(N'2018-06-30 15:03:45.657' AS DateTime), 1)
INSERT [dbo].[ArtWork] ([ArtWorkID], [ArtWorkTheme], [CreationYear], [PaintingMedium], [PaintingWidth], [PaintingHeight], [ArtWorkFullsizeURL], [ArtWorkThumbnailURL], [ArtistFullName], [ArtistBirthYear], [PlaceOfResidence], [SenderFullname], [SenderEmailAddress], [SenderPhone], [SenderCellPhune], [SenderRelationToArtist], [PaimentMethod], [SubmissionDate], [ShowInCollection]) VALUES (12, N'ΠΑΝΑΝΘΡΏΠΙΝΕΣ ΑΞΊΕΣ', 2016, N'ΝΕΡΟΜΠΟΓΙΈΣ', 30, 40, N'/resources/images/collection/fullsize/diakidistzortzis.jpg', N'/resources/images/collection/thumbnails/diakidistzortzis.jpg', N'ΔΙΑΚΙΔΗΣ-ΚΩΣΤΑΣ ΤΖΩΡΤΖΗΣ', 2003, N'ΡΌΔΟΣ', N'ΠΑΙΔΙΚΗ ΠΙΝΑΚΟΘΗΚΕ ΕΛΛΑΔΟΣ', N'paidiki.pinakothiki.elladas@gmail.com', N'2241000000', N'6900000000', N'ΓΟΝΕΑΣ', N'bank transfer', CAST(N'2018-06-30 15:03:45.660' AS DateTime), 1)
INSERT [dbo].[ArtWork] ([ArtWorkID], [ArtWorkTheme], [CreationYear], [PaintingMedium], [PaintingWidth], [PaintingHeight], [ArtWorkFullsizeURL], [ArtWorkThumbnailURL], [ArtistFullName], [ArtistBirthYear], [PlaceOfResidence], [SenderFullname], [SenderEmailAddress], [SenderPhone], [SenderCellPhune], [SenderRelationToArtist], [PaimentMethod], [SubmissionDate], [ShowInCollection]) VALUES (13, N'ΑΝΘΡΏΠΙΝΑ ΔΙΚΑΙΏΜΑΤΑ', 2017, N'ΛΑΔΟΜΠΟΓΙΈΣ', 30, 40, N'/resources/images/collection/fullsize/kamardantina.jpg', N'/resources/images/collection/thumbnails/kamardantina.jpg', N'ΚΑΜΑΡΔΑ ΝΤΙΝΑ', 2005, N'ΞΑΝΘΗ', N'ΠΑΙΔΙΚΗ ΠΙΝΑΚΟΘΗΚΕ ΕΛΛΑΔΟΣ', N'paidiki.pinakothiki.elladas@gmail.com', N'2241000000', N'6900000000', N'ΓΟΝΕΑΣ', N'bank transfer', CAST(N'2018-06-30 15:03:45.690' AS DateTime), 1)
INSERT [dbo].[ArtWork] ([ArtWorkID], [ArtWorkTheme], [CreationYear], [PaintingMedium], [PaintingWidth], [PaintingHeight], [ArtWorkFullsizeURL], [ArtWorkThumbnailURL], [ArtistFullName], [ArtistBirthYear], [PlaceOfResidence], [SenderFullname], [SenderEmailAddress], [SenderPhone], [SenderCellPhune], [SenderRelationToArtist], [PaimentMethod], [SubmissionDate], [ShowInCollection]) VALUES (14, N'ΑΝΘΡΏΠΙΝΑ ΔΙΚΑΙΏΜΑΤΑ', 2017, N'ΝΕΡΟΜΠΟΓΙΈΣ', 40, 30, N'/resources/images/collection/fullsize/kivirtzikivasiliki.jpg', N'/resources/images/collection/thumbnails/kivirtzikivasiliki.jpg', N'ΚΥΒΙΡΤΖΙΚΗ ΒΑΣΙΛΙΚΗ', 2013, N'ΘΕΣΣΑΛΟΝΊΚΗ', N'ΠΑΙΔΙΚΗ ΠΙΝΑΚΟΘΗΚΕ ΕΛΛΑΔΟΣ', N'paidiki.pinakothiki.elladas@gmail.com', N'2241000000', N'6900000000', N'ΓΟΝΕΑΣ', N'bank transfer', CAST(N'2018-06-30 15:03:45.690' AS DateTime), 1)
INSERT [dbo].[ArtWork] ([ArtWorkID], [ArtWorkTheme], [CreationYear], [PaintingMedium], [PaintingWidth], [PaintingHeight], [ArtWorkFullsizeURL], [ArtWorkThumbnailURL], [ArtistFullName], [ArtistBirthYear], [PlaceOfResidence], [SenderFullname], [SenderEmailAddress], [SenderPhone], [SenderCellPhune], [SenderRelationToArtist], [PaimentMethod], [SubmissionDate], [ShowInCollection]) VALUES (15, N'ΟΙ ΝΈΟΙ ΖΩΓΡΑΦΊΖΟΥΝ', 2017, N'ΝΕΡΟΜΠΟΓΙΈΣ', 40, 30, N'/resources/images/collection/fullsize/siligardakisnikolaos.jpg', N'/resources/images/collection/thumbnails/siligardakisnikolaos.jpg', N'ΣΙΛΙΓΑΡΔΑΚΗΣ NΙΚΟΛΑΟΣ', 2007, N'ΚΡΉΤΗ', N'ΠΑΙΔΙΚΗ ΠΙΝΑΚΟΘΗΚΕ ΕΛΛΑΔΟΣ', N'paidiki.pinakothiki.elladas@gmail.com', N'2241000000', N'6900000000', N'ΓΟΝΕΑΣ', N'bank transfer', CAST(N'2018-06-30 15:03:45.690' AS DateTime), 1)
INSERT [dbo].[ArtWork] ([ArtWorkID], [ArtWorkTheme], [CreationYear], [PaintingMedium], [PaintingWidth], [PaintingHeight], [ArtWorkFullsizeURL], [ArtWorkThumbnailURL], [ArtistFullName], [ArtistBirthYear], [PlaceOfResidence], [SenderFullname], [SenderEmailAddress], [SenderPhone], [SenderCellPhune], [SenderRelationToArtist], [PaimentMethod], [SubmissionDate], [ShowInCollection]) VALUES (16, N'ΟΙ ΝΈΟΙ ΖΩΓΡΑΦΊΖΟΥΝ', 2017, N'ΛΑΔΟΜΠΟΓΙΈΣ', 40, 30, N'/resources/images/collection/fullsize/ngelaarhontia.jpg', N'/resources/images/collection/thumbnails/ngelaarhontia.jpg', N'ΝΓΚΕΛΑ ΑΡΧΟΝΤΙΑ', 2011, N'ΑΙΔΗΨΌΣ', N'ΠΑΙΔΙΚΗ ΠΙΝΑΚΟΘΗΚΕ ΕΛΛΑΔΟΣ', N'paidiki.pinakothiki.elladas@gmail.com', N'2241000000', N'6900000000', N'ΓΟΝΕΑΣ', N'bank transfer', CAST(N'2018-06-30 15:03:45.693' AS DateTime), 1)
INSERT [dbo].[ArtWork] ([ArtWorkID], [ArtWorkTheme], [CreationYear], [PaintingMedium], [PaintingWidth], [PaintingHeight], [ArtWorkFullsizeURL], [ArtWorkThumbnailURL], [ArtistFullName], [ArtistBirthYear], [PlaceOfResidence], [SenderFullname], [SenderEmailAddress], [SenderPhone], [SenderCellPhune], [SenderRelationToArtist], [PaimentMethod], [SubmissionDate], [ShowInCollection]) VALUES (17, N'ΑΝΘΡΏΠΙΝΑ ΔΙΚΑΙΏΜΑΤΑ', 2017, N'ΝΕΡΟΜΠΟΓΙΈΣ', 40, 30, N'/resources/images/collection/fullsize/hatzimoisiadoumaria.jpg', N'/resources/images/collection/thumbnails/hatzimoisiadoumaria.jpg', N'ΧΑΤΖΗΜΩΥΣΙAΔΟΥ ΜΑΡΙΑ', 2003, N'ΞΑΝΘΗ', N'ΠΑΙΔΙΚΗ ΠΙΝΑΚΟΘΗΚΕ ΕΛΛΑΔΟΣ', N'paidiki.pinakothiki.elladas@gmail.com', N'2241000000', N'6900000000', N'ΓΟΝΕΑΣ', N'bank transfer', CAST(N'2018-06-30 15:03:45.693' AS DateTime), 1)
INSERT [dbo].[ArtWork] ([ArtWorkID], [ArtWorkTheme], [CreationYear], [PaintingMedium], [PaintingWidth], [PaintingHeight], [ArtWorkFullsizeURL], [ArtWorkThumbnailURL], [ArtistFullName], [ArtistBirthYear], [PlaceOfResidence], [SenderFullname], [SenderEmailAddress], [SenderPhone], [SenderCellPhune], [SenderRelationToArtist], [PaimentMethod], [SubmissionDate], [ShowInCollection]) VALUES (18, N'ΟΙ ΝΈΟΙ ΖΩΓΡΑΦΊΖΟΥΝ', 2016, N'ΝΕΡΟΜΠΟΓΙΈΣ', 40, 30, N'/resources/images/collection/fullsize/fragiadakifoteini.jpg', N'/resources/images/collection/thumbnails/fragiadakifoteini.jpg', N'ΦΡΑΓΚΙΑΔΑΚΗ ΦΩΤΕΙΝΗ', 2005, N'ΚΡΉΤΗ', N'ΠΑΙΔΙΚΗ ΠΙΝΑΚΟΘΗΚΕ ΕΛΛΑΔΟΣ', N'paidiki.pinakothiki.elladas@gmail.com', N'2241000000', N'6900000000', N'ΓΟΝΕΑΣ', N'bank transfer', CAST(N'2018-06-30 15:03:45.693' AS DateTime), 1)
INSERT [dbo].[ArtWork] ([ArtWorkID], [ArtWorkTheme], [CreationYear], [PaintingMedium], [PaintingWidth], [PaintingHeight], [ArtWorkFullsizeURL], [ArtWorkThumbnailURL], [ArtistFullName], [ArtistBirthYear], [PlaceOfResidence], [SenderFullname], [SenderEmailAddress], [SenderPhone], [SenderCellPhune], [SenderRelationToArtist], [PaimentMethod], [SubmissionDate], [ShowInCollection]) VALUES (19, N'ΟΛΥΜΠΙΑΚΆ ΙΔΕΏΔΗ', 2016, N'ΑΚΟΥΑΡΈΛΑ', 40, 30, N'/resources/images/collection/fullsize/petridisaggelos.jpg', N'/resources/images/collection/thumbnails/petridisaggelos.jpg', N'ΠΕΤΡΙΔΗΣ ΑΓΓΕΛΟΣ', 2012, N'ΡΌΔΟΣ', N'ΠΑΙΔΙΚΗ ΠΙΝΑΚΟΘΗΚΕ ΕΛΛΑΔΟΣ', N'paidiki.pinakothiki.elladas@gmail.com', N'2241000000', N'6900000000', N'ΓΟΝΕΑΣ', N'bank transfer', CAST(N'2018-06-30 15:03:45.697' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[ArtWork] OFF
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (1, N'Afghanistan')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (2, N'Albania')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (3, N'Algeria')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (4, N'Andorra')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (5, N'Angola')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (6, N'Antigua and Barbuda')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (7, N'Argentina')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (8, N'Armenia')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (9, N'Australia')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (10, N'Austria')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (11, N'Azerbaijan')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (12, N'Bahamas')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (13, N'Bahrain')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (14, N'Bangladesh')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (15, N'Barbados')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (16, N'Belarus')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (17, N'Belgium')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (18, N'Belize')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (19, N'Benin')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (20, N'Bhutan')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (21, N'Bolivia')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (22, N'Bosnia and Herzegovina')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (23, N'Botswana')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (24, N'Brazil')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (25, N'Brunei Darussalam')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (26, N'Bulgaria')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (27, N'Burkina Faso')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (28, N'Burundi')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (29, N'Cambodia')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (30, N'Cameroon')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (31, N'Canada')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (32, N'Cape Verde')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (33, N'Central African Republic')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (34, N'Chad')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (35, N'Chile')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (36, N'China')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (37, N'Colombia')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (38, N'Comoros')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (39, N'Democratic Republic of the Congo')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (40, N'Congo, Republic of the')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (41, N'Costa Rica')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (42, N'Cote d''Ivoire Co^te d''Ivoire')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (43, N'Croatia')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (44, N'Cuba')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (45, N'Cyprus')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (46, N'Czech Republic')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (47, N'Denmark')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (48, N'Djibouti')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (49, N'Dominica')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (50, N'Dominican Republic')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (51, N'Ecuador')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (52, N'Egypt')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (53, N'El Salvador')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (54, N'Equatorial Guinea')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (55, N'Eritrea')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (56, N'Estonia')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (57, N'Ethiopia')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (58, N'Fiji')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (59, N'Finland')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (60, N'France')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (61, N'Gabon')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (62, N'Gambia')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (63, N'Georgia')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (64, N'Germany')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (65, N'Ghana')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (66, N'Greece')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (67, N'Grenada')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (68, N'Guatemala')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (69, N'Guinea')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (70, N'Guinea-Bissau')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (71, N'Guyana')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (72, N'Haiti')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (73, N'Honduras')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (74, N'Hungary')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (75, N'Iceland')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (76, N'India')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (77, N'Indonesia')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (78, N'Iran, Islamic Republic of')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (79, N'Iraq')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (80, N'Ireland')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (81, N'Israel')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (82, N'Italy')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (83, N'Jamaica')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (84, N'Japan')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (85, N'Jordan')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (86, N'Kazakhstan')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (87, N'Kenya')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (88, N'Kiribati')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (89, N'Democratic People''s Republic of Korea')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (90, N'Republic of Korea')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (91, N'Kuwait')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (92, N'Kyrgyzstan')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (93, N'Lao People''s Democratic Republic')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (94, N'Latvia')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (95, N'Lebanon')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (96, N'Lesotho')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (97, N'Liberia')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (98, N'Libyan Arab Jamahiriya')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (99, N'Liechtenstein')
GO
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (100, N'Lithuania')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (101, N'Luxembourg')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (102, N'Former Yugoslav Republic of Macedonia')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (103, N'Madagascar')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (104, N'Malawi')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (105, N'Malaysia')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (106, N'Maldives')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (107, N'Mali')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (108, N'Malta')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (109, N'Marshall Islands')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (110, N'Mauritania')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (111, N'Mauritius')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (112, N'Mexico')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (113, N'Micronesia, Federated States of')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (114, N'Republic of Moldova')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (115, N'Monaco')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (116, N'Mongolia')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (117, N'Montenegro')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (118, N'Morocco')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (119, N'Mozambique')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (120, N'Myanmar')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (121, N'Namibia')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (122, N'Nauru')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (123, N'Nepal')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (124, N'Netherlands')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (125, N'New Zealand')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (126, N'Nicaragua')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (127, N'Niger')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (128, N'Nigeria')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (129, N'Norway')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (130, N'Oman')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (131, N'Pakistan')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (132, N'Palau')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (133, N'Panama')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (134, N'Papua New Guinea')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (135, N'Paraguay')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (136, N'Peru')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (137, N'Philippines')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (138, N'Poland')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (139, N'Portugal')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (140, N'Qatar')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (141, N'Romania')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (142, N'Russian Federation')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (143, N'Rwanda')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (144, N'Saint Kitts and Nevis')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (145, N'Saint Lucia')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (146, N'Saint Vincent and the Grenadines')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (147, N'Samoa')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (148, N'San Marino')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (149, N'Sao Tome and Principe')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (150, N'Saudi Arabia')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (151, N'Senegal')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (152, N'Serbia')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (153, N'Seychelles')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (154, N'Sierra Leone')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (155, N'Singapore')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (156, N'Slovakia')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (157, N'Slovenia')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (158, N'Solomon Islands')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (159, N'Somalia')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (160, N'South Africa')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (161, N'Spain')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (162, N'Sri Lanka')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (163, N'Sudan')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (164, N'Suriname')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (165, N'Swaziland')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (166, N'Sweden')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (167, N'Switzerland')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (168, N'Syrian Arab Republic')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (169, N'Tajikistan')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (170, N'United Republic of Tanzania')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (171, N'Thailand')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (172, N'Timor-Leste')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (173, N'Togo')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (174, N'Tonga')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (175, N'Trinidad and Tobago')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (176, N'Tunisia')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (177, N'Turkey')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (178, N'Turkmenistan')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (179, N'Tuvalu')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (180, N'Uganda')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (181, N'Ukraine')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (182, N'United Arab Emirates')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (183, N'United Kingdom of Great Britain and Northern Ireland')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (184, N'United States of America')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (185, N'Uruguay')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (186, N'Uzbekistan')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (187, N'Vanuatu')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (188, N'Venezuela, Bolivarian Republic of')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (189, N'Vietnam')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (190, N'Yemen')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (191, N'Zambia')
INSERT [dbo].[Countries] ([CountryID], [CountryName]) VALUES (192, N'Zimbabwe')
SET IDENTITY_INSERT [dbo].[Countries] OFF
SET IDENTITY_INSERT [dbo].[CPanelAccessLog] ON 

INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (997, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2015-12-03 09:58:05.670' AS DateTime), N'1064744186')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (998, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2015-12-03 11:17:56.337' AS DateTime), N'4421775')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (999, 3, N'::1', N'Successfull logout for user ''ipetridis''.', N'Successfull Logout', CAST(N'2015-12-03 11:18:29.063' AS DateTime), N'4421775')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1000, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2015-12-03 11:18:32.093' AS DateTime), N'4421777')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1001, 3, N'::1', N'Successfull logout for user ''ipetridis''.', N'Successfull Logout', CAST(N'2015-12-03 11:18:35.813' AS DateTime), N'4421777')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1002, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2015-12-03 11:36:03.677' AS DateTime), N'6813554')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1003, 3, N'::1', N'Successfull logout for user ''ipetridis''.', N'Successfull Logout', CAST(N'2015-12-03 11:53:28.593' AS DateTime), N'6813554')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1004, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2015-12-03 11:53:30.523' AS DateTime), N'6813556')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1005, 3, N'::1', N'Session expired for user ''ipetridis''.', N'Successfull Logout', CAST(N'2015-12-03 12:16:39.400' AS DateTime), N'6813556')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1006, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2015-12-03 12:16:54.170' AS DateTime), N'11736613')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1007, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2015-12-04 08:43:39.010' AS DateTime), N'161733729')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1008, 3, N'::1', N'Session expired for user ''ipetridis''.', N'Successfull Logout', CAST(N'2015-12-04 09:56:46.130' AS DateTime), N'161733729')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1009, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2015-12-04 09:56:49.980' AS DateTime), N'171571624')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1010, NULL, N'::1', N'Successfull logout for user ''''.', N'Successfull Logout', CAST(N'2015-12-04 12:32:28.260' AS DateTime), N'190697682')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1011, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2015-12-17 10:35:22.197' AS DateTime), N'329121481')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1012, NULL, N'::1', N'Successfull logout for user ''''.', N'Successfull Logout', CAST(N'2015-12-17 11:05:57.947' AS DateTime), N'332904024')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1013, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2015-12-17 11:24:09.240' AS DateTime), N'332904026')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1014, 3, N'::1', N'Session expired for user ''ipetridis''.', N'Successfull Logout', CAST(N'2015-12-17 11:59:10.043' AS DateTime), N'332904026')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1015, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2015-12-17 11:59:13.040' AS DateTime), N'338270147')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1016, 3, N'::1', N'Successfull logout for user ''ipetridis''.', N'Successfull Logout', CAST(N'2015-12-17 12:40:14.190' AS DateTime), N'338270147')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1017, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2015-12-17 12:41:45.377' AS DateTime), N'338270149')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1018, 3, N'::1', N'Successfull logout for user ''ipetridis''.', N'Successfull Logout', CAST(N'2015-12-17 12:42:11.830' AS DateTime), N'338270149')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1019, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2015-12-17 13:05:46.477' AS DateTime), N'347623945')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1020, 3, N'::1', N'Successfull logout for user ''ipetridis''.', N'Successfull Logout', CAST(N'2015-12-17 13:09:07.630' AS DateTime), N'347623945')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1021, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2015-12-23 14:26:10.907' AS DateTime), N'345429064')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1022, 3, N'::1', N'Successfull logout for user ''ipetridis''.', N'Successfull Logout', CAST(N'2015-12-23 14:27:51.570' AS DateTime), N'345429064')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1023, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2015-12-24 10:42:28.257' AS DateTime), N'494892858')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1024, 3, N'::1', N'Successfull logout for user ''ipetridis''.', N'Successfull Logout', CAST(N'2015-12-24 10:55:16.773' AS DateTime), N'494892858')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1025, 3, N'127.0.0.1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2015-12-24 10:57:21.070' AS DateTime), N'494892861')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1026, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2015-12-24 11:05:50.670' AS DateTime), N'494892862')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1027, NULL, N'127.0.0.1', N'Successfull logout for user ''''.', N'Successfull Logout', CAST(N'2015-12-24 11:56:31.557' AS DateTime), N'494892863')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1028, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-01-04 09:16:34.717' AS DateTime), N'283267311')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1029, 3, N'::1', N'Session expired for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-01-04 10:14:14.983' AS DateTime), N'283267311')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1030, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-01-04 12:07:38.250' AS DateTime), N'304149247')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1031, 3, N'::1', N'Successfull logout for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-01-04 12:55:17.640' AS DateTime), N'304149247')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1032, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-01-04 14:21:53.900' AS DateTime), N'320805555')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1033, NULL, N'::1', N'Successfull logout for user ''''.', N'Successfull Logout', CAST(N'2016-01-05 06:43:44.877' AS DateTime), N'441448999')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1034, NULL, N'::1', N'Successfull logout for user ''''.', N'Successfull Logout', CAST(N'2016-01-05 06:43:45.557' AS DateTime), N'441449000')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1035, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-01-05 08:57:39.830' AS DateTime), N'457896090')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1036, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-01-07 06:49:50.477' AS DateTime), N'796073524')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1037, 3, N'::1', N'Successfull logout for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-01-07 06:49:58.513' AS DateTime), N'796073524')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1038, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-01-07 10:37:29.403' AS DateTime), N'824046466')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1039, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-01-07 11:06:48.667' AS DateTime), N'827651728')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1040, NULL, N'::1', N'Successfull logout for user ''''.', N'Successfull Logout', CAST(N'2016-01-07 12:33:40.663' AS DateTime), N'838340652')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1041, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-01-11 08:34:55.517' AS DateTime), N'443046191')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1042, 3, N'::1', N'Successfull logout for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-01-11 08:56:19.097' AS DateTime), N'443046191')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1043, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-01-11 09:01:19.650' AS DateTime), N'443046193')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1044, 3, N'::1', N'Session expired for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-01-11 09:28:10.663' AS DateTime), N'443046193')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1045, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-01-11 09:28:14.010' AS DateTime), N'449601509')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1046, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-01-11 10:56:05.693' AS DateTime), N'460397951')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1047, 3, N'::1', N'Successfull logout for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-01-11 11:48:41.067' AS DateTime), N'460397951')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1048, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-01-11 13:29:33.657' AS DateTime), N'479263247')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1049, 3, N'::1', N'Successfull logout for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-01-11 13:33:19.887' AS DateTime), N'479263247')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1050, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-01-12 09:05:53.640' AS DateTime), N'623629043')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1051, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-01-12 10:03:47.180' AS DateTime), N'623629043')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1052, NULL, N'::1', N'Successfull logout for user ''''.', N'Successfull Logout', CAST(N'2016-01-12 11:33:06.923' AS DateTime), N'641896635')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1053, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-01-14 14:06:27.893' AS DateTime), N'1014627011')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1054, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-01-15 10:40:16.087' AS DateTime), N'91856885')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1055, NULL, N'::1', N'Successfull logout for user ''''.', N'Successfull Logout', CAST(N'2016-01-15 11:36:43.527' AS DateTime), N'99439505')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1056, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-01-15 11:41:22.937' AS DateTime), N'99439507')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1057, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-01-15 13:40:57.970' AS DateTime), N'114702400')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1058, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-01-15 13:46:10.783' AS DateTime), N'114702402')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1059, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-01-15 14:01:46.437' AS DateTime), N'114702404')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1060, 3, N'::1', N'Successfull logout for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-01-15 14:26:41.100' AS DateTime), N'114702404')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1061, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-01-18 09:04:17.277' AS DateTime), N'610029985')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1062, NULL, N'::1', N'Successfull logout for user ''''.', N'Successfull Logout', CAST(N'2016-01-18 09:58:34.160' AS DateTime), N'618224703')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1063, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-01-18 10:05:41.710' AS DateTime), N'618224705')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1064, NULL, N'::1', N'Successfull logout for user ''''.', N'Successfull Logout', CAST(N'2016-01-18 11:13:46.283' AS DateTime), N'627465142')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1065, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-01-18 11:14:54.207' AS DateTime), N'627465145')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1066, 3, N'::1', N'Session expired for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-01-18 11:52:09.850' AS DateTime), N'627465145')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1067, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-01-18 11:52:27.170' AS DateTime), N'632182074')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1068, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-01-19 07:54:59.193' AS DateTime), N'779967793')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1069, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-01-19 11:00:52.877' AS DateTime), N'802821683')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1070, 3, N'::1', N'Successfull logout for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-01-19 11:43:47.260' AS DateTime), N'802821683')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1071, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-01-19 12:03:06.430' AS DateTime), N'802821685')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1072, 3, N'::1', N'Session expired for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-01-19 13:39:11.677' AS DateTime), N'802821685')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1073, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-01-20 08:47:14.290' AS DateTime), N'963269199')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1074, 3, N'::1', N'Session expired for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-01-20 09:22:22.267' AS DateTime), N'963269199')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1075, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-01-20 09:22:25.183' AS DateTime), N'967669919')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1076, NULL, N'::1', N'Successfull logout for user ''''.', N'Successfull Logout', CAST(N'2016-01-20 11:13:40.400' AS DateTime), N'981343565')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1077, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-01-20 11:13:42.633' AS DateTime), N'981343567')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1078, NULL, N'::1', N'Successfull logout for user ''''.', N'Successfull Logout', CAST(N'2016-01-20 12:14:43.050' AS DateTime), N'988844874')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1079, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-01-20 13:28:41.467' AS DateTime), N'997932079')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1080, 3, N'::1', N'Successfull logout for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-01-20 13:53:14.670' AS DateTime), N'997932079')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1081, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-01-21 08:29:28.137' AS DateTime), N'64344516')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1082, 3, N'::1', N'Session expired for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-01-21 09:44:48.223' AS DateTime), N'64344516')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1083, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-01-22 08:42:22.383' AS DateTime), N'242883613')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1084, 3, N'::1', N'Successfull logout for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-01-22 08:55:22.920' AS DateTime), N'242883613')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1085, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-04 12:28:27.560' AS DateTime), N'423309995')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1086, 3, N'::1', N'Session expired for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-02-04 14:01:02.920' AS DateTime), N'423309995')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1087, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-04 14:01:05.557' AS DateTime), N'434895720')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1088, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-05 12:34:43.770' AS DateTime), N'601227112')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1089, 3, N'::1', N'Session expired for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-02-05 13:43:43.063' AS DateTime), N'601227112')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1090, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-08 13:00:24.460' AS DateTime), N'61471094')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1091, 3, N'::1', N'Session expired for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-02-08 13:41:19.090' AS DateTime), N'61471094')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1092, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-08 13:41:22.570' AS DateTime), N'66518620')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1093, 3, N'::1', N'Successfull logout for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-02-08 14:16:22.500' AS DateTime), N'66518620')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1094, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-09 10:57:55.990' AS DateTime), N'223383594')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1095, 3, N'::1', N'Session expired for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-02-09 11:35:38.080' AS DateTime), N'223383594')
GO
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1096, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-09 11:35:40.680' AS DateTime), N'228020470')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1097, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-09 12:11:46.223' AS DateTime), N'228020470')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1098, 3, N'::1', N'Successfull logout for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-02-09 12:25:53.263' AS DateTime), N'228020470')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1099, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-09 12:26:18.847' AS DateTime), N'228020472')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1100, 3, N'::1', N'Session expired for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-02-09 13:02:57.637' AS DateTime), N'228020472')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1101, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-09 13:03:03.230' AS DateTime), N'238755665')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1102, NULL, N'::1', N'Successfull logout for user ''''.', N'Successfull Logout', CAST(N'2016-02-09 14:07:34.930' AS DateTime), N'246691557')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1103, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-10 14:03:47.260' AS DateTime), N'423165721')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1104, NULL, N'::1', N'Successfull logout for user ''''.', N'Successfull Logout', CAST(N'2016-02-11 06:24:35.597' AS DateTime), N'543692395')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1105, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-11 09:59:12.727' AS DateTime), N'570064202')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1106, 3, N'::1', N'Session expired for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-02-11 10:50:05.400' AS DateTime), N'570064202')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1107, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-11 10:50:08.377' AS DateTime), N'576320995')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1108, NULL, N'::1', N'Successfull logout for user ''''.', N'Successfull Logout', CAST(N'2016-02-11 11:52:52.603' AS DateTime), N'584032020')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1109, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-11 14:14:10.267' AS DateTime), N'601396010')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1110, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-12 10:56:39.763' AS DateTime), N'753244465')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1111, 3, N'::1', N'Session expired for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-02-12 11:25:35.957' AS DateTime), N'753244465')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1112, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-12 11:25:38.630' AS DateTime), N'757625310')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1113, 3, N'::1', N'Successfull logout for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-02-12 12:01:01.600' AS DateTime), N'757625310')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1114, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-12 12:01:03.533' AS DateTime), N'757625312')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1115, 3, N'::1', N'Session expired for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-02-12 13:30:14.577' AS DateTime), N'757625312')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1116, 3, N'::1', N'Session expired for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-02-12 14:21:48.453' AS DateTime), N'757625312')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1117, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-12 14:21:52.427' AS DateTime), N'779245640')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1118, 3, N'::1', N'Successfull logout for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-02-12 14:28:42.700' AS DateTime), N'779245640')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1119, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-15 08:06:53.020' AS DateTime), N'189889936')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1120, NULL, N'::1', N'Successfull logout for user ''''.', N'Successfull Logout', CAST(N'2016-02-15 10:55:24.343' AS DateTime), N'208551105')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1121, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-16 09:16:21.917' AS DateTime), N'375789542')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1122, 3, N'::1', N'Successfull logout for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-02-16 09:28:34.590' AS DateTime), N'375789542')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1123, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-16 09:47:20.087' AS DateTime), N'375789544')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1124, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-16 10:05:18.490' AS DateTime), N'375789546')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1125, 3, N'::1', N'Session expired for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-02-16 11:34:08.380' AS DateTime), N'375789546')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1126, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-16 11:34:11.310' AS DateTime), N'392720701')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1127, NULL, N'::1', N'Successfull logout for user ''''.', N'Successfull Logout', CAST(N'2016-02-16 13:09:34.183' AS DateTime), N'404452739')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1128, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-18 07:42:39.700' AS DateTime), N'718164669')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1129, NULL, N'::1', N'Successfull logout for user ''''.', N'Successfull Logout', CAST(N'2016-02-18 08:23:36.143' AS DateTime), N'723204059')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1130, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-18 09:12:26.693' AS DateTime), N'729210718')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1131, NULL, N'::1', N'Successfull logout for user ''''.', N'Successfull Logout', CAST(N'2016-02-18 10:03:16.990' AS DateTime), N'735457517')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1132, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-18 10:03:18.803' AS DateTime), N'735457519')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1133, 3, N'::1', N'Successfull logout for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-02-18 10:05:18.437' AS DateTime), N'735457519')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1134, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-18 11:26:54.700' AS DateTime), N'745732087')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1135, NULL, N'::1', N'Successfull logout for user ''''.', N'Successfull Logout', CAST(N'2016-02-18 14:01:23.920' AS DateTime), N'764712919')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1136, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-18 14:10:40.627' AS DateTime), N'764712921')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1137, NULL, N'::1', N'Successfull logout for user ''''.', N'Successfull Logout', CAST(N'2016-02-19 06:25:39.380' AS DateTime), N'885651124')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1138, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-19 07:19:32.157' AS DateTime), N'892279033')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1139, 3, N'::1', N'Session expired for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-02-19 07:51:41.950' AS DateTime), N'892279033')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1140, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-19 07:51:44.887' AS DateTime), N'896234060')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1141, 3, N'::1', N'Session expired for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-02-19 08:53:19.893' AS DateTime), N'896234060')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1142, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-19 08:53:22.980' AS DateTime), N'903806939')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1143, 3, N'::1', N'Successfull logout for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-02-19 09:51:43.347' AS DateTime), N'903806939')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1144, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-19 11:05:01.340' AS DateTime), N'919991719')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1145, 3, N'::1', N'Session expired for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-02-19 11:30:32.330' AS DateTime), N'919991719')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1146, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-19 11:30:34.993' AS DateTime), N'923120053')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1147, NULL, N'::1', N'Successfull logout for user ''''.', N'Successfull Logout', CAST(N'2016-02-19 12:50:23.320' AS DateTime), N'932934742')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1148, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-22 09:20:45.243' AS DateTime), N'364273415')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1149, NULL, N'::1', N'Successfull logout for user ''''.', N'Successfull Logout', CAST(N'2016-02-22 10:57:50.197' AS DateTime), N'376207747')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1150, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-22 11:33:35.530' AS DateTime), N'376207753')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1151, 3, N'::1', N'Successfull logout for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-02-22 12:24:45.117' AS DateTime), N'376207753')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1152, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-22 12:47:20.783' AS DateTime), N'389665666')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1153, 3, N'::1', N'Successfull logout for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-02-22 12:56:59.777' AS DateTime), N'389665666')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1154, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-23 10:01:54.650' AS DateTime), N'545971972')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1155, 3, N'::1', N'Session expired for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-02-23 10:36:46.163' AS DateTime), N'545971972')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1156, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-24 10:53:27.657' AS DateTime), N'729559479')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1157, NULL, N'::1', N'Successfull logout for user ''''.', N'Successfull Logout', CAST(N'2016-02-24 12:04:53.203' AS DateTime), N'738342763')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1158, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-24 12:05:04.487' AS DateTime), N'738342765')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1159, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-25 08:41:45.237' AS DateTime), N'890319130')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1160, 3, N'::1', N'Session expired for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-02-25 09:18:00.610' AS DateTime), N'890319130')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1161, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-25 09:18:03.867' AS DateTime), N'894775716')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1162, NULL, N'::1', N'Successfull logout for user ''''.', N'Successfull Logout', CAST(N'2016-02-25 11:18:41.187' AS DateTime), N'909611279')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1163, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-25 12:17:11.383' AS DateTime), N'916798812')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1164, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-25 12:18:18.363' AS DateTime), N'916798814')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1165, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-25 13:12:57.207' AS DateTime), N'916798816')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1166, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-02-25 14:29:48.360' AS DateTime), N'916798818')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1167, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-03-02 09:29:42.190' AS DateTime), N'884153593')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1168, 3, N'::1', N'Successfull logout for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-03-02 09:47:28.390' AS DateTime), N'884153593')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1169, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-03-02 13:05:03.333' AS DateTime), N'910619041')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1170, NULL, N'::1', N'Successfull logout for user ''''.', N'Successfull Logout', CAST(N'2016-03-02 13:30:58.643' AS DateTime), N'913808011')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1171, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-03-04 14:10:21.230' AS DateTime), N'198794682')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1172, 3, N'::1', N'Successfull logout for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-03-04 14:14:55.613' AS DateTime), N'198794682')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1173, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2016-04-07 10:52:58.680' AS DateTime), N'814643764')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1174, 3, N'::1', N'Successfull logout for user ''ipetridis''.', N'Successfull Logout', CAST(N'2016-04-07 10:54:26.053' AS DateTime), N'814643764')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1175, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2017-06-16 14:28:25.157' AS DateTime), N'503700937')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1176, 3, N'::1', N'Successfull logout for user ''ipetridis''.', N'Successfull Logout', CAST(N'2017-06-16 14:29:25.050' AS DateTime), N'503700937')
INSERT [dbo].[CPanelAccessLog] ([AccessLogID], [CPanelUserID], [RemoteHost], [LogEntry], [EventType], [LogEntryDate], [UserSessionID]) VALUES (1177, 3, N'::1', N'Successfull login user ''ipetridis''.', N'Successfull Audit', CAST(N'2017-06-19 09:06:23.610' AS DateTime), N'995015628')
SET IDENTITY_INSERT [dbo].[CPanelAccessLog] OFF
INSERT [dbo].[CPanelPrivGroups] ([PrivilegeGroupID], [PrivilegeGroupName], [DisplayOrder], [IsEnabled]) VALUES (1, N'Χρήστες Συστήματος', 1, 1)
INSERT [dbo].[CPanelPrivGroups] ([PrivilegeGroupID], [PrivilegeGroupName], [DisplayOrder], [IsEnabled]) VALUES (2, N'Περιεχόμενα Ιστοσελίδας', 2, 1)
INSERT [dbo].[CPanelPrivGroups] ([PrivilegeGroupID], [PrivilegeGroupName], [DisplayOrder], [IsEnabled]) VALUES (3, N'Ενημέρωση', 3, 1)
INSERT [dbo].[CPanelPrivGroups] ([PrivilegeGroupID], [PrivilegeGroupName], [DisplayOrder], [IsEnabled]) VALUES (4, N'Τηλεφωνικός Κατάλογος', 4, 1)
INSERT [dbo].[CPanelPrivGroups] ([PrivilegeGroupID], [PrivilegeGroupName], [DisplayOrder], [IsEnabled]) VALUES (5, N'Ο λογαριασμός μου', 5, 1)
INSERT [dbo].[CPanelPrivileges] ([PrivilegeID], [PrivilegeDescription], [DisplayOrder], [StartupScript], [PrivilegeGroupID], [IsEnabled]) VALUES (1, N'Διαχείριση Χρηστών', 1, N'manageCPanelUsers.asp', 1, 1)
INSERT [dbo].[CPanelPrivileges] ([PrivilegeID], [PrivilegeDescription], [DisplayOrder], [StartupScript], [PrivilegeGroupID], [IsEnabled]) VALUES (2, N'Φωτογραφίες', 1, N'manageImages.asp', 2, 1)
INSERT [dbo].[CPanelPrivileges] ([PrivilegeID], [PrivilegeDescription], [DisplayOrder], [StartupScript], [PrivilegeGroupID], [IsEnabled]) VALUES (3, N'Έγγραφα', 2, N'manageDocuments.asp', 2, 1)
INSERT [dbo].[CPanelPrivileges] ([PrivilegeID], [PrivilegeDescription], [DisplayOrder], [StartupScript], [PrivilegeGroupID], [IsEnabled]) VALUES (4, N'Αρχεία', 3, N'manageFiles.asp', 2, 1)
INSERT [dbo].[CPanelPrivileges] ([PrivilegeID], [PrivilegeDescription], [DisplayOrder], [StartupScript], [PrivilegeGroupID], [IsEnabled]) VALUES (5, N'Ιστοσελίδες', 4, N'manageWebContent.asp', 2, 1)
INSERT [dbo].[CPanelPrivileges] ([PrivilegeID], [PrivilegeDescription], [DisplayOrder], [StartupScript], [PrivilegeGroupID], [IsEnabled]) VALUES (6, N'Photo Galleries', 5, N'managePhotoGalleries.asp', 2, 1)
INSERT [dbo].[CPanelPrivileges] ([PrivilegeID], [PrivilegeDescription], [DisplayOrder], [StartupScript], [PrivilegeGroupID], [IsEnabled]) VALUES (7, N'Οργανόγραμμα', 5, N'manageOrgChart.asp', 2, 1)
INSERT [dbo].[CPanelPrivileges] ([PrivilegeID], [PrivilegeDescription], [DisplayOrder], [StartupScript], [PrivilegeGroupID], [IsEnabled]) VALUES (8, N'Γραφείο Τύπου', 1, N'managePressOffice.asp', 3, 1)
INSERT [dbo].[CPanelPrivileges] ([PrivilegeID], [PrivilegeDescription], [DisplayOrder], [StartupScript], [PrivilegeGroupID], [IsEnabled]) VALUES (9, N'Κατάλογος Τμημάτων', 1, N'manageDeptPhoneBook.asp', 4, 1)
INSERT [dbo].[CPanelPrivileges] ([PrivilegeID], [PrivilegeDescription], [DisplayOrder], [StartupScript], [PrivilegeGroupID], [IsEnabled]) VALUES (10, N'Κατάλογος Ιατρών', 2, N'manageDocPhoneBook.asp', 4, 1)
INSERT [dbo].[CPanelPrivileges] ([PrivilegeID], [PrivilegeDescription], [DisplayOrder], [StartupScript], [PrivilegeGroupID], [IsEnabled]) VALUES (11, N'Αλλαγή Κωδικού', 1, N'changePassword.asp', 5, 1)
INSERT [dbo].[CPanelPrivileges] ([PrivilegeID], [PrivilegeDescription], [DisplayOrder], [StartupScript], [PrivilegeGroupID], [IsEnabled]) VALUES (12, N'Διαγωνισμοί', 2, N'manageTenders.asp', 3, 1)
SET IDENTITY_INSERT [dbo].[CPanelUserPrivs] ON 

INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (276, 1, 1)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (277, 1, 2)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (278, 1, 3)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (279, 1, 4)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (280, 1, 5)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (281, 1, 6)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (282, 1, 7)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (283, 1, 8)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (284, 1, 9)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (285, 1, 10)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (286, 1, 11)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (298, 4, 1)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (299, 4, 2)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (300, 4, 3)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (301, 4, 4)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (302, 4, 5)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (303, 4, 6)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (304, 4, 7)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (305, 4, 8)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (306, 4, 9)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (307, 4, 10)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (308, 4, 11)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (309, 5, 1)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (310, 5, 2)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (311, 5, 3)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (312, 5, 4)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (313, 5, 5)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (314, 5, 6)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (315, 5, 7)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (316, 5, 8)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (317, 5, 9)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (318, 5, 10)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (319, 5, 11)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (320, 3, 1)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (321, 3, 2)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (322, 3, 3)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (323, 3, 4)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (324, 3, 5)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (325, 3, 6)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (326, 3, 7)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (327, 3, 8)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (328, 3, 12)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (329, 3, 9)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (330, 3, 10)
INSERT [dbo].[CPanelUserPrivs] ([UserPrivilegeID], [CPanelUserID], [PrivilegeID]) VALUES (331, 3, 11)
SET IDENTITY_INSERT [dbo].[CPanelUserPrivs] OFF
SET IDENTITY_INSERT [dbo].[CPanelUsers] ON 

INSERT [dbo].[CPanelUsers] ([CPanelUserID], [FullName], [UserName], [UserPass], [UserEmail], [IPRestriction1], [IPRestriction2], [IPRestriction3], [IsEnabled]) VALUES (1, N'Διαχειριστής Συστήματος', N'admin', N'UobYx+PTYFo=', N'ipetridis@rhodes-hospital.gr', NULL, NULL, NULL, 1)
INSERT [dbo].[CPanelUsers] ([CPanelUserID], [FullName], [UserName], [UserPass], [UserEmail], [IPRestriction1], [IPRestriction2], [IPRestriction3], [IsEnabled]) VALUES (3, N'Ιωάννης Πετριδης', N'ipetridis', N'K5G/YwDMaxE=', N'ipetridis@rtel.gr', NULL, NULL, NULL, 1)
INSERT [dbo].[CPanelUsers] ([CPanelUserID], [FullName], [UserName], [UserPass], [UserEmail], [IPRestriction1], [IPRestriction2], [IPRestriction3], [IsEnabled]) VALUES (4, N'Ιάκωβος Καράκιζας', N'jack', N'UobYx+PTYFo=', N'jack@rhodes-hospital.gr', NULL, NULL, NULL, 1)
INSERT [dbo].[CPanelUsers] ([CPanelUserID], [FullName], [UserName], [UserPass], [UserEmail], [IPRestriction1], [IPRestriction2], [IPRestriction3], [IsEnabled]) VALUES (5, N'Ελευθερία Φιλτζαντζίδου', N'elli', N'UobYx+PTYFo=', N'elli@rhodes-hospital.gr', NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[CPanelUsers] OFF
SET IDENTITY_INSERT [dbo].[DocumentBase] ON 

INSERT [dbo].[DocumentBase] ([DocumentID], [DocTitle], [DocName], [DocContentType], [DocFileSize], [DocFileExt], [DocURL], [DocumentCategoryID], [IsActive]) VALUES (8, N'The final test edited', N'05_2013 .pdf', N'pdf', 207139, N'pdf', N'/resources/docs/website/05_2013 .pdf', 1, 1)
INSERT [dbo].[DocumentBase] ([DocumentID], [DocTitle], [DocName], [DocContentType], [DocFileSize], [DocFileExt], [DocURL], [DocumentCategoryID], [IsActive]) VALUES (9, N'Test', N'56_2013.pdf', N'pdf', 753002, N'pdf', N'/resources/docs/pressoffice/56_2013.pdf', 2, 1)
SET IDENTITY_INSERT [dbo].[DocumentBase] OFF
SET IDENTITY_INSERT [dbo].[DocumentCategories] ON 

INSERT [dbo].[DocumentCategories] ([DocumentCategoryID], [DocumentCategory], [DocumentStoragePath]) VALUES (1, N'Ιστοσελίδα', N'/resources/docs/website')
INSERT [dbo].[DocumentCategories] ([DocumentCategoryID], [DocumentCategory], [DocumentStoragePath]) VALUES (2, N'Νέα & Ανακοινώσεις', N'/resources/docs/pressoffice')
INSERT [dbo].[DocumentCategories] ([DocumentCategoryID], [DocumentCategory], [DocumentStoragePath]) VALUES (3, N'Διαγωνισμοί', N'/resources/docs/tenders')
INSERT [dbo].[DocumentCategories] ([DocumentCategoryID], [DocumentCategory], [DocumentStoragePath]) VALUES (4, N'Προκήρυξη Θέσεων', N'/resources/docs/recruitment')
SET IDENTITY_INSERT [dbo].[DocumentCategories] OFF
SET IDENTITY_INSERT [dbo].[FileBase] ON 

INSERT [dbo].[FileBase] ([FileID], [FileTitle], [FileName], [FileContentType], [FileSize], [FileExt], [FileURL], [FileCategoryID], [IsActive]) VALUES (6, NULL, N'0902.zip', N'x-zip-compressed', 3759, N'zip       ', N'/resources/files/website/0902.zip', 1, 1)
SET IDENTITY_INSERT [dbo].[FileBase] OFF
SET IDENTITY_INSERT [dbo].[FileCategories] ON 

INSERT [dbo].[FileCategories] ([FileCategoryID], [FileCategory], [FileStoragePath]) VALUES (1, N'Ιστοσελίδα', N'/resources/files/website')
INSERT [dbo].[FileCategories] ([FileCategoryID], [FileCategory], [FileStoragePath]) VALUES (2, N'Διαγωνισμοί', N'/resources/files/tenders')
SET IDENTITY_INSERT [dbo].[FileCategories] OFF
SET IDENTITY_INSERT [dbo].[ImageBase] ON 

INSERT [dbo].[ImageBase] ([ImageID], [ImageName], [ImageCaption], [ImageFormat], [ImageWidth], [ImageHeight], [ImageSize], [ImageExtension], [ImageURL], [ThumbnailURL], [ThumbnailWidth], [ThumbnailHeight], [ImageCategoryID], [IsActive]) VALUES (9, N'gnr-rodou10.jpg', N'ΓΕΝΙΚΟ ΝΟΣΟΚΟΜΕΙΟ ΡΟΔΟΥ - ΑΕΡΟΦΩΤΟΓΡΑΦΙΑ', N'jpeg', 500, 333, 210914, N'jpg', N'/resources/images/galleries/fullsize/gnr-rodou10.jpg', N'/resources/images/galleries/thumbnails/gnr-rodou10.jpg', 150, 100, 2, 1)
INSERT [dbo].[ImageBase] ([ImageID], [ImageName], [ImageCaption], [ImageFormat], [ImageWidth], [ImageHeight], [ImageSize], [ImageExtension], [ImageURL], [ThumbnailURL], [ThumbnailWidth], [ThumbnailHeight], [ImageCategoryID], [IsActive]) VALUES (10, N'gnr-rodou2.jpg', N'ΓΕΝΙΚΟ ΝΟΣΟΚΟΜΕΙΟ ΡΟΔΟΥ - ΚΕΝΤΡΙΚΗ ΕΙΣΟΔΟΣ', N'jpeg', 905, 600, 80634, N'jpg', N'/resources/images/galleries/fullsize/gnr-rodou2.jpg', N'/resources/images/galleries/thumbnails/gnr-rodou2.jpg', 150, 100, 2, 1)
INSERT [dbo].[ImageBase] ([ImageID], [ImageName], [ImageCaption], [ImageFormat], [ImageWidth], [ImageHeight], [ImageSize], [ImageExtension], [ImageURL], [ThumbnailURL], [ThumbnailWidth], [ThumbnailHeight], [ImageCategoryID], [IsActive]) VALUES (11, N'gnr-rodou9.jpg', N'ΓΕΝΙΚΟ ΝΟΣΟΚΟΜΕΙΟ ΡΟΔΟΥ - RECEPTION', N'jpeg', 500, 331, 133647, N'jpg', N'/resources/images/galleries/fullsize/gnr-rodou9.jpg', N'/resources/images/galleries/thumbnails/gnr-rodou9.jpg', 151, 100, 2, 1)
SET IDENTITY_INSERT [dbo].[ImageBase] OFF
SET IDENTITY_INSERT [dbo].[ImageCategories] ON 

INSERT [dbo].[ImageCategories] ([ImageCategoryID], [ImageCategory], [ImageFullsizeStoragePath], [ImageThumbnailStoragePath]) VALUES (1, N'Ιστοσελίδα', N'/resources/images/website/fullsize', N'/resources/images/website/thumbnails')
INSERT [dbo].[ImageCategories] ([ImageCategoryID], [ImageCategory], [ImageFullsizeStoragePath], [ImageThumbnailStoragePath]) VALUES (2, N'Photo Gallery', N'/resources/images/galleries/fullsize', N'/resources/images/galleries/thumbnails')
SET IDENTITY_INSERT [dbo].[ImageCategories] OFF
SET IDENTITY_INSERT [dbo].[PageItems] ON 

INSERT [dbo].[PageItems] ([PageItemID], [PageTitle], [MetaDescription], [MetaKeywords], [PageBody], [PageTypeID], [PublicationDate], [ExpirationDate], [NeverExpires], [DisplayInNavigation], [DisplaySideNavigation], [RedirectURL], [ContentSourceItemID], [DisplayOrder], [ParentItemID], [AllowEditID], [Published]) VALUES (1, N'Το Νοσοκομείο', NULL, NULL, NULL, 2, CAST(N'2015-12-02 10:09:00.000' AS DateTime), NULL, 1, 1, 1, NULL, NULL, 1, 0, NULL, 1)
INSERT [dbo].[PageItems] ([PageItemID], [PageTitle], [MetaDescription], [MetaKeywords], [PageBody], [PageTypeID], [PublicationDate], [ExpirationDate], [NeverExpires], [DisplayInNavigation], [DisplaySideNavigation], [RedirectURL], [ContentSourceItemID], [DisplayOrder], [ParentItemID], [AllowEditID], [Published]) VALUES (2, N'Οργανωτική Δομή', NULL, NULL, NULL, 2, CAST(N'2015-12-02 10:16:00.000' AS DateTime), NULL, 1, 1, 1, NULL, NULL, 2, 0, NULL, 1)
INSERT [dbo].[PageItems] ([PageItemID], [PageTitle], [MetaDescription], [MetaKeywords], [PageBody], [PageTypeID], [PublicationDate], [ExpirationDate], [NeverExpires], [DisplayInNavigation], [DisplaySideNavigation], [RedirectURL], [ContentSourceItemID], [DisplayOrder], [ParentItemID], [AllowEditID], [Published]) VALUES (3, N'Ενημέρωση', NULL, NULL, NULL, 2, CAST(N'2015-12-02 10:17:00.000' AS DateTime), NULL, 1, 1, 1, NULL, NULL, 3, 0, NULL, 1)
INSERT [dbo].[PageItems] ([PageItemID], [PageTitle], [MetaDescription], [MetaKeywords], [PageBody], [PageTypeID], [PublicationDate], [ExpirationDate], [NeverExpires], [DisplayInNavigation], [DisplaySideNavigation], [RedirectURL], [ContentSourceItemID], [DisplayOrder], [ParentItemID], [AllowEditID], [Published]) VALUES (4, N'Για τον Ασθενή', NULL, NULL, NULL, 2, CAST(N'2015-12-02 10:18:00.000' AS DateTime), NULL, 1, 1, 1, NULL, NULL, 4, 0, NULL, 1)
INSERT [dbo].[PageItems] ([PageItemID], [PageTitle], [MetaDescription], [MetaKeywords], [PageBody], [PageTypeID], [PublicationDate], [ExpirationDate], [NeverExpires], [DisplayInNavigation], [DisplaySideNavigation], [RedirectURL], [ContentSourceItemID], [DisplayOrder], [ParentItemID], [AllowEditID], [Published]) VALUES (5, N'Επικοινωνία', NULL, NULL, NULL, 2, CAST(N'2015-12-02 10:19:00.000' AS DateTime), NULL, 1, 1, 1, NULL, NULL, 5, 0, NULL, 1)
INSERT [dbo].[PageItems] ([PageItemID], [PageTitle], [MetaDescription], [MetaKeywords], [PageBody], [PageTypeID], [PublicationDate], [ExpirationDate], [NeverExpires], [DisplayInNavigation], [DisplaySideNavigation], [RedirectURL], [ContentSourceItemID], [DisplayOrder], [ParentItemID], [AllowEditID], [Published]) VALUES (6, N'Σκοπός', NULL, NULL, N'<p>Η σελίδα είναι υπο κατασκευή</p>', 1, CAST(N'2015-12-02 10:22:00.000' AS DateTime), NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, 1)
INSERT [dbo].[PageItems] ([PageItemID], [PageTitle], [MetaDescription], [MetaKeywords], [PageBody], [PageTypeID], [PublicationDate], [ExpirationDate], [NeverExpires], [DisplayInNavigation], [DisplaySideNavigation], [RedirectURL], [ContentSourceItemID], [DisplayOrder], [ParentItemID], [AllowEditID], [Published]) VALUES (7, N'Ιστορικά Στοιχεία', NULL, NULL, N'<p>Η ενότητα είναι υπό κατασκευή</p>', 1, CAST(N'2015-12-02 10:23:00.000' AS DateTime), NULL, 1, 1, 1, NULL, NULL, 2, 1, NULL, 1)
INSERT [dbo].[PageItems] ([PageItemID], [PageTitle], [MetaDescription], [MetaKeywords], [PageBody], [PageTypeID], [PublicationDate], [ExpirationDate], [NeverExpires], [DisplayInNavigation], [DisplaySideNavigation], [RedirectURL], [ContentSourceItemID], [DisplayOrder], [ParentItemID], [AllowEditID], [Published]) VALUES (8, N'Διοίκηση', NULL, NULL, NULL, 2, CAST(N'2015-12-02 10:24:00.000' AS DateTime), NULL, 1, 1, 1, NULL, NULL, 3, 1, NULL, 1)
INSERT [dbo].[PageItems] ([PageItemID], [PageTitle], [MetaDescription], [MetaKeywords], [PageBody], [PageTypeID], [PublicationDate], [ExpirationDate], [NeverExpires], [DisplayInNavigation], [DisplaySideNavigation], [RedirectURL], [ContentSourceItemID], [DisplayOrder], [ParentItemID], [AllowEditID], [Published]) VALUES (9, N'Διοικητής', N'Διοικητής', N'Διοικητής', N'<p>Η σελίδα αυτή είναι υπό κατασκευή</p>', 1, CAST(N'2016-02-22 09:25:00.000' AS DateTime), NULL, 1, 1, 1, NULL, NULL, 1, 8, NULL, 1)
INSERT [dbo].[PageItems] ([PageItemID], [PageTitle], [MetaDescription], [MetaKeywords], [PageBody], [PageTypeID], [PublicationDate], [ExpirationDate], [NeverExpires], [DisplayInNavigation], [DisplaySideNavigation], [RedirectURL], [ContentSourceItemID], [DisplayOrder], [ParentItemID], [AllowEditID], [Published]) VALUES (10, N'Αναπλ. Διοικητής', N'Αναπλ. Διοικητής', N'Αναπλ. Διοικητής', N'<p>Η σελίδα αυτή είναι υπό κατασκευή</p>', 1, CAST(N'2016-02-22 09:27:00.000' AS DateTime), NULL, 1, 1, 1, NULL, NULL, 2, 8, NULL, 1)
INSERT [dbo].[PageItems] ([PageItemID], [PageTitle], [MetaDescription], [MetaKeywords], [PageBody], [PageTypeID], [PublicationDate], [ExpirationDate], [NeverExpires], [DisplayInNavigation], [DisplaySideNavigation], [RedirectURL], [ContentSourceItemID], [DisplayOrder], [ParentItemID], [AllowEditID], [Published]) VALUES (11, N'Διοικητικό Συμβούλιο', N'Διοικητικό Συμβούλιο', N'Διοικητικό Συμβούλιο', N'<p>Η σελίδα αυτή είναι υπό κατασκευή</p>', 1, CAST(N'2016-02-22 09:29:00.000' AS DateTime), NULL, 1, 1, 1, NULL, NULL, 3, 8, NULL, 1)
INSERT [dbo].[PageItems] ([PageItemID], [PageTitle], [MetaDescription], [MetaKeywords], [PageBody], [PageTypeID], [PublicationDate], [ExpirationDate], [NeverExpires], [DisplayInNavigation], [DisplaySideNavigation], [RedirectURL], [ContentSourceItemID], [DisplayOrder], [ParentItemID], [AllowEditID], [Published]) VALUES (12, N'Οργονόγραμμα', N'Οργονόγραμμα', N'Οργονόγραμμα', NULL, 1, CAST(N'2016-02-22 09:34:00.000' AS DateTime), NULL, 1, 1, 1, N'org-chart.asp', NULL, 4, 1, NULL, 1)
INSERT [dbo].[PageItems] ([PageItemID], [PageTitle], [MetaDescription], [MetaKeywords], [PageBody], [PageTypeID], [PublicationDate], [ExpirationDate], [NeverExpires], [DisplayInNavigation], [DisplaySideNavigation], [RedirectURL], [ContentSourceItemID], [DisplayOrder], [ParentItemID], [AllowEditID], [Published]) VALUES (13, N'Οικονομικά Στοιχεία', N'Οικονομικά Στοιχεία', N'Οικονομικά Στοιχεία', N'<p>Η σελίδα είναι υπο κατασκευή</p>', 1, CAST(N'2016-02-22 09:54:00.000' AS DateTime), NULL, 1, 1, 1, NULL, NULL, 5, 1, NULL, 1)
INSERT [dbo].[PageItems] ([PageItemID], [PageTitle], [MetaDescription], [MetaKeywords], [PageBody], [PageTypeID], [PublicationDate], [ExpirationDate], [NeverExpires], [DisplayInNavigation], [DisplaySideNavigation], [RedirectURL], [ContentSourceItemID], [DisplayOrder], [ParentItemID], [AllowEditID], [Published]) VALUES (14, N'Εγκαταστάσεις &amp; Εξοπλισμός', N'Εγκαταστάσεις &amp; Εξοπλισμός', N'Εγκαταστάσεις &amp; Εξοπλισμός', N'<p></p>
<ul class="list-inline hidden-print">
<li style="margin:5px 5px 5px 0;"><a href="/resources/images/galleries/fullsize/gnr-rodou10.jpg"><img class="img-thumbnail" src="/resources/images/galleries/thumbnails/gnr-rodou10.jpg" alt="" /></a></li>
<li style="margin:5px 5px 5px 0;"><a href="/resources/images/galleries/fullsize/gnr-rodou2.jpg"><img class="img-thumbnail" src="/resources/images/galleries/thumbnails/gnr-rodou2.jpg" alt="" /></a></li>
<li style="margin:5px 5px 5px 0;"><a href="/resources/images/galleries/fullsize/gnr-rodou9.jpg"><img class="img-thumbnail" src="/resources/images/galleries/thumbnails/gnr-rodou9.jpg" alt="" /></a></li>
</ul>
<p></p>
<p></p>', 1, CAST(N'2016-02-22 10:00:00.000' AS DateTime), NULL, 1, 1, 1, NULL, NULL, 6, 1, NULL, 1)
INSERT [dbo].[PageItems] ([PageItemID], [PageTitle], [MetaDescription], [MetaKeywords], [PageBody], [PageTypeID], [PublicationDate], [ExpirationDate], [NeverExpires], [DisplayInNavigation], [DisplaySideNavigation], [RedirectURL], [ContentSourceItemID], [DisplayOrder], [ParentItemID], [AllowEditID], [Published]) VALUES (15, N'Δ.ΙΕΚ Βοηθών Νοσηλευτικής Ατόμων με Ειδικές Παθήσεις', N'Δ.ΙΕΚ Βοηθών Νοσηλευτικής Ατόμων με Ειδικές Παθήσεις', N'Δ.ΙΕΚ Βοηθών Νοσηλευτικής Ατόμων με Ειδικές Παθήσεις', N'<p><span style="font-family: monospace; font-size: medium; white-space: pre-wrap;">Δ.ΙΕΚ Βοηθών Νοσηλευτικής Ατόμων με Ειδικές Παθήσεις</span></p>', 1, CAST(N'2016-02-22 10:06:00.000' AS DateTime), NULL, 1, 1, 1, NULL, NULL, 7, 1, NULL, 1)
INSERT [dbo].[PageItems] ([PageItemID], [PageTitle], [MetaDescription], [MetaKeywords], [PageBody], [PageTypeID], [PublicationDate], [ExpirationDate], [NeverExpires], [DisplayInNavigation], [DisplaySideNavigation], [RedirectURL], [ContentSourceItemID], [DisplayOrder], [ParentItemID], [AllowEditID], [Published]) VALUES (16, N'Ιατρική Υπηρεσία', N'Ιατρική Υπηρεσία', N'Ιατρική Υπηρεσία', NULL, 2, CAST(N'2016-02-22 10:11:00.000' AS DateTime), NULL, 1, 1, 1, NULL, NULL, 1, 2, NULL, 1)
INSERT [dbo].[PageItems] ([PageItemID], [PageTitle], [MetaDescription], [MetaKeywords], [PageBody], [PageTypeID], [PublicationDate], [ExpirationDate], [NeverExpires], [DisplayInNavigation], [DisplaySideNavigation], [RedirectURL], [ContentSourceItemID], [DisplayOrder], [ParentItemID], [AllowEditID], [Published]) VALUES (17, N'Νοσηλευτική Υπηρεσία', N'Νοσηλευτική Υπηρεσία', N'Νοσηλευτική Υπηρεσία', NULL, 2, CAST(N'2016-02-22 10:12:00.000' AS DateTime), NULL, 1, 1, 1, NULL, NULL, 2, 2, NULL, 1)
SET IDENTITY_INSERT [dbo].[PageItems] OFF
SET IDENTITY_INSERT [dbo].[PageTypes] ON 

INSERT [dbo].[PageTypes] ([PageTypeID], [PageType], [IsEnabled]) VALUES (1, N'Σελίδα περιεχομένων', 1)
INSERT [dbo].[PageTypes] ([PageTypeID], [PageType], [IsEnabled]) VALUES (2, N'Σελίδα σύνδεσης', 1)
SET IDENTITY_INSERT [dbo].[PageTypes] OFF
SET IDENTITY_INSERT [dbo].[PhotoGalleries] ON 

INSERT [dbo].[PhotoGalleries] ([GalleryID], [GalleryDescription], [ImageTotal], [LayoutType], [ImageCollection], [IsActive]) VALUES (3, N'ΕΓΚΑΤΑΣΤΑΣΕΙΣ', 3, N'grid', N'9, 10, 11', 1)
SET IDENTITY_INSERT [dbo].[PhotoGalleries] OFF
SET IDENTITY_INSERT [dbo].[PressItemCategories] ON 

INSERT [dbo].[PressItemCategories] ([PressItemCategoryID], [PressItemCategory], [IsEnabled]) VALUES (1, N'ΑΝΑΚΟΙΝΩΣΗ', 1)
INSERT [dbo].[PressItemCategories] ([PressItemCategoryID], [PressItemCategory], [IsEnabled]) VALUES (2, N'ΔΕΛΤΙΟ ΤΥΠΟΥ', 1)
INSERT [dbo].[PressItemCategories] ([PressItemCategoryID], [PressItemCategory], [IsEnabled]) VALUES (3, N'ΠΡΟΚΗΡΥΞΗ ΘΕΣΕΩΝ', 1)
SET IDENTITY_INSERT [dbo].[PressItemCategories] OFF
SET IDENTITY_INSERT [dbo].[PressRoom] ON 

INSERT [dbo].[PressRoom] ([PressItemID], [PressItemTitle], [PressItemBody], [PublicationDate], [ExpirationDate], [NeverExpires], [DisplayOnFirstPage], [PressItemCategoryID], [RelatedDocumentList], [IsActive]) VALUES (1, N'Νέα Ιστοσελίδα του ΓΝ ΡΟΔΟΥ', N'<p>Νέα Ιστοσελίδα του Γ.Ν ΡΟΔΟΥ</p>', CAST(N'2016-02-25 14:09:00.000' AS DateTime), NULL, 1, 1, 1, N'9', 1)
SET IDENTITY_INSERT [dbo].[PressRoom] OFF
SET IDENTITY_INSERT [dbo].[ThumbnailDimensions] ON 

INSERT [dbo].[ThumbnailDimensions] ([DimensionID], [Dimensions], [DimensionLabel], [DisplayOrder]) VALUES (1, N'50x50', N'Μικρό (50 x 50 pixels)', 1)
INSERT [dbo].[ThumbnailDimensions] ([DimensionID], [Dimensions], [DimensionLabel], [DisplayOrder]) VALUES (2, N'75x75', N'Μεσαίο (75 x 75 pixels)', 2)
INSERT [dbo].[ThumbnailDimensions] ([DimensionID], [Dimensions], [DimensionLabel], [DisplayOrder]) VALUES (3, N'100x100', N'Μεγάλο (100 x 100 pixels)', 3)
INSERT [dbo].[ThumbnailDimensions] ([DimensionID], [Dimensions], [DimensionLabel], [DisplayOrder]) VALUES (4, N'120x120', N'Πολύ μεγάλο (120 x 120 pixels)', 4)
INSERT [dbo].[ThumbnailDimensions] ([DimensionID], [Dimensions], [DimensionLabel], [DisplayOrder]) VALUES (6, N'150x80', N'Προσαρμοσμένο (150 x 80 pixels)', 6)
INSERT [dbo].[ThumbnailDimensions] ([DimensionID], [Dimensions], [DimensionLabel], [DisplayOrder]) VALUES (7, N'-1x100', N'Εικονίδο με ύψος 100 pixels', 5)
INSERT [dbo].[ThumbnailDimensions] ([DimensionID], [Dimensions], [DimensionLabel], [DisplayOrder]) VALUES (8, N'100x-1', N'Εικονίδιο με πλάτος 100 pixels', 6)
SET IDENTITY_INSERT [dbo].[ThumbnailDimensions] OFF
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'CreationYears', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ArtWork"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 259
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CreationYears'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'CreationYears', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CreationYears'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'GeographicalLocations', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ArtWork"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 293
               Right = 259
            End
            DisplayFlags = 280
            TopColumn = 7
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GeographicalLocations'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'GeographicalLocations', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GeographicalLocations'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'PaintingMediums', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ArtWork"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 259
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PaintingMediums'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'PaintingMediums', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PaintingMediums'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'Themes', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ArtWork"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 181
               Right = 259
            End
            DisplayFlags = 280
            TopColumn = 8
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Themes'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'Themes', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Themes'
GO
USE [master]
GO
ALTER DATABASE [asepz] SET  READ_WRITE 
GO
