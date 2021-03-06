USE [master]
GO
/****** Object:  Database [dboUsuarios]    Script Date: 26/02/2021 12:06:47 ******/
CREATE DATABASE [dboUsuarios]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dboUsuarios', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\dboUsuarios.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dboUsuarios_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\dboUsuarios_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [dboUsuarios] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dboUsuarios].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dboUsuarios] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dboUsuarios] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dboUsuarios] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dboUsuarios] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dboUsuarios] SET ARITHABORT OFF 
GO
ALTER DATABASE [dboUsuarios] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [dboUsuarios] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dboUsuarios] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dboUsuarios] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dboUsuarios] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dboUsuarios] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dboUsuarios] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dboUsuarios] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dboUsuarios] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dboUsuarios] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dboUsuarios] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dboUsuarios] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dboUsuarios] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dboUsuarios] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dboUsuarios] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dboUsuarios] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dboUsuarios] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dboUsuarios] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dboUsuarios] SET  MULTI_USER 
GO
ALTER DATABASE [dboUsuarios] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dboUsuarios] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dboUsuarios] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dboUsuarios] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dboUsuarios] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dboUsuarios] SET QUERY_STORE = OFF
GO
USE [dboUsuarios]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 26/02/2021 12:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[apellidos] [varchar](50) NULL,
	[email] [varchar](20) NULL,
	[direcion] [varchar](100) NULL,
	[password] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_insertaUsusario]    Script Date: 26/02/2021 12:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_insertaUsusario]
(
@nombre varchar(50),
@apellidos varchar(50),
@email varchar(20),
@direccion varchar(100),
@contrasenha varchar(100)
)

as 
insert into dbo.Usuarios values(
@nombre,
@apellidos,
@email,
@direccion,
@contrasenha
)
return
GO
USE [master]
GO
ALTER DATABASE [dboUsuarios] SET  READ_WRITE 
GO
