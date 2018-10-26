USE [master]
GO
/****** Object:  Database [project4]    Script Date: 10/26/2018 12:05:30 PM ******/
CREATE DATABASE [project4]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'project4', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\project4.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'project4_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\project4_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [project4] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [project4].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [project4] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [project4] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [project4] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [project4] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [project4] SET ARITHABORT OFF 
GO
ALTER DATABASE [project4] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [project4] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [project4] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [project4] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [project4] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [project4] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [project4] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [project4] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [project4] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [project4] SET  DISABLE_BROKER 
GO
ALTER DATABASE [project4] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [project4] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [project4] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [project4] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [project4] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [project4] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [project4] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [project4] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [project4] SET  MULTI_USER 
GO
ALTER DATABASE [project4] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [project4] SET DB_CHAINING OFF 
GO
ALTER DATABASE [project4] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [project4] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [project4] SET DELAYED_DURABILITY = DISABLED 
GO
USE [project4]
GO
/****** Object:  Table [dbo].[Catalog]    Script Date: 10/26/2018 12:05:30 PM ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 10/26/2018 12:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Birthday] [smalldatetime] NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Register] [bit] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HistoryOfInputProduct]    Script Date: 10/26/2018 12:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryOfInputProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
	[SupplierID] [int] NULL,
	[Date] [smalldatetime] NULL,
 CONSTRAINT [PK_HistoryOfInputProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NavMenu]    Script Date: 10/26/2018 12:05:30 PM ******/
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
/****** Object:  Table [dbo].[News]    Script Date: 10/26/2018 12:05:30 PM ******/
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
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 10/26/2018 12:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NULL,
	[Size] [varchar](30) NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10/26/2018 12:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Total] [int] NULL,
	[OrderDate] [smalldatetime] NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [varchar](15) NULL,
	[Address] [nvarchar](70) NULL,
	[Note] [ntext] NULL,
	[CustomerID] [int] NULL,
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
/****** Object:  Table [dbo].[PaymentStatus]    Script Date: 10/26/2018 12:05:30 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 10/26/2018 12:05:30 PM ******/
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
	[Quantity] [int] NULL,
	[Brand] [nvarchar](50) NULL,
	[Img1] [nvarchar](max) NULL,
	[Img2] [nvarchar](max) NULL,
	[CatalogID] [int] NULL,
	[SupplierID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 10/26/2018 12:05:30 PM ******/
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
/****** Object:  Table [dbo].[Shipper]    Script Date: 10/26/2018 12:05:30 PM ******/
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
	[Company] [nvarchar](50) NULL,
 CONSTRAINT [PK_Shipper] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 10/26/2018 12:05:30 PM ******/
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
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/26/2018 12:05:30 PM ******/
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
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Wishlist]    Script Date: 10/26/2018 12:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wishlist](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[ProductId] [int] NULL
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
SET IDENTITY_INSERT [dbo].[NavMenu] ON 

INSERT [dbo].[NavMenu] ([Id], [Name]) VALUES (1, N'Thương hiệu')
INSERT [dbo].[NavMenu] ([Id], [Name]) VALUES (2, N'Linh kiện')
INSERT [dbo].[NavMenu] ([Id], [Name]) VALUES (3, N'Giới tính')
SET IDENTITY_INSERT [dbo].[NavMenu] OFF
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([Id], [Title], [Content], [CreatedBy], [EditedBy], [CreatedDate], [EditedDate], [ImageTitle]) VALUES (2, N'BÁO LAO ĐỘNG
BẢO VỆ QUYỀN & LỢI ÍCH HỢP PHÁP
CHÍNH ĐÁNG CỦA NGƯỜI LAO ĐỘNG
HOME
MEDIA
THỜI SỰ
CÔNG ĐOÀN
THẾ GIỚI
XÃ HỘI
KINH DOANH
PHÁP LUẬT
VĂN HÓA - GIẢI TRÍ
THỂ THAO
PHÓNG SỰ
DU LỊCH
XE +
SỨC KHỎE
BẠN ĐỌC
PHÁP LUẬT
Tin tức pháp luật 24h: Truy tìm dấu vết hung thủ cắt đứt cuống họng tài xế GrabBike để cướp tài sản', N'<p><strong>Tài xế GrabBike bị cướp cắt đứt cuống họng lúc nửa đêm</strong></p><p>Gần 3h sáng, người dân ở Hóc Môn hoảng hồn khi thấy một thanh niên chạy đến một tiệm bida kêu cứu với vết thương nghiêm trọng trên cổ nên hỗ trợ đưa đi cấp trình báo cơ quan công an. Bước đầu ghi nhận nạn nhân là tài xế GrabBike bị cướp tấn công vào lúc rạng sáng.</p><p>Thấy vậy, nhiều người vội đưa nạn nhân đi cấp cứu. Một số người nhận định người thanh niên này bị ai đó tấn công nên trình báo sự việc với công an địa phương. <strong><a href="https://laodong.vn/phap-luat/tai-xe-grabbike-bi-cuop-cat-dut-cuong-hong-luc-nua-dem-637248.ldo">Xem chi tiết tại đây.</a></strong></p><p><strong>Sở Y tế Đắk Lắk nói gì về vụ cha bồng con chạy khắp bệnh viện tìm bác sĩ cầu cứu?</strong></p><p>Sáng 21.10, lãnh đạo Sở Y tế tỉnh Đắk Lắk<span>&nbsp;xác nhận, đơn vị vừa nắm thông tin sơ bộ liên quan đến việc một bệnh nhi tới Bệnh viện Đa khoa huyện Krông Bông để cấp cứu nhưng chờ nhân viên y tế thăm khám.</span></p>', N'admin', NULL, CAST(N'2018-10-23' AS Date), NULL, N'Tin-Tuc-Phap-Luat-24.jpg')
INSERT [dbo].[News] ([Id], [Title], [Content], [CreatedBy], [EditedBy], [CreatedDate], [EditedDate], [ImageTitle]) VALUES (3, N'Đâm người tình vì chê thù lao 10 triệu sau 7 năm làm công', N'<p class="abs"><strong>Không đồng ý vì người tình chỉ trả có 10 triệu đồng sau thời gian làm công, Bình ấm ức trong người rồi dùng dao sát hại nạn nhân sau đó.</strong></p><p>Ngày 21.10, tin từ VKSND tỉnh Đắk Lắk cho biết, đơn vị vừa ban hành cáo trạng truy tố bị can Đặng Bình (SN 1962, ngụ xã Ea Khal, huyện Ea H’leo, tỉnh Đắk Lắk) về tội "Giết người".</p><p>Theo cáo trạng, từ năm 2011, Bình và bà Bùi Thị H. (SN 1967) chung sống như vợ chồng tại xã Ea Khal. </p>', N'admin', NULL, CAST(N'2018-10-23' AS Date), NULL, N'44399607_24433877890.jpg')
SET IDENTITY_INSERT [dbo].[News] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Detail], [Price], [Discount], [Quantity], [Brand], [Img1], [Img2], [CatalogID], [SupplierID]) VALUES (8, N'Dong ho', N'1', 100000000, 50000000, 1, N'EVOS', N'A1-min.jpg', N'A11-min.jpg', 1, 1)
INSERT [dbo].[Product] ([Id], [Name], [Detail], [Price], [Discount], [Quantity], [Brand], [Img1], [Img2], [CatalogID], [SupplierID]) VALUES (9, N'Linhkien', N'1', 89879879, 0, 2, N'EVOS', N'A12-min.jpg', N'A14-min.jpg', 1, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Role]) VALUES (1, N'admin')
INSERT [dbo].[Role] ([Id], [Role]) VALUES (2, N'nhanvien')
INSERT [dbo].[Role] ([Id], [Role]) VALUES (3, N'khachhang')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([Id], [Name], [Address], [Phone], [Email]) VALUES (1, N'TNHH', N'cac', N'cac', N'cac')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [Password], [Name], [Email], [RoleID], [ImageUser], [Phone], [Address]) VALUES (3, N'admin', N'admin', N'admin', N'tanks.museum98@gmail.com', 1, N'xuananh.jpg', N'01206076517', N'abc')
INSERT [dbo].[Users] ([Id], [Username], [Password], [Name], [Email], [RoleID], [ImageUser], [Phone], [Address]) VALUES (4, N'khoi', N'123', N'khoi', N'khoi@gmail.com', 1, N'anhchandung.jpg', N'01206076517', N'136/48 Tráº§n Quang Diá»u, P.14, Q.3, TP.HCM')
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[Wishlist] ON 

INSERT [dbo].[Wishlist] ([Id], [UserId], [ProductId]) VALUES (3, 3, 9)
INSERT [dbo].[Wishlist] ([Id], [UserId], [ProductId]) VALUES (4, 3, 8)
SET IDENTITY_INSERT [dbo].[Wishlist] OFF
ALTER TABLE [dbo].[Catalog]  WITH CHECK ADD  CONSTRAINT [FK_Catalog_NavMenu] FOREIGN KEY([NavID])
REFERENCES [dbo].[NavMenu] ([Id])
GO
ALTER TABLE [dbo].[Catalog] CHECK CONSTRAINT [FK_Catalog_NavMenu]
GO
ALTER TABLE [dbo].[HistoryOfInputProduct]  WITH CHECK ADD  CONSTRAINT [FK_HistoryOfInputProduct_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([Id])
GO
ALTER TABLE [dbo].[HistoryOfInputProduct] CHECK CONSTRAINT [FK_HistoryOfInputProduct_Supplier]
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
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customer]
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
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Catalog] FOREIGN KEY([CatalogID])
REFERENCES [dbo].[Catalog] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Catalog]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Supplier]
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
ALTER DATABASE [project4] SET  READ_WRITE 
GO
