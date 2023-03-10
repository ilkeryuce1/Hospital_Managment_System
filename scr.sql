USE [master]
GO
/****** Object:  Database [Mvc_Hospital]    Script Date: 3.02.2023 14:28:24 ******/
CREATE DATABASE [Mvc_Hospital]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Mvc_Hospital', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Mvc_Hospital.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Mvc_Hospital_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Mvc_Hospital_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Mvc_Hospital] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Mvc_Hospital].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Mvc_Hospital] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Mvc_Hospital] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Mvc_Hospital] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Mvc_Hospital] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Mvc_Hospital] SET ARITHABORT OFF 
GO
ALTER DATABASE [Mvc_Hospital] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Mvc_Hospital] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Mvc_Hospital] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Mvc_Hospital] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Mvc_Hospital] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Mvc_Hospital] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Mvc_Hospital] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Mvc_Hospital] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Mvc_Hospital] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Mvc_Hospital] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Mvc_Hospital] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Mvc_Hospital] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Mvc_Hospital] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Mvc_Hospital] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Mvc_Hospital] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Mvc_Hospital] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Mvc_Hospital] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Mvc_Hospital] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Mvc_Hospital] SET  MULTI_USER 
GO
ALTER DATABASE [Mvc_Hospital] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Mvc_Hospital] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Mvc_Hospital] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Mvc_Hospital] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Mvc_Hospital] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Mvc_Hospital] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Mvc_Hospital] SET QUERY_STORE = OFF
GO
USE [Mvc_Hospital]
GO
/****** Object:  Table [dbo].[AccountTypeTable]    Script Date: 3.02.2023 14:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountTypeTable](
	[AccountTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_AccountTypeTable] PRIMARY KEY CLUSTERED 
(
	[AccountTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoctorAppointTable]    Script Date: 3.02.2023 14:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorAppointTable](
	[DoctorAppointID] [int] IDENTITY(1,1) NOT NULL,
	[DoctorID] [int] NOT NULL,
	[PatientID] [int] NOT NULL,
	[DoctorTimeSlotID] [int] NOT NULL,
	[AppointDate] [date] NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[IsFeeSubmit] [bit] NOT NULL,
	[IsChecked] [bit] NOT NULL,
	[TransectionID] [nvarchar](150) NOT NULL,
	[DoctorComment] [nvarchar](500) NULL,
 CONSTRAINT [PK_DoctorAppointTable] PRIMARY KEY CLUSTERED 
(
	[DoctorAppointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoctorTable]    Script Date: 3.02.2023 14:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorTable](
	[DoctorID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[ContactNo] [nvarchar](20) NOT NULL,
	[Fees] [float] NOT NULL,
	[Splztion] [nvarchar](150) NOT NULL,
	[ClinicAddress] [nvarchar](300) NOT NULL,
	[PermanentAddress] [nvarchar](300) NOT NULL,
	[EmailAddress] [nvarchar](150) NOT NULL,
	[ClinicPhoneNo] [nvarchar](20) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[PerDayMaxAppitmnt] [int] NULL,
	[Photo] [nvarchar](300) NULL,
	[AccountTypeID] [int] NOT NULL,
	[AccountNo] [nvarchar](100) NOT NULL,
	[GenderID] [int] NOT NULL,
 CONSTRAINT [PK_DoctorTable] PRIMARY KEY CLUSTERED 
(
	[DoctorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoctorTimeSlotTable]    Script Date: 3.02.2023 14:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorTimeSlotTable](
	[DoctorTimeSlotID] [int] IDENTITY(1,1) NOT NULL,
	[DoctorID] [int] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[ToTime] [time](7) NOT NULL,
	[FromTime] [time](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_DoctoTimeSlotTable] PRIMARY KEY CLUSTERED 
(
	[DoctorTimeSlotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GenderTable]    Script Date: 3.02.2023 14:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GenderTable](
	[GenderID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_GenderTable] PRIMARY KEY CLUSTERED 
(
	[GenderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LabAppointTable]    Script Date: 3.02.2023 14:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabAppointTable](
	[LabAppointID] [int] IDENTITY(1,1) NOT NULL,
	[LabTestID] [int] NOT NULL,
	[PatientID] [int] NOT NULL,
	[LabID] [int] NOT NULL,
	[LabTimeSlotID] [int] NOT NULL,
	[AppointDate] [date] NOT NULL,
	[IsFeeSubmit] [bit] NOT NULL,
	[IsComplete] [bit] NOT NULL,
	[Description] [nvarchar](300) NULL,
	[TransectionID] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_LabAppointTable] PRIMARY KEY CLUSTERED 
(
	[LabAppointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LabTable]    Script Date: 3.02.2023 14:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabTable](
	[LabID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Name] [nvarchar](300) NOT NULL,
	[Photo] [nvarchar](300) NULL,
	[ContactNo] [nvarchar](20) NOT NULL,
	[PhoneNo] [nvarchar](150) NULL,
	[EmailAddress] [nvarchar](150) NOT NULL,
	[PermanentAddress] [nvarchar](300) NOT NULL,
	[AboutLab] [nvarchar](500) NULL,
	[AccountTypeID] [int] NOT NULL,
	[AccountNo] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_LabTable] PRIMARY KEY CLUSTERED 
(
	[LabID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LabTestDetailsTable]    Script Date: 3.02.2023 14:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabTestDetailsTable](
	[LabTestDetailID] [int] IDENTITY(1,1) NOT NULL,
	[LabTestID] [int] NOT NULL,
	[LabID] [int] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[MinValue] [int] NOT NULL,
	[MaxValue] [int] NOT NULL,
 CONSTRAINT [PK_LabTestDetailsTable] PRIMARY KEY CLUSTERED 
(
	[LabTestDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LabTestTable]    Script Date: 3.02.2023 14:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabTestTable](
	[LabTestID] [int] IDENTITY(1,1) NOT NULL,
	[LabID] [int] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Cost] [float] NOT NULL,
 CONSTRAINT [PK_LabTestTable] PRIMARY KEY CLUSTERED 
(
	[LabTestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LabTimeSlotTable]    Script Date: 3.02.2023 14:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabTimeSlotTable](
	[LabTimeSlotID] [int] IDENTITY(1,1) NOT NULL,
	[LabID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ToTime] [time](7) NOT NULL,
	[FromTime] [time](7) NOT NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_LabTimeSlotTable] PRIMARY KEY CLUSTERED 
(
	[LabTimeSlotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientTable]    Script Date: 3.02.2023 14:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientTable](
	[PatientID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ContactNo] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[Description] [nvarchar](500) NULL,
	[Photo] [nvarchar](300) NULL,
	[GenderID] [int] NOT NULL,
 CONSTRAINT [PK_PatientTable] PRIMARY KEY CLUSTERED 
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientTestDetailTable]    Script Date: 3.02.2023 14:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientTestDetailTable](
	[LabAppointDetailID] [int] IDENTITY(1,1) NOT NULL,
	[LabAppointID] [int] NOT NULL,
	[LabTestDetailID] [int] NOT NULL,
	[PatientValue] [int] NOT NULL,
 CONSTRAINT [PK_PatientTestDetailTable] PRIMARY KEY CLUSTERED 
(
	[LabAppointDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTable]    Script Date: 3.02.2023 14:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTable](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeID] [int] NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[ContactNo] [nvarchar](20) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[IsVerifed] [bit] NOT NULL,
 CONSTRAINT [PK_UserTable] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTypeTable]    Script Date: 3.02.2023 14:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypeTable](
	[UserTypeID] [int] IDENTITY(1,1) NOT NULL,
	[UserType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserTypeTable] PRIMARY KEY CLUSTERED 
(
	[UserTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AccountTypeTable] ON 

INSERT [dbo].[AccountTypeTable] ([AccountTypeID], [Name]) VALUES (1, N'Bank Account')
INSERT [dbo].[AccountTypeTable] ([AccountTypeID], [Name]) VALUES (2, N'Easy Paisa')
INSERT [dbo].[AccountTypeTable] ([AccountTypeID], [Name]) VALUES (3, N'Mobile Account')
SET IDENTITY_INSERT [dbo].[AccountTypeTable] OFF
GO
SET IDENTITY_INSERT [dbo].[DoctorAppointTable] ON 

INSERT [dbo].[DoctorAppointTable] ([DoctorAppointID], [DoctorID], [PatientID], [DoctorTimeSlotID], [AppointDate], [Description], [IsFeeSubmit], [IsChecked], [TransectionID], [DoctorComment]) VALUES (2, 8, 4, 1, CAST(N'2022-12-02' AS Date), N'as', 1, 1, N'123', N'It''s  Absolutely Right')
INSERT [dbo].[DoctorAppointTable] ([DoctorAppointID], [DoctorID], [PatientID], [DoctorTimeSlotID], [AppointDate], [Description], [IsFeeSubmit], [IsChecked], [TransectionID], [DoctorComment]) VALUES (3, 9, 4, 6, CAST(N'2023-02-02' AS Date), N'asa', 0, 0, N'asda', N'')
INSERT [dbo].[DoctorAppointTable] ([DoctorAppointID], [DoctorID], [PatientID], [DoctorTimeSlotID], [AppointDate], [Description], [IsFeeSubmit], [IsChecked], [TransectionID], [DoctorComment]) VALUES (4, 9, 4, 6, CAST(N'2022-12-02' AS Date), N'as', 0, 0, N'12354', N'')
INSERT [dbo].[DoctorAppointTable] ([DoctorAppointID], [DoctorID], [PatientID], [DoctorTimeSlotID], [AppointDate], [Description], [IsFeeSubmit], [IsChecked], [TransectionID], [DoctorComment]) VALUES (5, 8, 4, 3, CAST(N'2023-02-02' AS Date), N'as', 0, 0, N'12', N'')
INSERT [dbo].[DoctorAppointTable] ([DoctorAppointID], [DoctorID], [PatientID], [DoctorTimeSlotID], [AppointDate], [Description], [IsFeeSubmit], [IsChecked], [TransectionID], [DoctorComment]) VALUES (6, 8, 4, 3, CAST(N'2022-12-02' AS Date), N'as', 0, 0, N'14566', N'')
INSERT [dbo].[DoctorAppointTable] ([DoctorAppointID], [DoctorID], [PatientID], [DoctorTimeSlotID], [AppointDate], [Description], [IsFeeSubmit], [IsChecked], [TransectionID], [DoctorComment]) VALUES (7, 8, 4, 2, CAST(N'2022-12-02' AS Date), N'as', 0, 0, N'asd', N'')
INSERT [dbo].[DoctorAppointTable] ([DoctorAppointID], [DoctorID], [PatientID], [DoctorTimeSlotID], [AppointDate], [Description], [IsFeeSubmit], [IsChecked], [TransectionID], [DoctorComment]) VALUES (8, 17, 4, 7, CAST(N'2023-01-17' AS Date), N'baş ağrısı', 0, 0, N'65456', N'')
SET IDENTITY_INSERT [dbo].[DoctorAppointTable] OFF
GO
SET IDENTITY_INSERT [dbo].[DoctorTable] ON 

INSERT [dbo].[DoctorTable] ([DoctorID], [UserID], [Name], [ContactNo], [Fees], [Splztion], [ClinicAddress], [PermanentAddress], [EmailAddress], [ClinicPhoneNo], [Description], [PerDayMaxAppitmnt], [Photo], [AccountTypeID], [AccountNo], [GenderID]) VALUES (8, 4, N'İlker Yüce', N'5534971008', 500, N'10', N'Ankara', N'Ankara', N'doktor@gmail.vom', N'1453', NULL, 10, NULL, 2, N'10', 2)
INSERT [dbo].[DoctorTable] ([DoctorID], [UserID], [Name], [ContactNo], [Fees], [Splztion], [ClinicAddress], [PermanentAddress], [EmailAddress], [ClinicPhoneNo], [Description], [PerDayMaxAppitmnt], [Photo], [AccountTypeID], [AccountNo], [GenderID]) VALUES (9, 34, N'neval türkdönmez', N'12354', 10, N'10', N'ad', N'asd', N'nevo@mail.com', N'123644', N'asda', 15, N'~/Content/DoctorImages/9.png', 1, N'12', 1)
INSERT [dbo].[DoctorTable] ([DoctorID], [UserID], [Name], [ContactNo], [Fees], [Splztion], [ClinicAddress], [PermanentAddress], [EmailAddress], [ClinicPhoneNo], [Description], [PerDayMaxAppitmnt], [Photo], [AccountTypeID], [AccountNo], [GenderID]) VALUES (10, 36, N'asd', N'13', 1, N'a', N'45', N'79', N'a', N'ada', N'asd', 12, NULL, 2, N'12', 1)
INSERT [dbo].[DoctorTable] ([DoctorID], [UserID], [Name], [ContactNo], [Fees], [Splztion], [ClinicAddress], [PermanentAddress], [EmailAddress], [ClinicPhoneNo], [Description], [PerDayMaxAppitmnt], [Photo], [AccountTypeID], [AccountNo], [GenderID]) VALUES (12, 36, N'asd', N'13', 1, N'50', N'45', N'79', N'a@gmail.comsda', N'4050', N'asd', 12, NULL, 2, N'12', 1)
INSERT [dbo].[DoctorTable] ([DoctorID], [UserID], [Name], [ContactNo], [Fees], [Splztion], [ClinicAddress], [PermanentAddress], [EmailAddress], [ClinicPhoneNo], [Description], [PerDayMaxAppitmnt], [Photo], [AccountTypeID], [AccountNo], [GenderID]) VALUES (13, 36, N'asd', N'13', 1, N'50', N'45', N'79', N'12365478987', N'4050', N'asd', 12, NULL, 2, N'12', 1)
INSERT [dbo].[DoctorTable] ([DoctorID], [UserID], [Name], [ContactNo], [Fees], [Splztion], [ClinicAddress], [PermanentAddress], [EmailAddress], [ClinicPhoneNo], [Description], [PerDayMaxAppitmnt], [Photo], [AccountTypeID], [AccountNo], [GenderID]) VALUES (14, 36, N'asd', N'13', 1, N'50', N'asda', N'ad', N'as', N'4050', N'asd', 12, N'~/Content/DoctorImages/14.png', 2, N'12', 1)
INSERT [dbo].[DoctorTable] ([DoctorID], [UserID], [Name], [ContactNo], [Fees], [Splztion], [ClinicAddress], [PermanentAddress], [EmailAddress], [ClinicPhoneNo], [Description], [PerDayMaxAppitmnt], [Photo], [AccountTypeID], [AccountNo], [GenderID]) VALUES (15, 37, N'ilker yuce', N'45698712365', 10, N'10', N'affa', N'asd', N'hasta@mail.com', N'14789965412', N'df', 50, N'~/Content/DoctorImages/15.png', 1, N'1236547', 2)
INSERT [dbo].[DoctorTable] ([DoctorID], [UserID], [Name], [ContactNo], [Fees], [Splztion], [ClinicAddress], [PermanentAddress], [EmailAddress], [ClinicPhoneNo], [Description], [PerDayMaxAppitmnt], [Photo], [AccountTypeID], [AccountNo], [GenderID]) VALUES (16, 43, N'ilker', N'145225', 14, N'50', N'aşsfll', N'asfkaşkf', N'yuce@mail.com', N'55349710080000', N'asfda


', 50, NULL, 2, N'1478965', 2)
INSERT [dbo].[DoctorTable] ([DoctorID], [UserID], [Name], [ContactNo], [Fees], [Splztion], [ClinicAddress], [PermanentAddress], [EmailAddress], [ClinicPhoneNo], [Description], [PerDayMaxAppitmnt], [Photo], [AccountTypeID], [AccountNo], [GenderID]) VALUES (17, 46, N'Mehmet Akkuş', N'0000000000', 6546454848, N'15151515', N'akldklsjskldfjkl', N'51awdkawjdaw4545', N'mail@gmail.com', N'101010101010', N'test açıklama', 546, N'~/Content/DoctorImages/17.png', 1, N'465454564', 2)
SET IDENTITY_INSERT [dbo].[DoctorTable] OFF
GO
SET IDENTITY_INSERT [dbo].[DoctorTimeSlotTable] ON 

INSERT [dbo].[DoctorTimeSlotTable] ([DoctorTimeSlotID], [DoctorID], [Name], [ToTime], [FromTime], [IsActive]) VALUES (1, 8, N'Morning 9 to 9:30 AM', CAST(N'09:30:00' AS Time), CAST(N'09:00:00' AS Time), 1)
INSERT [dbo].[DoctorTimeSlotTable] ([DoctorTimeSlotID], [DoctorID], [Name], [ToTime], [FromTime], [IsActive]) VALUES (2, 8, N'Morning 9.30 to10 AM', CAST(N'10:00:00' AS Time), CAST(N'09:30:00' AS Time), 1)
INSERT [dbo].[DoctorTimeSlotTable] ([DoctorTimeSlotID], [DoctorID], [Name], [ToTime], [FromTime], [IsActive]) VALUES (3, 8, N'Morning 10:00 to 10:30 AM', CAST(N'10:30:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[DoctorTimeSlotTable] ([DoctorTimeSlotID], [DoctorID], [Name], [ToTime], [FromTime], [IsActive]) VALUES (4, 8, N'Morning 10:30 to 11:00 AM', CAST(N'11:00:00' AS Time), CAST(N'10:30:00' AS Time), 1)
INSERT [dbo].[DoctorTimeSlotTable] ([DoctorTimeSlotID], [DoctorID], [Name], [ToTime], [FromTime], [IsActive]) VALUES (5, 8, N'Morning 11:00 to 11:30 AM', CAST(N'11:30:00' AS Time), CAST(N'11:00:00' AS Time), 1)
INSERT [dbo].[DoctorTimeSlotTable] ([DoctorTimeSlotID], [DoctorID], [Name], [ToTime], [FromTime], [IsActive]) VALUES (6, 9, N'Morning 9.30 to10 AM', CAST(N'09:30:00' AS Time), CAST(N'09:00:00' AS Time), 1)
INSERT [dbo].[DoctorTimeSlotTable] ([DoctorTimeSlotID], [DoctorID], [Name], [ToTime], [FromTime], [IsActive]) VALUES (7, 17, N'10', CAST(N'10:10:00' AS Time), CAST(N'02:02:00' AS Time), 1)
SET IDENTITY_INSERT [dbo].[DoctorTimeSlotTable] OFF
GO
SET IDENTITY_INSERT [dbo].[GenderTable] ON 

INSERT [dbo].[GenderTable] ([GenderID], [Name]) VALUES (1, N'Female')
INSERT [dbo].[GenderTable] ([GenderID], [Name]) VALUES (2, N'Male')
INSERT [dbo].[GenderTable] ([GenderID], [Name]) VALUES (3, N'Other')
SET IDENTITY_INSERT [dbo].[GenderTable] OFF
GO
SET IDENTITY_INSERT [dbo].[LabAppointTable] ON 

INSERT [dbo].[LabAppointTable] ([LabAppointID], [LabTestID], [PatientID], [LabID], [LabTimeSlotID], [AppointDate], [IsFeeSubmit], [IsComplete], [Description], [TransectionID]) VALUES (1, 1, 4, 1, 2, CAST(N'2022-12-12' AS Date), 1, 1, N'dvb', N'12')
INSERT [dbo].[LabAppointTable] ([LabAppointID], [LabTestID], [PatientID], [LabID], [LabTimeSlotID], [AppointDate], [IsFeeSubmit], [IsComplete], [Description], [TransectionID]) VALUES (2, 1, 4, 1, 4, CAST(N'2022-12-12' AS Date), 1, 0, N'asd', N'asd')
INSERT [dbo].[LabAppointTable] ([LabAppointID], [LabTestID], [PatientID], [LabID], [LabTimeSlotID], [AppointDate], [IsFeeSubmit], [IsComplete], [Description], [TransectionID]) VALUES (3, 1, 4, 1, 2, CAST(N'2023-11-25' AS Date), 0, 0, N'ad', N'145')
INSERT [dbo].[LabAppointTable] ([LabAppointID], [LabTestID], [PatientID], [LabID], [LabTimeSlotID], [AppointDate], [IsFeeSubmit], [IsComplete], [Description], [TransectionID]) VALUES (4, 1, 4, 1, 1, CAST(N'1212-02-11' AS Date), 0, 0, N'asdf', N'00')
INSERT [dbo].[LabAppointTable] ([LabAppointID], [LabTestID], [PatientID], [LabID], [LabTimeSlotID], [AppointDate], [IsFeeSubmit], [IsComplete], [Description], [TransectionID]) VALUES (5, 1, 4, 1, 1, CAST(N'2020-12-13' AS Date), 0, 0, N'ada', N'12354')
INSERT [dbo].[LabAppointTable] ([LabAppointID], [LabTestID], [PatientID], [LabID], [LabTimeSlotID], [AppointDate], [IsFeeSubmit], [IsComplete], [Description], [TransectionID]) VALUES (6, 1, 4, 1, 4, CAST(N'2023-11-11' AS Date), 0, 0, N'gj', N'g')
SET IDENTITY_INSERT [dbo].[LabAppointTable] OFF
GO
SET IDENTITY_INSERT [dbo].[LabTable] ON 

INSERT [dbo].[LabTable] ([LabID], [UserID], [Name], [Photo], [ContactNo], [PhoneNo], [EmailAddress], [PermanentAddress], [AboutLab], [AccountTypeID], [AccountNo]) VALUES (1, 18, N'asd', N'~/Content/LabPhotos/1.png', N'12345', N'456321', N'aabad@mail.com', N'asd', N'asd', 2, N'14567')
SET IDENTITY_INSERT [dbo].[LabTable] OFF
GO
SET IDENTITY_INSERT [dbo].[LabTestDetailsTable] ON 

INSERT [dbo].[LabTestDetailsTable] ([LabTestDetailID], [LabTestID], [LabID], [Name], [MinValue], [MaxValue]) VALUES (1, 1, 1, N'asd', 500, 500)
INSERT [dbo].[LabTestDetailsTable] ([LabTestDetailID], [LabTestID], [LabID], [Name], [MinValue], [MaxValue]) VALUES (2, 1, 1, N'a', 20, 40)
INSERT [dbo].[LabTestDetailsTable] ([LabTestDetailID], [LabTestID], [LabID], [Name], [MinValue], [MaxValue]) VALUES (3, 5, 1, N'aasa', 10, 200)
SET IDENTITY_INSERT [dbo].[LabTestDetailsTable] OFF
GO
SET IDENTITY_INSERT [dbo].[LabTestTable] ON 

INSERT [dbo].[LabTestTable] ([LabTestID], [LabID], [Name], [Cost]) VALUES (1, 1, N'Blood Test', 50)
INSERT [dbo].[LabTestTable] ([LabTestID], [LabID], [Name], [Cost]) VALUES (2, 1, N'dasd', 500)
INSERT [dbo].[LabTestTable] ([LabTestID], [LabID], [Name], [Cost]) VALUES (3, 1, N'SADFGHJK', 4201)
INSERT [dbo].[LabTestTable] ([LabTestID], [LabID], [Name], [Cost]) VALUES (4, 1, N'ad', 10)
INSERT [dbo].[LabTestTable] ([LabTestID], [LabID], [Name], [Cost]) VALUES (5, 1, N'dd', 100)
SET IDENTITY_INSERT [dbo].[LabTestTable] OFF
GO
SET IDENTITY_INSERT [dbo].[LabTimeSlotTable] ON 

INSERT [dbo].[LabTimeSlotTable] ([LabTimeSlotID], [LabID], [Name], [ToTime], [FromTime], [IsActive]) VALUES (1, 1, N'Morning 9 to 9:30 AM', CAST(N'09:30:00' AS Time), CAST(N'09:00:00' AS Time), 1)
INSERT [dbo].[LabTimeSlotTable] ([LabTimeSlotID], [LabID], [Name], [ToTime], [FromTime], [IsActive]) VALUES (2, 1, N'Morning 9.30 to 10:00 AM', CAST(N'10:00:00' AS Time), CAST(N'09:30:00' AS Time), 1)
INSERT [dbo].[LabTimeSlotTable] ([LabTimeSlotID], [LabID], [Name], [ToTime], [FromTime], [IsActive]) VALUES (3, 1, N'Morning 10:00 to 10:30 AM', CAST(N'10:30:00' AS Time), CAST(N'10:00:00' AS Time), NULL)
INSERT [dbo].[LabTimeSlotTable] ([LabTimeSlotID], [LabID], [Name], [ToTime], [FromTime], [IsActive]) VALUES (4, 1, N'Morning 11:00 to 11:30 AM', CAST(N'11:30:00' AS Time), CAST(N'11:00:00' AS Time), 1)
INSERT [dbo].[LabTimeSlotTable] ([LabTimeSlotID], [LabID], [Name], [ToTime], [FromTime], [IsActive]) VALUES (5, 1, N'Morning 10:30 to 11:00 AM', CAST(N'11:00:00' AS Time), CAST(N'10:30:00' AS Time), 1)
INSERT [dbo].[LabTimeSlotTable] ([LabTimeSlotID], [LabID], [Name], [ToTime], [FromTime], [IsActive]) VALUES (6, 1, N'Morning 11:30 to 12:00 AM', CAST(N'12:00:00' AS Time), CAST(N'11:30:00' AS Time), 1)
SET IDENTITY_INSERT [dbo].[LabTimeSlotTable] OFF
GO
SET IDENTITY_INSERT [dbo].[PatientTable] ON 

INSERT [dbo].[PatientTable] ([PatientID], [UserID], [Name], [ContactNo], [Email], [Description], [Photo], [GenderID]) VALUES (4, 33, N'hasta', N'1425', N'patient@gmail.com', N'asd', N'1', 2)
INSERT [dbo].[PatientTable] ([PatientID], [UserID], [Name], [ContactNo], [Email], [Description], [Photo], [GenderID]) VALUES (5, 41, N'Berkcan', N'454', N'x@mail.com', N'asda', N'~/Content/PatientPhotos/5.png', 2)
SET IDENTITY_INSERT [dbo].[PatientTable] OFF
GO
SET IDENTITY_INSERT [dbo].[PatientTestDetailTable] ON 

INSERT [dbo].[PatientTestDetailTable] ([LabAppointDetailID], [LabAppointID], [LabTestDetailID], [PatientValue]) VALUES (1, 1, 1, 10)
INSERT [dbo].[PatientTestDetailTable] ([LabAppointDetailID], [LabAppointID], [LabTestDetailID], [PatientValue]) VALUES (2, 1, 2, 12)
SET IDENTITY_INSERT [dbo].[PatientTestDetailTable] OFF
GO
SET IDENTITY_INSERT [dbo].[UserTable] ON 

INSERT [dbo].[UserTable] ([UserID], [UserTypeID], [UserName], [Password], [Email], [ContactNo], [Description], [IsVerifed]) VALUES (1, 1, N'Admin', N'1', N'1', N'05534971008', N'ABC', 1)
INSERT [dbo].[UserTable] ([UserID], [UserTypeID], [UserName], [Password], [Email], [ContactNo], [Description], [IsVerifed]) VALUES (4, 2, N'doktor', N'2', N'2', N'12345678911', NULL, 1)
INSERT [dbo].[UserTable] ([UserID], [UserTypeID], [UserName], [Password], [Email], [ContactNo], [Description], [IsVerifed]) VALUES (18, 3, N'lab', N'3', N'3', N'12354', NULL, 1)
INSERT [dbo].[UserTable] ([UserID], [UserTypeID], [UserName], [Password], [Email], [ContactNo], [Description], [IsVerifed]) VALUES (33, 4, N'patient', N'4', N'4', N'145', N'1', 1)
INSERT [dbo].[UserTable] ([UserID], [UserTypeID], [UserName], [Password], [Email], [ContactNo], [Description], [IsVerifed]) VALUES (34, 2, N'Neval', N'neval', N'nevo@mail.com', N'1453', NULL, 1)
INSERT [dbo].[UserTable] ([UserID], [UserTypeID], [UserName], [Password], [Email], [ContactNo], [Description], [IsVerifed]) VALUES (36, 2, N'12345678945', N'123', N'12365478987', N'1', NULL, 0)
INSERT [dbo].[UserTable] ([UserID], [UserTypeID], [UserName], [Password], [Email], [ContactNo], [Description], [IsVerifed]) VALUES (37, 2, N'ad', N'asd', N'12345698745', N'123', NULL, 0)
INSERT [dbo].[UserTable] ([UserID], [UserTypeID], [UserName], [Password], [Email], [ContactNo], [Description], [IsVerifed]) VALUES (38, 2, N'patient@gmail.com', N'patient', N'12473243523453', N'12', NULL, 0)
INSERT [dbo].[UserTable] ([UserID], [UserTypeID], [UserName], [Password], [Email], [ContactNo], [Description], [IsVerifed]) VALUES (39, 4, N'serseri_bedo', N'1', N'14785236936', N'123', NULL, 1)
INSERT [dbo].[UserTable] ([UserID], [UserTypeID], [UserName], [Password], [Email], [ContactNo], [Description], [IsVerifed]) VALUES (40, 2, N'1231', N'123', N'1234123123412441', N'123', NULL, 0)
INSERT [dbo].[UserTable] ([UserID], [UserTypeID], [UserName], [Password], [Email], [ContactNo], [Description], [IsVerifed]) VALUES (41, 4, N'berkcan', N'5', N'5', N'11457852', NULL, 1)
INSERT [dbo].[UserTable] ([UserID], [UserTypeID], [UserName], [Password], [Email], [ContactNo], [Description], [IsVerifed]) VALUES (42, 3, N'45', N'45', N'555', N'454', NULL, 0)
INSERT [dbo].[UserTable] ([UserID], [UserTypeID], [UserName], [Password], [Email], [ContactNo], [Description], [IsVerifed]) VALUES (43, 2, N'aa', N'aa', N'14', N'145', NULL, 0)
INSERT [dbo].[UserTable] ([UserID], [UserTypeID], [UserName], [Password], [Email], [ContactNo], [Description], [IsVerifed]) VALUES (44, 4, N'Devrimtest', N'testdevrim', N'12345678901', N'0000000000', NULL, 1)
INSERT [dbo].[UserTable] ([UserID], [UserTypeID], [UserName], [Password], [Email], [ContactNo], [Description], [IsVerifed]) VALUES (45, 4, N'Devrimtest', N'testdevrim', N'12345678901', N'0000000000', NULL, 1)
INSERT [dbo].[UserTable] ([UserID], [UserTypeID], [UserName], [Password], [Email], [ContactNo], [Description], [IsVerifed]) VALUES (46, 2, N'doktordis', N'1010', N'1010', N'1010', NULL, 1)
SET IDENTITY_INSERT [dbo].[UserTable] OFF
GO
SET IDENTITY_INSERT [dbo].[UserTypeTable] ON 

INSERT [dbo].[UserTypeTable] ([UserTypeID], [UserType]) VALUES (1, N'Admin')
INSERT [dbo].[UserTypeTable] ([UserTypeID], [UserType]) VALUES (2, N'Doctor')
INSERT [dbo].[UserTypeTable] ([UserTypeID], [UserType]) VALUES (3, N'Lab')
INSERT [dbo].[UserTypeTable] ([UserTypeID], [UserType]) VALUES (4, N'Patient')
SET IDENTITY_INSERT [dbo].[UserTypeTable] OFF
GO
ALTER TABLE [dbo].[DoctorAppointTable] ADD  CONSTRAINT [DF_DoctorAppointTable_IsFeeSubmit]  DEFAULT ((0)) FOR [IsFeeSubmit]
GO
ALTER TABLE [dbo].[DoctorAppointTable] ADD  CONSTRAINT [DF_DoctorAppointTable_IsChecked]  DEFAULT ((0)) FOR [IsChecked]
GO
ALTER TABLE [dbo].[DoctorTimeSlotTable] ADD  CONSTRAINT [DF_DoctoTimeSlotTable_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[LabAppointTable] ADD  CONSTRAINT [DF_LabAppointTable_IsFeeSubmit]  DEFAULT ((0)) FOR [IsFeeSubmit]
GO
ALTER TABLE [dbo].[LabAppointTable] ADD  CONSTRAINT [DF_LabAppointTable_IsComplete]  DEFAULT ((0)) FOR [IsComplete]
GO
ALTER TABLE [dbo].[LabTimeSlotTable] ADD  CONSTRAINT [DF_LabTimeSlotTable_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[DoctorAppointTable]  WITH CHECK ADD  CONSTRAINT [FK_DoctorAppointTable_DoctorTable] FOREIGN KEY([DoctorID])
REFERENCES [dbo].[DoctorTable] ([DoctorID])
GO
ALTER TABLE [dbo].[DoctorAppointTable] CHECK CONSTRAINT [FK_DoctorAppointTable_DoctorTable]
GO
ALTER TABLE [dbo].[DoctorAppointTable]  WITH CHECK ADD  CONSTRAINT [FK_DoctorAppointTable_DoctorTimeSlotTable] FOREIGN KEY([DoctorTimeSlotID])
REFERENCES [dbo].[DoctorTimeSlotTable] ([DoctorTimeSlotID])
GO
ALTER TABLE [dbo].[DoctorAppointTable] CHECK CONSTRAINT [FK_DoctorAppointTable_DoctorTimeSlotTable]
GO
ALTER TABLE [dbo].[DoctorAppointTable]  WITH CHECK ADD  CONSTRAINT [FK_DoctorAppointTable_PatientTable] FOREIGN KEY([PatientID])
REFERENCES [dbo].[PatientTable] ([PatientID])
GO
ALTER TABLE [dbo].[DoctorAppointTable] CHECK CONSTRAINT [FK_DoctorAppointTable_PatientTable]
GO
ALTER TABLE [dbo].[DoctorTable]  WITH CHECK ADD  CONSTRAINT [FK_DoctorTable_GenderTable] FOREIGN KEY([GenderID])
REFERENCES [dbo].[GenderTable] ([GenderID])
GO
ALTER TABLE [dbo].[DoctorTable] CHECK CONSTRAINT [FK_DoctorTable_GenderTable]
GO
ALTER TABLE [dbo].[DoctorTable]  WITH CHECK ADD  CONSTRAINT [FK_DoctorTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[DoctorTable] CHECK CONSTRAINT [FK_DoctorTable_UserTable]
GO
ALTER TABLE [dbo].[DoctorTimeSlotTable]  WITH CHECK ADD  CONSTRAINT [FK_DoctorTimeSlotTable_DoctorTable] FOREIGN KEY([DoctorID])
REFERENCES [dbo].[DoctorTable] ([DoctorID])
GO
ALTER TABLE [dbo].[DoctorTimeSlotTable] CHECK CONSTRAINT [FK_DoctorTimeSlotTable_DoctorTable]
GO
ALTER TABLE [dbo].[LabAppointTable]  WITH CHECK ADD  CONSTRAINT [FK_LabAppointTable_LabTable] FOREIGN KEY([LabID])
REFERENCES [dbo].[LabTable] ([LabID])
GO
ALTER TABLE [dbo].[LabAppointTable] CHECK CONSTRAINT [FK_LabAppointTable_LabTable]
GO
ALTER TABLE [dbo].[LabAppointTable]  WITH CHECK ADD  CONSTRAINT [FK_LabAppointTable_LabTestTable] FOREIGN KEY([LabTestID])
REFERENCES [dbo].[LabTestTable] ([LabTestID])
GO
ALTER TABLE [dbo].[LabAppointTable] CHECK CONSTRAINT [FK_LabAppointTable_LabTestTable]
GO
ALTER TABLE [dbo].[LabAppointTable]  WITH CHECK ADD  CONSTRAINT [FK_LabAppointTable_LabTimeSlotTable] FOREIGN KEY([LabTimeSlotID])
REFERENCES [dbo].[LabTimeSlotTable] ([LabTimeSlotID])
GO
ALTER TABLE [dbo].[LabAppointTable] CHECK CONSTRAINT [FK_LabAppointTable_LabTimeSlotTable]
GO
ALTER TABLE [dbo].[LabAppointTable]  WITH CHECK ADD  CONSTRAINT [FK_LabAppointTable_PatientTable] FOREIGN KEY([PatientID])
REFERENCES [dbo].[PatientTable] ([PatientID])
GO
ALTER TABLE [dbo].[LabAppointTable] CHECK CONSTRAINT [FK_LabAppointTable_PatientTable]
GO
ALTER TABLE [dbo].[LabTable]  WITH CHECK ADD  CONSTRAINT [FK_LabTable_AccountTypeTable] FOREIGN KEY([AccountTypeID])
REFERENCES [dbo].[AccountTypeTable] ([AccountTypeID])
GO
ALTER TABLE [dbo].[LabTable] CHECK CONSTRAINT [FK_LabTable_AccountTypeTable]
GO
ALTER TABLE [dbo].[LabTable]  WITH CHECK ADD  CONSTRAINT [FK_LabTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[LabTable] CHECK CONSTRAINT [FK_LabTable_UserTable]
GO
ALTER TABLE [dbo].[LabTestDetailsTable]  WITH CHECK ADD  CONSTRAINT [FK_LabTestDetailsTable_LabTable] FOREIGN KEY([LabID])
REFERENCES [dbo].[LabTable] ([LabID])
GO
ALTER TABLE [dbo].[LabTestDetailsTable] CHECK CONSTRAINT [FK_LabTestDetailsTable_LabTable]
GO
ALTER TABLE [dbo].[LabTestDetailsTable]  WITH CHECK ADD  CONSTRAINT [FK_LabTestDetailsTable_LabTestTable] FOREIGN KEY([LabTestID])
REFERENCES [dbo].[LabTestTable] ([LabTestID])
GO
ALTER TABLE [dbo].[LabTestDetailsTable] CHECK CONSTRAINT [FK_LabTestDetailsTable_LabTestTable]
GO
ALTER TABLE [dbo].[LabTestTable]  WITH CHECK ADD  CONSTRAINT [FK_LabTestTable_LabTable] FOREIGN KEY([LabID])
REFERENCES [dbo].[LabTable] ([LabID])
GO
ALTER TABLE [dbo].[LabTestTable] CHECK CONSTRAINT [FK_LabTestTable_LabTable]
GO
ALTER TABLE [dbo].[LabTimeSlotTable]  WITH CHECK ADD  CONSTRAINT [FK_LabTimeSlotTable_LabTable] FOREIGN KEY([LabID])
REFERENCES [dbo].[LabTable] ([LabID])
GO
ALTER TABLE [dbo].[LabTimeSlotTable] CHECK CONSTRAINT [FK_LabTimeSlotTable_LabTable]
GO
ALTER TABLE [dbo].[PatientTable]  WITH CHECK ADD  CONSTRAINT [FK_PatientTable_GenderTable] FOREIGN KEY([GenderID])
REFERENCES [dbo].[GenderTable] ([GenderID])
GO
ALTER TABLE [dbo].[PatientTable] CHECK CONSTRAINT [FK_PatientTable_GenderTable]
GO
ALTER TABLE [dbo].[PatientTable]  WITH CHECK ADD  CONSTRAINT [FK_PatientTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[PatientTable] CHECK CONSTRAINT [FK_PatientTable_UserTable]
GO
ALTER TABLE [dbo].[PatientTestDetailTable]  WITH CHECK ADD  CONSTRAINT [FK_PatientTestDetailTable_LabAppointTable] FOREIGN KEY([LabAppointID])
REFERENCES [dbo].[LabAppointTable] ([LabAppointID])
GO
ALTER TABLE [dbo].[PatientTestDetailTable] CHECK CONSTRAINT [FK_PatientTestDetailTable_LabAppointTable]
GO
ALTER TABLE [dbo].[PatientTestDetailTable]  WITH CHECK ADD  CONSTRAINT [FK_PatientTestDetailTable_LabTestDetailsTable] FOREIGN KEY([LabTestDetailID])
REFERENCES [dbo].[LabTestDetailsTable] ([LabTestDetailID])
GO
ALTER TABLE [dbo].[PatientTestDetailTable] CHECK CONSTRAINT [FK_PatientTestDetailTable_LabTestDetailsTable]
GO
ALTER TABLE [dbo].[UserTable]  WITH CHECK ADD  CONSTRAINT [FK_UserTable_UserTypeTable] FOREIGN KEY([UserTypeID])
REFERENCES [dbo].[UserTypeTable] ([UserTypeID])
GO
ALTER TABLE [dbo].[UserTable] CHECK CONSTRAINT [FK_UserTable_UserTypeTable]
GO
USE [master]
GO
ALTER DATABASE [Mvc_Hospital] SET  READ_WRITE 
GO
