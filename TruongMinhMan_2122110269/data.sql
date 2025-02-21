USE [WebsiteBanHang]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 17/1/2025 6:22:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Avatar] [nvarchar](100) NULL,
	[Slug] [varchar](100) NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
	[Deleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 17/1/2025 6:22:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Avatar] [nchar](100) NULL,
	[Slug] [varchar](100) NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[Deleted] [bit] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 17/1/2025 6:22:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[UserId] [int] NULL,
	[Status] [int] NULL,
	[CreateOnUtc] [datetime] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 17/1/2025 6:22:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 17/1/2025 6:22:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Avatar] [nchar](100) NULL,
	[CategoryId] [int] NULL,
	[ShortDes] [nvarchar](100) NULL,
	[FullDescription] [nvarchar](500) NULL,
	[Price] [float] NULL,
	[PriceDiscount] [int] NULL,
	[TypeId] [int] NULL,
	[Slug] [varchar](50) NULL,
	[BrandId] [int] NULL,
	[Deleted] [bit] NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 17/1/2025 6:22:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[IsAdmin] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (1, N'Apple', N'apple.jpg', N'apple', 1, 1, NULL, NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (2, N'Samsung', N'samsung.jpg', N'samsung', 1, 2, NULL, NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (3, N'Xiaomi', N'xiaomi.jpg', N'xiaomi', 1, 3, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (1, N'Điện Thoại', N'Phone.jpg                                                                                           ', N'dien-thoai', 1, 1, 0, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (2, N'Máy Tính', N'Laptop.jpg                                                                                          ', N'may-tinh', 1, 2, 0, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (3, N'Máy Tính Bảng', N'Ipad.jpg                                                                                            ', N'may-tinh-bang', 0, 3, 0, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (4, N'Phụ Kiện', N'Phukien.jpg                                                                                         ', N'phu-kien', 0, 4, 0, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (5, N'Đồng hồ thông minh', N'donghothongminh.jpg                                                                                 ', N'dong-ho-thong-minh', 1, 5, 0, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (6, N'Đồng hồ thời trang', N'donghothoitrang.jpg                                                                                 ', N'dong-ho-thoi-trang', 0, 6, 0, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (7, N'Trương Minh Mẫn', N'0ab9268e-9d32-475d-98fc-64cbaa56105b.jpg_20250113095924.jpg                                         ', N'minhman', NULL, 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreateOnUtc]) VALUES (2, N'DonHang20250117181757', 3, 1, CAST(N'2025-01-17T18:17:57.020' AS DateTime))
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (2, 2, 6, 4)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (1, N'iPhone 15', N'iphone15.jpg_20250107094618.jpg                                                                     ', 1, N'Điện thoại Apple cao cấp', N'Điện thoại thông minh với chip A17 và camera sắc nét.', 23999760, 10, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (2, N'MacBook Pro', N'macbookpro.jpg                                                                                      ', 2, N'Laptop Apple hiệu năng cao', N'Laptop với chip M3 và màn hình Retina.', 47999760, 15, 2, N'macbook-pro', 1, 0, 1, 2, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (3, N'iPad Pro 12.9', N'ipadpro129.jpg                                                                                      ', 3, N'Máy tính bảng Apple lớn nhất', N'iPad Pro với chip M2 và màn hình Liquid Retina XDR.', 31199760, 10, 2, N'ipad-pro-129', 1, 0, 1, 3, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (4, N'Apple Watch Series 9', N'applewatch9.jpg                                                                                     ', 5, N'Đồng hồ thông minh Apple', N'Đồng hồ với nhiều tính năng sức khỏe và GPS.', 9599760, 5, 3, N'apple-watch-9', 1, 0, 1, 4, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (5, N'Galaxy S23', N'galaxys23.jpg                                                                                       ', 1, N'Điện thoại Samsung flagship', N'Điện thoại với màn hình AMOLED và camera 108MP.', 21599760, 5, 1, N'galaxy-s23', 2, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (6, N'Galaxy Z Fold 5', N'galaxyzfold5.jpg                                                                                    ', 1, N'Điện thoại gập Samsung', N'Điện thoại với thiết kế gập và màn hình lớn.', 43199760, 10, 1, N'galaxy-z-fold-5', 2, 0, 1, 2, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (7, N'Galaxy Tab S9', N'galaxytabs9.jpg                                                                                     ', 3, N'Máy tính bảng Samsung cao cấp', N'Máy tính bảng với màn hình AMOLED và bút S Pen.', 19199760, 10, 2, N'galaxy-tab-s9', 2, 0, 1, 3, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (8, N'Galaxy Watch 6', N'galaxywatch6.jpg                                                                                    ', 5, N'Đồng hồ thông minh Samsung', N'Đồng hồ với màn hình Super AMOLED và tính năng theo dõi sức khỏe.', 8399760, 15, 3, N'galaxy-watch-6', 2, 0, 1, 4, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (9, N'Redmi Note 13', N'redminote13.jpg                                                                                     ', 1, N'Điện thoại Xiaomi giá rẻ', N'Điện thoại thông minh với pin 5000mAh và camera 50MP.', 7199760, 5, 1, N'redmi-note-13', 3, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (10, N'Mi 13 Ultra', N'mi13ultra.jpg                                                                                       ', 1, N'Điện thoại Xiaomi flagship', N'Điện thoại với camera Leica và màn hình AMOLED.', 31199760, 15, 1, N'mi-13-ultra', 3, 0, 1, 2, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (11, N'Mi Pad 6', N'mipad6.jpg                                                                                          ', 3, N'Máy tính bảng Xiaomi mạnh mẽ', N'Máy tính bảng với chip Snapdragon 870 và màn hình 120Hz.', 11999760, 10, 2, N'mi-pad-6', 3, 0, 1, 3, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (12, N'Xiaomi Watch S2', N'xiaomiwatchs2.jpg                                                                                   ', 5, N'Đồng hồ thông minh Xiaomi', N'Đồng hồ với màn hình AMOLED và theo dõi sức khỏe 24/7.', 4799760, 20, 3, N'xiaomi-watch-s2', 3, 0, 1, 4, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (13, N'AirPods Pro', N'airpodspro.jpg                                                                                      ', 4, N'Tai nghe không dây Apple', N'Tai nghe chống ồn chủ động với âm thanh chất lượng cao.', 5999760, 20, 3, N'airpods-pro', 1, 0, 1, 5, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (14, N'Galaxy Buds 2', N'galaxybuds2.jpg                                                                                     ', 4, N'Tai nghe không dây Samsung', N'Tai nghe nhỏ gọn với âm thanh chuẩn studio.', 3599760, 15, 3, N'galaxy-buds-2', 2, 0, 1, 5, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (15, N'Xiaomi Buds 4', N'xiaomibuds4.jpg                                                                                     ', 4, N'Tai nghe không dây Xiaomi', N'Tai nghe với thiết kế nhỏ gọn và âm thanh chất lượng.', 2399760, 10, 3, N'xiaomi-buds-4', 3, 0, 1, 5, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (16, N'Apple Watch Hermès', N'applewatchhermes.jpg                                                                                ', 6, N'Đồng hồ thời trang cao cấp', N'Phiên bản đặc biệt của Apple Watch kết hợp Hermès.', 31199760, 5, 3, N'apple-watch-hermes', 1, 0, 1, 6, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (17, N'Samsung Watch Elite1', N'samsungwatchelite.jpg                                                                               ', 6, N'Đồng hồ thời trang Samsung', N'Đồng hồ thông minh với thiết kế sang trọng.', 14399760, 10, 1, N'samsung-watch-elite', 2, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (1, N'Truong', N'M?n', N'truongminhman1112004@gmail.com', N'FC1D234E0F570B749ED96861D081A620', 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (2, N'Tr?n', N'B?o', N'bao@gmail.com', N'b4e1c6620073acda217d807627a78dae', 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (3, N'Tr?n', N'M?n', N'man@gmail.com', N'39c63ddb96a31b9610cd976b896ad4f0', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Users]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brand] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Brand]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
