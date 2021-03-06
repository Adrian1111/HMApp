USE [master]
GO
/****** Object:  Database [DiamondDB]    Script Date: 2015-10-22 23:04:12 ******/
CREATE DATABASE [DiamondDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DiamondDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DiamondDB.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DiamondDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DiamondDB_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DiamondDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DiamondDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DiamondDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DiamondDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DiamondDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DiamondDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DiamondDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DiamondDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DiamondDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DiamondDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DiamondDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DiamondDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DiamondDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DiamondDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DiamondDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DiamondDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DiamondDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DiamondDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DiamondDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DiamondDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DiamondDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DiamondDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DiamondDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DiamondDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DiamondDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DiamondDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DiamondDB] SET  MULTI_USER 
GO
ALTER DATABASE [DiamondDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DiamondDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DiamondDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DiamondDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DiamondDB]
GO
/****** Object:  Table [dbo].[AccountPrivileges]    Script Date: 2015-10-22 23:04:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AccountPrivileges](
	[Id] [int] NOT NULL,
	[AccountType] [varchar](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PropAccomodation]    Script Date: 2015-10-22 23:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PropAccomodation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_proposition] [int] NULL,
	[TypeOfRoom] [varchar](30) NULL,
	[BruttoPrice] [real] NULL,
	[Vat] [tinyint] NULL,
	[Amount] [smallint] NULL,
	[Days] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PropAccomodation_Dictionary]    Script Date: 2015-10-22 23:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PropAccomodation_Dictionary](
	[TypeOfRoom] [varchar](60) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PropAccomodationDiscount]    Script Date: 2015-10-22 23:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropAccomodationDiscount](
	[Id_proposition] [int] NULL,
	[StandardPrice] [real] NULL,
	[Discount] [real] NULL,
	[DoubleRoomEP] [real] NULL,
	[BussinesSingleEP] [real] NULL,
	[BussinesDoubleEP] [real] NULL,
	[ApartmentSingleEP] [real] NULL,
	[ApartmentDoubleEP] [real] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PropClient]    Script Date: 2015-10-22 23:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PropClient](
	[Id_proposition] [int] NULL,
	[CompanyName] [varchar](50) NULL,
	[CompanyStreet] [varchar](20) NULL,
	[CompanyBuildingNumber] [varchar](4) NULL,
	[CompanyZipCode] [varchar](6) NULL,
	[CompanyCity] [varchar](30) NULL,
	[NIP] [varchar](10) NULL,
	[CustomerName] [varchar](20) NULL,
	[CustomerSurname] [varchar](30) NULL,
	[PhoneNum] [varchar](15) NULL,
	[DecisingPersonName] [varchar](20) NULL,
	[DecisingPersonSurname] [varchar](30) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PropExtraServices]    Script Date: 2015-10-22 23:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PropExtraServices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_proposition] [int] NULL,
	[ServiceType] [varchar](60) NULL,
	[BruttoHourPrice] [int] NULL,
	[Vat] [tinyint] NULL,
	[Amount] [smallint] NULL,
	[Days] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PropExtraServices_Dictionary]    Script Date: 2015-10-22 23:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PropExtraServices_Dictionary](
	[ServiceType] [varchar](60) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PropExtraServicesDiscount]    Script Date: 2015-10-22 23:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropExtraServicesDiscount](
	[Id_proposition] [int] NULL,
	[StandardPrice] [real] NULL,
	[Discount] [real] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PropHallEquipment]    Script Date: 2015-10-22 23:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropHallEquipment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_proposition] [int] NULL,
	[Things] [nvarchar](50) NULL,
	[BruttoPrice] [real] NULL,
	[Vat] [real] NULL,
	[Amount] [int] NULL,
	[Days] [int] NULL,
 CONSTRAINT [PK_PropHallEquipment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PropHallEquipmentDiscount]    Script Date: 2015-10-22 23:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropHallEquipmentDiscount](
	[Id] [int] NULL,
	[StandardPrice] [real] NULL,
	[Discount] [real] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PropHallEquipmnet_Dictionary_First]    Script Date: 2015-10-22 23:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PropHallEquipmnet_Dictionary_First](
	[Things] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PropHallEquipmnet_Dictionary_Second]    Script Date: 2015-10-22 23:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropHallEquipmnet_Dictionary_Second](
	[Things] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PropMenuGastronomicThings_Dictionary_First]    Script Date: 2015-10-22 23:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PropMenuGastronomicThings_Dictionary_First](
	[ThingName] [nvarchar](170) NULL,
	[NettoMini] [real] NULL,
	[Vat] [tinyint] NULL,
	[MargeType] [varchar](5) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PropMenuMarge]    Script Date: 2015-10-22 23:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PropMenuMarge](
	[Id_proposition] [int] NULL,
	[MargeName] [nvarchar](40) NULL,
	[DefaultValue] [real] NULL,
	[MargeType] [varchar](5) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PropMenuMarge_Dictionary_First]    Script Date: 2015-10-22 23:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropMenuMarge_Dictionary_First](
	[MargeName] [nvarchar](40) NULL,
	[Value] [real] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PropMenuPosition]    Script Date: 2015-10-22 23:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PropMenuPosition](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_proposition] [int] NULL,
	[TypeOfService] [varchar](50) NULL,
	[BruttoPrice] [real] NULL,
	[Vat] [tinyint] NULL,
	[Amount] [smallint] NULL,
	[Days] [smallint] NULL,
 CONSTRAINT [PK__PropMenu__3214EC07B15CECE7] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PropMergeTypes_Dictionary]    Script Date: 2015-10-22 23:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PropMergeTypes_Dictionary](
	[MargeType] [varchar](5) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Proposition]    Script Date: 2015-10-22 23:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proposition](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_user] [int] NOT NULL,
	[UpdateDate] [date] NULL,
 CONSTRAINT [PK__Proposit__3214EC07B4C8EBAF] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PropPaymentSuggestions]    Script Date: 2015-10-22 23:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PropPaymentSuggestions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_proposition] [int] NOT NULL,
	[PaymentForm] [varchar](60) NULL,
	[InvoiceServiceName] [varchar](255) NULL,
	[IndividualOrders] [varchar](170) NULL,
	[CarPark] [varchar](90) NULL,
	[HallDescription] [varchar](max) NULL,
 CONSTRAINT [PK__PropPaym__3214EC07DDC91D22] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PropPaymentSuggestions_Dictionary_First]    Script Date: 2015-10-22 23:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PropPaymentSuggestions_Dictionary_First](
	[PaymentForm] [varchar](60) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PropPaymentSuggestions_Dictionary_Fourth]    Script Date: 2015-10-22 23:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PropPaymentSuggestions_Dictionary_Fourth](
	[CarPark] [varchar](255) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PropPaymentSuggestions_Dictionary_Second]    Script Date: 2015-10-22 23:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PropPaymentSuggestions_Dictionary_Second](
	[InvoiceServiceName] [varchar](255) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PropPaymentSuggestions_Dictionary_Third]    Script Date: 2015-10-22 23:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PropPaymentSuggestions_Dictionary_Third](
	[IndividualOrders] [varchar](170) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PropReservationDetails]    Script Date: 2015-10-22 23:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropReservationDetails](
	[Id_proposition] [int] NULL,
	[StartData] [date] NULL,
	[StartTime] [time](7) NULL,
	[EndData] [date] NULL,
	[EndTime] [time](7) NULL,
	[PeopleNumber] [int] NULL,
	[Hall] [nvarchar](50) NULL,
	[HallSetting] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 2015-10-22 23:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](35) NOT NULL,
	[Surname] [nvarchar](35) NOT NULL,
	[PhoneNum] [varchar](15) NULL,
	[Email] [nvarchar](50) NULL,
	[Position] [nvarchar](70) NULL,
	[AccountType] [int] NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[PropAccomodation]  WITH CHECK ADD  CONSTRAINT [FK__PropAccom__Id_pr__3A81B327] FOREIGN KEY([Id_proposition])
REFERENCES [dbo].[Proposition] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PropAccomodation] CHECK CONSTRAINT [FK__PropAccom__Id_pr__3A81B327]
GO
ALTER TABLE [dbo].[PropAccomodationDiscount]  WITH CHECK ADD FOREIGN KEY([Id_proposition])
REFERENCES [dbo].[Proposition] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PropClient]  WITH CHECK ADD  CONSTRAINT [FK__PropClien__Id_pr__239E4DCF] FOREIGN KEY([Id_proposition])
REFERENCES [dbo].[Proposition] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PropClient] CHECK CONSTRAINT [FK__PropClien__Id_pr__239E4DCF]
GO
ALTER TABLE [dbo].[PropExtraServices]  WITH CHECK ADD  CONSTRAINT [FK__PropExtra__Id_pr__3D5E1FD2] FOREIGN KEY([Id_proposition])
REFERENCES [dbo].[Proposition] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PropExtraServices] CHECK CONSTRAINT [FK__PropExtra__Id_pr__3D5E1FD2]
GO
ALTER TABLE [dbo].[PropExtraServicesDiscount]  WITH CHECK ADD FOREIGN KEY([Id_proposition])
REFERENCES [dbo].[Proposition] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PropHallEquipment]  WITH CHECK ADD  CONSTRAINT [FK_PropHallEquipment_Proposition] FOREIGN KEY([Id_proposition])
REFERENCES [dbo].[Proposition] ([Id])
GO
ALTER TABLE [dbo].[PropHallEquipment] CHECK CONSTRAINT [FK_PropHallEquipment_Proposition]
GO
ALTER TABLE [dbo].[PropHallEquipmentDiscount]  WITH CHECK ADD FOREIGN KEY([Id])
REFERENCES [dbo].[PropHallEquipment] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PropMenuMarge]  WITH CHECK ADD FOREIGN KEY([Id_proposition])
REFERENCES [dbo].[Proposition] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PropMenuPosition]  WITH CHECK ADD  CONSTRAINT [FK__PropMenuP__Id_pr__31EC6D26] FOREIGN KEY([Id_proposition])
REFERENCES [dbo].[Proposition] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PropMenuPosition] CHECK CONSTRAINT [FK__PropMenuP__Id_pr__31EC6D26]
GO
ALTER TABLE [dbo].[Proposition]  WITH CHECK ADD  CONSTRAINT [FK__Propositi__Id_us__1FCDBCEB] FOREIGN KEY([Id_user])
REFERENCES [dbo].[Users] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Proposition] CHECK CONSTRAINT [FK__Propositi__Id_us__1FCDBCEB]
GO
ALTER TABLE [dbo].[PropPaymentSuggestions]  WITH CHECK ADD  CONSTRAINT [FK__PropPayme__Id_pr__403A8C7D] FOREIGN KEY([Id_proposition])
REFERENCES [dbo].[Proposition] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PropPaymentSuggestions] CHECK CONSTRAINT [FK__PropPayme__Id_pr__403A8C7D]
GO
ALTER TABLE [dbo].[PropReservationDetails]  WITH CHECK ADD  CONSTRAINT [FK__PropReser__Id_pr__21B6055D] FOREIGN KEY([Id_proposition])
REFERENCES [dbo].[Proposition] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PropReservationDetails] CHECK CONSTRAINT [FK__PropReser__Id_pr__21B6055D]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([AccountType])
REFERENCES [dbo].[AccountPrivileges] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [DiamondDB] SET  READ_WRITE 
GO
