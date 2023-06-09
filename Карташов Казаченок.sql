USE [master]
GO
/****** Object:  Database [IR2230Practice]    Script Date: 11.03.2023 13:32:15 ******/
CREATE DATABASE [IR2230Practice]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IR2230Practice', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\IR2230Practice.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IR2230Practice_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\IR2230Practice_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [IR2230Practice] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IR2230Practice].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IR2230Practice] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IR2230Practice] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IR2230Practice] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IR2230Practice] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IR2230Practice] SET ARITHABORT OFF 
GO
ALTER DATABASE [IR2230Practice] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IR2230Practice] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IR2230Practice] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IR2230Practice] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IR2230Practice] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IR2230Practice] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IR2230Practice] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IR2230Practice] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IR2230Practice] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IR2230Practice] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IR2230Practice] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IR2230Practice] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IR2230Practice] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IR2230Practice] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IR2230Practice] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IR2230Practice] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IR2230Practice] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IR2230Practice] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [IR2230Practice] SET  MULTI_USER 
GO
ALTER DATABASE [IR2230Practice] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IR2230Practice] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IR2230Practice] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IR2230Practice] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IR2230Practice] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [IR2230Practice] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [IR2230Practice] SET QUERY_STORE = OFF
GO
USE [IR2230Practice]
GO
/****** Object:  Table [dbo].[Заказ]    Script Date: 11.03.2023 13:32:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказ](
	[Номер] [int] NOT NULL,
	[Дата] [date] NOT NULL,
	[Этап выполнения] [nchar](10) NOT NULL,
	[Заказчик] [nchar](10) NOT NULL,
	[Менеджер] [nchar](10) NOT NULL,
	[Стоимость] [float] NULL,
 CONSTRAINT [PK_Заказ_1] PRIMARY KEY CLUSTERED 
(
	[Номер] ASC,
	[Дата] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заказанные изделия]    Script Date: 11.03.2023 13:32:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказанные изделия](
	[Артикул изделия] [int] NOT NULL,
	[Номер заказа] [int] NOT NULL,
	[Количество] [int] NOT NULL,
 CONSTRAINT [PK_Заказанные изделия] PRIMARY KEY CLUSTERED 
(
	[Артикул изделия] ASC,
	[Номер заказа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Изделие]    Script Date: 11.03.2023 13:32:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Изделие](
	[Артикул] [int] NOT NULL,
	[Наименование] [nvarchar](50) NOT NULL,
	[Ширина] [int] NOT NULL,
	[Длина] [int] NOT NULL,
	[Изображение] [varbinary](max) NULL,
	[Комментарий] [nvarchar](max) NULL,
 CONSTRAINT [PK_Изделие] PRIMARY KEY CLUSTERED 
(
	[Артикул] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пользователь]    Script Date: 11.03.2023 13:32:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пользователь](
	[Логин] [nchar](20) NOT NULL,
	[Пароль] [nchar](16) NOT NULL,
	[Роль] [nvarchar](50) NOT NULL,
	[Наименование] [nvarchar](50) NULL,
 CONSTRAINT [PK_Пользователь] PRIMARY KEY CLUSTERED 
(
	[Логин] ASC,
	[Пароль] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Склад ткани]    Script Date: 11.03.2023 13:32:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Склад ткани](
	[Рулон] [int] NOT NULL,
	[Артикул ткани] [int] NOT NULL,
	[Длина] [int] NOT NULL,
	[Ширина] [int] NOT NULL,
 CONSTRAINT [PK_Склад ткани] PRIMARY KEY CLUSTERED 
(
	[Рулон] ASC,
	[Артикул ткани] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Склад фурнитуры]    Script Date: 11.03.2023 13:32:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Склад фурнитуры](
	[Партия] [int] NOT NULL,
	[Артикул фурнитуры] [int] NOT NULL,
	[Количество] [int] NOT NULL,
 CONSTRAINT [PK_Склад фурнитуры] PRIMARY KEY CLUSTERED 
(
	[Партия] ASC,
	[Артикул фурнитуры] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ткани изделия]    Script Date: 11.03.2023 13:32:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ткани изделия](
	[Артикул ткани] [int] NOT NULL,
	[Артикул изделия] [int] NOT NULL,
 CONSTRAINT [PK_Ткани изделия] PRIMARY KEY CLUSTERED 
(
	[Артикул ткани] ASC,
	[Артикул изделия] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ткань]    Script Date: 11.03.2023 13:32:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ткань](
	[Артикул] [int] NOT NULL,
	[Наименование] [nvarchar](50) NOT NULL,
	[Цвет] [nchar](10) NULL,
	[Рисунок] [nvarchar](50) NULL,
	[Изображение] [varbinary](max) NULL,
	[Состав] [nvarchar](max) NULL,
	[Ширина] [int] NOT NULL,
	[Длина] [int] NOT NULL,
	[Цена] [float] NOT NULL,
 CONSTRAINT [PK_Ткань] PRIMARY KEY CLUSTERED 
(
	[Артикул] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Фурнитура]    Script Date: 11.03.2023 13:32:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Фурнитура](
	[Артикул] [int] NOT NULL,
	[Наименование] [nvarchar](50) NOT NULL,
	[Тип] [nvarchar](50) NOT NULL,
	[Ширина] [int] NOT NULL,
	[Длина] [int] NULL,
	[Вес] [float] NULL,
	[Изображение] [varbinary](max) NULL,
	[Цена] [float] NOT NULL,
 CONSTRAINT [PK_Фурнитура] PRIMARY KEY CLUSTERED 
(
	[Артикул] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Фурнитура изделия]    Script Date: 11.03.2023 13:32:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Фурнитура изделия](
	[Артикул фурнитуры] [int] NOT NULL,
	[Артикул изделия] [int] NOT NULL,
	[Размещения] [nchar](10) NOT NULL,
	[Ширина] [int] NULL,
	[Длина] [int] NULL,
	[Поворот] [int] NULL,
	[Количество] [int] NOT NULL,
 CONSTRAINT [PK_Фурнитура изделия] PRIMARY KEY CLUSTERED 
(
	[Артикул фурнитуры] ASC,
	[Артикул изделия] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Заказанные изделия]  WITH CHECK ADD  CONSTRAINT [FK_Заказанные изделия_Изделие] FOREIGN KEY([Артикул изделия])
REFERENCES [dbo].[Изделие] ([Артикул])
GO
ALTER TABLE [dbo].[Заказанные изделия] CHECK CONSTRAINT [FK_Заказанные изделия_Изделие]
GO
ALTER TABLE [dbo].[Склад ткани]  WITH CHECK ADD  CONSTRAINT [FK_Склад ткани_Ткань] FOREIGN KEY([Артикул ткани])
REFERENCES [dbo].[Ткань] ([Артикул])
GO
ALTER TABLE [dbo].[Склад ткани] CHECK CONSTRAINT [FK_Склад ткани_Ткань]
GO
ALTER TABLE [dbo].[Склад фурнитуры]  WITH CHECK ADD  CONSTRAINT [FK_Склад фурнитуры_Фурнитура] FOREIGN KEY([Артикул фурнитуры])
REFERENCES [dbo].[Фурнитура] ([Артикул])
GO
ALTER TABLE [dbo].[Склад фурнитуры] CHECK CONSTRAINT [FK_Склад фурнитуры_Фурнитура]
GO
ALTER TABLE [dbo].[Ткани изделия]  WITH CHECK ADD  CONSTRAINT [FK_Ткани изделия_Изделие] FOREIGN KEY([Артикул изделия])
REFERENCES [dbo].[Изделие] ([Артикул])
GO
ALTER TABLE [dbo].[Ткани изделия] CHECK CONSTRAINT [FK_Ткани изделия_Изделие]
GO
ALTER TABLE [dbo].[Ткани изделия]  WITH CHECK ADD  CONSTRAINT [FK_Ткани изделия_Ткань] FOREIGN KEY([Артикул ткани])
REFERENCES [dbo].[Ткань] ([Артикул])
GO
ALTER TABLE [dbo].[Ткани изделия] CHECK CONSTRAINT [FK_Ткани изделия_Ткань]
GO
ALTER TABLE [dbo].[Фурнитура изделия]  WITH CHECK ADD  CONSTRAINT [FK_Фурнитура изделия_Изделие] FOREIGN KEY([Артикул изделия])
REFERENCES [dbo].[Изделие] ([Артикул])
GO
ALTER TABLE [dbo].[Фурнитура изделия] CHECK CONSTRAINT [FK_Фурнитура изделия_Изделие]
GO
ALTER TABLE [dbo].[Фурнитура изделия]  WITH CHECK ADD  CONSTRAINT [FK_Фурнитура изделия_Фурнитура] FOREIGN KEY([Артикул фурнитуры])
REFERENCES [dbo].[Фурнитура] ([Артикул])
GO
ALTER TABLE [dbo].[Фурнитура изделия] CHECK CONSTRAINT [FK_Фурнитура изделия_Фурнитура]
GO
USE [master]
GO
ALTER DATABASE [IR2230Practice] SET  READ_WRITE 
GO
