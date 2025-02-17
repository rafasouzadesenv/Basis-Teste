USE [basisbd]
GO
/****** Object:  Table [dbo].[Assunto]    Script Date: 30/12/2024 00:04:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assunto](
	[CodAs] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodAs] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Autor]    Script Date: 30/12/2024 00:04:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autor](
	[Autor_CodAu] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[Autor_CodAu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Livro]    Script Date: 30/12/2024 00:04:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Livro](
	[Livro_Codl] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](40) NULL,
	[Editora] [varchar](40) NULL,
	[Edicao] [int] NULL,
	[AnoPublicacao] [varchar](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[Livro_Codl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Livro_Aquisicao]    Script Date: 30/12/2024 00:04:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Livro_Aquisicao](
	[CodAq] [int] IDENTITY(1,1) NOT NULL,
	[Livro_Codl] [int] NULL,
	[Valor] [numeric](18, 2) NULL,
	[Tipo_Aquisicao_Cod] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CodAq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Livro_Assunto]    Script Date: 30/12/2024 00:04:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Livro_Assunto](
	[Livro_Assunto_Cod] [int] IDENTITY(1,1) NOT NULL,
	[Livro_Codl] [int] NULL,
	[Assunto_CodAs] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Livro_Assunto_Cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Livro_Autor]    Script Date: 30/12/2024 00:04:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Livro_Autor](
	[Livro_Autor_Cod] [int] IDENTITY(1,1) NOT NULL,
	[Autor_CodAu] [int] NULL,
	[Livro_Codl] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Livro_Autor_Cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Aquisicao]    Script Date: 30/12/2024 00:04:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Aquisicao](
	[Tipo_Aquisicao_Cod] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Tipo_Aquisicao_Cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[LivrosView]    Script Date: 30/12/2024 00:04:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[LivrosView]
AS
SELECT        L.Livro_Codl AS LivroCodl, L.Titulo, L.Editora, L.Edicao, L.AnoPublicacao, A.Descricao AS Assunto, LAq.Valor, Taq.Descricao AS TipoAquisicao, Au.Nome AS Autor
FROM            dbo.Livro AS L LEFT OUTER JOIN
                         dbo.Livro_Assunto AS LA ON LA.Livro_Codl = L.Livro_Codl LEFT OUTER JOIN
                         dbo.Assunto AS A ON A.CodAs = LA.Assunto_CodAs LEFT OUTER JOIN
                         dbo.Livro_Autor AS LAu ON LAu.Livro_Codl = L.Livro_Codl LEFT OUTER JOIN
                         dbo.Autor AS Au ON Au.Autor_CodAu = LAu.Livro_Autor_Cod LEFT OUTER JOIN
                         dbo.Livro_Aquisicao AS LAq ON LAq.Livro_Codl = L.Livro_Codl LEFT OUTER JOIN
                         dbo.Tipo_Aquisicao AS Taq ON Taq.Tipo_Aquisicao_Cod = LAq.Tipo_Aquisicao_Cod
GO
ALTER TABLE [dbo].[Livro_Aquisicao]  WITH CHECK ADD  CONSTRAINT [FK_Livro_Aquisicao_Livro] FOREIGN KEY([Livro_Codl])
REFERENCES [dbo].[Livro] ([Livro_Codl])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Livro_Aquisicao] CHECK CONSTRAINT [FK_Livro_Aquisicao_Livro]
GO
ALTER TABLE [dbo].[Livro_Aquisicao]  WITH CHECK ADD  CONSTRAINT [FK_Livro_Aquisicao_Tipo_Aquisicao] FOREIGN KEY([Tipo_Aquisicao_Cod])
REFERENCES [dbo].[Tipo_Aquisicao] ([Tipo_Aquisicao_Cod])
GO
ALTER TABLE [dbo].[Livro_Aquisicao] CHECK CONSTRAINT [FK_Livro_Aquisicao_Tipo_Aquisicao]
GO
ALTER TABLE [dbo].[Livro_Assunto]  WITH CHECK ADD  CONSTRAINT [FK_Livro_Assunto_Assunto] FOREIGN KEY([Assunto_CodAs])
REFERENCES [dbo].[Assunto] ([CodAs])
GO
ALTER TABLE [dbo].[Livro_Assunto] CHECK CONSTRAINT [FK_Livro_Assunto_Assunto]
GO
ALTER TABLE [dbo].[Livro_Assunto]  WITH CHECK ADD  CONSTRAINT [FK_Livro_Assunto_Livro] FOREIGN KEY([Livro_Codl])
REFERENCES [dbo].[Livro] ([Livro_Codl])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Livro_Assunto] CHECK CONSTRAINT [FK_Livro_Assunto_Livro]
GO
ALTER TABLE [dbo].[Livro_Autor]  WITH CHECK ADD  CONSTRAINT [FK_Livro_Autor_Autor] FOREIGN KEY([Autor_CodAu])
REFERENCES [dbo].[Autor] ([Autor_CodAu])
GO
ALTER TABLE [dbo].[Livro_Autor] CHECK CONSTRAINT [FK_Livro_Autor_Autor]
GO
ALTER TABLE [dbo].[Livro_Autor]  WITH CHECK ADD  CONSTRAINT [FK_Livro_Autor_Livro] FOREIGN KEY([Livro_Codl])
REFERENCES [dbo].[Livro] ([Livro_Codl])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Livro_Autor] CHECK CONSTRAINT [FK_Livro_Autor_Livro]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "L"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LA"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 436
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "A"
            Begin Extent = 
               Top = 120
               Left = 246
               Bottom = 216
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LAu"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 251
               Right = 215
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Au"
            Begin Extent = 
               Top = 216
               Left = 253
               Bottom = 312
               Right = 423
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LAq"
            Begin Extent = 
               Top = 252
               Left = 38
               Bottom = 382
               Right = 234
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Taq"
            Begin Extent = 
               Top = 384
               Left = 38
               Bottom = 480
               Right = 234
            End
            DisplayFlags = 280
            TopColumn = 0
       ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'LivrosView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'  End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'LivrosView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'LivrosView'
GO
