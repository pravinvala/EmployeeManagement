USE [master]
GO
/****** Object:  Database [ExcellenceIT]    Script Date: 07/21/20 2:28:53 PM ******/
CREATE DATABASE [ExcellenceIT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ExcellenceIT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ExcellenceIT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ExcellenceIT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ExcellenceIT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExcellenceIT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExcellenceIT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ExcellenceIT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ExcellenceIT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ExcellenceIT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ExcellenceIT] SET ARITHABORT OFF 
GO
ALTER DATABASE [ExcellenceIT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ExcellenceIT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ExcellenceIT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ExcellenceIT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ExcellenceIT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ExcellenceIT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ExcellenceIT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ExcellenceIT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ExcellenceIT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ExcellenceIT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ExcellenceIT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ExcellenceIT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ExcellenceIT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ExcellenceIT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ExcellenceIT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ExcellenceIT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ExcellenceIT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ExcellenceIT] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ExcellenceIT] SET  MULTI_USER 
GO
ALTER DATABASE [ExcellenceIT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ExcellenceIT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ExcellenceIT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ExcellenceIT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ExcellenceIT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ExcellenceIT] SET QUERY_STORE = OFF
GO
USE [ExcellenceIT]
GO
/****** Object:  Table [dbo].[TBL_City]    Script Date: 07/21/20 2:28:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[StateID] [int] NULL,
 CONSTRAINT [PK_TBL_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_Country]    Script Date: 07/21/20 2:28:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Country](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_TBL_Country] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_Department]    Script Date: 07/21/20 2:28:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Department](
	[DeptID] [varchar](50) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_TBL_Department] PRIMARY KEY CLUSTERED 
(
	[DeptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_Employee]    Script Date: 07/21/20 2:28:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Employee](
	[EmpID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[DOB] [date] NULL,
	[Email] [varchar](100) NULL,
	[Phone] [varchar](50) NULL,
	[Department] [varchar](50) NULL,
	[CityID] [int] NULL,
	[StateID] [int] NULL,
	[CountryID] [int] NULL,
	[Pincode] [int] NULL,
	[EmployeePhoto] [varchar](50) NULL,
	[Hobbies] [varchar](100) NULL,
 CONSTRAINT [PK_TBL_Employee] PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_State]    Script Date: 07/21/20 2:28:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_State](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[CountryID] [int] NULL,
 CONSTRAINT [PK_TBL_State] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TBL_City] ON 

INSERT [dbo].[TBL_City] ([CityID], [Name], [StateID]) VALUES (1, N'Surat', 1)
INSERT [dbo].[TBL_City] ([CityID], [Name], [StateID]) VALUES (2, N'Baroda', 1)
INSERT [dbo].[TBL_City] ([CityID], [Name], [StateID]) VALUES (3, N'Ahmedabad', 1)
INSERT [dbo].[TBL_City] ([CityID], [Name], [StateID]) VALUES (4, N'Rajkot', 1)
SET IDENTITY_INSERT [dbo].[TBL_City] OFF
SET IDENTITY_INSERT [dbo].[TBL_Country] ON 

INSERT [dbo].[TBL_Country] ([CountryID], [Name]) VALUES (1, N'India')
INSERT [dbo].[TBL_Country] ([CountryID], [Name]) VALUES (2, N'US')
INSERT [dbo].[TBL_Country] ([CountryID], [Name]) VALUES (3, N'JAPAN')
INSERT [dbo].[TBL_Country] ([CountryID], [Name]) VALUES (4, N'AUS')
SET IDENTITY_INSERT [dbo].[TBL_Country] OFF
SET IDENTITY_INSERT [dbo].[TBL_Employee] ON 

INSERT [dbo].[TBL_Employee] ([EmpID], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone], [Department], [CityID], [StateID], [CountryID], [Pincode], [EmployeePhoto], [Hobbies]) VALUES (2, N'test', N'test', N'Male', CAST(N'1901-01-30' AS Date), N'test@gmail.com', N'9876543210', N'test', 1, 1, 1, 395010, N'123', N'test,data')
INSERT [dbo].[TBL_Employee] ([EmpID], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone], [Department], [CityID], [StateID], [CountryID], [Pincode], [EmployeePhoto], [Hobbies]) VALUES (1002, N'test', N'test', N'Male', CAST(N'0001-01-01' AS Date), N'test@gmail.com', N'9543527562', N'test', 1, 1, 1, 395010, N'123', N'test,data')
INSERT [dbo].[TBL_Employee] ([EmpID], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone], [Department], [CityID], [StateID], [CountryID], [Pincode], [EmployeePhoto], [Hobbies]) VALUES (1003, N'xcvbfd ', N'fcb f', N'Male', CAST(N'2020-07-24' AS Date), N'test@gmail.com', N'6545665156', N'test', 1, 1, 1, 395010, N'123', N'test')
INSERT [dbo].[TBL_Employee] ([EmpID], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone], [Department], [CityID], [StateID], [CountryID], [Pincode], [EmployeePhoto], [Hobbies]) VALUES (1005, N'fgeersdg', N'dergfesdrg', N'Male', CAST(N'2020-07-31' AS Date), N'test@gmail.com', N'4524832563', N'test', 1, 1, 1, 395010, N'123', N'test,data')
INSERT [dbo].[TBL_Employee] ([EmpID], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone], [Department], [CityID], [StateID], [CountryID], [Pincode], [EmployeePhoto], [Hobbies]) VALUES (1006, N'gjn', N'gvng', N'Male', CAST(N'2020-08-01' AS Date), N'test@gmail.com', N'8455155415', N'test', 1, 1, 1, 395010, N'123', N'test,data')
INSERT [dbo].[TBL_Employee] ([EmpID], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone], [Department], [CityID], [StateID], [CountryID], [Pincode], [EmployeePhoto], [Hobbies]) VALUES (1007, N'fghbf', N'fgbgfh', N'Male', CAST(N'2020-07-30' AS Date), N'test@gmail.com', N'6541515151', N'test', 1, 1, 1, 395010, N'123', N'test,data')
INSERT [dbo].[TBL_Employee] ([EmpID], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone], [Department], [CityID], [StateID], [CountryID], [Pincode], [EmployeePhoto], [Hobbies]) VALUES (1008, N'fbgh', N'fgcbh', N'Male', CAST(N'2020-07-31' AS Date), N'test@gmail.com', N'5615615615', N'test', 1, 1, 1, 395010, N'123', N'test,data')
SET IDENTITY_INSERT [dbo].[TBL_Employee] OFF
SET IDENTITY_INSERT [dbo].[TBL_State] ON 

INSERT [dbo].[TBL_State] ([StateID], [Name], [CountryID]) VALUES (2, N'GUJRAT', 1)
INSERT [dbo].[TBL_State] ([StateID], [Name], [CountryID]) VALUES (3, N'MP', 1)
INSERT [dbo].[TBL_State] ([StateID], [Name], [CountryID]) VALUES (4, N'UP', 1)
INSERT [dbo].[TBL_State] ([StateID], [Name], [CountryID]) VALUES (5, N'Raj', 1)
SET IDENTITY_INSERT [dbo].[TBL_State] OFF
ALTER TABLE [dbo].[TBL_City]  WITH CHECK ADD  CONSTRAINT [FK_TBL_City_TBL_State] FOREIGN KEY([StateID])
REFERENCES [dbo].[TBL_State] ([StateID])
GO
ALTER TABLE [dbo].[TBL_City] CHECK CONSTRAINT [FK_TBL_City_TBL_State]
GO
ALTER TABLE [dbo].[TBL_Employee]  WITH CHECK ADD  CONSTRAINT [FK_TBL_Employee_TBL_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[TBL_City] ([CityID])
GO
ALTER TABLE [dbo].[TBL_Employee] CHECK CONSTRAINT [FK_TBL_Employee_TBL_City]
GO
ALTER TABLE [dbo].[TBL_Employee]  WITH CHECK ADD  CONSTRAINT [FK_TBL_Employee_TBL_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[TBL_Country] ([CountryID])
GO
ALTER TABLE [dbo].[TBL_Employee] CHECK CONSTRAINT [FK_TBL_Employee_TBL_Country]
GO
ALTER TABLE [dbo].[TBL_Employee]  WITH CHECK ADD  CONSTRAINT [FK_TBL_Employee_TBL_State] FOREIGN KEY([StateID])
REFERENCES [dbo].[TBL_State] ([StateID])
GO
ALTER TABLE [dbo].[TBL_Employee] CHECK CONSTRAINT [FK_TBL_Employee_TBL_State]
GO
ALTER TABLE [dbo].[TBL_State]  WITH CHECK ADD  CONSTRAINT [FK_TBL_State_TBL_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[TBL_Country] ([CountryID])
GO
ALTER TABLE [dbo].[TBL_State] CHECK CONSTRAINT [FK_TBL_State_TBL_Country]
GO
USE [master]
GO
ALTER DATABASE [ExcellenceIT] SET  READ_WRITE 
GO
