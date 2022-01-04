CREATE TABLE [dbo].[active](
	[uyeid] [int] NULL,
	[akodu] [nchar](10) NULL
) ON [PRIMARY]


CREATE TABLE [dbo].[altkategoriler](
	[altkateno] [smallint] IDENTITY(1,1) NOT NULL,
	[altkateadi] [nvarchar](50) NOT NULL,
	[anakateno] [tinyint] NOT NULL,
 CONSTRAINT [PK_altkategoriler] PRIMARY KEY CLUSTERED 
(	[altkateno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[favoriler](
	[favno] [bigint] IDENTITY(1,1) NOT NULL,
	[uyeid] [int] NOT NULL,
	[urunid] [int] NOT NULL,
 CONSTRAINT [PK_favoriler] PRIMARY KEY CLUSTERED 
(
	[favno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


CREATE TABLE [dbo].[kategoriler](
	[kateno] [tinyint] IDENTITY(1,1) NOT NULL,
	[kateadi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_kategoriler] PRIMARY KEY CLUSTERED 
(
	[kateno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]




CREATE TABLE [dbo].[toplam_kazan] (
    [sipno]      INT           NOT NULL,
    [toplamfiy]  FLOAT (53)    NOT NULL,
    [sip_tarihi] SMALLDATETIME NULL
)

CREATE TABLE [dbo].[urunler] (
    [urunid]   INT             IDENTITY (1, 1) NOT NULL,
    [urunadi]  NVARCHAR (50)   NOT NULL,
    [fiyat]    FLOAT (53)      NOT NULL,
    [aciklama] NVARCHAR (2000) NULL,
    [resim]    NVARCHAR (50)   NULL,
    [kateno]   TINYINT         NOT NULL,
    CONSTRAINT [PK_urunler] PRIMARY KEY CLUSTERED ([urunid] ASC),
    CONSTRAINT [FK_urunler_kategoriler] FOREIGN KEY ([kateno]) REFERENCES [dbo].[kategoriler] ([kateno]) ON UPDATE CASCADE
)

CREATE TABLE [dbo].[uyeler] (
    [uyeid]    INT            IDENTITY (1, 1) NOT NULL,
    [kuladi]   NVARCHAR (30)  NOT NULL,
    [sifre]    NVARCHAR (20)  NOT NULL,
    [adsoyad]  NVARCHAR (50)  NOT NULL,
    [dogtar]   SMALLDATETIME  NOT NULL,
    [cinsiyet] BIT            NOT NULL,
    [adres]    NVARCHAR (400) NULL,
    [email]    NVARCHAR (50)  NOT NULL,
    [onay]     BIT            CONSTRAINT [DF_uyeler_onay] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_uyeler] PRIMARY KEY CLUSTERED ([uyeid] ASC),
    CONSTRAINT [uk_email] UNIQUE NONCLUSTERED ([email] ASC),
    CONSTRAINT [uk_kuladi] UNIQUE NONCLUSTERED ([kuladi] ASC)

)



CREATE TABLE [dbo].[siparisler] (
    [uyeid]      INT           NOT NULL,
    [urunid]     INT           NOT NULL,
    [adet]       SMALLINT      NOT NULL,
    [sip_tarihi] SMALLDATETIME NOT NULL,
    [sipno]      INT           NOT NULL,
    [kayitno]    BIGINT        IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_siparisler] PRIMARY KEY CLUSTERED ([kayitno] ASC),
    CONSTRAINT [FK_siparisler_urunler] FOREIGN KEY ([urunid]) REFERENCES [dbo].[urunler] ([urunid]),
    CONSTRAINT [FK_siparisler_uyeler] FOREIGN KEY ([uyeid]) REFERENCES [dbo].[uyeler] ([uyeid])

)


/****** Object:  Index [IX_uyeler]    Script Date: 28.08.2021 12:22:45 ******/



Go
ALTER TABLE [dbo].[altkategoriler]  WITH CHECK ADD  CONSTRAINT [FK_altkategoriler_kategoriler] FOREIGN KEY([anakateno])
REFERENCES [dbo].[kategoriler] ([kateno])
GO
ALTER TABLE [dbo].[altkategoriler] CHECK CONSTRAINT [FK_altkategoriler_kategoriler]
GO
ALTER TABLE [dbo].[favoriler]  WITH CHECK ADD  CONSTRAINT [FK_favoriler_urunler] FOREIGN KEY([urunid])
REFERENCES [dbo].[urunler] ([urunid])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[favoriler] CHECK CONSTRAINT [FK_favoriler_urunler]
GO
ALTER TABLE [dbo].[favoriler]  WITH CHECK ADD  CONSTRAINT [FK_favoriler_uyeler] FOREIGN KEY([uyeid])
REFERENCES [dbo].[uyeler] ([uyeid])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[favoriler] CHECK CONSTRAINT [FK_favoriler_uyeler]
GO
