# SQLServer-Course

-----------SESSION 2------------




مشکل این مدل دیتا چی هست؟ 

-- مشکل در این هست  که این اسم ها شبیه هستند و امکان اشتباه کردن زیاده و هر کدوم کد اسکی متفاوت داره و نباید تکرار داشت به همین دلیل!

-- Person ( id , fn , ln , role )

--        ( 1 , aaa , bbb ,  مدیر )
--        ( 1 , aaa , bbb ,  مدیرارشد )
--        ( 1 , aaa , bbb ,  کاربر )
--        ( 1 , aaa , bbb ,  کاربر ارشد )
--        ( 1 , aaa , bbb ,  منشی )
--        ( 1 , aaa , bbb ,   منشي)
--        ( 1 , aaa , bbb ,   مدیر)
--        ( 1 , aaa , bbb ,   مدیر ارشد)
--        ( 1 , aaa , bbb ,   منشی)
--        ( 1 , aaa , bbb ,   منشي)
--        ( 1 , aaa , bbb ,   مدبر)
--        ( 1 , aaa , bbb ,   کاربر)
--        ( 1 , aaa , bbb ,   کاربز)

-------------------------------------------------------------------------------

-- Person ( id , fn , ln , Spouse Name )
-- Person ( id , fn , ln , Spouse Name 1 , Spouse Name 2  )
-- Person ( id , fn , ln , Spouse Name 1 , Spouse Name 2  )
-- Person ( id , fn , ln , Spouse Name 1 , Spouse Name 2 , 3 , 4  )

-- قرارداد
-- اول ستون های اصلی مون باشن پرایمری کی چون میتونن ترکیبی باشن و چند تا باشن بعد ستون خارجی  و بقیه ستون ها 
-- اولین ستون یا ستون ها کلید اصلی باشند
-- ستون های بعدی کلید خارجی


-- Role ( Code , TitleFa , TitleEn ) میتونیم نقش رو به دو زبان بنویسیم
-- Person( ID , RoleCode , fn , ln , .......... )
-- Marriage( ID , PersonID , SpouseName, Wedding Date , Divorce Date , .... )
-- Children(ID , MarriageID , ChildrenName , DateofBirth , ...)

-- بعدا این طراحی عوض میشود ولی چند تا مشکل داره؟  و میشه با دوتا جدول هندلش کرد و درست هم کار میکنه  ولی فعلا برای یادگیری این بهتره

------------------------------انواع روابط ---------------------------------------------

-- بعد از استخراج موجودیت ها باید بریم روابط رو طراحی بکنیم که جدول درست طراحی بشه 

-- 1:1  One to  One
-- 1:n  One to  Many
-- m:n  Many to Many

-- یک شخص فقط یک نقش حتما دارد
-- یک نقش را میتوان به چندین شخص اعطا کرد
-- حتما این جملات باید با یک شروع بشه اول جمله 

-- Role ( Code , TitleFa , TitleEn )
-- Person( ID , RoleCode , fn , ln , .......... ) یک شخص میتونه یدونه کلید خارجی داشته باشه پس اینجا فقط یدونه رول کد براش میذاریم ولی نقش رو میشه به چند نفر داد پس نباید وابستکی خاصی براش ایجاد کنم و اون پرسن هست که وابسته میشه.

-- Weak Entity موجودیت ضعیفی هست که به ازای موجودیت دیگه شکل گرفته و اگه اون وجود نداشته باشه پس این موجودیت هم نیست 

--------------------------------------------------------------------------------

--1:n
-- Comment
-- Post
-- یک پست میتونه چند تا کامنت داشته باشه یک کامنت متعلق به یک پسته

-- کتگوری و پست 
-- ادم و پست

---------------------------------------------------------------------------------

-- Many to Many

-- یک مطلب میتواند شامل چندین کلمه کلیدی باشد
-- یک کلمه کلیدی میتواند در چندین مطلب وجود داشته باشد

---------------------------------------------------------------------------------

-- پیاده سازی این چطوری میشه؟ 

-- نیاز به جدول واسط داریم 

-- Junction Table
-- Post    ( id , title , date, personid ,.............)
-- Keyword ( id , title)

-- قرارداد
-- نام گذاری جدول 
-- Junction table just have tgis form and the other are PersonID pascal from. and hve two foreign key.
--Post_Keyword( ID , PostID , KeywordID )

-- کلید ترکیبی
--Post_Keyword( PostID , KeywordID )


-------------------------------------------------------------------

-- یک کاربر میتواند چندین فعالیت انجام دهد
-- یک فعالیت میتواند توسط چندین نفر انجام داده شود

-- Person(id , rolecode , fn , ln , bod , gender )
-- Post
-- comment
-- Password
-- Role
-- Activity (Code , Title , Point )
 
-- Keyword
-- Post_Keyword
-- PasswordHistory
-- Person_Activity ( ID , PersonID , ActivityCode)

-- ترکیب 3 تا با هم یونیک میشود
-- Person_Activity ( PersonID , ActivityCode , DateTime)

-----------------------------------------------------

-- یک شخص فقط میتواند یک اکانت داشته باشد
-- یک اکانت فقط متعلق به یک شخص است


-- Person(id , rolecode , fn , ln , bod , gender )
-- Account(id , PersonID(unique) , username , email , ip , last login date )
-- PasswordHistory ( id , personid , password )

-- OR (سرکار خانم طیبی)

-- Person(id , rolecode , fn , ln , bod , gender )
-- Account(id , PersonID(unique) , username , email , ip , last login date )
-- PasswordHistory ( id , AccountID , password )

-- OR (سرکار خانم طیبی)

-- Person(id , rolecode , fn , ln , bod , gender )
-- Account(PersonID(PK,FK) , username , email , ip , last login date )
-- PasswordHistory ( id , personid , password )

-------------------------------------------

-- سفر با هواپیما

--airport
--ticket
--person
--Plane
--Travel
--pilot
-- class ( eco , first , biz )
-- boarding pass ( seat , gate ... )
--Ticket ( date ,time , from , to , flight no , price , class 
---------------


--Flight (id , No , plane id , pilotid , ......)
--Flight_Person(id , flight id , person id , Note)
--Flight_Person(flight id , person id , Note)
----------------------------------

--Flight_Person(flight id , person id , Note)

--Flight_Person(flight id , person id , Note)


PRINT GETDATE()
GO

PRINT @@VERSION
GO
/*
Microsoft SQL Server 2019 (RTM-GDR) (KB5029377) - 15.0.2104.1 (X64) 
	Aug 16 2023 00:09:21 
	Copyright (C) 2019 Microsoft Corporation
	Enterprise Edition (64-bit) on Windows 10 Enterprise 10.0 <X64> (Build 19045: )
*/

PRINT @@SERVERNAME --ICODE14000
GO

PRINT @@SERVICENAME -- MSSQLSERVER
GO

-- CRUD -------------رایج   
-- CREATE : INSERT
-- READ   : SELECT
-- UPDATE : UPDATE
-- DELETE : DELETE
-----------------------------------

-- DDL : DATA DEFINITION LANGUAGE    : CREATE , ALTER , DROP 
-- DML : DATA MANIPULATION LANGUAGE  : INSERT , UPDATE , DELETE
-- DQL : DATA QUERY LANGUAGE         : SELECT 
-- DCL : DATA CONTROL LANGUAGE       : GRANT , REVOKE
-- TCL : TRANSACTION CONTROL LANGUAGE: COMMIT , ROLLBACK

-----------------------------------

USE Weblog2023Dotin
GO

INSERT INTO dbo.Person(RoleCode,FirstName,LastName, BirthDate,Gender)
VALUES(4,N'مهران',N'درکاله','1995-08-01', 1)
GO

SELECT *
FROM dbo.Person
GO


-----------------------

USE [Weblog2023Dotin]
GO

/****** Object:  Table [dbo].[Person]    Script Date: 10/20/2023 1:29:13 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Person](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleCode] [tinyint] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Gender] [bit] NOT NULL,
	[CreateDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Person] ADD  CONSTRAINT [DF_Person_CreateDateTime]  DEFAULT (getdate()) FOR [CreateDateTime]
GO

ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Role] FOREIGN KEY([RoleCode])
REFERENCES [dbo].[Role] ([Code])
GO

ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Role]
GO


-------------------------------------------------

-- Bootcamp
-- role
-- type ( online / .... )
-- person
-- task ( id , title , deadline )
-- team ( code , title , )
-- team person ( code , teamcode , person , ......)
-- task team ( id , task id , team code , done , duration , status )
-- حضور غیاب
-- جلسه
