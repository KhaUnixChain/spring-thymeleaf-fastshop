USE [master]
GO
/****** Object:  Database [Fastshop]    Script Date: 9/30/2022 11:37:13 PM ******/
CREATE DATABASE [Fastshop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Pegashop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Pegashop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Pegashop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Pegashop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Fastshop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Fastshop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Fastshop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Fastshop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Fastshop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Fastshop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Fastshop] SET ARITHABORT OFF 
GO
ALTER DATABASE [Fastshop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Fastshop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Fastshop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Fastshop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Fastshop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Fastshop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Fastshop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Fastshop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Fastshop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Fastshop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Fastshop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Fastshop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Fastshop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Fastshop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Fastshop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Fastshop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Fastshop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Fastshop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Fastshop] SET  MULTI_USER 
GO
ALTER DATABASE [Fastshop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Fastshop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Fastshop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Fastshop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Fastshop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Fastshop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Fastshop] SET QUERY_STORE = OFF
GO
USE [Fastshop]
GO
/****** Object:  Table [dbo].[accounts]    Script Date: 9/30/2022 11:37:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accounts](
	[username] [varchar](15) NOT NULL,
	[email] [varchar](30) NOT NULL,
	[fullname] [nvarchar](30) NOT NULL,
	[password] [nvarchar](15) NOT NULL,
	[photo] [varchar](30) NULL,
	[phone] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[authorities]    Script Date: 9/30/2022 11:37:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authorities](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](15) NULL,
	[roleid] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 9/30/2022 11:37:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [varchar](255) NOT NULL,
	[name] [nvarchar](25) NOT NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comments]    Script Date: 9/30/2022 11:37:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[feedback] [nvarchar](250) NULL,
	[productid] [int] NULL,
	[username] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[discounts]    Script Date: 9/30/2022 11:37:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discounts](
	[id] [varchar](20) NOT NULL,
	[date_from] [date] NULL,
	[date_end] [date] NULL,
	[free] [float] NULL,
	[status] [bit] NULL,
	[dolar] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[histories]    Script Date: 9/30/2022 11:37:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[histories](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[link] [varchar](250) NOT NULL,
	[schedual] [datetime] NOT NULL,
	[title] [nvarchar](250) NOT NULL,
	[username] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[keywords]    Script Date: 9/30/2022 11:37:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[keywords](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[keyword] [nvarchar](100) NOT NULL,
	[username] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderdetails]    Script Date: 9/30/2022 11:37:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderdetails](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NULL,
	[orderid] [bigint] NULL,
	[productid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 9/30/2022 11:37:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[createdate] [date] NULL,
	[username] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 9/30/2022 11:37:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[createdate] [date] NULL,
	[image] [varchar](255) NULL,
	[name] [nvarchar](50) NOT NULL,
	[price] [float] NULL,
	[categoryid] [varchar](255) NULL,
	[number] [int] NULL,
	[available] [bit] NULL,
	[discountid] [varchar](20) NULL,
	[describe] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 9/30/2022 11:37:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [varchar](255) NOT NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'an123039', N'an123039@outlook.com', N'Tô Đình Tân', N'123456789', N'abc.jpg', N'0398107186')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'an542090', N'an542090@yahoo.com', N'Ông Trùng Vân', N'123456789', N'abc.jpg', N'0901585292')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'an542095', N'an542095@yahoo.com', N'Lý Văn Khải', N'123456789', N'abc.jpg', N'0954519241')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'an789071', N'an789071@zoho.com', N'Viên Ngọc Phú', N'123456789', N'abc.jpg', N'0710922573')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'an875037', N'an875037@io.com', N'Phùng Vân Trinh', N'123456789', N'abc.jpg', N'0379784018')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'an875096', N'an875096@gmail.com', N'Quách Thu Linh', N'123456789', N'abc.jpg', N'0961895923')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'an875099', N'an875099@edu.com.vn', N'Trần Khởi My', N'123456789', N'abc.jpg', N'0991336192')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'an963095', N'an963095@outlook.com', N'Nguyễn Tiên An', N'123456789', N'abc.jpg', N'0955122018')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'anAP062', N'anAP062@gmail.com', N'Nhâm Văn Thanh', N'123456789', N'abc.jpg', N'0627063051')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'anAP073', N'anAP073@gmail.com', N'Huỳnh Thị Tâm', N'123456789', N'abc.jpg', N'0734685952')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'anGU033', N'anGU033@yahoo.com', N'Đồng Khởi Lan', N'123456789', N'abc.jpg', N'0333972419')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'anGU095', N'anGU095@gmail.com', N'Tô Trùng Hương', N'123456789', N'abc.jpg', N'0959235975')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'anHM095', N'anHM095@yahoo.com', N'Hà Tú Khang', N'123456789', N'abc.jpg', N'0959343245')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'anHV031', N'anHV031@io.com', N'Đàm Ngọc Hương', N'123456789', N'abc.jpg', N'0313078878')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'anKA035', N'anKA035@io.com', N'Lương Bích Linh', N'123456789', N'abc.jpg', N'0358774900')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'anNC095', N'anNC095@io.com', N'Đồng Văn An', N'123456789', N'abc.jpg', N'0951336118')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'anTX077', N'anTX077@io.com', N'Hà Tấn An', N'123456789', N'abc.jpg', N'0771040786')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'binh123095', N'binh123095@zoho.com', N'Nhâm Quang Phú', N'123456789', N'abc.jpg', N'0953207235')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'binh875063', N'binh875063@outlook.com', N'Phùng Thanh An', N'123456789', N'abc.jpg', N'0635448551')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'binh875091', N'binh875091@zoho.com', N'Hà Thu Mỹ', N'123456789', N'abc.jpg', N'0918866280')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'binhCI090', N'binhCI090@io.com', N'Nguyễn Thu Vân', N'123456789', N'abc.jpg', N'0908840242')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'binhGU062', N'binhGU062@yahoo.com', N'Đinh Bích Thảo', N'123456789', N'abc.jpg', N'0628455859')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'binhHV037', N'binhHV037@outlook.com', N'Nguyễn Kim Nhi', N'123456789', N'abc.jpg', N'0379295851')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'binhHV039', N'binhHV039@edu.com.vn', N'Hà Đình Thành', N'123456789', N'abc.jpg', N'0397375448')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'binhHV090', N'binhHV090@gmail.com', N'Cao  Vân', N'123456789', N'abc.jpg', N'0902462850')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'binhIT073', N'binhIT073@zoho.com', N'Trần Mỹ Tuấn', N'123456789', N'abc.jpg', N'0739364297')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'binhIT096', N'binhIT096@fpt.edu.vn', N'Triệu Thị Khang', N'123456789', N'abc.jpg', N'0965529923')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'binhKA091', N'binhKA091@yahoo.com', N'Diệp Thị Vân', N'123456789', N'abc.jpg', N'0910421321')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'binhNC035', N'binhNC035@gmail.com', N'Thái Bích An', N'123456789', N'abc.jpg', N'0357883558')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'binhTX032', N'binhTX032@gmail.com', N'Lại Tú Linh', N'123456789', N'abc.jpg', N'0326543177')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'binhTX091', N'binhTX091@zoho.com', N'Ông Bích Tân', N'123456789', N'abc.jpg', N'0915192817')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'binhXX032', N'binhXX032@edu.com.vn', N'Phan Khởi My', N'123456789', N'abc.jpg', N'0321547051')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'cuong123075', N'cuong123075@zoho.com', N'Đào Quang Đức', N'123456789', N'abc.jpg', N'0753348200')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'cuong123099', N'cuong123099@outlook.com', N'Khương Tiên Đức', N'123456789', N'abc.jpg', N'0995575154')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'cuong521071', N'cuong521071@fpt.edu.vn', N'Tạ Quang Linh', N'123456789', N'abc.jpg', N'0712126813')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'cuong789073', N'cuong789073@zoho.com', N'Viên Ngọc Tài', N'123456789', N'abc.jpg', N'0734399854')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'cuong789095', N'cuong789095@gmail.com', N'Phan Đình My', N'123456789', N'abc.jpg', N'0958913159')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'cuong963031', N'cuong963031@yahoo.com', N'Cao Kim Trọng', N'123456789', N'abc.jpg', N'0316493144')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'cuongAP035', N'cuongAP035@gmail.com', N'Đào Tú Đức', N'123456789', N'abc.jpg', N'0354218127')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'cuongCI071', N'cuongCI071@fpt.edu.vn', N'Triệu Bích Tân', N'123456789', N'abc.jpg', N'0714098387')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'cuongEXO095', N'cuongEXO095@edu.com.vn', N'Cao Thanh Nam', N'123456789', N'abc.jpg', N'0958935741')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'cuongEXO099', N'cuongEXO099@edu.com.vn', N'Lương Vân Lam', N'123456789', N'abc.jpg', N'0992247115')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'cuongHA067', N'cuongHA067@yahoo.com', N'Huỳnh Bá Tài', N'123456789', N'abc.jpg', N'0677367062')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'cuongHA096', N'cuongHA096@edu.com.vn', N'Cao Lan Trinh', N'123456789', N'abc.jpg', N'0968917238')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'cuongHV064', N'cuongHV064@outlook.com', N'Nguyễn Khởi An', N'123456789', N'abc.jpg', N'0649631169')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'cuongHV075', N'cuongHV075@outlook.com', N'Trịnh Thanh Tâm', N'123456789', N'abc.jpg', N'0756282786')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'cuongKA032', N'cuongKA032@zoho.com', N'Trịnh Tấn Khải', N'123456789', N'abc.jpg', N'0324448390')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'cuongNC032', N'cuongNC032@gmail.com', N'Lại Thiên Tuấn', N'123456789', N'abc.jpg', N'0323692637')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'cuongNC077', N'cuongNC077@fpt.edu.vn', N'Lê Bá Nhi', N'123456789', N'abc.jpg', N'0779680358')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'cuongXX037', N'cuongXX037@gmail.com', N'Tạ Trùng Trọng', N'123456789', N'abc.jpg', N'0376756437')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'cuongXX062', N'cuongXX062@fpt.edu.vn', N'Thôi Khởi Trinh', N'123456789', N'abc.jpg', N'0623065909')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'duc123031', N'duc123031@io.com', N'Triệu Lan Thảo', N'123456789', N'abc.jpg', N'0319403225')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'duc123064', N'duc123064@gmail.com', N'Tào Ngọc Tài', N'123456789', N'abc.jpg', N'0646948389')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'duc521096', N'duc521096@io.com', N'Diệp Minh Thanh', N'123456789', N'abc.jpg', N'0968001880')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'duc875072', N'duc875072@gmail.com', N'Trịnh Thanh Tâm', N'123456789', N'abc.jpg', N'0721202378')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'duc875077', N'duc875077@yahoo.com', N'Đoàn Thu An', N'123456789', N'abc.jpg', N'0770491389')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'ducCI096', N'ducCI096@fpt.edu.vn', N'Viên Thanh Lan', N'123456789', N'abc.jpg', N'0965423588')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'ducGU077', N'ducGU077@gmail.com', N'Mai Bích Trinh', N'123456789', N'abc.jpg', N'0779872865')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'ducGU095', N'ducGU095@yahoo.com', N'Lê Trọng Tân', N'123456789', N'abc.jpg', N'0950470370')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'ducHA035', N'ducHA035@edu.com.vn', N'Lại Vân Bình', N'123456789', N'abc.jpg', N'0352361723')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'ducHA037', N'ducHA037@outlook.com', N'Hà Bá Tân', N'123456789', N'abc.jpg', N'0371677650')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'ducHA064', N'ducHA064@outlook.com', N'Diệp Thu Nhi', N'123456789', N'abc.jpg', N'0643164571')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'ducHA075', N'ducHA075@gmail.com', N'Trịnh Kim Lĩnh', N'123456789', N'abc.jpg', N'0756222715')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'ducHM063', N'ducHM063@fpt.edu.vn', N'Triệu Trùng Tuấn', N'123456789', N'abc.jpg', N'0630386053')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'ducHV077', N'ducHV077@outlook.com', N'Cao Trọng Lam', N'123456789', N'abc.jpg', N'0770049234')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'ducHV096', N'ducHV096@gmail.com', N'Phùng Bích Mỹ', N'123456789', N'abc.jpg', N'0960737210')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'ducKA071', N'ducKA071@yahoo.com', N'Đào Lan An', N'123456789', N'abc.jpg', N'0719482938')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'ducNC090', N'ducNC090@zoho.com', N'Lại Tấn An', N'123456789', N'abc.jpg', N'0904800763')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'ducQG031', N'ducQG031@edu.com.vn', N'Nguyễn Bích Tuấn', N'123456789', N'abc.jpg', N'0314126332')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'ducTX077', N'ducTX077@io.com', N'Lê Lan Tâm', N'123456789', N'abc.jpg', N'0771049490')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'ducXX062', N'ducXX062@fpt.edu.vn', N'Hà Khởi Tân', N'123456789', N'abc.jpg', N'0620843070')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'huong123095', N'huong123095@io.com', N'Lý Văn Tài', N'123456789', N'abc.jpg', N'0950272023')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'huong789075', N'huong789075@fpt.edu.vn', N'Cao Ngọc Nam', N'123456789', N'abc.jpg', N'0759102872')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'huong963064', N'huong963064@zoho.com', N'Tào Vân Nhi', N'123456789', N'abc.jpg', N'0641162494')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'huong963071', N'huong963071@edu.com.vn', N'Ông Lộc Tân', N'123456789', N'abc.jpg', N'0712256856')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'huong963095', N'huong963095@edu.com.vn', N'Tạ Lộc Đức', N'123456789', N'abc.jpg', N'0953675436')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'huongAP073', N'huongAP073@outlook.com', N'Phan  Cường', N'123456789', N'abc.jpg', N'0735341784')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'huongGU031', N'huongGU031@edu.com.vn', N'Hà Thu Linh', N'123456789', N'abc.jpg', N'0319604708')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'huongGU091', N'huongGU091@outlook.com', N'Quách Tấn Thành', N'123456789', N'abc.jpg', N'0913368520')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'huongHM071', N'huongHM071@io.com', N'Đàm Kim Bình', N'123456789', N'abc.jpg', N'0718633844')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'huongHM075', N'huongHM075@io.com', N'Tô Mỹ Trinh', N'123456789', N'abc.jpg', N'0751182430')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'huongHV033', N'huongHV033@edu.com.vn', N'Huỳnh Mỹ Nam', N'123456789', N'abc.jpg', N'0334630430')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'huongIT096', N'huongIT096@io.com', N'Tô Minh Ngân', N'123456789', N'abc.jpg', N'0960090249')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'huongQG064', N'huongQG064@io.com', N'Phùng Thanh An', N'123456789', N'abc.jpg', N'0642214523')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'huongQG077', N'huongQG077@zoho.com', N'Nguyễn Thiên Khải', N'123456789', N'abc.jpg', N'0777451846')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'huongTX033', N'huongTX033@outlook.com', N'Đồng Bích Ngân', N'123456789', N'abc.jpg', N'0337197122')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'huongTX096', N'huongTX096@zoho.com', N'Lương Đình Linh', N'123456789', N'abc.jpg', N'0961442649')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'huongXX064', N'huongXX064@io.com', N'Viên Khởi Lĩnh', N'123456789', N'abc.jpg', N'0646531936')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khai521073', N'khai521073@gmail.com', N'Thái  Nhi', N'123456789', N'abc.jpg', N'0734760850')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khai542035', N'khai542035@io.com', N'Ông Lộc Vân', N'123456789', N'abc.jpg', N'0354243555')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khai542037', N'khai542037@outlook.com', N'Phùng Thanh Nam', N'123456789', N'abc.jpg', N'0376539790')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khai542063', N'khai542063@zoho.com', N'Ông Bích Phú', N'123456789', N'abc.jpg', N'0631156992')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khai542071', N'khai542071@io.com', N'Tô Bích Bình', N'123456789', N'abc.jpg', N'0713315663')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khai875072', N'khai875072@outlook.com', N'Lê Minh My', N'123456789', N'abc.jpg', N'0724880208')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khaiAP063', N'khaiAP063@zoho.com', N'Nhâm Tấn Vân', N'123456789', N'abc.jpg', N'0636368348')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khaiAP073', N'khaiAP073@outlook.com', N'Khương Bá Tâm', N'123456789', N'abc.jpg', N'0733432608')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khaiEXO075', N'khaiEXO075@io.com', N'Tô Đình Tâm', N'123456789', N'abc.jpg', N'0756949278')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khaiHA032', N'khaiHA032@edu.com.vn', N'Thái Lộc Khải', N'123456789', N'abc.jpg', N'0326960005')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khaiHA033', N'khaiHA033@outlook.com', N'Nhâm Bích Nhi', N'123456789', N'abc.jpg', N'0339369278')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khaiHM062', N'khaiHM062@io.com', N'Đàm Văn An', N'123456789', N'abc.jpg', N'0621629217')
GO
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khaiHM073', N'khaiHM073@yahoo.com', N'Tăng Trùng Lam', N'123456789', N'abc.jpg', N'0734591325')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khaiHM096', N'khaiHM096@io.com', N'Nguyễn Bích Thanh', N'123456789', N'abc.jpg', N'0967597967')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khaiKA095', N'khaiKA095@fpt.edu.vn', N'Đồng Minh Lam', N'123456789', N'abc.jpg', N'0959919845')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khaiNC032', N'khaiNC032@fpt.edu.vn', N'Triệu Tiên Tuấn', N'123456789', N'abc.jpg', N'0327831622')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khaiNC063', N'khaiNC063@edu.com.vn', N'Khương Quang My', N'123456789', N'abc.jpg', N'0633992556')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khaiQG033', N'khaiQG033@io.com', N'Trịnh Vân Bình', N'123456789', N'abc.jpg', N'0334771059')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khaiQG071', N'khaiQG071@gmail.com', N'Lý Minh Cường', N'123456789', N'abc.jpg', N'0710321341')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khaiTX031', N'khaiTX031@yahoo.com', N'Đào Trọng Tân', N'123456789', N'abc.jpg', N'0312171303')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khaiTX072', N'khaiTX072@io.com', N'Nguyễn Thiên Trọng', N'123456789', N'abc.jpg', N'0726511119')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khaiXX072', N'khaiXX072@outlook.com', N'Đàm Kim Trinh', N'123456789', N'abc.jpg', N'0726216364')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khang521071', N'khang521071@io.com', N'Phạm Thiên Khang', N'123456789', N'abc.jpg', N'0712418868')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khang875099', N'khang875099@gmail.com', N'Phan Đình Sương', N'123456789', N'abc.jpg', N'0999979023')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khangAP096', N'khangAP096@fpt.edu.vn', N'Diệp Thị Mỹ', N'123456789', N'abc.jpg', N'0962613608')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khangEXO096', N'khangEXO096@gmail.com', N'Lê Khởi Ngân', N'123456789', N'abc.jpg', N'0966010816')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khangGU095', N'khangGU095@yahoo.com', N'Phạm Đình Tài', N'123456789', N'abc.jpg', N'0956142901')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khangGU099', N'khangGU099@gmail.com', N'Viên  An', N'123456789', N'abc.jpg', N'0993240720')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khangHA063', N'khangHA063@yahoo.com', N'Mai Lộc Tài', N'123456789', N'abc.jpg', N'0632237169')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khangHM096', N'khangHM096@edu.com.vn', N'Tào Đình Sơn', N'123456789', N'abc.jpg', N'0966999364')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khangHV032', N'khangHV032@fpt.edu.vn', N'Đồng Kim Trọng', N'123456789', N'abc.jpg', N'0322421954')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khangHV090', N'khangHV090@io.com', N'Tào Thiên Hương', N'123456789', N'abc.jpg', N'0903998216')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khangIT067', N'khangIT067@zoho.com', N'Lương Trọng Thanh', N'123456789', N'abc.jpg', N'0675575601')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khangIT095', N'khangIT095@edu.com.vn', N'Phùng Lan Phú', N'123456789', N'abc.jpg', N'0954738145')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khangKA032', N'khangKA032@edu.com.vn', N'Đinh Thị Trọng', N'123456789', N'abc.jpg', N'0320844455')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khangKA064', N'khangKA064@outlook.com', N'Diệp Mỹ Linh', N'123456789', N'abc.jpg', N'0645059208')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khangNC077', N'khangNC077@zoho.com', N'Đoàn Bích Linh', N'123456789', N'abc.jpg', N'0774459765')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khangNC091', N'khangNC091@fpt.edu.vn', N'Quách Trọng Nam', N'123456789', N'abc.jpg', N'0917718437')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khangTX039', N'khangTX039@yahoo.com', N'Đàm Trọng Sương', N'123456789', N'abc.jpg', N'0394075305')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khangXX064', N'khangXX064@gmail.com', N'Thái Thị Bình', N'123456789', N'abc.jpg', N'0647425175')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'khannit159', N'nhomchung1999@gmail.com', N'Nguyễn Ngọc Kha', N'0907718993', N'kha.jpg', N'0386837394')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lam542062', N'lam542062@gmail.com', N'Lương Minh Khải', N'123456789', N'abc.jpg', N'0627147331')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lam542096', N'lam542096@yahoo.com', N'Mai Ngọc Tâm', N'123456789', N'abc.jpg', N'0965467745')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lam789071', N'lam789071@io.com', N'Tạ Lộc Tuấn', N'123456789', N'abc.jpg', N'0719845967')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lam875072', N'lam875072@yahoo.com', N'Tạ Khởi Tài', N'123456789', N'abc.jpg', N'0723035786')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lam963063', N'lam963063@gmail.com', N'Trương Lan Lan', N'123456789', N'abc.jpg', N'0639113373')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lam963090', N'lam963090@gmail.com', N'Trịnh Mỹ Phú', N'123456789', N'abc.jpg', N'0902473065')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lamAP095', N'lamAP095@yahoo.com', N'Triệu Thị Sơn', N'123456789', N'abc.jpg', N'0957154661')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lamEXO039', N'lamEXO039@fpt.edu.vn', N'Tăng Ngọc Ngân', N'123456789', N'abc.jpg', N'0392773386')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lamEXO090', N'lamEXO090@outlook.com', N'Lại Quang Nam', N'123456789', N'abc.jpg', N'0902665399')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lamEXO099', N'lamEXO099@gmail.com', N'Quách Đình Trọng', N'123456789', N'abc.jpg', N'0996005463')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lamGU031', N'lamGU031@edu.com.vn', N'Lại Quang Khải', N'123456789', N'abc.jpg', N'0314312147')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lamIT035', N'lamIT035@zoho.com', N'Thái Thu Lĩnh', N'123456789', N'abc.jpg', N'0358377897')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lamIT039', N'lamIT039@fpt.edu.vn', N'Từ Khởi Vân', N'123456789', N'abc.jpg', N'0394811797')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lamIT073', N'lamIT073@outlook.com', N'Đồng Minh Cường', N'123456789', N'abc.jpg', N'0736930440')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lamNC037', N'lamNC037@fpt.edu.vn', N'Tạ Quang Khải', N'123456789', N'abc.jpg', N'0377061444')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lamNC090', N'lamNC090@outlook.com', N'Tạ Bá Ngân', N'123456789', N'abc.jpg', N'0901228202')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lamQG032', N'lamQG032@edu.com.vn', N'Đinh Lan Thanh', N'123456789', N'abc.jpg', N'0327901840')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lamQG099', N'lamQG099@yahoo.com', N'Lại Tiên Nam', N'123456789', N'abc.jpg', N'0997820827')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lan521096', N'lan521096@fpt.edu.vn', N'Đào Mỹ Tâm', N'123456789', N'abc.jpg', N'0968802553')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lan542033', N'lan542033@zoho.com', N'Phạm Vân Lĩnh', N'123456789', N'abc.jpg', N'0333695831')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lan789062', N'lan789062@fpt.edu.vn', N'Lại Lộc Thành', N'123456789', N'abc.jpg', N'0620833453')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lan789095', N'lan789095@zoho.com', N'Phùng Mỹ Sương', N'123456789', N'abc.jpg', N'0951356152')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lan875091', N'lan875091@gmail.com', N'Đồng Văn Trọng', N'123456789', N'abc.jpg', N'0914432846')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lan963032', N'lan963032@yahoo.com', N'Nhâm Đình Sơn', N'123456789', N'abc.jpg', N'0323582322')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lan963062', N'lan963062@io.com', N'Đinh Khởi Lĩnh', N'123456789', N'abc.jpg', N'0626185858')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lanAP090', N'lanAP090@io.com', N'Hà Lộc Khang', N'123456789', N'abc.jpg', N'0905258493')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lanAP091', N'lanAP091@gmail.com', N'Quách Văn Lan', N'123456789', N'abc.jpg', N'0916245699')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lanAP095', N'lanAP095@zoho.com', N'Quách Trùng An', N'123456789', N'abc.jpg', N'0955056508')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lanCI073', N'lanCI073@zoho.com', N'Tô Mỹ Nhi', N'123456789', N'abc.jpg', N'0739515106')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lanEXO096', N'lanEXO096@edu.com.vn', N'Từ Bích Ngân', N'123456789', N'abc.jpg', N'0968800918')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lanGU067', N'lanGU067@yahoo.com', N'Nguyễn Đình Sương', N'123456789', N'abc.jpg', N'0673260492')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lanHA072', N'lanHA072@edu.com.vn', N'Triệu Trọng Tân', N'123456789', N'abc.jpg', N'0723192239')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lanKA032', N'lanKA032@outlook.com', N'Cao Lộc Cường', N'123456789', N'abc.jpg', N'0321730672')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lanKA095', N'lanKA095@yahoo.com', N'Diệp Lan Lĩnh', N'123456789', N'abc.jpg', N'0959238304')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lanNC072', N'lanNC072@outlook.com', N'Viên Trọng Lam', N'123456789', N'abc.jpg', N'0726827297')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lanQG062', N'lanQG062@outlook.com', N'Cao Bích Trọng', N'123456789', N'abc.jpg', N'0620829451')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lanQG064', N'lanQG064@gmail.com', N'Tào Tiên Thành', N'123456789', N'abc.jpg', N'0642936235')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lanQG072', N'lanQG072@edu.com.vn', N'Viên Mỹ Khải', N'123456789', N'abc.jpg', N'0725848733')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lanXX090', N'lanXX090@outlook.com', N'Đồng Bích Nam', N'123456789', N'abc.jpg', N'0904664642')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'lanXX091', N'lanXX091@gmail.com', N'Trương Quang Thanh', N'123456789', N'abc.jpg', N'0912124664')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'linh123033', N'linh123033@fpt.edu.vn', N'Thôi Trùng Ngân', N'123456789', N'abc.jpg', N'0336782357')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'linh521099', N'linh521099@edu.com.vn', N'Nhâm Quang Trinh', N'123456789', N'abc.jpg', N'0997792406')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'linh542031', N'linh542031@gmail.com', N'Nhâm Trùng Hương', N'123456789', N'abc.jpg', N'0319017627')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'linh875032', N'linh875032@gmail.com', N'Tăng Lộc Sương', N'123456789', N'abc.jpg', N'0321554249')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'linhAP072', N'linhAP072@gmail.com', N'Phùng Thị Tuấn', N'123456789', N'abc.jpg', N'0723225166')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'linhCI062', N'linhCI062@yahoo.com', N'Huỳnh Thị Phú', N'123456789', N'abc.jpg', N'0628298402')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'linhEXO071', N'linhEXO071@yahoo.com', N'Huỳnh Đình Nam', N'123456789', N'abc.jpg', N'0719304717')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'linhGU077', N'linhGU077@fpt.edu.vn', N'Quách Bích Tân', N'123456789', N'abc.jpg', N'0777113433')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'linhGU091', N'linhGU091@outlook.com', N'Lại Tiên Tâm', N'123456789', N'abc.jpg', N'0914197303')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'linhGU099', N'linhGU099@zoho.com', N'Trịnh Tấn An', N'123456789', N'abc.jpg', N'0992408403')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'linhIT035', N'linhIT035@gmail.com', N'Tào Bích Thanh', N'123456789', N'abc.jpg', N'0355388447')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'linhIT075', N'linhIT075@io.com', N'Trịnh Thiên Thanh', N'123456789', N'abc.jpg', N'0758663568')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'linhNC096', N'linhNC096@zoho.com', N'Đồng Thanh Khải', N'123456789', N'abc.jpg', N'0962558875')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'linhQG091', N'linhQG091@fpt.edu.vn', N'Hà Thị Tân', N'123456789', N'abc.jpg', N'0912261925')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'linhXX077', N'linhXX077@zoho.com', N'Trần Lộc Nhi', N'123456789', N'abc.jpg', N'0770684621')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'minhlinh521033', N'minhlinh521033@yahoo.com', N'Phạm Thu An', N'123456789', N'abc.jpg', N'0338148293')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'minhlinh542039', N'minhlinh542039@outlook.com', N'Trịnh Khởi Cường', N'123456789', N'abc.jpg', N'0391863238')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'minhlinh542091', N'minhlinh542091@yahoo.com', N'Trần Thiên Tâm', N'123456789', N'abc.jpg', N'0911628869')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'minhlinh789096', N'minhlinh789096@outlook.com', N'Diệp Kim Mỹ', N'123456789', N'abc.jpg', N'0963344582')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'minhlinh875073', N'minhlinh875073@gmail.com', N'Viên Vân My', N'123456789', N'abc.jpg', N'0734913687')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'minhlinh963033', N'minhlinh963033@outlook.com', N'Hà Ngọc Trọng', N'123456789', N'abc.jpg', N'0337282158')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'minhlinh963077', N'minhlinh963077@yahoo.com', N'Tào Tú Tâm', N'123456789', N'abc.jpg', N'0775927699')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'minhlinhAP077', N'minhlinhAP077@gmail.com', N'Thái Mỹ Tài', N'123456789', N'abc.jpg', N'0776135688')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'minhlinhAP099', N'minhlinhAP099@edu.com.vn', N'Mai Tiên Bình', N'123456789', N'abc.jpg', N'0990969980')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'minhlinhCI063', N'minhlinhCI063@gmail.com', N'Đàm Lộc Trọng', N'123456789', N'abc.jpg', N'0634416627')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'minhlinhEXO067', N'minhlinhEXO067@io.com', N'Lê Ngọc My', N'123456789', N'abc.jpg', N'0672951443')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'minhlinhGU071', N'minhlinhGU071@fpt.edu.vn', N'Tăng Thị Sương', N'123456789', N'abc.jpg', N'0711127525')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'minhlinhGU096', N'minhlinhGU096@io.com', N'Phùng Bích Vân', N'123456789', N'abc.jpg', N'0969030624')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'minhlinhHM072', N'minhlinhHM072@zoho.com', N'Tô Lan Linh', N'123456789', N'abc.jpg', N'0723804565')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'minhlinhHV031', N'minhlinhHV031@outlook.com', N'Từ Bích My', N'123456789', N'abc.jpg', N'0319639898')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'minhlinhHV071', N'minhlinhHV071@outlook.com', N'Triệu Minh Lam', N'123456789', N'abc.jpg', N'0712044549')
GO
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'minhlinhNC067', N'minhlinhNC067@outlook.com', N'Trần Mỹ Linh', N'123456789', N'abc.jpg', N'0670505559')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'minhlinhTX062', N'minhlinhTX062@fpt.edu.vn', N'Tào Lộc Đức', N'123456789', N'abc.jpg', N'0629519466')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'minhlinhTX073', N'minhlinhTX073@yahoo.com', N'Huỳnh Minh My', N'123456789', N'abc.jpg', N'0735238316')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'my123091', N'my123091@edu.com.vn', N'Lại Thiên Trinh', N'123456789', N'abc.jpg', N'0912104384')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'my963071', N'my963071@yahoo.com', N'Huỳnh Thu Lan', N'123456789', N'abc.jpg', N'0715520370')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'myAP062', N'myAP062@fpt.edu.vn', N'Mai Đình Tuấn', N'123456789', N'abc.jpg', N'0620150633')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'myCI031', N'myCI031@edu.com.vn', N'Hà Đình Tâm', N'123456789', N'abc.jpg', N'0315834986')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'myCI075', N'myCI075@outlook.com', N'Khương Bá Nhi', N'123456789', N'abc.jpg', N'0756574356')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'myEXO064', N'myEXO064@io.com', N'Đinh Thanh Trinh', N'123456789', N'abc.jpg', N'0641415434')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'myHA073', N'myHA073@outlook.com', N'Tạ Ngọc Thảo', N'123456789', N'abc.jpg', N'0730308998')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'myHM037', N'myHM037@edu.com.vn', N'Lại Tấn Trinh', N'123456789', N'abc.jpg', N'0374384318')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'myHM063', N'myHM063@yahoo.com', N'Khương Bá Cường', N'123456789', N'abc.jpg', N'0632742864')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'myHV063', N'myHV063@fpt.edu.vn', N'Đoàn Vân Cường', N'123456789', N'abc.jpg', N'0636075317')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'myIT031', N'myIT031@zoho.com', N'Tăng Bích Tài', N'123456789', N'abc.jpg', N'0317866798')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'myIT032', N'myIT032@outlook.com', N'Phan Tú Trọng', N'123456789', N'abc.jpg', N'0325170241')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'myIT035', N'myIT035@edu.com.vn', N'Trần Bích Trọng', N'123456789', N'abc.jpg', N'0356530735')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'myIT077', N'myIT077@edu.com.vn', N'Trịnh Kim Sơn', N'123456789', N'abc.jpg', N'0776393494')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'myIT095', N'myIT095@gmail.com', N'Đoàn Vân Thảo', N'123456789', N'abc.jpg', N'0956882383')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'myNC072', N'myNC072@zoho.com', N'Lương Bích Hương', N'123456789', N'abc.jpg', N'0721000263')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'myNC075', N'myNC075@gmail.com', N'Ông Minh Vân', N'123456789', N'abc.jpg', N'0759261799')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'myQG037', N'myQG037@yahoo.com', N'Quách Thu My', N'123456789', N'abc.jpg', N'0374619070')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'myTX062', N'myTX062@yahoo.com', N'Đoàn Đình Thành', N'123456789', N'abc.jpg', N'0625389529')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'nam521035', N'nam521035@fpt.edu.vn', N'Triệu Bá Lam', N'123456789', N'abc.jpg', N'0354165275')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'nam542032', N'nam542032@io.com', N'Lại Thanh An', N'123456789', N'abc.jpg', N'0327431410')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'nam542064', N'nam542064@fpt.edu.vn', N'Trần Bích Mỹ', N'123456789', N'abc.jpg', N'0648900690')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'nam789032', N'nam789032@fpt.edu.vn', N'Triệu  Vân', N'123456789', N'abc.jpg', N'0329039722')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'nam875062', N'nam875062@io.com', N'Đào  Thanh', N'123456789', N'abc.jpg', N'0629072132')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'namCI064', N'namCI064@fpt.edu.vn', N'Viên Quang Tân', N'123456789', N'abc.jpg', N'0644988894')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'namEXO032', N'namEXO032@yahoo.com', N'Đàm Tú Lam', N'123456789', N'abc.jpg', N'0328048479')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'namEXO033', N'namEXO033@outlook.com', N'Phùng Thanh Tâm', N'123456789', N'abc.jpg', N'0339393082')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'namEXO064', N'namEXO064@outlook.com', N'Tạ Bích Sương', N'123456789', N'abc.jpg', N'0645664938')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'namEXO077', N'namEXO077@edu.com.vn', N'Đồng Thanh Đức', N'123456789', N'abc.jpg', N'0773475148')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'namGU039', N'namGU039@edu.com.vn', N'Tô Thị Mỹ', N'123456789', N'abc.jpg', N'0396442446')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'namHA077', N'namHA077@outlook.com', N'Phan Vân Hương', N'123456789', N'abc.jpg', N'0772790642')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'namHM071', N'namHM071@yahoo.com', N'Nguyễn Minh My', N'123456789', N'abc.jpg', N'0716974930')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'namHM073', N'namHM073@fpt.edu.vn', N'Trương Kim Nam', N'123456789', N'abc.jpg', N'0731897986')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'namHV073', N'namHV073@edu.com.vn', N'Đào Ngọc Lam', N'123456789', N'abc.jpg', N'0733144105')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'namHV095', N'namHV095@outlook.com', N'Thôi Quang Cường', N'123456789', N'abc.jpg', N'0952554025')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'namHV096', N'namHV096@edu.com.vn', N'Lương Thu Hương', N'123456789', N'abc.jpg', N'0960418514')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'namIT090', N'namIT090@gmail.com', N'Đoàn Bá Nam', N'123456789', N'abc.jpg', N'0904189019')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'namTX072', N'namTX072@gmail.com', N'Trương Trùng Linh', N'123456789', N'abc.jpg', N'0727692615')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'namTX090', N'namTX090@edu.com.vn', N'Khương Vân Khải', N'123456789', N'abc.jpg', N'0907779987')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'namXX031', N'namXX031@edu.com.vn', N'Phùng Bá Lam', N'123456789', N'abc.jpg', N'0318093283')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'namXX090', N'namXX090@fpt.edu.vn', N'Hà Minh Tuấn', N'123456789', N'abc.jpg', N'0903935074')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'ngan521039', N'ngan521039@fpt.edu.vn', N'Phùng Thanh Nam', N'123456789', N'abc.jpg', N'0398791759')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'ngan521067', N'ngan521067@gmail.com', N'Lê Khởi Cường', N'123456789', N'abc.jpg', N'0673587902')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'ngan521091', N'ngan521091@outlook.com', N'Lại Tú Đức', N'123456789', N'abc.jpg', N'0917031737')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'ngan542073', N'ngan542073@yahoo.com', N'Từ Minh Tâm', N'123456789', N'abc.jpg', N'0734532345')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'ngan875031', N'ngan875031@zoho.com', N'Quách Thị My', N'123456789', N'abc.jpg', N'0312838033')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'ngan963062', N'ngan963062@outlook.com', N'Triệu Lan Bình', N'123456789', N'abc.jpg', N'0624200374')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'nganAP037', N'nganAP037@outlook.com', N'Lý Tiên Tài', N'123456789', N'abc.jpg', N'0379626501')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'nganAP067', N'nganAP067@yahoo.com', N'Khương Trùng Ngân', N'123456789', N'abc.jpg', N'0675951686')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'nganAP077', N'nganAP077@yahoo.com', N'Viên Bích Tân', N'123456789', N'abc.jpg', N'0771109234')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'nganEXO091', N'nganEXO091@gmail.com', N'Nhâm Thị Cường', N'123456789', N'abc.jpg', N'0911815571')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'nganGU031', N'nganGU031@io.com', N'Mai Trọng Khải', N'123456789', N'abc.jpg', N'0316068512')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'nganGU071', N'nganGU071@fpt.edu.vn', N'Lý Bích My', N'123456789', N'abc.jpg', N'0717936987')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'nganHM099', N'nganHM099@zoho.com', N'Hà Thanh Thảo', N'123456789', N'abc.jpg', N'0993041020')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'nganIT067', N'nganIT067@zoho.com', N'Diệp Tiên Hương', N'123456789', N'abc.jpg', N'0677025845')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'nganKA037', N'nganKA037@yahoo.com', N'Tạ Tấn Thảo', N'123456789', N'abc.jpg', N'0374609547')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'nganKA062', N'nganKA062@zoho.com', N'Huỳnh Đình My', N'123456789', N'abc.jpg', N'0620223677')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'nganNC067', N'nganNC067@gmail.com', N'Mai Trùng Tân', N'123456789', N'abc.jpg', N'0674783535')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'nganQG031', N'nganQG031@fpt.edu.vn', N'Trịnh Văn Ngân', N'123456789', N'abc.jpg', N'0316454803')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'nganTX091', N'nganTX091@zoho.com', N'Mai Thanh Ngân', N'123456789', N'abc.jpg', N'0911123179')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'nganXX091', N'nganXX091@gmail.com', N'Viên Bích Sương', N'123456789', N'abc.jpg', N'0912766344')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'nguyenkha220699', N'nguyenngockha220699@gmail.com', N'Nguyễn Minh Kha', N'123456789', N'user.jpg', N'0918257468')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'nhi521033', N'nhi521033@yahoo.com', N'Đồng Mỹ Trinh', N'123456789', N'abc.jpg', N'0333096486')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'nhi521095', N'nhi521095@io.com', N'Lê  Hương', N'123456789', N'abc.jpg', N'0950746363')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'nhi789035', N'nhi789035@gmail.com', N'Phạm Thanh Tuấn', N'123456789', N'abc.jpg', N'0354867842')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'nhi963031', N'nhi963031@gmail.com', N'Từ Tú Trọng', N'123456789', N'abc.jpg', N'0312656759')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'nhiAP039', N'nhiAP039@gmail.com', N'Nhâm  My', N'123456789', N'abc.jpg', N'0396440467')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'nhiEXO095', N'nhiEXO095@gmail.com', N'Mai Mỹ Tuấn', N'123456789', N'abc.jpg', N'0957235958')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'nhiHA031', N'nhiHA031@gmail.com', N'Tô Bá Tài', N'123456789', N'abc.jpg', N'0313214718')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'nhiHM064', N'nhiHM064@yahoo.com', N'Lê Khởi Cường', N'123456789', N'abc.jpg', N'0641017417')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'nhiHM096', N'nhiHM096@io.com', N'Lê Tấn Trinh', N'123456789', N'abc.jpg', N'0963376872')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'nhiIT099', N'nhiIT099@outlook.com', N'Lương Tấn Khải', N'123456789', N'abc.jpg', N'0996943928')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'nhiNC032', N'nhiNC032@fpt.edu.vn', N'Thôi  Thảo', N'123456789', N'abc.jpg', N'0323369812')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'nhiNC067', N'nhiNC067@fpt.edu.vn', N'Đào Lộc An', N'123456789', N'abc.jpg', N'0676966572')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'phu123039', N'phu123039@yahoo.com', N'Tô Trọng Tân', N'123456789', N'abc.jpg', N'0394879750')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'phu123073', N'phu123073@zoho.com', N'Đồng Mỹ Thảo', N'123456789', N'abc.jpg', N'0730781230')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'phu521063', N'phu521063@edu.com.vn', N'Đào Lan Khang', N'123456789', N'abc.jpg', N'0631280247')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'phu542063', N'phu542063@io.com', N'Đào Văn Mỹ', N'123456789', N'abc.jpg', N'0639443904')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'phu789077', N'phu789077@yahoo.com', N'Ông Vân Thành', N'123456789', N'abc.jpg', N'0778495612')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'phu875067', N'phu875067@outlook.com', N'Nhâm Thiên Thành', N'123456789', N'abc.jpg', N'0677977228')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'phuAP090', N'phuAP090@outlook.com', N'Lý Tiên Vân', N'123456789', N'abc.jpg', N'0909121147')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'phuCI064', N'phuCI064@io.com', N'Tạ Thu Sương', N'123456789', N'abc.jpg', N'0647584417')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'phuGU071', N'phuGU071@fpt.edu.vn', N'Tạ Bích Ngân', N'123456789', N'abc.jpg', N'0719316800')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'phuHA090', N'phuHA090@gmail.com', N'Thái Khởi Khải', N'123456789', N'abc.jpg', N'0905628842')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'phuHV067', N'phuHV067@fpt.edu.vn', N'Phan Vân An', N'123456789', N'abc.jpg', N'0678828706')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'phuIT077', N'phuIT077@outlook.com', N'Viên Thiên Tân', N'123456789', N'abc.jpg', N'0774152802')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'phuKA032', N'phuKA032@edu.com.vn', N'Nguyễn Vân Linh', N'123456789', N'abc.jpg', N'0320429113')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'phuQG033', N'phuQG033@outlook.com', N'Khương Trọng My', N'123456789', N'abc.jpg', N'0333493377')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'phuXX031', N'phuXX031@fpt.edu.vn', N'Thái Thiên Tân', N'123456789', N'abc.jpg', N'0319501084')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'son521090', N'son521090@zoho.com', N'Hà Mỹ Hương', N'123456789', N'abc.jpg', N'0903070644')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'son542033', N'son542033@yahoo.com', N'Phạm Thị Sương', N'123456789', N'abc.jpg', N'0334222809')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'son875077', N'son875077@edu.com.vn', N'Đàm Thiên Tân', N'123456789', N'abc.jpg', N'0776950475')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'son963062', N'son963062@edu.com.vn', N'Tô Văn Sơn', N'123456789', N'abc.jpg', N'0621143513')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'son963063', N'son963063@outlook.com', N'Hà Bích An', N'123456789', N'abc.jpg', N'0635552674')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'son963075', N'son963075@zoho.com', N'Trương Mỹ Khang', N'123456789', N'abc.jpg', N'0750141068')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'son963090', N'son963090@yahoo.com', N'Từ Thị Ngân', N'123456789', N'abc.jpg', N'0906926382')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'sonAP075', N'sonAP075@io.com', N'Đàm Thanh My', N'123456789', N'abc.jpg', N'0757490741')
GO
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'sonEXO031', N'sonEXO031@fpt.edu.vn', N'Phùng Lộc Linh', N'123456789', N'abc.jpg', N'0313520184')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'sonHA037', N'sonHA037@yahoo.com', N'Đoàn Tấn Khang', N'123456789', N'abc.jpg', N'0379358907')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'sonHA075', N'sonHA075@gmail.com', N'Trần Lộc Hương', N'123456789', N'abc.jpg', N'0750919217')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'sonHA096', N'sonHA096@io.com', N'Viên Thị Sơn', N'123456789', N'abc.jpg', N'0965419974')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'sonHM037', N'sonHM037@yahoo.com', N'Hà  Hương', N'123456789', N'abc.jpg', N'0370626759')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'sonHV035', N'sonHV035@yahoo.com', N'Tăng Ngọc Thanh', N'123456789', N'abc.jpg', N'0353023443')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'sonHV090', N'sonHV090@gmail.com', N'Ông Thị Khang', N'123456789', N'abc.jpg', N'0903227334')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'sonHV099', N'sonHV099@zoho.com', N'Viên Thu Hương', N'123456789', N'abc.jpg', N'0999493877')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'sonKA067', N'sonKA067@outlook.com', N'Viên Kim Ngân', N'123456789', N'abc.jpg', N'0672030732')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'sonQG072', N'sonQG072@outlook.com', N'Lương Vân Đức', N'123456789', N'abc.jpg', N'0720841020')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'sonTX037', N'sonTX037@yahoo.com', N'Diệp Bích An', N'123456789', N'abc.jpg', N'0378332879')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'sonXX064', N'sonXX064@outlook.com', N'Đoàn Tiên Khải', N'123456789', N'abc.jpg', N'0645130187')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'suong521090', N'suong521090@yahoo.com', N'Lương Thị Tân', N'123456789', N'abc.jpg', N'0900658789')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'suong789064', N'suong789064@zoho.com', N'Lại Mỹ Nhi', N'123456789', N'abc.jpg', N'0648316511')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'suongEXO031', N'suongEXO031@outlook.com', N'Trương Thị Nhi', N'123456789', N'abc.jpg', N'0314912729')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'suongGU099', N'suongGU099@yahoo.com', N'Lại Quang Trinh', N'123456789', N'abc.jpg', N'0991796000')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'suongHA075', N'suongHA075@fpt.edu.vn', N'Thái Trọng Đức', N'123456789', N'abc.jpg', N'0759244689')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'suongHM033', N'suongHM033@outlook.com', N'Huỳnh Lan Thành', N'123456789', N'abc.jpg', N'0332788375')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'suongHM037', N'suongHM037@io.com', N'Viên Trùng Cường', N'123456789', N'abc.jpg', N'0370329031')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'suongHM067', N'suongHM067@fpt.edu.vn', N'Lý Ngọc My', N'123456789', N'abc.jpg', N'0678596933')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'suongHV037', N'suongHV037@fpt.edu.vn', N'Huỳnh Tiên Khải', N'123456789', N'abc.jpg', N'0376120700')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'suongIT091', N'suongIT091@io.com', N'Nhâm Khởi Tuấn', N'123456789', N'abc.jpg', N'0918241881')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'suongKA091', N'suongKA091@edu.com.vn', N'Phan Thiên Trọng', N'123456789', N'abc.jpg', N'0911991288')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'suongTX095', N'suongTX095@io.com', N'Khương Đình Lan', N'123456789', N'abc.jpg', N'0957223721')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tai123077', N'tai123077@edu.com.vn', N'Phùng Văn Khải', N'123456789', N'abc.jpg', N'0770838224')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tai521077', N'tai521077@fpt.edu.vn', N'Diệp Thanh Sơn', N'123456789', N'abc.jpg', N'0772515084')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tai542031', N'tai542031@io.com', N'Hà Thanh Thảo', N'123456789', N'abc.jpg', N'0319051372')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tai789064', N'tai789064@yahoo.com', N'Cao Văn Đức', N'123456789', N'abc.jpg', N'0641253957')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'taiCI095', N'taiCI095@zoho.com', N'Khương Thị Cường', N'123456789', N'abc.jpg', N'0959990483')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'taiCI096', N'taiCI096@edu.com.vn', N'Diệp Thiên Bình', N'123456789', N'abc.jpg', N'0960996374')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'taiEXO073', N'taiEXO073@yahoo.com', N'Đinh Minh Sơn', N'123456789', N'abc.jpg', N'0734583825')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'taiEXO096', N'taiEXO096@zoho.com', N'Trần Trọng Tài', N'123456789', N'abc.jpg', N'0964243047')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'taiGU064', N'taiGU064@gmail.com', N'Huỳnh Thanh Lĩnh', N'123456789', N'abc.jpg', N'0642269080')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'taiGU077', N'taiGU077@edu.com.vn', N'Từ Bích Tài', N'123456789', N'abc.jpg', N'0773176887')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'taiHM032', N'taiHM032@yahoo.com', N'Diệp Trọng Sơn', N'123456789', N'abc.jpg', N'0323968012')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'taiHV096', N'taiHV096@outlook.com', N'Triệu  Lan', N'123456789', N'abc.jpg', N'0968778398')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'taiIT033', N'taiIT033@gmail.com', N'Quách Trọng Trọng', N'123456789', N'abc.jpg', N'0337637166')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'taiIT090', N'taiIT090@gmail.com', N'Viên Đình Đức', N'123456789', N'abc.jpg', N'0902339367')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'taiKA031', N'taiKA031@zoho.com', N'Trịnh Thị Thảo', N'123456789', N'abc.jpg', N'0314328068')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'taiKA037', N'taiKA037@io.com', N'Đoàn Tú Tân', N'123456789', N'abc.jpg', N'0376878767')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'taiNC031', N'taiNC031@edu.com.vn', N'Đinh Thanh Linh', N'123456789', N'abc.jpg', N'0311493452')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'taiNC037', N'taiNC037@edu.com.vn', N'Đồng Mỹ Khải', N'123456789', N'abc.jpg', N'0376040761')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'taiNC095', N'taiNC095@outlook.com', N'Tạ Văn Tài', N'123456789', N'abc.jpg', N'0953848246')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'taiTX032', N'taiTX032@edu.com.vn', N'Lại Bích Lam', N'123456789', N'abc.jpg', N'0329212351')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'taiXX099', N'taiXX099@zoho.com', N'Viên Bích Đức', N'123456789', N'abc.jpg', N'0999253984')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tam123090', N'tam123090@io.com', N'Diệp Thanh Ngân', N'123456789', N'abc.jpg', N'0900809793')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tam521072', N'tam521072@fpt.edu.vn', N'Thôi Tiên Thảo', N'123456789', N'abc.jpg', N'0729743712')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tam521091', N'tam521091@fpt.edu.vn', N'Đàm Khởi Trọng', N'123456789', N'abc.jpg', N'0910215946')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tam542039', N'tam542039@zoho.com', N'Trương Thiên My', N'123456789', N'abc.jpg', N'0397544035')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tam963032', N'tam963032@yahoo.com', N'Đồng Lan Lan', N'123456789', N'abc.jpg', N'0325920597')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tamAP067', N'tamAP067@fpt.edu.vn', N'Lương Thị Hương', N'123456789', N'abc.jpg', N'0679050314')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tamAP075', N'tamAP075@outlook.com', N'Khương Lan Sơn', N'123456789', N'abc.jpg', N'0753511654')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tamCI062', N'tamCI062@io.com', N'Đàm  Ngân', N'123456789', N'abc.jpg', N'0622007024')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tamEXO062', N'tamEXO062@outlook.com', N'Tào Tú Thanh', N'123456789', N'abc.jpg', N'0623449617')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tamHA067', N'tamHA067@fpt.edu.vn', N'Ông Trùng Cường', N'123456789', N'abc.jpg', N'0675291678')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tamHA077', N'tamHA077@yahoo.com', N'Lại Minh Sương', N'123456789', N'abc.jpg', N'0777954662')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tamHM067', N'tamHM067@outlook.com', N'Trịnh Ngọc Nam', N'123456789', N'abc.jpg', N'0672657848')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tamIT071', N'tamIT071@zoho.com', N'Tăng Khởi Hương', N'123456789', N'abc.jpg', N'0716922924')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tamIT091', N'tamIT091@yahoo.com', N'Trương Bích Ngân', N'123456789', N'abc.jpg', N'0915176525')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tamQG035', N'tamQG035@edu.com.vn', N'Ông Thiên Thảo', N'123456789', N'abc.jpg', N'0356925816')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tamQG075', N'tamQG075@outlook.com', N'Hà Bích Đức', N'123456789', N'abc.jpg', N'0752958452')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tamTX071', N'tamTX071@yahoo.com', N'Trần Vân Phú', N'123456789', N'abc.jpg', N'0719799713')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tamXX071', N'tamXX071@io.com', N'Huỳnh Thị Lan', N'123456789', N'abc.jpg', N'0717485994')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tamXX077', N'tamXX077@edu.com.vn', N'Trịnh Tiên Ngân', N'123456789', N'abc.jpg', N'0772979109')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tamXX095', N'tamXX095@gmail.com', N'Đồng Thiên Khải', N'123456789', N'abc.jpg', N'0959811104')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tan123037', N'tan123037@edu.com.vn', N'Mai  Thanh', N'123456789', N'abc.jpg', N'0379652930')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tan123099', N'tan123099@fpt.edu.vn', N'Diệp  Linh', N'123456789', N'abc.jpg', N'0994551096')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tan875037', N'tan875037@zoho.com', N'Đồng Đình Tân', N'123456789', N'abc.jpg', N'0374382463')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tan875095', N'tan875095@gmail.com', N'Huỳnh Thiên Thanh', N'123456789', N'abc.jpg', N'0952199314')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tan963073', N'tan963073@yahoo.com', N'Phùng Đình Tài', N'123456789', N'abc.jpg', N'0732129689')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tanAP090', N'tanAP090@zoho.com', N'Trần Thị My', N'123456789', N'abc.jpg', N'0903258244')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tanCI033', N'tanCI033@fpt.edu.vn', N'Lê Văn Nhi', N'123456789', N'abc.jpg', N'0335158174')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tanCI035', N'tanCI035@outlook.com', N'Đào Tấn Hương', N'123456789', N'abc.jpg', N'0355065462')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tanEXO064', N'tanEXO064@fpt.edu.vn', N'Đoàn Thanh Đức', N'123456789', N'abc.jpg', N'0643591780')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tanEXO075', N'tanEXO075@zoho.com', N'Thái Mỹ Thảo', N'123456789', N'abc.jpg', N'0759188352')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tanEXO091', N'tanEXO091@outlook.com', N'Hà Trùng Thành', N'123456789', N'abc.jpg', N'0912991425')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tanEXO095', N'tanEXO095@zoho.com', N'Nhâm Bá Lam', N'123456789', N'abc.jpg', N'0957800308')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tanGU033', N'tanGU033@edu.com.vn', N'Phan Khởi Khang', N'123456789', N'abc.jpg', N'0338597339')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tanHA077', N'tanHA077@outlook.com', N'Hà Vân Linh', N'123456789', N'abc.jpg', N'0779243663')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tanHA090', N'tanHA090@yahoo.com', N'Viên Minh Ngân', N'123456789', N'abc.jpg', N'0903962898')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tanHM096', N'tanHM096@yahoo.com', N'Tăng Bá Trọng', N'123456789', N'abc.jpg', N'0968781861')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tanHV067', N'tanHV067@edu.com.vn', N'Triệu Quang Lam', N'123456789', N'abc.jpg', N'0671676986')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tanIT091', N'tanIT091@io.com', N'Đinh Thiên Sơn', N'123456789', N'abc.jpg', N'0911943624')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tanKA071', N'tanKA071@yahoo.com', N'Đoàn Mỹ Linh', N'123456789', N'abc.jpg', N'0712115687')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tanNC035', N'tanNC035@fpt.edu.vn', N'Phạm Mỹ Lan', N'123456789', N'abc.jpg', N'0355130000')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tanTX062', N'tanTX062@io.com', N'Triệu Quang Nhi', N'123456789', N'abc.jpg', N'0621048954')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tanXX067', N'tanXX067@fpt.edu.vn', N'Diệp Bích Hương', N'123456789', N'abc.jpg', N'0674831611')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thanh123039', N'thanh123039@fpt.edu.vn', N'Phùng Tấn Ngân', N'123456789', N'abc.jpg', N'0393189351')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thanh521073', N'thanh521073@edu.com.vn', N'Từ Bá Bình', N'123456789', N'abc.jpg', N'0736487350')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thanh521075', N'thanh521075@gmail.com', N'Khương Minh Đức', N'123456789', N'abc.jpg', N'0750041712')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thanh542031', N'thanh542031@zoho.com', N'Hà Tiên Khang', N'123456789', N'abc.jpg', N'0314965850')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thanh542039', N'thanh542039@outlook.com', N'Nhâm Thanh Thanh', N'123456789', N'abc.jpg', N'0399658484')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thanh542072', N'thanh542072@fpt.edu.vn', N'Nhâm Bích Khải', N'123456789', N'abc.jpg', N'0723412891')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thanh789091', N'thanh789091@zoho.com', N'Thôi  Khang', N'123456789', N'abc.jpg', N'0913135455')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thanh875039', N'thanh875039@fpt.edu.vn', N'Mai Tiên My', N'123456789', N'abc.jpg', N'0391446241')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thanh875063', N'thanh875063@edu.com.vn', N'Cao Lộc Tân', N'123456789', N'abc.jpg', N'0636836705')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thanh875072', N'thanh875072@gmail.com', N'Thái Văn Mỹ', N'123456789', N'abc.jpg', N'0721023217')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thanh875095', N'thanh875095@outlook.com', N'Quách Bá Sương', N'123456789', N'abc.jpg', N'0955020605')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thanh963071', N'thanh963071@zoho.com', N'Diệp Lộc Tâm', N'123456789', N'abc.jpg', N'0716415484')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thanh963095', N'thanh963095@outlook.com', N'Lý Ngọc Hương', N'123456789', N'abc.jpg', N'0955319711')
GO
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thanhAP037', N'thanhAP037@zoho.com', N'Mai Văn Phú', N'123456789', N'abc.jpg', N'0377234727')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thanhCI033', N'thanhCI033@io.com', N'Phùng Thiên Thảo', N'123456789', N'abc.jpg', N'0332732653')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thanhCI035', N'thanhCI035@gmail.com', N'Cao Thanh Tài', N'123456789', N'abc.jpg', N'0352190434')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thanhCI062', N'thanhCI062@fpt.edu.vn', N'Đào Trọng Lam', N'123456789', N'abc.jpg', N'0629244450')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thanhHA073', N'thanhHA073@fpt.edu.vn', N'Đoàn Ngọc Khang', N'123456789', N'abc.jpg', N'0738283391')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thanhHM033', N'thanhHM033@gmail.com', N'Viên Bích Nhi', N'123456789', N'abc.jpg', N'0331494557')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thanhHM064', N'thanhHM064@gmail.com', N'Lý Mỹ My', N'123456789', N'abc.jpg', N'0643397769')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thanhHV067', N'thanhHV067@io.com', N'Ông  Vân', N'123456789', N'abc.jpg', N'0674103986')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thanhIT039', N'thanhIT039@outlook.com', N'Nguyễn Lộc Tuấn', N'123456789', N'abc.jpg', N'0398186529')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thanhIT064', N'thanhIT064@fpt.edu.vn', N'Diệp Mỹ My', N'123456789', N'abc.jpg', N'0646140550')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thanhTX032', N'thanhTX032@fpt.edu.vn', N'Thôi Tấn Thành', N'123456789', N'abc.jpg', N'0322448369')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thanhTX075', N'thanhTX075@yahoo.com', N'Đoàn  Tài', N'123456789', N'abc.jpg', N'0755120220')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thanhXX035', N'thanhXX035@gmail.com', N'Trịnh Thanh Ngân', N'123456789', N'abc.jpg', N'0352725092')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thanhXX095', N'thanhXX095@fpt.edu.vn', N'Lại Văn Khải', N'123456789', N'abc.jpg', N'0951522599')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thao521033', N'thao521033@outlook.com', N'Đồng Minh Trọng', N'123456789', N'abc.jpg', N'0332449010')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thao542099', N'thao542099@io.com', N'Trương Minh Nam', N'123456789', N'abc.jpg', N'0996748170')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thao789064', N'thao789064@yahoo.com', N'Tô Minh An', N'123456789', N'abc.jpg', N'0649378659')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thao789067', N'thao789067@gmail.com', N'Thôi Tiên Bình', N'123456789', N'abc.jpg', N'0678438611')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thao875033', N'thao875033@yahoo.com', N'Cao Bá Thảo', N'123456789', N'abc.jpg', N'0332039817')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thao963033', N'thao963033@yahoo.com', N'Lý Thiên Tân', N'123456789', N'abc.jpg', N'0333154909')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thaoAP062', N'thaoAP062@yahoo.com', N'Mai Thanh An', N'123456789', N'abc.jpg', N'0628169590')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thaoEXO071', N'thaoEXO071@io.com', N'Trần Thu Ngân', N'123456789', N'abc.jpg', N'0719019007')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thaoGU032', N'thaoGU032@fpt.edu.vn', N'Đào Thu Đức', N'123456789', N'abc.jpg', N'0327617303')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thaoHA096', N'thaoHA096@zoho.com', N'Huỳnh Tú Thảo', N'123456789', N'abc.jpg', N'0968700904')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thaoHM067', N'thaoHM067@zoho.com', N'Khương Tấn Thanh', N'123456789', N'abc.jpg', N'0672268270')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thaoHV037', N'thaoHV037@yahoo.com', N'Lại Thu Thanh', N'123456789', N'abc.jpg', N'0377282885')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thaoIT035', N'thaoIT035@io.com', N'Phùng Tú My', N'123456789', N'abc.jpg', N'0357671504')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thaoKA035', N'thaoKA035@zoho.com', N'Đàm Lan Sơn', N'123456789', N'abc.jpg', N'0355254930')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thaoKA062', N'thaoKA062@io.com', N'Đào Tú Khải', N'123456789', N'abc.jpg', N'0624402065')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thaoNC033', N'thaoNC033@edu.com.vn', N'Trịnh Vân Tài', N'123456789', N'abc.jpg', N'0334293040')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thaoNC071', N'thaoNC071@outlook.com', N'Lại Đình Trọng', N'123456789', N'abc.jpg', N'0714327598')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thaoNC073', N'thaoNC073@zoho.com', N'Ông Thu Hương', N'123456789', N'abc.jpg', N'0734043193')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thaoTX037', N'thaoTX037@outlook.com', N'Đinh Quang Hương', N'123456789', N'abc.jpg', N'0370290444')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thaoXX035', N'thaoXX035@outlook.com', N'Triệu Bích Khang', N'123456789', N'abc.jpg', N'0358542768')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'thaoXX095', N'thaoXX095@gmail.com', N'Trần Vân Lĩnh', N'123456789', N'abc.jpg', N'0956124472')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'trinh875031', N'trinh875031@yahoo.com', N'Phùng Vân Tài', N'123456789', N'abc.jpg', N'0312023680')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'trinh963032', N'trinh963032@gmail.com', N'Trần Lộc Bình', N'123456789', N'abc.jpg', N'0321388039')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'trinhEXO032', N'trinhEXO032@fpt.edu.vn', N'Đinh Kim Trọng', N'123456789', N'abc.jpg', N'0325803782')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'trinhEXO073', N'trinhEXO073@zoho.com', N'Phùng Vân Lam', N'123456789', N'abc.jpg', N'0734780522')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'trinhGU035', N'trinhGU035@yahoo.com', N'Trịnh Đình Thành', N'123456789', N'abc.jpg', N'0352767059')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'trinhHV031', N'trinhHV031@zoho.com', N'Đàm Đình Sơn', N'123456789', N'abc.jpg', N'0312648023')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'trinhKA062', N'trinhKA062@edu.com.vn', N'Lý Tiên Lĩnh', N'123456789', N'abc.jpg', N'0626079439')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'trinhQG062', N'trinhQG062@yahoo.com', N'Khương Thị Tân', N'123456789', N'abc.jpg', N'0624159274')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'trinhQG071', N'trinhQG071@yahoo.com', N'Lương Bá Bình', N'123456789', N'abc.jpg', N'0719831018')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'trinhTX062', N'trinhTX062@fpt.edu.vn', N'Trần Khởi Thanh', N'123456789', N'abc.jpg', N'0623252030')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'trinhTX099', N'trinhTX099@io.com', N'Nguyễn Bích My', N'123456789', N'abc.jpg', N'0992879106')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'trinhXX032', N'trinhXX032@zoho.com', N'Lại Lan Đức', N'123456789', N'abc.jpg', N'0322419571')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'trinhXX039', N'trinhXX039@yahoo.com', N'Quách Mỹ Tâm', N'123456789', N'abc.jpg', N'0390504259')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'trong123095', N'trong123095@zoho.com', N'Nhâm Văn Mỹ', N'123456789', N'abc.jpg', N'0956765954')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'trong875067', N'trong875067@outlook.com', N'Đàm Tấn Khang', N'123456789', N'abc.jpg', N'0670629621')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'trongAP031', N'trongAP031@zoho.com', N'Tào Lan Thành', N'123456789', N'abc.jpg', N'0317367398')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'trongAP091', N'trongAP091@io.com', N'Nhâm Vân Lam', N'123456789', N'abc.jpg', N'0916943776')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'trongEXO031', N'trongEXO031@gmail.com', N'Hà Tiên Linh', N'123456789', N'abc.jpg', N'0317544211')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'trongGU062', N'trongGU062@edu.com.vn', N'Tô Vân My', N'123456789', N'abc.jpg', N'0629497688')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'trongGU077', N'trongGU077@fpt.edu.vn', N'Lương Minh Khải', N'123456789', N'abc.jpg', N'0777195834')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'trongHA095', N'trongHA095@gmail.com', N'Phùng Thiên Ngân', N'123456789', N'abc.jpg', N'0953351779')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'trongHM067', N'trongHM067@zoho.com', N'Tăng Mỹ Sương', N'123456789', N'abc.jpg', N'0674911334')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'trongIT091', N'trongIT091@outlook.com', N'Tạ Thanh Nhi', N'123456789', N'abc.jpg', N'0918323646')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'trongKA064', N'trongKA064@gmail.com', N'Đào Ngọc Linh', N'123456789', N'abc.jpg', N'0645531694')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'trongNC039', N'trongNC039@io.com', N'Nhâm Bích Tài', N'123456789', N'abc.jpg', N'0390786978')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'trongQG062', N'trongQG062@zoho.com', N'Hà Văn Mỹ', N'123456789', N'abc.jpg', N'0621789894')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tuanAP071', N'tuanAP071@zoho.com', N'Thái Ngọc Khang', N'123456789', N'abc.jpg', N'0719036837')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tuanAP073', N'tuanAP073@gmail.com', N'Tào  Khang', N'123456789', N'abc.jpg', N'0735246640')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tuanCI039', N'tuanCI039@fpt.edu.vn', N'Tào Văn Trọng', N'123456789', N'abc.jpg', N'0394545272')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tuanEXO099', N'tuanEXO099@outlook.com', N'Cao Tấn Sương', N'123456789', N'abc.jpg', N'0993009824')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tuanHA075', N'tuanHA075@fpt.edu.vn', N'Lương Đình Phú', N'123456789', N'abc.jpg', N'0752521309')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tuanHV039', N'tuanHV039@outlook.com', N'Đinh Lan Nhi', N'123456789', N'abc.jpg', N'0394267978')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tuanHV072', N'tuanHV072@edu.com.vn', N'Lê Thị Thanh', N'123456789', N'abc.jpg', N'0727648758')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tuanIT064', N'tuanIT064@zoho.com', N'Lương Tấn Lan', N'123456789', N'abc.jpg', N'0640226185')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tuanKA091', N'tuanKA091@yahoo.com', N'Hà Đình Vân', N'123456789', N'abc.jpg', N'0916538008')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tuanNC033', N'tuanNC033@gmail.com', N'Tào Thiên Sơn', N'123456789', N'abc.jpg', N'0334381024')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tuanQG031', N'tuanQG031@zoho.com', N'Hà Quang Nhi', N'123456789', N'abc.jpg', N'0316624725')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tuanTX031', N'tuanTX031@io.com', N'Tào Vân Hương', N'123456789', N'abc.jpg', N'0317828941')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'tuanTX099', N'tuanTX099@gmail.com', N'Trương Tiên Trọng', N'123456789', N'abc.jpg', N'0999164621')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'van542099', N'van542099@edu.com.vn', N'Đồng Bích Tâm', N'123456789', N'abc.jpg', N'0991400306')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'van963032', N'van963032@edu.com.vn', N'Trịnh Vân Tuấn', N'123456789', N'abc.jpg', N'0328268267')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'van963064', N'van963064@gmail.com', N'Phùng Tiên Vân', N'123456789', N'abc.jpg', N'0644899160')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'van963099', N'van963099@zoho.com', N'Đồng Thị Vân', N'123456789', N'abc.jpg', N'0997487663')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'vanAP095', N'vanAP095@gmail.com', N'Quách Bích Trọng', N'123456789', N'abc.jpg', N'0953137661')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'vanGU072', N'vanGU072@io.com', N'Quách Bích Thảo', N'123456789', N'abc.jpg', N'0727840796')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'vanGU077', N'vanGU077@edu.com.vn', N'Phùng Thanh Khang', N'123456789', N'abc.jpg', N'0776892847')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'vanIT062', N'vanIT062@fpt.edu.vn', N'Trần Thanh Hương', N'123456789', N'abc.jpg', N'0620720962')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'vanIT063', N'vanIT063@gmail.com', N'Nhâm Đình Tuấn', N'123456789', N'abc.jpg', N'0639639699')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'vanIT096', N'vanIT096@gmail.com', N'Thôi Vân Trinh', N'123456789', N'abc.jpg', N'0969147745')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'vanTX064', N'vanTX064@outlook.com', N'Trương Trùng Thành', N'123456789', N'abc.jpg', N'0645401330')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'vanTX075', N'vanTX075@io.com', N'Tô Tấn Bình', N'123456789', N'abc.jpg', N'0757764563')
INSERT [dbo].[accounts] ([username], [email], [fullname], [password], [photo], [phone]) VALUES (N'vanXX062', N'vanXX062@zoho.com', N'Từ Văn Trinh', N'123456789', N'abc.jpg', N'0628167421')
GO
SET IDENTITY_INSERT [dbo].[authorities] ON 

INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (130, N'an123039', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (49, N'an542090', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (457, N'an542095', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (143, N'an789071', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (107, N'an875037', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (67, N'an875096', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (340, N'an875099', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (320, N'an963095', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (44, N'anAP062', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (119, N'anAP073', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (79, N'anGU033', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (430, N'anGU095', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (172, N'anHM095', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (98, N'anHV031', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (377, N'anKA035', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (33, N'anNC095', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (84, N'anTX077', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (316, N'binh123095', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (376, N'binh875063', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (339, N'binh875091', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (4, N'binhCI090', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (64, N'binhGU062', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (191, N'binhHV037', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (224, N'binhHV039', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (148, N'binhHV090', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (77, N'binhIT073', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (110, N'binhIT096', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (75, N'binhKA091', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (323, N'binhNC035', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (372, N'binhTX032', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (403, N'binhTX091', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (350, N'binhXX032', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (88, N'cuong123075', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (206, N'cuong123099', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (397, N'cuong521071', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (137, N'cuong789073', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (7, N'cuong789095', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (451, N'cuong963031', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (222, N'cuongAP035', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (440, N'cuongCI071', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (120, N'cuongEXO095', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (43, N'cuongEXO099', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (251, N'cuongHA067', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (286, N'cuongHA096', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (298, N'cuongHV064', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (334, N'cuongHV075', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (239, N'cuongKA032', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (128, N'cuongNC032', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (424, N'cuongNC077', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (471, N'cuongXX037', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (60, N'cuongXX062', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (338, N'duc123031', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (352, N'duc123064', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (246, N'duc521096', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (364, N'duc875072', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (467, N'duc875077', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (187, N'ducCI096', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (433, N'ducGU077', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (293, N'ducGU095', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (384, N'ducHA035', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (425, N'ducHA037', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (461, N'ducHA064', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (40, N'ducHA075', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (374, N'ducHM063', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (134, N'ducHV077', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (138, N'ducHV096', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (13, N'ducKA071', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (292, N'ducNC090', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (135, N'ducQG031', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (285, N'ducTX077', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (147, N'ducXX062', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (80, N'huong123095', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (259, N'huong789075', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (42, N'huong963064', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (382, N'huong963071', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (455, N'huong963095', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (429, N'huongAP073', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (482, N'huongGU031', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (111, N'huongGU091', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (229, N'huongHM071', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (166, N'huongHM075', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (103, N'huongHV033', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (11, N'huongIT096', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (474, N'huongQG064', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (412, N'huongQG077', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (52, N'huongTX033', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (452, N'huongTX096', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (61, N'huongXX064', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (459, N'khai521073', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (317, N'khai542035', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (264, N'khai542037', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (360, N'khai542063', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (463, N'khai542071', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (473, N'khai875072', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (335, N'khaiAP063', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (140, N'khaiAP073', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (125, N'khaiEXO075', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (16, N'khaiHA032', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (417, N'khaiHA033', N'USER')
GO
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (428, N'khaiHM062', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (122, N'khaiHM073', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (295, N'khaiHM096', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (41, N'khaiKA095', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (275, N'khaiNC032', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (408, N'khaiNC063', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (248, N'khaiQG033', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (276, N'khaiQG071', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (311, N'khaiTX031', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (241, N'khaiTX072', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (228, N'khaiXX072', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (218, N'khang521071', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (362, N'khang875099', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (26, N'khangAP096', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (183, N'khangEXO096', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (383, N'khangGU095', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (51, N'khangGU099', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (150, N'khangHA063', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (71, N'khangHM096', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (287, N'khangHV032', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (281, N'khangHV090', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (247, N'khangIT067', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (395, N'khangIT095', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (198, N'khangKA032', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (249, N'khangKA064', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (484, N'khangNC077', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (344, N'khangNC091', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (74, N'khangTX039', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (160, N'khangXX064', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (486, N'khannit159', N'ADMIN')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (220, N'lam542062', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (394, N'lam542096', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (393, N'lam789071', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (271, N'lam875072', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (402, N'lam963063', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (359, N'lam963090', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (131, N'lamAP095', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (399, N'lamEXO039', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (330, N'lamEXO090', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (20, N'lamEXO099', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (453, N'lamGU031', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (14, N'lamIT035', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (82, N'lamIT039', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (270, N'lamIT073', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (209, N'lamNC037', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (50, N'lamNC090', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (194, N'lamQG032', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (426, N'lamQG099', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (101, N'lan521096', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (315, N'lan542033', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (419, N'lan789062', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (324, N'lan789095', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (477, N'lan875091', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (410, N'lan963032', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (223, N'lan963062', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (356, N'lanAP090', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (443, N'lanAP091', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (169, N'lanAP095', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (370, N'lanCI073', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (458, N'lanEXO096', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (434, N'lanGU067', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (257, N'lanHA072', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (232, N'lanKA032', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (258, N'lanKA095', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (333, N'lanNC072', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (201, N'lanQG062', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (10, N'lanQG064', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (24, N'lanQG072', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (165, N'lanXX090', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (46, N'lanXX091', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (115, N'linh123033', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (142, N'linh521099', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (124, N'linh542031', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (205, N'linh875032', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (284, N'linhAP072', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (197, N'linhCI062', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (347, N'linhEXO071', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (112, N'linhGU077', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (427, N'linhGU091', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (420, N'linhGU099', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (38, N'linhIT035', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (465, N'linhIT075', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (357, N'linhNC096', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (45, N'linhQG091', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (447, N'linhXX077', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (157, N'minhlinh521033', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (269, N'minhlinh542039', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (252, N'minhlinh542091', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (136, N'minhlinh789096', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (95, N'minhlinh875073', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (481, N'minhlinh963033', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (174, N'minhlinh963077', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (63, N'minhlinhAP077', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (389, N'minhlinhAP099', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (100, N'minhlinhCI063', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (263, N'minhlinhEXO067', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (184, N'minhlinhGU071', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (83, N'minhlinhGU096', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (283, N'minhlinhHM072', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (47, N'minhlinhHV031', N'STAFF')
GO
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (373, N'minhlinhHV071', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (151, N'minhlinhNC067', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (326, N'minhlinhTX062', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (56, N'minhlinhTX073', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (97, N'my123091', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (93, N'my963071', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (319, N'myAP062', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (309, N'myCI031', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (27, N'myCI075', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (245, N'myEXO064', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (195, N'myHA073', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (322, N'myHM037', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (302, N'myHM063', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (154, N'myHV063', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (54, N'myIT031', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (113, N'myIT032', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (236, N'myIT035', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (438, N'myIT077', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (331, N'myIT095', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (392, N'myNC072', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (401, N'myNC075', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (358, N'myQG037', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (469, N'myTX062', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (313, N'nam521035', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (31, N'nam542032', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (289, N'nam542064', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (277, N'nam789032', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (21, N'nam875062', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (366, N'namCI064', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (321, N'namEXO032', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (153, N'namEXO033', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (146, N'namEXO064', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (386, N'namEXO077', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (237, N'namGU039', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (454, N'namHA077', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (409, N'namHM071', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (341, N'namHM073', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (39, N'namHV073', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (211, N'namHV095', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (123, N'namHV096', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (378, N'namIT090', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (415, N'namTX072', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (37, N'namTX090', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (253, N'namXX031', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (388, N'namXX090', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (318, N'ngan521039', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (273, N'ngan521067', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (17, N'ngan521091', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (385, N'ngan542073', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (328, N'ngan875031', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (444, N'ngan963062', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (441, N'nganAP037', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (398, N'nganAP067', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (9, N'nganAP077', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (310, N'nganEXO091', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (407, N'nganGU031', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (70, N'nganGU071', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (336, N'nganHM099', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (267, N'nganIT067', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (391, N'nganKA037', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (367, N'nganKA062', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (406, N'nganNC067', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (58, N'nganQG031', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (168, N'nganTX091', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (72, N'nganXX091', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (487, N'nguyenkha220699', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (152, N'nhi521033', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (278, N'nhi521095', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (167, N'nhi789035', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (288, N'nhi963031', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (371, N'nhiAP039', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (265, N'nhiEXO095', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (99, N'nhiHA031', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (114, N'nhiHM064', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (235, N'nhiHM096', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (102, N'nhiIT099', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (116, N'nhiNC032', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (478, N'nhiNC067', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (200, N'phu123039', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (225, N'phu123073', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (162, N'phu521063', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (242, N'phu542063', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (219, N'phu789077', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (32, N'phu875067', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (460, N'phuAP090', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (12, N'phuCI064', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (436, N'phuGU071', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (55, N'phuHA090', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (173, N'phuHV067', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (129, N'phuIT077', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (91, N'phuKA032', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (348, N'phuQG033', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (185, N'phuXX031', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (2, N'son521090', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (216, N'son542033', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (109, N'son875077', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (181, N'son963062', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (266, N'son963063', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (354, N'son963075', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (178, N'son963090', N'STAFF')
GO
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (139, N'sonAP075', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (180, N'sonEXO031', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (22, N'sonHA037', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (34, N'sonHA075', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (66, N'sonHA096', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (387, N'sonHM037', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (437, N'sonHV035', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (144, N'sonHV090', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (456, N'sonHV099', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (145, N'sonKA067', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (238, N'sonQG072', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (210, N'sonTX037', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (405, N'sonXX064', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (244, N'suong521090', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (65, N'suong789064', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (214, N'suongEXO031', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (190, N'suongGU099', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (87, N'suongHA075', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (411, N'suongHM033', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (18, N'suongHM037', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (89, N'suongHM067', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (81, N'suongHV037', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (8, N'suongIT091', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (208, N'suongKA091', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (158, N'suongTX095', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (193, N'tai123077', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (57, N'tai521077', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (305, N'tai542031', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (117, N'tai789064', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (179, N'taiCI095', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (159, N'taiCI096', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (379, N'taiEXO073', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (23, N'taiEXO096', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (250, N'taiGU064', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (325, N'taiGU077', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (163, N'taiHM032', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (6, N'taiHV096', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (48, N'taiIT033', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (300, N'taiIT090', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (53, N'taiKA031', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (365, N'taiKA037', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (349, N'taiNC031', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (448, N'taiNC037', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (449, N'taiNC095', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (390, N'taiTX032', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (369, N'taiXX099', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (361, N'tam123090', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (59, N'tam521072', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (28, N'tam521091', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (36, N'tam542039', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (204, N'tam963032', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (240, N'tamAP067', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (468, N'tamAP075', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (230, N'tamCI062', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (192, N'tamEXO062', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (423, N'tamHA067', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (274, N'tamHA077', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (212, N'tamHM067', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (203, N'tamIT071', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (233, N'tamIT091', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (472, N'tamQG035', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (307, N'tamQG075', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (280, N'tamTX071', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (342, N'tamXX071', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (176, N'tamXX077', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (294, N'tamXX095', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (3, N'tan123037', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (105, N'tan123099', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (164, N'tan875037', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (86, N'tan875095', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (261, N'tan963073', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (479, N'tanAP090', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (329, N'tanCI033', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (380, N'tanCI035', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (227, N'tanEXO064', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (462, N'tanEXO075', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (156, N'tanEXO091', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (69, N'tanEXO095', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (355, N'tanGU033', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (375, N'tanHA077', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (171, N'tanHA090', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (353, N'tanHM096', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (141, N'tanHV067', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (256, N'tanIT091', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (177, N'tanKA071', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (96, N'tanNC035', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (255, N'tanTX062', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (445, N'tanXX067', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (279, N'thanh123039', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (106, N'thanh521073', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (304, N'thanh521075', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (149, N'thanh542031', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (466, N'thanh542039', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (431, N'thanh542072', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (30, N'thanh789091', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (92, N'thanh875039', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (127, N'thanh875063', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (404, N'thanh875072', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (290, N'thanh875095', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (483, N'thanh963071', N'STAFF')
GO
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (363, N'thanh963095', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (351, N'thanhAP037', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (215, N'thanhCI033', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (35, N'thanhCI035', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (368, N'thanhCI062', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (186, N'thanhHA073', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (226, N'thanhHM033', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (432, N'thanhHM064', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (439, N'thanhHV067', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (25, N'thanhIT039', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (78, N'thanhIT064', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (5, N'thanhTX032', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (464, N'thanhTX075', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (442, N'thanhXX035', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (104, N'thanhXX095', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (73, N'thao521033', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (213, N'thao542099', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (327, N'thao789064', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (243, N'thao789067', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (260, N'thao875033', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (291, N'thao963033', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (337, N'thaoAP062', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (19, N'thaoEXO071', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (29, N'thaoGU032', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (421, N'thaoHA096', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (175, N'thaoHM067', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (480, N'thaoHV037', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (470, N'thaoIT035', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (476, N'thaoKA035', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (254, N'thaoKA062', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (435, N'thaoNC033', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (299, N'thaoNC071', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (272, N'thaoNC073', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (414, N'thaoTX037', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (416, N'thaoXX035', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (161, N'thaoXX095', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (346, N'trinh875031', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (400, N'trinh963032', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (303, N'trinhEXO032', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (422, N'trinhEXO073', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (170, N'trinhGU035', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (396, N'trinhHV031', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (132, N'trinhKA062', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (413, N'trinhQG062', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (68, N'trinhQG071', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (343, N'trinhTX062', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (76, N'trinhTX099', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (231, N'trinhXX032', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (217, N'trinhXX039', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (297, N'trong123095', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (418, N'trong875067', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (62, N'trongAP031', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (207, N'trongAP091', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (90, N'trongEXO031', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (196, N'trongGU062', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (308, N'trongGU077', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (221, N'trongHA095', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (475, N'trongHM067', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (188, N'trongIT091', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (332, N'trongKA064', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (189, N'trongNC039', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (199, N'trongQG062', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (345, N'tuanAP071', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (381, N'tuanAP073', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (121, N'tuanCI039', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (485, N'tuanEXO099', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (450, N'tuanHA075', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (306, N'tuanHV039', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (268, N'tuanHV072', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (301, N'tuanIT064', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (282, N'tuanKA091', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (1, N'tuanNC033', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (296, N'tuanQG031', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (126, N'tuanTX031', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (314, N'tuanTX099', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (234, N'van542099', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (118, N'van963032', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (312, N'van963064', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (202, N'van963099', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (133, N'vanAP095', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (446, N'vanGU072', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (15, N'vanGU077', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (155, N'vanIT062', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (108, N'vanIT063', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (94, N'vanIT096', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (262, N'vanTX064', N'STAFF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (85, N'vanTX075', N'USER')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (182, N'vanXX062', N'STAFF')
SET IDENTITY_INSERT [dbo].[authorities] OFF
GO
INSERT [dbo].[categories] ([id], [name], [status]) VALUES (N'B', N'Bia', 1)
INSERT [dbo].[categories] ([id], [name], [status]) VALUES (N'BD', N'Bóng đèn', 1)
INSERT [dbo].[categories] ([id], [name], [status]) VALUES (N'BL', N'Balo', 1)
INSERT [dbo].[categories] ([id], [name], [status]) VALUES (N'CMR', N'Camera', 1)
INSERT [dbo].[categories] ([id], [name], [status]) VALUES (N'DG', N'Dầu gội', 1)
INSERT [dbo].[categories] ([id], [name], [status]) VALUES (N'DH', N'Đồng hồ', 1)
INSERT [dbo].[categories] ([id], [name], [status]) VALUES (N'DN', N'Đèn ngủ', 1)
INSERT [dbo].[categories] ([id], [name], [status]) VALUES (N'DT', N'Điện thoại', 1)
INSERT [dbo].[categories] ([id], [name], [status]) VALUES (N'GD', N'Giày dép', 1)
INSERT [dbo].[categories] ([id], [name], [status]) VALUES (N'GV', N'Gia vị', 1)
INSERT [dbo].[categories] ([id], [name], [status]) VALUES (N'HN', N'Hộp nhựa', 1)
INSERT [dbo].[categories] ([id], [name], [status]) VALUES (N'KT', N'Khăn tắm', 1)
INSERT [dbo].[categories] ([id], [name], [status]) VALUES (N'LT', N'Laptop', 1)
INSERT [dbo].[categories] ([id], [name], [status]) VALUES (N'MT', N'Mì tôm', 1)
INSERT [dbo].[categories] ([id], [name], [status]) VALUES (N'NH', N'Nước hoa', 1)
INSERT [dbo].[categories] ([id], [name], [status]) VALUES (N'QAF', N'Quần áo nữ', 1)
INSERT [dbo].[categories] ([id], [name], [status]) VALUES (N'QAM', N'Quần áo nam', 1)
INSERT [dbo].[categories] ([id], [name], [status]) VALUES (N'QM', N'Quạt máy', 1)
INSERT [dbo].[categories] ([id], [name], [status]) VALUES (N'RC', N'Rau củ', 1)
INSERT [dbo].[categories] ([id], [name], [status]) VALUES (N'ST', N'Sữa tươi', 1)
INSERT [dbo].[categories] ([id], [name], [status]) VALUES (N'TC', N'Thịt cá', 1)
INSERT [dbo].[categories] ([id], [name], [status]) VALUES (N'TX', N'Túi xách', 1)
GO
INSERT [dbo].[discounts] ([id], [date_from], [date_end], [free], [status], [dolar]) VALUES (N'0000-5555-0214-5879', CAST(N'2022-06-23' AS Date), CAST(N'2022-07-10' AS Date), 50, 0, NULL)
INSERT [dbo].[discounts] ([id], [date_from], [date_end], [free], [status], [dolar]) VALUES (N'0250-9666-3602-0001', CAST(N'2022-02-10' AS Date), CAST(N'2022-02-20' AS Date), 30, 0, NULL)
INSERT [dbo].[discounts] ([id], [date_from], [date_end], [free], [status], [dolar]) VALUES (N'0522-0555-9686-9875', CAST(N'2021-06-12' AS Date), CAST(N'2021-07-12' AS Date), 10, 0, NULL)
INSERT [dbo].[discounts] ([id], [date_from], [date_end], [free], [status], [dolar]) VALUES (N'0588-0001-8545-9652', CAST(N'2021-10-25' AS Date), CAST(N'2021-12-25' AS Date), 10, 0, NULL)
INSERT [dbo].[discounts] ([id], [date_from], [date_end], [free], [status], [dolar]) VALUES (N'7798-5685-5214-0000', CAST(N'2022-09-30' AS Date), CAST(N'2022-10-30' AS Date), 10, 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[keywords] ON 

INSERT [dbo].[keywords] ([id], [keyword], [username]) VALUES (15, N'a', N'an123039')
INSERT [dbo].[keywords] ([id], [keyword], [username]) VALUES (87, N'a', N'nguyenkha220699')
SET IDENTITY_INSERT [dbo].[keywords] OFF
GO
SET IDENTITY_INSERT [dbo].[orderdetails] ON 

INSERT [dbo].[orderdetails] ([id], [quantity], [orderid], [productid]) VALUES (1, 1, 1, 30)
INSERT [dbo].[orderdetails] ([id], [quantity], [orderid], [productid]) VALUES (2, 2, 1, 31)
SET IDENTITY_INSERT [dbo].[orderdetails] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [address], [createdate], [username]) VALUES (1, N'K341/18 Tôn Đức Thắng, Q.Liên Chiểu, Hòa Minh, ĐN', CAST(N'2022-08-21' AS Date), N'nguyenkha220699')
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (30, CAST(N'2022-12-30' AS Date), N'bia1.jpg', N'Bia Laru - Vui cùng miền trung nào', 251.25, N'B', 120, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (31, CAST(N'2022-08-19' AS Date), N'bia2.jpg', N'Bia Oranjeboom Premium Strong', 352.12, N'B', 50, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (32, CAST(N'2022-08-13' AS Date), N'bia3.jpg', N'Bia X-Mark Tequila 5,9% – Lon 500ml – Thùng 12 lon', 130.22, N'B', 55, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (33, CAST(N'2022-12-29' AS Date), N'bia4.jpg', N'Bia Heineken Pháp 5% – Chai 250ml – Thùng 20 chai', 265.3, N'B', 66, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (34, CAST(N'2022-12-28' AS Date), N'bongden1.jpg', N'Đèn Ngủ Gắn Tường Gỗ Cao Cấp', 125, N'BD', 5, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (35, CAST(N'2022-12-28' AS Date), N'bongden2.jpg', N'Đèn Tường Da Dê Đẹp Treo Phòng Ngủ Giá Rẻ', 251.2, N'BD', 0, 0, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (36, CAST(N'2022-12-28' AS Date), N'bongden3.jpg', N'Đèn Vách Dù Đẹp AV280', 21.2, N'BD', 8, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (37, CAST(N'2022-08-10' AS Date), N'bongden4.jpg', N'Đèn Ngủ Gắn Tường Gỗ Cao Cấp', 54.25, N'BD', 9, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (38, CAST(N'2022-12-27' AS Date), N'balo1.jpg', N'Balo Mikkor The Kalino M Light Grey', 220, N'BL', 30, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (39, CAST(N'2022-12-27' AS Date), N'balo2.jpg', N'Balo Herschel Classic Mini XS Paint Pour Black', 356.25, N'BL', 36, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (40, CAST(N'2022-12-26' AS Date), N'balo3.jpg', N'Balo Herschel Retreat Standard 15" Backpack M Navy', 365, N'BL', 11, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (41, CAST(N'2022-12-20' AS Date), N'bia5.jpg', N'Bia Chimay đỏ 7% – Chai 330ml – Thùng 12 chai', 223.21, N'B', 7, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (42, CAST(N'2022-12-20' AS Date), N'dienthoai1.jpg', N'Apple-iphone7-special', 854.2, N'DT', 18, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (43, CAST(N'2020-12-20' AS Date), N'dienthoai2.jpg', N'Apple-iphone8-special-black', 999.25, N'DT', 14, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (44, CAST(N'2021-05-06' AS Date), N'dienthoai3.jpg', N'Huawei-mate x7 dung lượng 8GB', 142.36, N'DT', 56, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (45, CAST(N'2021-07-25' AS Date), N'dienthoai4.jpg', N'Samsung-galaxy 7 dung lượng 4GB', 152.14, N'DT', 60, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (46, CAST(N'2021-10-22' AS Date), N'dienthoai5.jpg', N'Điện thoại LG G6 Version 10 4GB lưu trữ', 123.26, N'DT', 29, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (47, CAST(N'2020-11-19' AS Date), N'laptop1.jpg', N'Laptop maxbook mini 251x274', 1205.2, N'LT', 5, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (48, CAST(N'2021-07-07' AS Date), N'laptop2.jpg', N'Laptop I7 Lobomx 570', 1425.7, N'LT', 6, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (49, CAST(N'2021-07-12' AS Date), N'laptop3.jpg', N'Laptop MSI Modern 14 B11MOU', 1255, N'LT', 2, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (50, CAST(N'2020-12-05' AS Date), N'balo4.jpg', N'Balo da nam chống nước Baodidaishu Aolang A3004', 147, N'BL', 22, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (51, CAST(N'2022-08-27' AS Date), N'camera2.jpg', N'Camera IP wifi Ezviz CS-C6N 1080P 2MP', 258.6, N'CMR', 0, 0, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (52, CAST(N'2022-08-17' AS Date), N'raucu5.jpg', N'Cà chua beef hữu cơ - 500g - [Chỉ Giao HCM]', 1.55, N'RC', 100, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (53, CAST(N'2022-06-13' AS Date), N'raucu4.jpg', N'Bí đỏ hữu cơ - 1kg - [Chỉ Giao HCM]', 0.25, N'RC', 80, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (54, CAST(N'2022-08-25' AS Date), N'raucu3.jpg', N'Cải xoăn (Kale) hữu cơ - 500g - [Chỉ Giao HCM]', 1, N'RC', 60, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (55, CAST(N'2022-08-22' AS Date), N'raucu2.jpg', N'Cải ngồng hữu cơ - 250g - [Chỉ Giao HCM]', 1.2, N'RC', 0, 0, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (56, CAST(N'2022-10-10' AS Date), N'raucu1.jpg', N'Rau dền hữu cơ - 300g - [Chỉ Giao HCM]', 1.2, N'RC', 25, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (57, CAST(N'2022-10-12' AS Date), N'raucu6.jpg', N'
Tỏi Ninh thuận 200G - [Chỉ Giao HCM]', 0.25, N'RC', 51, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (58, CAST(N'2022-12-30' AS Date), N'raucu7.jpg', N'Cà rốt - 400g - [Chỉ Giao HCM]', 1.4, N'RC', 10, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (59, CAST(N'2022-12-30' AS Date), N'raucu8.jpg', N'Bông cải xanh - 500g - [Chỉ Giao HCM]', 2.2, N'RC', 78, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (60, CAST(N'2022-12-28' AS Date), N'raucu9.jpg', N'Nấm Mỡ Trắng Rica (Khay 200G) - [Chỉ Giao HCM]', 2.25, N'RC', 0, 0, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (61, CAST(N'2021-08-19' AS Date), N'camera1.jpg', N'Camera GoPro 251PX', 421.2, N'CMR', 14, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (62, CAST(N'2022-09-08' AS Date), N'bia6.jpg', N'Thùng 24 lon bia SAIGON SPECIAL - 330ml - Mới
', 357, N'B', 14, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (64, CAST(N'2022-08-10' AS Date), N'bia7.jpg
', N'Thùng 24 lon bia lúa mì Tiger Platinum Wheat Lager', 9, N'B', 24, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (65, CAST(N'2022-08-09' AS Date), N'bia8.jpg
', N'Thùng 24 Lon Bia Sài Gòn Chill 330ml
 / Lon', 382, N'B', 19, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (66, CAST(N'2022-09-08' AS Date), N'bia9.jpg', N'Thùng Bia Tiger Xanh có 24 Lon (330ml / Lon)
', 356, N'B', 33, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (67, CAST(N'2022-08-09' AS Date), N'bia10.jpg', N'Thùng 24 lon Bia Tuyết - Edelweiss 330ml/lon
', 399.2, N'B', 20, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (68, CAST(N'2022-08-10' AS Date), N'bia11.jpg', N'Thùng 24 Lon Bia Sài Gòn Lager Xanh 330ml
 / Lon', 27, N'B', 23, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (69, CAST(N'2022-02-23' AS Date), N'bia12.jpg', N'Lốc 4 lon Bia Tuyết - Edelweiss 330ml/lon
', 78, N'B', 23, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (70, CAST(N'2022-08-07' AS Date), N'bia13.jpg', N'Thùng 24 Lon Bia 333 330ml
 / Lon', 281, N'B', 23, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (71, CAST(N'2022-08-08' AS Date), N'bongden5.jpg', N'Đèn Led Trang Trí Bóng Tròn 3M - 20 Bóng Trang Trí', 22, N'BD', 700, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (72, CAST(N'2022-08-04' AS Date), N'bongden6.jpg', N'sét 10 bóng Đèn Led 3w Ánh Sáng Trắng
', 4, N'BD', 520, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (73, CAST(N'2022-05-12' AS Date), N'bongden7.jpg
', N'Bóng Đèn Led Bulb E27 Đổi Màu RGB Kèm Remote
', 15, N'BD', 557, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (74, CAST(N'2022-06-16' AS Date), N'bongden8.jpg
', N'Bóng Tròn 3W/ 5W / VÀNG/ LẮP ĐUI ĐÈN TRANG TRÍ
', 8, N'BD', 120, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (75, CAST(N'2022-08-08' AS Date), N'bongden9.jpg', N'Bóng đèn LED BULB Trụ
', 5, N'BD', 222, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (76, CAST(N'2021-05-16' AS Date), N'bongden10.jpg', N'Bóng đèn LED ECO STICK E27 OSRAM
', 9, N'BD', 74, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (77, CAST(N'2022-08-06' AS Date), N'bongden11.jpg', N'Bóng Đèn Thông Minh TP-Link Tapo L530E Đa Sắc', 10, N'BD', 56, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (78, CAST(N'2022-08-08' AS Date), N'bongden12.jpg', N'Bóng đèn led cảm biến 9W Rạng Đông, Model A60/9w', 11, N'BD', 56, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (82, CAST(N'2022-06-23' AS Date), N'balo5.jpg', N'Balo da nữ thời trang hàn quốc, tặng móc khóa gấu', 71, N'BL', 41, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (84, CAST(N'2021-04-10' AS Date), N'balo6.jpg', N'Balo nam thông minh đa năng cao cấp chống trộm', 69, N'BL', 42, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (85, CAST(N'2022-08-10' AS Date), N'balo7.jpg', N'Balo Nữ Sinh Đi Học Phong Cách Hàn Quốc G1260
', 145, N'BL', 44, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (86, CAST(N'2022-06-17' AS Date), N'balo8.jpg
', N'Balo da nam chống nước Baodidaishu Aolang Grey A30', 549, N'BL', 10, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (88, CAST(N'2022-07-23' AS Date), N'balo9.jpg', N'Balo mini chống nước Haoshuai Aolang Green Xanh', 229, N'BL', 15, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (89, CAST(N'2022-06-25' AS Date), N'balo10.jpg', N'Bộ ba lô thời trang 5 món học sinh
', 78, N'BL', 11, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (90, CAST(N'2018-09-28' AS Date), N'balo11.jpg', N'Balo nữ thời trang chống nước và chống trộm
', 129, N'BL', 19, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (92, CAST(N'2022-08-09' AS Date), N'balo12.jpg', N'Balo Unisex balo đi học laptop sinh viên ulzzang', 255, N'BL', 39, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (93, CAST(N'2022-08-08' AS Date), N'daugoi1.jpg
', N'Dầu Gội Dove Phục Hồi Hư Tổn 880gr
', 146, N'DG', 100, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (94, CAST(N'2019-05-29' AS Date), N'daugoi2.jpg
', N'Combo 2 Dầu Gội HEAD & SHOULDERS Bạc Hà', 258, N'DG', 140, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (95, CAST(N'2022-08-01' AS Date), N'daugoi3.jpg
', N'Dầu gội Dược liệu Nguyên Xuân dưỡng tóc 450ml
', 120, N'DG', 20, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (96, CAST(N'2022-08-09' AS Date), N'daugoi4.jpg
', N'Dầu gội xả 2in1 Palmolive thiên nhiên 600ml
', 115, N'DG', 21, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (98, CAST(N'2022-08-07' AS Date), N'daugoi5.jpg
', N'Dầu ngăn rụng tóc Megumi Hair Fall Control Sham', 159, N'DG', 22, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (99, CAST(N'2022-08-24' AS Date), N'daugoi6.jpg
', N'Dầu gội chăm sóc tóc Bưởi MILAGANICS
', 25, N'DG', 22, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (100, CAST(N'2022-08-11' AS Date), N'daugoi7.jpg
', N'Dove Phục Hồi Hư Tổn Dầu Gội 640g + Kem Xả 610g
', 216, N'DG', 58, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (101, CAST(N'2021-09-15' AS Date), N'daugoi8.jpg
', N'Dầu Gội REJOICE Chai Dung Tích 650ml/900ml/1.8L
', 247, N'DG', 69, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (102, CAST(N'2020-12-01' AS Date), N'dongho1.jpg
', N'Đồng Hồ Nam Dây Da Yazole 332 (45mm) - Đen
', 69, N'DH', 5, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (103, CAST(N'2021-05-07' AS Date), N'dongho2.jpg
', N'Đồng hồ nam chính hãng Lobinni No.3603
', 68, N'DH', 6, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (104, CAST(N'2022-08-05' AS Date), N'dongho3.jpg
', N'Đồng hồ nam chính hãng Teintop T7015-1
', 25, N'DH', 10, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (105, CAST(N'2022-06-29' AS Date), N'dongho4.jpg
', N'Đồng hồ nam nữ thông minh giá rẻ VATANE DH16
', 988, N'DH', 3, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (106, CAST(N'2022-08-08' AS Date), N'dongho5.jpg
', N'Đồng Hồ Casio Nam General MTP-E320D-9EVDF
', 6, N'DH', 4, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (107, CAST(N'2019-08-01' AS Date), N'dongho6.jpg
', N'Đồng hồ nam dây da Casio MTP-V004L-7AUDF
', 535, N'DH', 2, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (108, CAST(N'2021-01-24' AS Date), N'dongho7.jpg
', N'Đồng Hồ Treo Tường Kim Trôi Cao Cấp HONO
', 125, N'DH', 4, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (109, CAST(N'2022-05-01' AS Date), N'dongho8.jpg
', N'Đồng hồ đeo tay Hakiko nam nữ cực đẹp DH44
', 999, N'DH', 10, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (110, CAST(N'2022-07-19' AS Date), N'camera3.jpg
', N'Camera Quan Sát Siêu Nhỏ SQ11 - Hàng Nhập', 525, N'CMR', 15, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (111, CAST(N'2021-09-12' AS Date), N'camera4.jpg
', N'Camera năng lượng mặt trời thông minh
', 1431.2, N'CMR', 4, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (113, CAST(N'2022-06-01' AS Date), N'camera5.jpg
', N'Camera wifi mini không dây HD 1080P chống trộm
', 898, N'CMR', 10, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (114, CAST(N'2022-08-07' AS Date), N'camera6.jpg
', N'Camera Dahua IP Wifi Imou IPC-C22EP-imou
', 995, N'CMR', 12, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (115, CAST(N'2021-03-29' AS Date), N'camera7.jpg
', N'Camera mini Wifi Góc Rộng HD V380 E06
', 37, N'CMR', 25, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (116, CAST(N'2022-07-22' AS Date), N'camera8.jpg
', N'Camera giám sát toàn cảnh 360 độ EC11-P12
', 389, N'CMR', 36, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (118, CAST(N'2021-05-18' AS Date), N'camera9.jpg
', N'Camera Wifi TP-Link Tapo C310 An Ninh Ngoài Trời', 83, N'CMR', 45, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (119, CAST(N'2019-11-12' AS Date), N'camera10.jpg', N'Camera IP Wifi Trong Nhà EZVIZ C6N 1080p', 479.25, N'CMR', 55, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (120, CAST(N'2022-08-04' AS Date), N'denngu1.jpg
', N'Đèn ngủ 3W
', 4, N'DN', 10, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (121, CAST(N'2020-04-02' AS Date), N'denngu2.jpg
', N'Đèn ngủ hình nấm công nghệ đèn led
', 297, N'DN', 15, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (122, CAST(N'2022-08-21' AS Date), N'denngu3.jpg
', N'Đèn ngủ cảm biến ban đêm Mijia MJYD04YL', 14, N'DN', 25, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (123, CAST(N'2022-08-05' AS Date), N'denngu4.jpg
', N'Đèn Ngủ Cảm Ứng Hình Quả Trứng
', 875, N'DN', 17, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (124, CAST(N'2022-06-21' AS Date), N'denngu5.jpg
', N'Combo 2 Đèn Ngủ Cảm Biến Ánh Sáng
', 44, N'DN', 89, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (125, CAST(N'2022-08-22' AS Date), N'denngu6.jpg
', N'Đèn Led Phòng Ngủ 3D
', 149, N'DN', 5, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (126, CAST(N'2022-05-12' AS Date), N'denngu7.jpg
', N'Đèn ngủ hình cây- đèn ngủ để bàn - đèn trang trí', 9, N'DN', 14, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (127, CAST(N'2022-07-08' AS Date), N'giaydep1.jpg
', N'Giày Sneaker thể thao nam - Nâng chiều cao
', 179, N'GD', 50, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (128, CAST(N'2022-08-08' AS Date), N'giaydep2.jpg
', N'Dép quai ngang cao su đúc siêu bền nam nữ
', 5, N'GD', 48, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (129, CAST(N'2021-03-29' AS Date), N'giaydep3.jpg
', N'Giày thời trang thể thao nam Rozalo R6815
', 129, N'GD', 95, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (130, CAST(N'2022-08-06' AS Date), N'giaydep4.jpg
', N'Dép nữ DUWA TNT001S - Quai ngang đế bánh mì', 66, N'GD', 70, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (131, CAST(N'2022-07-03' AS Date), N'giaydep5.jpg
', N'Giày sneaker nam phong cách thể thao 212
', 45, N'GD', 10, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (132, CAST(N'2021-12-16' AS Date), N'giaydep6.jpg
', N'Dép đúc Thái Lan nữ siêu nhẹ
', 33, N'GD', 0, 0, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (133, CAST(N'2022-03-23' AS Date), N'giaydep7.jpg
', N'Giày sneakers nam Elite Flex Prime 232212-LGBK
', 19, N'GD', 2, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (134, CAST(N'2022-08-05' AS Date), N'giaydep8.jpg
', N'Dép bánh mỳ quai bèo nhún gắn tickets
', 89, N'GD', 5, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (135, CAST(N'2022-08-07' AS Date), N'giavi2.jpg', N'Chai nước gia vị cô đặc MAGGI 350g
', 27, N'GV', 15, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (136, CAST(N'2020-04-03' AS Date), N'giavi3.jpg', N'Gia vị thịt nướng Toàn Gia 500g/gói
', 149, N'GV', 20, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (138, CAST(N'2021-08-05' AS Date), N'giavi4.jpg', N'Combo 5 gói Natural Gia vị Ướp Thịt Nướng', 42, N'GV', 55, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (139, CAST(N'2022-08-07' AS Date), N'giavi5.jpg', N'Combo 5 Gói Gia Vị Nấu Phở Vipep - Gia Vị Nấu Phở', 55, N'GV', 1, 1, NULL, NULL)
GO
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (140, CAST(N'2022-08-10' AS Date), N'giavi6.jpg', N'Combo 5 gói Natural Gia vị Ướp Thịt Mắc Mật', 42, N'GV', 2, 1, NULL, NULL)
INSERT [dbo].[products] ([id], [createdate], [image], [name], [price], [categoryid], [number], [available], [discountid], [describe]) VALUES (141, CAST(N'2022-03-10' AS Date), N'quanaonu1.jpg
', N'SET ÁO & CHAN VÁY THỦY THỦ THỜI TRANG NỮ', 13, N'QAF', 50, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[products] OFF
GO
INSERT [dbo].[roles] ([id], [name]) VALUES (N'ADMIN', N'Administrators')
INSERT [dbo].[roles] ([id], [name]) VALUES (N'STAFF', N'Staffs')
INSERT [dbo].[roles] ([id], [name]) VALUES (N'USER', N'Users')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UKhtk0tjw6uf67w0vkhy5n3j1oq]    Script Date: 9/30/2022 11:37:13 PM ******/
ALTER TABLE [dbo].[authorities] ADD  CONSTRAINT [UKhtk0tjw6uf67w0vkhy5n3j1oq] UNIQUE NONCLUSTERED 
(
	[username] ASC,
	[roleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[authorities]  WITH CHECK ADD  CONSTRAINT [FKevi9708lm1k06pa4dugc91k7v] FOREIGN KEY([roleid])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[authorities] CHECK CONSTRAINT [FKevi9708lm1k06pa4dugc91k7v]
GO
ALTER TABLE [dbo].[authorities]  WITH CHECK ADD  CONSTRAINT [FKlw0sapcjvuxfa1kvyjw7jml88] FOREIGN KEY([username])
REFERENCES [dbo].[accounts] ([username])
GO
ALTER TABLE [dbo].[authorities] CHECK CONSTRAINT [FKlw0sapcjvuxfa1kvyjw7jml88]
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [FKdpyej8iigc8ml84qxns9mwvda] FOREIGN KEY([productid])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [FKdpyej8iigc8ml84qxns9mwvda]
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [FKmtau98mcbrvrn12dod8amygdl] FOREIGN KEY([username])
REFERENCES [dbo].[accounts] ([username])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [FKmtau98mcbrvrn12dod8amygdl]
GO
ALTER TABLE [dbo].[histories]  WITH CHECK ADD  CONSTRAINT [FK6pqq8n14hj80civ7y3qh3lfw1] FOREIGN KEY([username])
REFERENCES [dbo].[accounts] ([username])
GO
ALTER TABLE [dbo].[histories] CHECK CONSTRAINT [FK6pqq8n14hj80civ7y3qh3lfw1]
GO
ALTER TABLE [dbo].[keywords]  WITH CHECK ADD  CONSTRAINT [FKow0qfpj4kif8mq0erb14hp2vb] FOREIGN KEY([username])
REFERENCES [dbo].[accounts] ([username])
GO
ALTER TABLE [dbo].[keywords] CHECK CONSTRAINT [FKow0qfpj4kif8mq0erb14hp2vb]
GO
ALTER TABLE [dbo].[orderdetails]  WITH CHECK ADD  CONSTRAINT [FKaltatpxipsjtcih4d1h6bn0xr] FOREIGN KEY([productid])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[orderdetails] CHECK CONSTRAINT [FKaltatpxipsjtcih4d1h6bn0xr]
GO
ALTER TABLE [dbo].[orderdetails]  WITH CHECK ADD  CONSTRAINT [FKj4gc2ja2otvwemf4rho2lp3s8] FOREIGN KEY([orderid])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[orderdetails] CHECK CONSTRAINT [FKj4gc2ja2otvwemf4rho2lp3s8]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FKk3cjfcgb621qhahps1tre43e4] FOREIGN KEY([username])
REFERENCES [dbo].[accounts] ([username])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FKk3cjfcgb621qhahps1tre43e4]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_discount_id] FOREIGN KEY([discountid])
REFERENCES [dbo].[discounts] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_discount_id]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK1krrsjgcawsfg8k8u4hm5gi8q] FOREIGN KEY([categoryid])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK1krrsjgcawsfg8k8u4hm5gi8q]
GO
USE [master]
GO
ALTER DATABASE [Fastshop] SET  READ_WRITE 
GO
