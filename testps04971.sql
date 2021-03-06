/****** Object:  Table [dbo].[bacsi]    Script Date: 8/29/2017 8:13:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bacsi](
	[mabs] [int] NOT NULL,
	[hoten] [nvarchar](50) NOT NULL,
	[diachi] [nvarchar](50) NOT NULL,
 CONSTRAINT [bacsi_pk] PRIMARY KEY CLUSTERED 
(
	[mabs] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[benhnhan]    Script Date: 8/29/2017 8:13:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[benhnhan](
	[mabenhnhan] [int] NOT NULL,
	[hoten] [nvarchar](50) NOT NULL,
	[phai] [nvarchar](5) NOT NULL,
	[diachi] [nvarchar](50) NOT NULL,
 CONSTRAINT [benhnhan_pk] PRIMARY KEY CLUSTERED 
(
	[mabenhnhan] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[phieukham]    Script Date: 8/29/2017 8:13:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phieukham](
	[maphieu] [int] NOT NULL,
	[mabenhnhan] [int] NOT NULL,
	[bacsidieutri] [int] NOT NULL,
	[chuandoan] [nvarchar](50) NOT NULL,
	[chiphi] [money] NOT NULL,
 CONSTRAINT [phieukham_pk] PRIMARY KEY CLUSTERED 
(
	[maphieu] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
INSERT [dbo].[bacsi] ([mabs], [hoten], [diachi]) VALUES (1, N'Lê Anh Tú', N'Poly')
INSERT [dbo].[bacsi] ([mabs], [hoten], [diachi]) VALUES (2, N'Đỗ Chí Thuận', N'Poly')
INSERT [dbo].[benhnhan] ([mabenhnhan], [hoten], [phai], [diachi]) VALUES (1, N'Đỗ Chí Thuận', N'Nam', N'Poly')
INSERT [dbo].[benhnhan] ([mabenhnhan], [hoten], [phai], [diachi]) VALUES (2, N'Đỗ Thành Nam', N'Nữ', N'Poly')
INSERT [dbo].[phieukham] ([maphieu], [mabenhnhan], [bacsidieutri], [chuandoan], [chiphi]) VALUES (1, 1, 1, N'Ung Thu', 10000.0000)
INSERT [dbo].[phieukham] ([maphieu], [mabenhnhan], [bacsidieutri], [chuandoan], [chiphi]) VALUES (2, 2, 2, N'Ung Buu', 20000.0000)
ALTER TABLE [dbo].[phieukham]  WITH CHECK ADD  CONSTRAINT [phieukham_bacsi] FOREIGN KEY([bacsidieutri])
REFERENCES [dbo].[bacsi] ([mabs])
GO
ALTER TABLE [dbo].[phieukham] CHECK CONSTRAINT [phieukham_bacsi]
GO
ALTER TABLE [dbo].[phieukham]  WITH CHECK ADD  CONSTRAINT [phieukham_benhnhan] FOREIGN KEY([mabenhnhan])
REFERENCES [dbo].[benhnhan] ([mabenhnhan])
GO
ALTER TABLE [dbo].[phieukham] CHECK CONSTRAINT [phieukham_benhnhan]
GO
