USE [master]
GO
/****** Object:  Database [project5]    Script Date: 11/2/2018 3:27:50 PM ******/
CREATE DATABASE [project5]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'project5', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\project5.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'project5_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\project5_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [project5] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [project5].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [project5] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [project5] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [project5] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [project5] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [project5] SET ARITHABORT OFF 
GO
ALTER DATABASE [project5] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [project5] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [project5] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [project5] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [project5] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [project5] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [project5] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [project5] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [project5] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [project5] SET  DISABLE_BROKER 
GO
ALTER DATABASE [project5] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [project5] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [project5] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [project5] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [project5] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [project5] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [project5] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [project5] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [project5] SET  MULTI_USER 
GO
ALTER DATABASE [project5] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [project5] SET DB_CHAINING OFF 
GO
ALTER DATABASE [project5] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [project5] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [project5] SET DELAYED_DURABILITY = DISABLED 
GO
USE [project5]
GO
/****** Object:  Table [dbo].[Catalog]    Script Date: 11/2/2018 3:27:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[NavID] [int] NULL,
 CONSTRAINT [PK_Catalog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 11/2/2018 3:27:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Total] [int] NULL,
	[Date] [nvarchar](50) NULL,
	[SupplierID] [int] NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InvoiceDetail]    Script Date: 11/2/2018 3:27:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[Price] [int] NULL,
	[Quantity] [int] NULL,
	[InvoiceID] [int] NULL,
 CONSTRAINT [PK_InvoiceDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NavMenu]    Script Date: 11/2/2018 3:27:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NavMenu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_NavMenu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[News]    Script Date: 11/2/2018 3:27:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[EditedBy] [nvarchar](50) NULL,
	[CreatedDate] [date] NULL,
	[EditedDate] [date] NULL,
	[ImageTitle] [nvarchar](50) NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 11/2/2018 3:27:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[Price] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/2/2018 3:27:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Total] [int] NULL,
	[OrderDate] [date] NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [varchar](15) NULL,
	[Address] [nvarchar](70) NULL,
	[Note] [nvarchar](max) NULL,
	[UserID] [int] NULL,
	[ShipperID] [int] NULL,
	[PaymentStsID] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PaymentStatus]    Script Date: 11/2/2018 3:27:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](30) NULL,
 CONSTRAINT [PK_PaymentStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/2/2018 3:27:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Detail] [nvarchar](max) NULL,
	[Price] [int] NULL,
	[Discount] [int] NULL,
	[Brand] [nvarchar](50) NULL,
	[Img1] [nvarchar](max) NULL,
	[Img2] [nvarchar](max) NULL,
	[CatalogID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/2/2018 3:27:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Role] [nvarchar](35) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shipper]    Script Date: 11/2/2018 3:27:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Shipper](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [varchar](15) NULL,
 CONSTRAINT [PK_Shipper] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 11/2/2018 3:27:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Company] [nvarchar](50) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/2/2018 3:27:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[RoleID] [int] NULL,
	[ImageUser] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[CreatedDate] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Wishlist]    Script Date: 11/2/2018 3:27:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wishlist](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[ProductId] [int] NULL,
 CONSTRAINT [PK_Wishlist] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Catalog] ON 

INSERT [dbo].[Catalog] ([Id], [Name], [NavID]) VALUES (1, N'Epos Swiss', 1)
INSERT [dbo].[Catalog] ([Id], [Name], [NavID]) VALUES (2, N'Atlantic Swiss', 1)
INSERT [dbo].[Catalog] ([Id], [Name], [NavID]) VALUES (3, N'Bruno Sohnle Glashutte', 1)
INSERT [dbo].[Catalog] ([Id], [Name], [NavID]) VALUES (4, N'Diamond D', 1)
INSERT [dbo].[Catalog] ([Id], [Name], [NavID]) VALUES (5, N'Aries Gold', 1)
INSERT [dbo].[Catalog] ([Id], [Name], [NavID]) VALUES (6, N'Diamond D', 2)
INSERT [dbo].[Catalog] ([Id], [Name], [NavID]) VALUES (7, N'Aries Gold', 2)
INSERT [dbo].[Catalog] ([Id], [Name], [NavID]) VALUES (8, N'Nam', 3)
INSERT [dbo].[Catalog] ([Id], [Name], [NavID]) VALUES (9, N'Nữ', 3)
INSERT [dbo].[Catalog] ([Id], [Name], [NavID]) VALUES (10, N'Unisex', 3)
INSERT [dbo].[Catalog] ([Id], [Name], [NavID]) VALUES (11, N'Bruno Sohnle Glashutte', 2)
INSERT [dbo].[Catalog] ([Id], [Name], [NavID]) VALUES (12, N'Atlantic Swiss', 2)
SET IDENTITY_INSERT [dbo].[Catalog] OFF
SET IDENTITY_INSERT [dbo].[Invoice] ON 

INSERT [dbo].[Invoice] ([Id], [Total], [Date], [SupplierID]) VALUES (1, 1000000, N'2018-10-30', 2)
INSERT [dbo].[Invoice] ([Id], [Total], [Date], [SupplierID]) VALUES (2, 100000000, N'2018-10-30', 3)
SET IDENTITY_INSERT [dbo].[Invoice] OFF
SET IDENTITY_INSERT [dbo].[InvoiceDetail] ON 

INSERT [dbo].[InvoiceDetail] ([Id], [ProductID], [Price], [Quantity], [InvoiceID]) VALUES (1, 1, 250000, 10, 1)
INSERT [dbo].[InvoiceDetail] ([Id], [ProductID], [Price], [Quantity], [InvoiceID]) VALUES (4, 1, 100000000, 1, 2)
INSERT [dbo].[InvoiceDetail] ([Id], [ProductID], [Price], [Quantity], [InvoiceID]) VALUES (5, 2, 250000, 10, 1)
SET IDENTITY_INSERT [dbo].[InvoiceDetail] OFF
SET IDENTITY_INSERT [dbo].[NavMenu] ON 

INSERT [dbo].[NavMenu] ([Id], [Name]) VALUES (1, N'Thương hiệu')
INSERT [dbo].[NavMenu] ([Id], [Name]) VALUES (2, N'Linh kiện')
INSERT [dbo].[NavMenu] ([Id], [Name]) VALUES (3, N'Giới tính')
SET IDENTITY_INSERT [dbo].[NavMenu] OFF
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([Id], [Title], [Content], [CreatedBy], [EditedBy], [CreatedDate], [EditedDate], [ImageTitle]) VALUES (2, N'Đâm người tình vì chê thù lao 10 triệu sau 7 năm làm công', N'<p class="abs"><strong>Không đồng ý vì người tình chỉ trả có 10 triệu đồng sau thời gian làm công, Bình ấm ức trong người rồi dùng dao sát hại nạn nhân sau đó.</strong></p><p>Ngày 21.10, tin từ VKSND tỉnh Đắk Lắk cho biết, đơn vị vừa ban hành cáo trạng truy tố bị can Đặng Bình (SN 1962, ngụ xã Ea Khal, huyện Ea H’leo, tỉnh Đắk Lắk) về tội "Giết người".</p><p>Theo cáo trạng, từ năm 2011, Bình và bà Bùi Thị H. (SN 1967) chung sống như vợ chồng tại xã Ea Khal. </p>', N'admin', NULL, CAST(N'2018-10-23' AS Date), NULL, N'44399607_24433877890.jpg')
INSERT [dbo].[News] ([Id], [Title], [Content], [CreatedBy], [EditedBy], [CreatedDate], [EditedDate], [ImageTitle]) VALUES (3, N'Đâm người tình vì chê thù lao 10 triệu sau 7 năm làm công', N'<p class="abs"><strong>Không đồng ý vì người tình chỉ trả có 10 triệu đồng sau thời gian làm công, Bình ấm ức trong người rồi dùng dao sát hại nạn nhân sau đó.</strong></p><p>Ngày 21.10, tin từ VKSND tỉnh Đắk Lắk cho biết, đơn vị vừa ban hành cáo trạng truy tố bị can Đặng Bình (SN 1962, ngụ xã Ea Khal, huyện Ea H’leo, tỉnh Đắk Lắk) về tội "Giết người".</p><p>Theo cáo trạng, từ năm 2011, Bình và bà Bùi Thị H. (SN 1967) chung sống như vợ chồng tại xã Ea Khal. </p>', N'admin', NULL, CAST(N'2018-10-27' AS Date), NULL, N'44399607_24433877890.jpg')
INSERT [dbo].[News] ([Id], [Title], [Content], [CreatedBy], [EditedBy], [CreatedDate], [EditedDate], [ImageTitle]) VALUES (4, N'Tài xế GrabBike bị cướp cắt đứt cuống họng lúc nửa đêm', N'<div class="section-title" style="outline: 0px; color: rgb(76, 73, 71); padding: 0px 40px 20px 60px; font-family: Roboto, sans-serif; font-size: medium;"><div class="imgCon" style="outline: 0px; position: relative; margin-left: -20px;"><a class="_photo-content article-title" href="https://media.laodong.vn/storage/newsportal/2018/10/21/637248/2G8A9191.jpg" style="outline: 0px; color: rgb(0, 0, 0); transition: color 0.1s linear 0s;"><figure class="_thumb" style="display: inline-block; outline: 0px; max-width: 100%; overflow: hidden;"><img data-src="https://media.laodong.vn/storage/newsportal/2018/10/21/637248/2G8A9191.jpg?w=888&amp;h=592&amp;crop=auto&amp;scale=both" class=" lazypreload lazyloaded" alt="Trước tình trạng nhiều tài xế xe ôm công nghệ bị tấn công vào ban đêm, nhiều người đã hạn chế nhận cuốc  - nhất là hành khách nam - vào đêm khuya, rạng sáng để đảm bảo an toàn. Ảnh mang tính minh họa." width="888" height="592" src="https://media.laodong.vn/storage/newsportal/2018/10/21/637248/2G8A9191.jpg?w=888&amp;h=592&amp;crop=auto&amp;scale=both" style="border-style: none; outline: 0px; vertical-align: bottom; transition: transform 0.2s ease 0s; width: 888px;"></figure></a><div class="fb-share-button fb_iframe_widget" data-href="https://media.laodong.vn/storage/newsportal/2018/10/21/637248/2G8A9191.jpg?w=600&amp;crop=auto&amp;scale=both" data-layout="button" data-size="large" data-mobile-iframe="true" fb-xfbml-state="rendered" fb-iframe-plugin-query="app_id=103473449992006&amp;container_width=0&amp;href=https%3A%2F%2Fmedia.laodong.vn%2Fstorage%2Fnewsportal%2F2018%2F10%2F21%2F637248%2F2G8A9191.jpg%3Fw%3D600%26crop%3Dauto%26scale%3Dboth&amp;layout=button&amp;locale=vi_VN&amp;mobile_iframe=true&amp;sdk=joey&amp;size=large" style="outline: 0px; display: inline-block; top: 0px; left: 0px; opacity: 0; transition: opacity 0.35s ease 0s; position: relative;"><span style="outline: 0px; display: inline-block; position: relative; text-align: justify; vertical-align: bottom; width: 83px; height: 28px;"><iframe name="f30bc51ad5982a" width="1000px" height="1000px" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" allow="encrypted-media" title="fb:share_button Facebook Social Plugin" src="https://web.facebook.com/v2.8/plugins/share_button.php?app_id=103473449992006&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fconnect%2Fxd_arbiter%2Fr%2F__Bz3h5RzMx.js%3Fversion%3D42%23cb%3Df93e2c2412d03%26domain%3Dlaodong.vn%26origin%3Dhttps%253A%252F%252Flaodong.vn%252Ff27d1fa3a0e06e8%26relation%3Dparent.parent&amp;container_width=0&amp;href=https%3A%2F%2Fmedia.laodong.vn%2Fstorage%2Fnewsportal%2F2018%2F10%2F21%2F637248%2F2G8A9191.jpg%3Fw%3D600%26crop%3Dauto%26scale%3Dboth&amp;layout=button&amp;locale=vi_VN&amp;mobile_iframe=true&amp;sdk=joey&amp;size=large" class="" style="outline: 0px; position: absolute; border-width: initial; border-style: none; visibility: visible; width: 83px; height: 28px;"></iframe></span></div><div class="description" style="outline: 0px; padding: 10px 0px; text-align: center; font-size: 1rem;"><i style="outline: 0px;">Trước tình trạng nhiều tài xế xe ôm công nghệ bị tấn công vào ban đêm, nhiều người đã hạn chế nhận cuốc - nhất là hành khách nam - vào đêm khuya, rạng sáng để đảm bảo an toàn. Ảnh mang tính minh họa.</i></div></div></div><div class="left-sidebar row" style="outline: 0px; position: relative; width: calc(100% - 320px); padding: 0px; float: left; border-right: none; color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: medium;"><div class="articleCon" style="outline: 0px; margin: 0px 40px 0px 60px; padding: 0px 0px 20px; position: relative;"><div class="row" style="outline: 0px; position: relative; width: 548px;"><p class="abs" style="outline: 0px; line-height: 2rem; font-size: 1.4rem; font-weight: 700; color: rgb(76, 73, 71);">Gần 3h sáng, người dân ở Hóc Môn hoảng hồn khi thấy một thanh niên chạy đến một tiệm bida kêu cứu với vết thương nghiêm trọng trên cổ nên hỗ trợ đưa đi cấp trình báo cơ quan công an. Bước đầu ghi nhận nạn nhân là tài xế GrabBike bị cướp tấn công vào lúc rạng sáng.</p><div class="social social-link" style="outline: 0px; position: fixed; margin-left: -45px; z-index: 1; top: 150px;"><ul style="outline: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style: none; width: 30px;"><li style="outline: 0px; display: inline-block;"><a data-js="facebook-social" title="Chia sẻ bài viết" class="facebook-social" style="background-image: url(&quot;../img/facebook.png&quot;); background-position: center center; background-size: 100%; background-repeat: no-repeat; outline: 0px; color: rgb(0, 0, 0); cursor: pointer; width: 30px; height: 30px; display: block;"></a></li><li style="outline: 0px; display: inline-block; margin: 15px 0px 0px;"><a data-js="gplus-social" title="Chia sẻ bài viết " class="gplus-social" style="background-image: url(&quot;../img/googleplus.png&quot;); background-position: center center; background-size: 100%; background-repeat: no-repeat; outline: 0px; color: rgb(0, 0, 0); cursor: pointer; width: 30px; height: 30px; display: block;"></a></li><li style="outline: 0px; display: inline-block; margin: 15px 0px 0px;"><a data-js="twitter-social" title="Chia sẻ bài viết" class="twitter-social" style="background-image: url(&quot;../img/twitter.png&quot;); background-position: center center; background-size: 100%; background-repeat: no-repeat; outline: 0px; color: rgb(0, 0, 0); cursor: pointer; width: 30px; height: 30px; display: block;"></a></li><li style="outline: 0px; display: inline-block; margin: 15px 0px 0px;"><a href="mailto:?subject=T%C3%A0i%20x%E1%BA%BF%20GrabBike%20b%E1%BB%8B%20c%C6%B0%E1%BB%9Bp%20c%E1%BA%AFt%20%C4%91%E1%BB%A9t%20cu%E1%BB%91ng%20h%E1%BB%8Dng%20l%C3%BAc%20n%E1%BB%ADa%20%C4%91%C3%AAm&amp;body=https://laodong.vn/phap-luat/tai-xe-grabbike-bi-cuop-cat-dut-cuong-hong-luc-nua-dem-637248.ldo" title="Gửi bài viết qua mail" class="gmail-social" style="background-image: url(&quot;../img/email.png&quot;); background-position: center center; background-size: 100%; background-repeat: no-repeat; outline: 0px; color: rgb(0, 0, 0); transition: color 0.1s linear 0s; cursor: pointer; width: 30px; height: 30px; display: block;"></a></li><li style="outline: 0px; display: inline-block; margin: 15px 0px 0px;"><a data-js="feedback-social" title="Gửi ý kiến" class="feedback-social" href="https://laodong.vn/lam-bao-cung-lao-dong#tabSendFeedback" style="background-image: url(&quot;../img/feedback.png&quot;); background-position: center center; background-size: 100%; background-repeat: no-repeat; outline: 0px; color: rgb(0, 0, 0); transition: color 0.1s linear 0s; cursor: pointer; width: 30px; height: 30px; display: block;"></a></li></ul></div><div class="wrapper-main-content" style="outline: 0px;"><article class="_photo-content summary" style="outline: 0px; color: rgb(76, 73, 71); padding-bottom: 30px; font-size: 1.2rem; line-height: 1.5rem; overflow: hidden;"><div class="article-content" style="outline: 0px;"><p style="outline: 0px; padding-top: 0.7rem; font-size: 1.2rem; line-height: 1.8rem; margin-bottom: 0px;">Theo đó, khoảng 2h45 hôm nay (21.10), một số người dân sống gần một tiệm bida thuộc ấp 7, xã Xuân Thới Thượng, huyện Hóc Môn đang ngủ thì thấy một thanh niên tay ôm vết thương trên cổ chạy đến cầu cứu.</p><p style="outline: 0px; padding-top: 0.7rem; font-size: 1.2rem; line-height: 1.8rem; margin-bottom: 0px;">Thấy vậy, nhiều người vội đưa nạn nhân đi cấp cứu. Một số người nhận định người thanh niên này bị ai đó tấn công nên trình báo sự việc với công an địa phương.</p><p style="outline: 0px; padding-top: 0.7rem; font-size: 1.2rem; line-height: 1.8rem; margin-bottom: 0px;">Nhận tin báo, Công an xã Xuân Thới Thượng, huyện Hóc Môn lập tức có mặt để ghi nhận sự việc, khám nghiệm hiện trường, lấy lời khai từ người dân để phục vụ điều tra.</p><p style="outline: 0px; padding-top: 0.7rem; font-size: 1.2rem; line-height: 1.8rem; margin-bottom: 0px;">Do nạn nhân bị cắt đứt thanh quản nên cơ quan điều tra chưa thể lấy lời khai của nạn nhân được. Tuy nhiên, qua những giấy tờ cá nhân, cảnh sát xác định nạn nhân là anh Nguyễn V (SN 1985, quê tỉnh Bình Định, tạm trú Vĩnh Lộc B, huyện Bình Chánh). Anh V là tài xế GrabBike.</p><p style="outline: 0px; padding-top: 0.7rem; font-size: 1.2rem; line-height: 1.8rem;">Cũng do anh V chưa thể nói được nên bước đầu chưa thể xác định được hiện trường thực sự của vụ án. Tuy nhiên, cảnh sát nhận định có thể anh V bị cướp tấn công để lấy tài sản là điện thoại và xe máy.</p></div></article></div></div></div></div>', N'admin', NULL, CAST(N'2018-10-27' AS Date), NULL, N'Tin-Tuc-Phap-Luat-24.jpg')
INSERT [dbo].[News] ([Id], [Title], [Content], [CreatedBy], [EditedBy], [CreatedDate], [EditedDate], [ImageTitle]) VALUES (9, N'Tài xế GrabBike bị cướp cắt đứt cuống họng lúc nửa đêm', N'<div class="section-title" style="outline: 0px; color: rgb(76, 73, 71); padding: 0px 40px 20px 60px; font-family: Roboto, sans-serif; font-size: medium;"><div class="imgCon" style="outline: 0px; position: relative; margin-left: -20px;"><a class="_photo-content article-title" href="https://media.laodong.vn/storage/newsportal/2018/10/21/637248/2G8A9191.jpg" style="outline: 0px; color: rgb(0, 0, 0); transition: color 0.1s linear 0s;"><figure class="_thumb" style="display: inline-block; outline: 0px; max-width: 100%; overflow: hidden;"><img data-src="https://media.laodong.vn/storage/newsportal/2018/10/21/637248/2G8A9191.jpg?w=888&amp;h=592&amp;crop=auto&amp;scale=both" class=" lazypreload lazyloaded" alt="Trước tình trạng nhiều tài xế xe ôm công nghệ bị tấn công vào ban đêm, nhiều người đã hạn chế nhận cuốc  - nhất là hành khách nam - vào đêm khuya, rạng sáng để đảm bảo an toàn. Ảnh mang tính minh họa." width="888" height="592" src="https://media.laodong.vn/storage/newsportal/2018/10/21/637248/2G8A9191.jpg?w=888&amp;h=592&amp;crop=auto&amp;scale=both" style="border-style: none; outline: 0px; vertical-align: bottom; transition: transform 0.2s ease 0s; width: 888px;"></figure></a><div class="fb-share-button fb_iframe_widget" data-href="https://media.laodong.vn/storage/newsportal/2018/10/21/637248/2G8A9191.jpg?w=600&amp;crop=auto&amp;scale=both" data-layout="button" data-size="large" data-mobile-iframe="true" fb-xfbml-state="rendered" fb-iframe-plugin-query="app_id=103473449992006&amp;container_width=0&amp;href=https%3A%2F%2Fmedia.laodong.vn%2Fstorage%2Fnewsportal%2F2018%2F10%2F21%2F637248%2F2G8A9191.jpg%3Fw%3D600%26crop%3Dauto%26scale%3Dboth&amp;layout=button&amp;locale=vi_VN&amp;mobile_iframe=true&amp;sdk=joey&amp;size=large" style="outline: 0px; display: inline-block; top: 0px; left: 0px; opacity: 0; transition: opacity 0.35s ease 0s; position: relative;"><span style="outline: 0px; display: inline-block; position: relative; text-align: justify; vertical-align: bottom; width: 83px; height: 28px;"><iframe name="f30bc51ad5982a" width="1000px" height="1000px" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" allow="encrypted-media" title="fb:share_button Facebook Social Plugin" src="https://web.facebook.com/v2.8/plugins/share_button.php?app_id=103473449992006&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fconnect%2Fxd_arbiter%2Fr%2F__Bz3h5RzMx.js%3Fversion%3D42%23cb%3Df93e2c2412d03%26domain%3Dlaodong.vn%26origin%3Dhttps%253A%252F%252Flaodong.vn%252Ff27d1fa3a0e06e8%26relation%3Dparent.parent&amp;container_width=0&amp;href=https%3A%2F%2Fmedia.laodong.vn%2Fstorage%2Fnewsportal%2F2018%2F10%2F21%2F637248%2F2G8A9191.jpg%3Fw%3D600%26crop%3Dauto%26scale%3Dboth&amp;layout=button&amp;locale=vi_VN&amp;mobile_iframe=true&amp;sdk=joey&amp;size=large" class="" style="outline: 0px; position: absolute; border-width: initial; border-style: none; visibility: visible; width: 83px; height: 28px;"></iframe></span></div><div class="description" style="outline: 0px; padding: 10px 0px; text-align: center; font-size: 1rem;"><em>Trước tình trạng nhiều tài xế xe ôm công nghệ bị tấn công vào ban đêm, nhiều người đã hạn chế nhận cuốc - nhất là hành khách nam - vào đêm khuya, rạng sáng để đảm bảo an toàn. Ảnh mang tính minh họa.</em></div></div></div><div class="left-sidebar row" style="outline: 0px; position: relative; width: calc(100% - 320px); padding: 0px; float: left; border-right: none; color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: medium;"><div class="articleCon" style="outline: 0px; margin: 0px 40px 0px 60px; padding: 0px 0px 20px; position: relative;"><div class="row" style="outline: 0px; position: relative; width: 548px;"><p class="abs" style="outline: 0px; line-height: 2rem; font-size: 1.4rem; font-weight: 700; color: rgb(76, 73, 71);">Gần 3h sáng, người dân ở Hóc Môn hoảng hồn khi thấy một thanh niên chạy đến một tiệm bida kêu cứu với vết thương nghiêm trọng trên cổ nên hỗ trợ đưa đi cấp trình báo cơ quan công an. Bước đầu ghi nhận nạn nhân là tài xế GrabBike bị cướp tấn công vào lúc rạng sáng.</p><div class="social social-link" style="outline: 0px; position: fixed; margin-left: -45px; z-index: 1; top: 150px;"><ul style="outline: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style: none; width: 30px;"><li style="outline: 0px; display: inline-block;"><a data-js="facebook-social" title="Chia sẻ bài viết" class="facebook-social" style="background-image: url(" ..="" img="" facebook.png");="" background-position:="" center="" center;="" background-size:="" 100%;="" background-repeat:="" no-repeat;="" outline:="" 0px;="" color:="" rgb(0,="" 0,="" 0);="" cursor:="" pointer;="" width:="" 30px;="" height:="" display:="" block;"=""></a></li><li style="outline: 0px; display: inline-block; margin: 15px 0px 0px;"><a data-js="gplus-social" title="Chia sẻ bài viết " class="gplus-social" style="background-image: url(" ..="" img="" googleplus.png");="" background-position:="" center="" center;="" background-size:="" 100%;="" background-repeat:="" no-repeat;="" outline:="" 0px;="" color:="" rgb(0,="" 0,="" 0);="" cursor:="" pointer;="" width:="" 30px;="" height:="" display:="" block;"=""></a></li><li style="outline: 0px; display: inline-block; margin: 15px 0px 0px;"><a data-js="twitter-social" title="Chia sẻ bài viết" class="twitter-social" style="background-image: url(" ..="" img="" twitter.png");="" background-position:="" center="" center;="" background-size:="" 100%;="" background-repeat:="" no-repeat;="" outline:="" 0px;="" color:="" rgb(0,="" 0,="" 0);="" cursor:="" pointer;="" width:="" 30px;="" height:="" display:="" block;"=""></a></li><li style="outline: 0px; display: inline-block; margin: 15px 0px 0px;"><a href="mailto:?subject=T%C3%A0i%20x%E1%BA%BF%20GrabBike%20b%E1%BB%8B%20c%C6%B0%E1%BB%9Bp%20c%E1%BA%AFt%20%C4%91%E1%BB%A9t%20cu%E1%BB%91ng%20h%E1%BB%8Dng%20l%C3%BAc%20n%E1%BB%ADa%20%C4%91%C3%AAm&amp;body=https://laodong.vn/phap-luat/tai-xe-grabbike-bi-cuop-cat-dut-cuong-hong-luc-nua-dem-637248.ldo" title="Gửi bài viết qua mail" class="gmail-social" style="background-image: url(" ..="" img="" email.png");="" background-position:="" center="" center;="" background-size:="" 100%;="" background-repeat:="" no-repeat;="" outline:="" 0px;="" color:="" rgb(0,="" 0,="" 0);="" transition:="" color="" 0.1s="" linear="" 0s;="" cursor:="" pointer;="" width:="" 30px;="" height:="" display:="" block;"=""></a></li><li style="outline: 0px; display: inline-block; margin: 15px 0px 0px;"><a data-js="feedback-social" title="Gửi ý kiến" class="feedback-social" href="https://laodong.vn/lam-bao-cung-lao-dong#tabSendFeedback" style="background-image: url(" ..="" img="" feedback.png");="" background-position:="" center="" center;="" background-size:="" 100%;="" background-repeat:="" no-repeat;="" outline:="" 0px;="" color:="" rgb(0,="" 0,="" 0);="" transition:="" color="" 0.1s="" linear="" 0s;="" cursor:="" pointer;="" width:="" 30px;="" height:="" display:="" block;"=""></a></li></ul></div><div class="wrapper-main-content" style="outline: 0px;"><article class="_photo-content summary" style="outline: 0px; color: rgb(76, 73, 71); padding-bottom: 30px; font-size: 1.2rem; line-height: 1.5rem; overflow: hidden;"><div class="article-content" style="outline: 0px;"><p style="outline: 0px; padding-top: 0.7rem; font-size: 1.2rem; line-height: 1.8rem; margin-bottom: 0px;">Theo đó, khoảng 2h45 hôm nay (21.10), một số người dân sống gần một tiệm bida thuộc ấp 7, xã Xuân Thới Thượng, huyện Hóc Môn đang ngủ thì thấy một thanh niên tay ôm vết thương trên cổ chạy đến cầu cứu.</p><p style="outline: 0px; padding-top: 0.7rem; font-size: 1.2rem; line-height: 1.8rem; margin-bottom: 0px;">Thấy vậy, nhiều người vội đưa nạn nhân đi cấp cứu. Một số người nhận định người thanh niên này bị ai đó tấn công nên trình báo sự việc với công an địa phương.</p><p style="outline: 0px; padding-top: 0.7rem; font-size: 1.2rem; line-height: 1.8rem; margin-bottom: 0px;">Nhận tin báo, Công an xã Xuân Thới Thượng, huyện Hóc Môn lập tức có mặt để ghi nhận sự việc, khám nghiệm hiện trường, lấy lời khai từ người dân để phục vụ điều tra.</p><p style="outline: 0px; padding-top: 0.7rem; font-size: 1.2rem; line-height: 1.8rem; margin-bottom: 0px;">Do nạn nhân bị cắt đứt thanh quản nên cơ quan điều tra chưa thể lấy lời khai của nạn nhân được. Tuy nhiên, qua những giấy tờ cá nhân, cảnh sát xác định nạn nhân là anh Nguyễn V (SN 1985, quê tỉnh Bình Định, tạm trú Vĩnh Lộc B, huyện Bình Chánh). Anh V là tài xế GrabBike.</p><p style="outline: 0px; padding-top: 0.7rem; font-size: 1.2rem; line-height: 1.8rem;">Cũng do anh V chưa thể nói được nên bước đầu chưa thể xác định được hiện trường thực sự của vụ án. Tuy nhiên, cảnh sát nhận định có thể anh V bị cướp tấn công để lấy tài sản là điện thoại và xe máy.</p></div></article></div></div></div></div>', N'admin', N'admin', CAST(N'2018-10-27' AS Date), CAST(N'2018-11-02' AS Date), N'Tin-Tuc-Phap-Luat-24.jpg')
SET IDENTITY_INSERT [dbo].[News] OFF
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([Id], [Quantity], [OrderID], [ProductID], [Price]) VALUES (34, 1, 4, 1, 100000000)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [OrderID], [ProductID], [Price]) VALUES (35, 1, 4, 2, 100000000)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [OrderID], [ProductID], [Price]) VALUES (36, 1, 5, 1, 100000000)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [OrderID], [ProductID], [Price]) VALUES (37, 1, 5, 2, 100000000)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [OrderID], [ProductID], [Price]) VALUES (38, 1, 6, 1, 100000000)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [OrderID], [ProductID], [Price]) VALUES (39, 1, 6, 2, 100000000)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [OrderID], [ProductID], [Price]) VALUES (40, 1, 8, 1, 100000000)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [OrderID], [ProductID], [Price]) VALUES (41, 1, 8, 2, 100000000)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [OrderID], [ProductID], [Price]) VALUES (42, 1, 9, 1, 100000000)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [OrderID], [ProductID], [Price]) VALUES (43, 1, 10, 1, 100000000)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [OrderID], [ProductID], [Price]) VALUES (1042, 1, 1009, 1, 100000000)
INSERT [dbo].[OrderDetail] ([Id], [Quantity], [OrderID], [ProductID], [Price]) VALUES (1043, 1, 1009, 2, 100000000)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [Total], [OrderDate], [Name], [Phone], [Address], [Note], [UserID], [ShipperID], [PaymentStsID]) VALUES (4, 100025000, CAST(N'2018-10-30' AS Date), N'khoi', N'01206076517', N'136/48 Tráº§n Quang Diá»u, P.14, Q.3, TP.HCM', N'', 2, 1, 1)
INSERT [dbo].[Orders] ([Id], [Total], [OrderDate], [Name], [Phone], [Address], [Note], [UserID], [ShipperID], [PaymentStsID]) VALUES (5, 100025000, CAST(N'2018-10-30' AS Date), N'khoi', N'01206076517', N'136/48 Tráº§n Quang Diá»u, P.14, Q.3, TP.HCM', N'', 2, 1, 1)
INSERT [dbo].[Orders] ([Id], [Total], [OrderDate], [Name], [Phone], [Address], [Note], [UserID], [ShipperID], [PaymentStsID]) VALUES (6, 100025000, CAST(N'2018-10-30' AS Date), N'khoi', N'01206076517', N'136/48 Tráº§n Quang Diá»u, P.14, Q.3, TP.HCM', N'', 2, 1, 1)
INSERT [dbo].[Orders] ([Id], [Total], [OrderDate], [Name], [Phone], [Address], [Note], [UserID], [ShipperID], [PaymentStsID]) VALUES (7, 100025000, CAST(N'2018-10-30' AS Date), N'khoi', N'01206076517', N'136/48 Tráº§n Quang Diá»u, P.14, Q.3, TP.HCM', N'', 2, 1, 1)
INSERT [dbo].[Orders] ([Id], [Total], [OrderDate], [Name], [Phone], [Address], [Note], [UserID], [ShipperID], [PaymentStsID]) VALUES (8, 100025000, CAST(N'2018-10-30' AS Date), N'khoi', N'01206076517', N'136/48 Tráº§n Quang Diá»u, P.14, Q.3, TP.HCM', N'', 2, 1, 1)
INSERT [dbo].[Orders] ([Id], [Total], [OrderDate], [Name], [Phone], [Address], [Note], [UserID], [ShipperID], [PaymentStsID]) VALUES (9, 50025000, CAST(N'2018-10-31' AS Date), N'PhongThai', N'01206076517', N'136/48 Tráº§n Quang Diá»u, P.14, Q.3, TP.HCM', N'', 5, 1, 1)
INSERT [dbo].[Orders] ([Id], [Total], [OrderDate], [Name], [Phone], [Address], [Note], [UserID], [ShipperID], [PaymentStsID]) VALUES (10, 50025000, CAST(N'2018-10-31' AS Date), N'PhongThai', N'01206076517', N'136/48 Tráº§n Quang Diá»u, P.14, Q.3, TP.HCM', N'', 5, 1, 1)
INSERT [dbo].[Orders] ([Id], [Total], [OrderDate], [Name], [Phone], [Address], [Note], [UserID], [ShipperID], [PaymentStsID]) VALUES (1009, 100025000, CAST(N'2018-11-02' AS Date), N'Võ Thạch Khôi', N'01206076517', N'136/48 Trần Quang Diệu, P.14, Q.3, TP.HCM', N'', 2, 1, 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[PaymentStatus] ON 

INSERT [dbo].[PaymentStatus] ([Id], [Status]) VALUES (1, N'Processing')
INSERT [dbo].[PaymentStatus] ([Id], [Status]) VALUES (2, N'Shipper')
INSERT [dbo].[PaymentStatus] ([Id], [Status]) VALUES (3, N'Delivered')
SET IDENTITY_INSERT [dbo].[PaymentStatus] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Detail], [Price], [Discount], [Brand], [Img1], [Img2], [CatalogID]) VALUES (1, N'Dong ho', N'123', 100000000, 50000000, N'EVOS', N'A2-min.jpg', N'A14-min.jpg', 1)
INSERT [dbo].[Product] ([Id], [Name], [Detail], [Price], [Discount], [Brand], [Img1], [Img2], [CatalogID]) VALUES (2, N'Dong ho 2', N'<p>1</p><p>2</p><p>3</p><p>4</p><p>5</p>', 100000000, 50000000, N'EVOS', N'A1-min.jpg', N'A1-min.jpg', 1)
INSERT [dbo].[Product] ([Id], [Name], [Detail], [Price], [Discount], [Brand], [Img1], [Img2], [CatalogID]) VALUES (3, N'Dong ho 3', N'2', 100000000, 50000000, N'EVOS', N'A2-min.jpg', N'A3-min.jpg', 1)
INSERT [dbo].[Product] ([Id], [Name], [Detail], [Price], [Discount], [Brand], [Img1], [Img2], [CatalogID]) VALUES (4, N'cac', N'cac', 123, 123, N'cac', N'', N'', 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Role]) VALUES (1, N'admin')
INSERT [dbo].[Role] ([Id], [Role]) VALUES (2, N'nhanvien')
INSERT [dbo].[Role] ([Id], [Role]) VALUES (3, N'khachhang')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Shipper] ON 

INSERT [dbo].[Shipper] ([Id], [Name], [Phone]) VALUES (1, N'Văn Kính', N'0705060780')
SET IDENTITY_INSERT [dbo].[Shipper] OFF
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([Id], [Name], [Address], [Phone], [Email], [Company]) VALUES (2, N'Đỗ Văn Phượng', N'1369643', N'134697', N'phuong@gmail.com', N'TNHH Phuong Company')
INSERT [dbo].[Supplier] ([Id], [Name], [Address], [Phone], [Email], [Company]) VALUES (3, N'Vi Quang Hữu', N'123456', N'123456', N'huu@gmail.com', N'TNHH Hữu')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [Password], [Name], [Email], [RoleID], [ImageUser], [Phone], [Address], [CreatedDate]) VALUES (1, N'admin', N'admin', N'admin', N'tanks.museum98@gmail.com', 1, N'xuananh.jpg', N'01206076517', N'136/48 TrÃÂ¡ÃÂºÃÂ§n Quang DiÃÂ¡ÃÂ»ÃÂu', N'2018-10-01')
INSERT [dbo].[Users] ([Id], [Username], [Password], [Name], [Email], [RoleID], [ImageUser], [Phone], [Address], [CreatedDate]) VALUES (2, N'khoi', N'123', N'Võ Thạch Khôi', N'khoivtps05357@fpt.edu.vn', 3, N'anhchandung.jpg', N'01206076517', N'136/48 Trần Quang Diệu, P.14, Q.3, TP.HCM', N'2018-10-01')
INSERT [dbo].[Users] ([Id], [Username], [Password], [Name], [Email], [RoleID], [ImageUser], [Phone], [Address], [CreatedDate]) VALUES (3, N'maidiep8', N'jason8lin!', N'Xuan Anh', N'tanks.museum98@gmail.com', 1, N'23905764_932612266904088_545687447536528264_n.jpg', N'01206076517', N'Chua biet', N'2018-10-01')
INSERT [dbo].[Users] ([Id], [Username], [Password], [Name], [Email], [RoleID], [ImageUser], [Phone], [Address], [CreatedDate]) VALUES (4, N'maidiep9', N'jason8lin!', N'Nguyen Hong Nhung', N'maidiep9@hotmail.com', 3, N'23905764_932612266904088_545687447536528264_n.jpg', N'01206076517', N'136/48 Tráº§n Quang Diá»u', NULL)
INSERT [dbo].[Users] ([Id], [Username], [Password], [Name], [Email], [RoleID], [ImageUser], [Phone], [Address], [CreatedDate]) VALUES (5, N'phongcute', N'1234', N'PhongThai', N'phongptps05454@fpt.edu.vn', 3, N'', N'01206076517', N'136/48 Tráº§n Quang Diá»u, P.14, Q.3, TP.HCM', N'2018-10-31')
INSERT [dbo].[Users] ([Id], [Username], [Password], [Name], [Email], [RoleID], [ImageUser], [Phone], [Address], [CreatedDate]) VALUES (1008, N'cac', N'cac', N'cac', N'cac@gmail.com', 2, N'23905764_932612266904088_545687447536528264_n.jpg', N'cac', N'cac', N'2018-10-31')
INSERT [dbo].[Users] ([Id], [Username], [Password], [Name], [Email], [RoleID], [ImageUser], [Phone], [Address], [CreatedDate]) VALUES (1009, N'cac1', N'cac', N'cac1', N'cac1@gmail.com', 2, N'23905764_932612266904088_545687447536528264_n.jpg', N'cac', N'cac', N'2018-10-31')
INSERT [dbo].[Users] ([Id], [Username], [Password], [Name], [Email], [RoleID], [ImageUser], [Phone], [Address], [CreatedDate]) VALUES (1010, N'cac3', N'cac3', N'cac3', N'cac3@gmail.com', 2, N'23905764_932612266904088_545687447536528264_n.jpg', N'cac4', N'cac3', N'2018-10-31')
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[Wishlist] ON 

INSERT [dbo].[Wishlist] ([Id], [UserId], [ProductId]) VALUES (382, 5, 1)
SET IDENTITY_INSERT [dbo].[Wishlist] OFF
ALTER TABLE [dbo].[Catalog]  WITH CHECK ADD  CONSTRAINT [FK_Catalog_NavMenu] FOREIGN KEY([NavID])
REFERENCES [dbo].[NavMenu] ([Id])
GO
ALTER TABLE [dbo].[Catalog] CHECK CONSTRAINT [FK_Catalog_NavMenu]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([Id])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Supplier]
GO
ALTER TABLE [dbo].[InvoiceDetail]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceDetail_Invoice] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[Invoice] ([Id])
GO
ALTER TABLE [dbo].[InvoiceDetail] CHECK CONSTRAINT [FK_InvoiceDetail_Invoice]
GO
ALTER TABLE [dbo].[InvoiceDetail]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[InvoiceDetail] CHECK CONSTRAINT [FK_InvoiceDetail_Product]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Orders]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_PaymentStatus] FOREIGN KEY([PaymentStsID])
REFERENCES [dbo].[PaymentStatus] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_PaymentStatus]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Shipper] FOREIGN KEY([ShipperID])
REFERENCES [dbo].[Shipper] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Shipper]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Catalog] FOREIGN KEY([CatalogID])
REFERENCES [dbo].[Catalog] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Catalog]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Role]
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD  CONSTRAINT [FK_Wishlist_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Wishlist] CHECK CONSTRAINT [FK_Wishlist_Product]
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD  CONSTRAINT [FK_Wishlist_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Wishlist] CHECK CONSTRAINT [FK_Wishlist_Users]
GO
USE [master]
GO
ALTER DATABASE [project5] SET  READ_WRITE 
GO
