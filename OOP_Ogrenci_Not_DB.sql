USE [DbTestKatman]
GO
/****** Object:  StoredProcedure [dbo].[KulupEkle]    Script Date: 18.06.2021 15:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[KulupEkle]
@KulupAd varchar(20)
as
Insert Into TblKulup (KulupAd) values (@KulupAd)
GO
/****** Object:  StoredProcedure [dbo].[KulupGuncelle]    Script Date: 18.06.2021 15:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[KulupGuncelle]
@KulupAd varchar(20),
@KulupID tinyint
as
Update TblKulup set KulupAd=@KulupAd where KulupID=@KulupID
GO
/****** Object:  StoredProcedure [dbo].[KulupListele]    Script Date: 18.06.2021 15:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[KulupListele]
as
Select * from TblKulup
GO
/****** Object:  StoredProcedure [dbo].[KulupSil]    Script Date: 18.06.2021 15:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[KulupSil]
@KulupID tinyint
as
Delete From TblKulup Where KulupID=@KulupID
GO
/****** Object:  StoredProcedure [dbo].[NotGuncelle]    Script Date: 18.06.2021 15:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[NotGuncelle]
@OgrID smallint,
@Sinav1 tinyint,
@Sinav2 tinyint,
@Sinav3 Tinyint,
@Proje Tinyint,
@Ortalama Decimal(18,2),
@Durum Bit
AS
Update TblNotlar Set Sinav1=@Sinav1,
Sinav2=@Sinav2,
Sinav3=@Sinav3,
Proje=@Proje,
Ortalama=@Ortalama,
Durum=@Durum
where OgrID=@OgrID
GO
/****** Object:  StoredProcedure [dbo].[NotListesi]    Script Date: 18.06.2021 15:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[NotListesi]
as
Select OgrID,Ad,Soyad,Sinav1,Sinav2,Sinav3,Proje,Ortalama,Durum
from TblNotlar inner join TblOgrenci on TblNotlar.OgrID=TblOgrenci.ID
GO
/****** Object:  StoredProcedure [dbo].[OgrenciEkle]    Script Date: 18.06.2021 15:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[OgrenciEkle]
@Ad varchar(20),
@Soyad varchar(30),
@Fotograf varchar(50),
@KulupID smallint
as
Insert Into TblOgrenci (Ad,Soyad,Fotograf,KulupID)
values
(@Ad,@Soyad,@Fotograf,@KulupID)
GO
/****** Object:  StoredProcedure [dbo].[OgrenciGuncelle]    Script Date: 18.06.2021 15:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[OgrenciGuncelle]
@Ad varchar(20),
@Soyad varchar(30),
@Fotograf varchar(50),
@KulupID smallint,
@ID smallint
as
Update TblOgrenci set Ad=@Ad,Soyad=@Soyad,Fotograf=@Fotograf,KulupID=@KulupID 
where ID=@ID
GO
/****** Object:  StoredProcedure [dbo].[OgrenciListesi]    Script Date: 18.06.2021 15:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[OgrenciListesi]
as
Select * from TblOgrenci
GO
/****** Object:  StoredProcedure [dbo].[OgrenciSil]    Script Date: 18.06.2021 15:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[OgrenciSil]
@ID smallint
as
Delete From TblOgrenci Where ID=@ID
GO
/****** Object:  Table [dbo].[TblKulup]    Script Date: 18.06.2021 15:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TblKulup](
	[KulupID] [tinyint] IDENTITY(1,1) NOT NULL,
	[KulupAd] [varchar](20) NULL,
 CONSTRAINT [PK_TblKulup] PRIMARY KEY CLUSTERED 
(
	[KulupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TblNotlar]    Script Date: 18.06.2021 15:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblNotlar](
	[OgrID] [smallint] NOT NULL,
	[Sinav1] [tinyint] NULL,
	[Sinav2] [tinyint] NULL,
	[Sinav3] [tinyint] NULL,
	[Proje] [tinyint] NULL,
	[Ortalama] [decimal](18, 2) NULL,
	[Durum] [bit] NULL,
 CONSTRAINT [PK_TblNotlar] PRIMARY KEY CLUSTERED 
(
	[OgrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TblOgrenci]    Script Date: 18.06.2021 15:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TblOgrenci](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Ad] [varchar](20) NULL,
	[Soyad] [varchar](30) NULL,
	[Fotograf] [varchar](50) NULL,
	[KulupID] [tinyint] NULL,
 CONSTRAINT [PK_TblOgrenci] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TblKulup] ON 

INSERT [dbo].[TblKulup] ([KulupID], [KulupAd]) VALUES (1, N'Kütüphane')
INSERT [dbo].[TblKulup] ([KulupID], [KulupAd]) VALUES (2, N'Trafik')
INSERT [dbo].[TblKulup] ([KulupID], [KulupAd]) VALUES (3, N'Sağlık')
INSERT [dbo].[TblKulup] ([KulupID], [KulupAd]) VALUES (4, N'Çevre')
INSERT [dbo].[TblKulup] ([KulupID], [KulupAd]) VALUES (5, N'Bilişim')
INSERT [dbo].[TblKulup] ([KulupID], [KulupAd]) VALUES (6, N'Çevre İlk Yardım')
SET IDENTITY_INSERT [dbo].[TblKulup] OFF
INSERT [dbo].[TblNotlar] ([OgrID], [Sinav1], [Sinav2], [Sinav3], [Proje], [Ortalama], [Durum]) VALUES (1, 50, 65, 70, 85, CAST(67.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[TblNotlar] ([OgrID], [Sinav1], [Sinav2], [Sinav3], [Proje], [Ortalama], [Durum]) VALUES (2, 45, 65, 50, 56, CAST(54.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[TblNotlar] ([OgrID], [Sinav1], [Sinav2], [Sinav3], [Proje], [Ortalama], [Durum]) VALUES (3, 74, 85, 85, 0, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[TblNotlar] ([OgrID], [Sinav1], [Sinav2], [Sinav3], [Proje], [Ortalama], [Durum]) VALUES (4, 44, 66, 65, 0, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[TblNotlar] ([OgrID], [Sinav1], [Sinav2], [Sinav3], [Proje], [Ortalama], [Durum]) VALUES (5, 45, 33, 0, 0, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[TblNotlar] ([OgrID], [Sinav1], [Sinav2], [Sinav3], [Proje], [Ortalama], [Durum]) VALUES (6, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[TblNotlar] ([OgrID], [Sinav1], [Sinav2], [Sinav3], [Proje], [Ortalama], [Durum]) VALUES (7, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[TblNotlar] ([OgrID], [Sinav1], [Sinav2], [Sinav3], [Proje], [Ortalama], [Durum]) VALUES (8, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[TblNotlar] ([OgrID], [Sinav1], [Sinav2], [Sinav3], [Proje], [Ortalama], [Durum]) VALUES (10, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[TblNotlar] ([OgrID], [Sinav1], [Sinav2], [Sinav3], [Proje], [Ortalama], [Durum]) VALUES (11, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[TblNotlar] ([OgrID], [Sinav1], [Sinav2], [Sinav3], [Proje], [Ortalama], [Durum]) VALUES (13, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[TblNotlar] ([OgrID], [Sinav1], [Sinav2], [Sinav3], [Proje], [Ortalama], [Durum]) VALUES (14, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[TblNotlar] ([OgrID], [Sinav1], [Sinav2], [Sinav3], [Proje], [Ortalama], [Durum]) VALUES (15, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[TblNotlar] ([OgrID], [Sinav1], [Sinav2], [Sinav3], [Proje], [Ortalama], [Durum]) VALUES (16, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[TblNotlar] ([OgrID], [Sinav1], [Sinav2], [Sinav3], [Proje], [Ortalama], [Durum]) VALUES (17, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[TblNotlar] ([OgrID], [Sinav1], [Sinav2], [Sinav3], [Proje], [Ortalama], [Durum]) VALUES (18, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[TblNotlar] ([OgrID], [Sinav1], [Sinav2], [Sinav3], [Proje], [Ortalama], [Durum]) VALUES (19, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[TblNotlar] ([OgrID], [Sinav1], [Sinav2], [Sinav3], [Proje], [Ortalama], [Durum]) VALUES (20, 0, 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), 0)
SET IDENTITY_INSERT [dbo].[TblOgrenci] ON 

INSERT [dbo].[TblOgrenci] ([ID], [Ad], [Soyad], [Fotograf], [KulupID]) VALUES (1, N'Ali', N'Çınar', N'Test', 1)
INSERT [dbo].[TblOgrenci] ([ID], [Ad], [Soyad], [Fotograf], [KulupID]) VALUES (2, N'Mehmet', N'Aslan', N'Test', 1)
INSERT [dbo].[TblOgrenci] ([ID], [Ad], [Soyad], [Fotograf], [KulupID]) VALUES (3, N'Eda', N'Öztürk', N'Test', 2)
INSERT [dbo].[TblOgrenci] ([ID], [Ad], [Soyad], [Fotograf], [KulupID]) VALUES (4, N'Ayşe', N'Yıldız', N'Test', 3)
INSERT [dbo].[TblOgrenci] ([ID], [Ad], [Soyad], [Fotograf], [KulupID]) VALUES (5, N'Veysel', N'Çınar', N'Test', 2)
INSERT [dbo].[TblOgrenci] ([ID], [Ad], [Soyad], [Fotograf], [KulupID]) VALUES (6, N'Baran', N'Yücedağ', N'Test', 4)
INSERT [dbo].[TblOgrenci] ([ID], [Ad], [Soyad], [Fotograf], [KulupID]) VALUES (7, N'Eylül', N'Yücedağ', N'Test', 5)
INSERT [dbo].[TblOgrenci] ([ID], [Ad], [Soyad], [Fotograf], [KulupID]) VALUES (8, N'Tuna', N'Yılmaz', N'Test', 2)
INSERT [dbo].[TblOgrenci] ([ID], [Ad], [Soyad], [Fotograf], [KulupID]) VALUES (10, N'Cemal', N'Meşe', N'Test', 4)
INSERT [dbo].[TblOgrenci] ([ID], [Ad], [Soyad], [Fotograf], [KulupID]) VALUES (11, N'Halit', N'Acet', N'Test', 2)
INSERT [dbo].[TblOgrenci] ([ID], [Ad], [Soyad], [Fotograf], [KulupID]) VALUES (13, N'asd', N'asd', N'asd', 3)
INSERT [dbo].[TblOgrenci] ([ID], [Ad], [Soyad], [Fotograf], [KulupID]) VALUES (14, N'abuzer', N'kadayıf', N'asd', 1)
INSERT [dbo].[TblOgrenci] ([ID], [Ad], [Soyad], [Fotograf], [KulupID]) VALUES (15, N'wer', N'fdsa', N'fsda', 1)
INSERT [dbo].[TblOgrenci] ([ID], [Ad], [Soyad], [Fotograf], [KulupID]) VALUES (16, N'sdf', N'sdf', N'', 1)
INSERT [dbo].[TblOgrenci] ([ID], [Ad], [Soyad], [Fotograf], [KulupID]) VALUES (17, N'', N'', N'as', 1)
INSERT [dbo].[TblOgrenci] ([ID], [Ad], [Soyad], [Fotograf], [KulupID]) VALUES (18, N'', N'', N'asd', 1)
INSERT [dbo].[TblOgrenci] ([ID], [Ad], [Soyad], [Fotograf], [KulupID]) VALUES (19, N'', N'', N'asdasdf', 1)
INSERT [dbo].[TblOgrenci] ([ID], [Ad], [Soyad], [Fotograf], [KulupID]) VALUES (20, N'asd', N'asd', N'asd', 4)
SET IDENTITY_INSERT [dbo].[TblOgrenci] OFF
ALTER TABLE [dbo].[TblNotlar] ADD  CONSTRAINT [DF_TblNotlar_Sinav1]  DEFAULT ((0)) FOR [Sinav1]
GO
ALTER TABLE [dbo].[TblNotlar] ADD  CONSTRAINT [DF_TblNotlar_Sinav2]  DEFAULT ((0)) FOR [Sinav2]
GO
ALTER TABLE [dbo].[TblNotlar] ADD  CONSTRAINT [DF_TblNotlar_Sinav3]  DEFAULT ((0)) FOR [Sinav3]
GO
ALTER TABLE [dbo].[TblNotlar] ADD  CONSTRAINT [DF_TblNotlar_Proje]  DEFAULT ((0)) FOR [Proje]
GO
ALTER TABLE [dbo].[TblNotlar] ADD  CONSTRAINT [DF_TblNotlar_Ortalama]  DEFAULT ((0)) FOR [Ortalama]
GO
ALTER TABLE [dbo].[TblNotlar] ADD  CONSTRAINT [DF_TblNotlar_Durum]  DEFAULT ((0)) FOR [Durum]
GO
ALTER TABLE [dbo].[TblNotlar]  WITH CHECK ADD  CONSTRAINT [FK_TblNotlar_TblOgrenci] FOREIGN KEY([OgrID])
REFERENCES [dbo].[TblOgrenci] ([ID])
GO
ALTER TABLE [dbo].[TblNotlar] CHECK CONSTRAINT [FK_TblNotlar_TblOgrenci]
GO
ALTER TABLE [dbo].[TblOgrenci]  WITH CHECK ADD  CONSTRAINT [FK_TblOgrenci_TblKulup] FOREIGN KEY([KulupID])
REFERENCES [dbo].[TblKulup] ([KulupID])
GO
ALTER TABLE [dbo].[TblOgrenci] CHECK CONSTRAINT [FK_TblOgrenci_TblKulup]
GO
