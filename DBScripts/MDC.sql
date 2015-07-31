SET NOCOUNT ON;

CREATE DATABASE [MDC]
GO

USE [MDC]
GO

--AP
CREATE TABLE [dbo].[AccountPrivileges]
(
[Id] INT NOT NULL PRIMARY KEY,
[AccountType] VARCHAR(255) NOT NULL
)

CREATE TABLE [dbo].[Users]
(
[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
[Name] VARCHAR(255) NOT NULL, 
[Surname] VARCHAR(255) NOT NULL, 
[Adress] VARCHAR(255) NULL, 
[TelNumber] VARCHAR(15) NULL, 
[Email] VARCHAR(255) NULL, 
[Position] VARCHAR(255) NULL, 
[AccountType] INT FOREIGN KEY REFERENCES [dbo].[AccountPrivileges](Id) ON DELETE CASCADE ON UPDATE CASCADE,
[Login] VARCHAR(255) NOT NULL, 
[Password] VARCHAR(255) NOT NULL
)

INSERT INTO [dbo].[AccountPrivileges] VALUES (1, N'User')
INSERT INTO [dbo].[AccountPrivileges] VALUES (2, N'Admin')

--LL
CREATE TABLE [dbo].[AdditionalSuggestions] (
[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
[TypeOfService] VARCHAR(MAX) NULL,
[UnitPriceBph] INTEGER NULL,
[Number] INTEGER NULL,
[Day] INTEGER NULL,
);
CREATE TABLE [dbo].[SuggestionsPayment] (
[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
[FormPay] VARCHAR(MAX) NOT NULL,
[IndividualOrders] VARCHAR(MAX) NOT NULL,
[DescriptionRoomTables] VARCHAR(MAX) NOT NULL,
[Value] INTEGER NOT NULL,
);

--SN
CREATE TABLE [dbo].[PropReservation]
(
[Id_proposition] INT NOT NULL, --- add foreign key
[StartData] DATE NULL, --// only date or with time (datetime)-- ?
[StartTime] TIME NULL,
[EndData] DATE NULL,
[EndTime] TIME NULL,
[PeopleNumber] INT NULL,-- // to 200k ppl
[Hall] VARCHAR(30) NULL,
[HallSetting] VARCHAR(20) NULL
)
CREATE TABLE [dbo].[PropClient]
(
[Id_client] INT NOT NULL,-- // change to Ip_proposition ? Its this same id
[CompanyName] VARCHAR(50) NULL,
[CompanyStreet] VARCHAR(20) NULL,
[CompanyBuildingNumber] VARCHAR(4) NULL,
[CompanyZipCode] VARCHAR(6) NULL,
[CompanyCity] VARCHAR(30) NULL,
[NIP] VARCHAR(10) NULL,
[CustomerName] VARCHAR(20) NULL,
[CustomerSurname] VARCHAR(30) NULL,
[TelNumber] VARCHAR(15) NULL,
[DecisingPersonName] VARCHAR(20) NULL,
[DecisingPersonSurname] VARCHAR(30) NULL
)
CREATE TABLE [dbo].[HallEquipmnet]
(
[Id_HallProp] INT NOT NULL, --// change to Ip_proposition ? Its this same id
[Rent] VARCHAR(30) NULL,
[Brutto] INT NULL,
[VAT] TINYINT NULL,
[Amount] SMALLINT NULL,
[Days] SMALLINT NULL
)