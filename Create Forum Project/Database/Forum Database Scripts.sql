USE [master]
GO
/****** Object:  Table [dbo].[Forum_Registration]    Script Date: 04/01/2015 01:35:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Forum_Registration](
	[username] [nvarchar](25) NOT NULL,
	[password] [nvarchar](25) NULL,
	[fullname] [nvarchar](50) NULL,
	[gender] [nvarchar](10) NULL,
	[dob] [nvarchar](15) NULL,
	[emailid] [nvarchar](30) NULL,
 CONSTRAINT [PK_Forum_Registration] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Forum_Registration] ([username], [password], [fullname], [gender], [dob], [emailid]) VALUES (N'abc', N'abc', N'abc', N'Male', N'33093933', N'abc@gmail.com')
INSERT [dbo].[Forum_Registration] ([username], [password], [fullname], [gender], [dob], [emailid]) VALUES (N'Hari', N'12345', N'Harinath', N'Male', N'23092033', N'h@gmail.com')
INSERT [dbo].[Forum_Registration] ([username], [password], [fullname], [gender], [dob], [emailid]) VALUES (N'Kiran98', N'kiran@98', N'Kiran Reddy', N'Male', N'21052012', N'kiran@gmail.com')
INSERT [dbo].[Forum_Registration] ([username], [password], [fullname], [gender], [dob], [emailid]) VALUES (N'prashant1', N'12345', N'prashant', N'Male', N'05052005', N'p@gmail.com')
INSERT [dbo].[Forum_Registration] ([username], [password], [fullname], [gender], [dob], [emailid]) VALUES (N'RamReddy44', N'ramreddy12345', N'Ram Reddy', N'Male', N'14042004', N'RR@gmail.com')
INSERT [dbo].[Forum_Registration] ([username], [password], [fullname], [gender], [dob], [emailid]) VALUES (N'srikanth12', N'12345', N'srikanth', N'Male', N'12092002', N'sri@gmail.com')
/****** Object:  Table [dbo].[Forum_Post]    Script Date: 04/01/2015 01:35:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Forum_Post](
	[postid] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](25) NULL,
	[posttitle] [nvarchar](150) NULL,
	[postmessage] [nvarchar](4000) NULL,
	[posteddate] [nvarchar](50) NULL,
 CONSTRAINT [PK_Forum_Post] PRIMARY KEY CLUSTERED 
(
	[postid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Forum_Post] ON
INSERT [dbo].[Forum_Post] ([postid], [username], [posttitle], [postmessage], [posteddate]) VALUES (2, N'Hari', N'What is HTML5?', N'HTML5 is a core technology markup language of the Internet used for structuring and presenting content for the World Wide Web', NULL)
INSERT [dbo].[Forum_Post] ([postid], [username], [posttitle], [postmessage], [posteddate]) VALUES (10, N'prashant1', N'What is HTML5?', N'HTML5 is a core technology markup language of the Internet used for structuring and presenting content for the World Wide Web. As of October 2014 this is the final and complete fifth revision of the HTML standard of the World Wide Web Consortium undefinedW3C). The previous version, HTML 4, was standardised in 1997.', NULL)
INSERT [dbo].[Forum_Post] ([postid], [username], [posttitle], [postmessage], [posteddate]) VALUES (12, N'prashant1', N'What is Money', N'HTML5 is a core technology markup language of the Internet used for structuring and presenting content for the World Wide Web. As of October 2014 this is the final and complete fifth revision of the HTML standard of the World Wide Web Consortium undefinedW3C). The previous version, HTML 4, was standardised in 1997.

Its core aims have been to improve the language with support for the latest multimedia while keeping it easily readable by humans and consistently understood by computers and devices undefinedweb browsers, parsers, etc.). HTML5 is intended to subsume not only HTML 4, but also XHTML 1 and DOM Level 2 HTML.', NULL)
INSERT [dbo].[Forum_Post] ([postid], [username], [posttitle], [postmessage], [posteddate]) VALUES (13, N'prashant1', N'what is string', N'Strings. Nearly every program uses strings.
In strings,
we find characters,
words
and textual data. The string type allows us to test and manipulate character data.


String face
Methods. Here are the methods and properties on strings. Some are static. We access them on the string type (like string.Empty). Complex algorithms often use many string methods.

Compare
CompareOrdinal
CompareTo
Concat
Contains
Copy
CopyTo
EndsWith
Empty
Equals
Format
GetEnumerator
GetHashCode
IndexOf
IndexOfAny
Insert
Intern
IsInterned
IsNormalized
IsNullOrEmpty
IsNullOrWhiteSpace
Join
LastIndexOf
LastIndexOfAny
Length
Normalize
PadLeft
PadRight
Remove
Replace
Split
StartsWith
Substring
ToCharArray
ToLower
ToLowerInvariant
ToString
ToUpper
ToUpperInvariant
Trim
TrimEnd
TrimStart

Constructor: create new
Constructor. Strings are often reused, and passed around within a program. Methods like Replace() create new strings. But we can also create new ones with a constructor.

String Constructor


Literals. These specify string data. We use quotes around literal data', NULL)
INSERT [dbo].[Forum_Post] ([postid], [username], [posttitle], [postmessage], [posteddate]) VALUES (14, N'Hari', N'Top 25 must see movies of 2015', N'Tomorrowland Mad Max? Bridge Of Spies Star Wars Child 44? join us as we look forward to 2015s must see movies...

Theres an awful lot to look forward to over the coming 12 months, from Hollywood and beyond. As such, compiling a list of 2015 most exciting films is extremely difficult.

In an attempt to limit the number of sequels which can fill up a list such as this, weve left out something like Fast & Furious 7, even though were fairly sure itll be a lot of fun. With but two significant exceptions, weve excluded some of the films from this list that were looking forward to in 2014 that have been delayed until this, such as Kingsman The Secret Service and Frankenstein. 

What were left with, we hope, is a fairly broad selection of action and comedy, science fiction and drama, animation and live action, and small scale productions as well as widescreen superhero blockbusters. So here goes...
', NULL)
INSERT [dbo].[Forum_Post] ([postid], [username], [posttitle], [postmessage], [posteddate]) VALUES (15, N'Hari', N'Money', N'Money
Money
Money
Money
Money
Money
MoneyMoney
Money
Money
Money
Money
Money
MoneyMoney
Money
Money
Money
Money
Money
MoneyMoney
Money
Money
Money
Money
Money
MoneyMoney
Money
Money
Money
Money
Money
MoneyMoney
Money
Money
Money
Money
Money
MoneyMoney
Money
Money
Money
Money
Money
MoneyMoney
Money
Money
Money
Money
Money
Money', NULL)
SET IDENTITY_INSERT [dbo].[Forum_Post] OFF
/****** Object:  ForeignKey [FK_Forum_Post_Forum_Registration]    Script Date: 04/01/2015 01:35:54 ******/
ALTER TABLE [dbo].[Forum_Post]  WITH CHECK ADD  CONSTRAINT [FK_Forum_Post_Forum_Registration] FOREIGN KEY([username])
REFERENCES [dbo].[Forum_Registration] ([username])
GO
ALTER TABLE [dbo].[Forum_Post] CHECK CONSTRAINT [FK_Forum_Post_Forum_Registration]
GO
