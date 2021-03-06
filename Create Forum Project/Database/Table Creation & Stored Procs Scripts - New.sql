USE [master]
GO
/****** Object:  Table [dbo].[Forum_Registration]    Script Date: 04/01/2015 01:35:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE Forum_Registration(
	[usernameID] [INT] NOT NULL IDENTITY(100,1) CONSTRAINT [PK_Forum_Registration] PRIMARY KEY,
	[username] [nvarchar](25) NOT NULL,
	[password] [nvarchar](25) NULL,
	[gender] [nvarchar](10) NULL,
	[dob] [nvarchar](15) NULL,
	[emailid] [nvarchar](30) NULL)
GO


/****** Object:  Table [dbo].[Forum_Post]    Script Date: 04/01/2015 01:35:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Forum_Post](
	[postid] [int] IDENTITY(1,1) CONSTRAINT [PK_POST_ID] PRIMARY KEY NOT NULL,
	[usernameID] INT NULL CONSTRAINT [FK_FOREIGN_REGISTRATION_USERID] FOREIGN KEY REFERENCES dbo.Forum_Registration(usernameID),
	[posttitle] [nvarchar](150) NULL,
	[postmessage] [nvarchar](4000) NULL,
	[posteddate] [nvarchar](50) NULL)
GO


/****** Object:  Table [dbo].[tbl_Profile]    Script Date: 11/20/2016 7:57:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE tbl_Profile
(
	ProfileID INT CONSTRAINT [FK_UserID] FOREIGN KEY REFERENCES Forum_Registration (usernameID),
	FirstName VARCHAR (50) ,
	LastName VARCHAR (50) ,
	MiddleName VARCHAR (50) ,
	ContactNo VARCHAR (15) ,
	Location VARCHAR (50) ,
	Description VARCHAR (500) ,
	College VARCHAR (100) ,
	Profession VARCHAR (100) ,
)
GO





/****** Object:  StoredProcedure [dbo].[usp_ViewProfile]    Script Date: 11/20/2016 7:59:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/*****************************************************************************************
  Procedure Name   : usp_ViewProfile
  Author           : Riya Gaba
  Description      : To view data of tbl_Profile
  Input Parameters : 
  Output Parameters: 
  Date             : 26-10-2016
*****************************************************************************************/
CREATE PROC [dbo].[usp_ViewProfile] (@Pid INT)
AS
BEGIN
 Select * from tbl_Profile WHERE ProfileID = @Pid
END
	
GO




/****** Object:  StoredProcedure [dbo].[usp_UpdateProfile]    Script Date: 11/20/2016 9:58:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[usp_UpdateProfile]
(@Pid INT, @Pfirstname VARCHAR(50), @Plastname VARCHAR(50), @Pmiddlename VARCHAR(50), @Pcontact VARCHAR(15),@Plocation VARCHAR(50), @Pdesc VARCHAR(100), @Pcollege VARCHAR(50), @Pprofession VARCHAR(50), @Pret INT OUTPUT)
AS
BEGIN
IF (exists(select top 1 FirstName from tbl_Profile WHERE ProfileID = @Pid))
BEGIN
 UPDATE tbl_Profile SET 
 FirstName=@Pfirstname, LastName=@Plastname, MiddleName=@Pmiddlename, ContactNo=@Pcontact, Location=@Plocation, Description=@Pdesc, College=@Pcollege, Profession=@Pprofession
 WHERE ProfileID = @Pid
 IF(@@ERROR<>0)
    SET @Pret = 0
  ELSE
   SET @Pret = 1
END
ELSE
BEGIN
INSERT INTO tbl_Profile VALUES (@Pid, @Pfirstname, @Plastname, @Pmiddlename, @Pcontact, @Plocation, @Pdesc, @Pcollege, @Pprofession)
IF(@@ERROR<>0)
    SET @Pret = 0
  ELSE
   SET @Pret = 1
END
END




