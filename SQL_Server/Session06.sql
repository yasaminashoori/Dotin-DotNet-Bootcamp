-- Red Gate ( SQL Toolbelt )
-- SQL PROMPT

-- SQL : Structrued Query Language
-- T-SQL : SQL SERVER ( Microsoft )
-- PL-SQL: Oracle SQL Developer ( Oracle )

-- DBMS ( DATA BASE MANAGEMENT SYSTEM ) 
-- RDBMS
-- NoSQL

-- پایگاه داده
-- 1 Database ==> n Tables
-- 1 Table    ==> Rows , Columns
-- Column     ==> ویژگی
-- Row        ==> داده
-- Table      ==> موجودیت

-- موجودیت Entity
-- هر چیزی که در این سیستم بهش نیاز داریم

-- سیستم عملیاتی
-- مکتوب 
-- مشتری داستان ش رو تعریف میکنه

-- استخراج موجودیت ها
-- Brain Storming بارش فکری


-- سیستم آموزشگاه 
--استاد
-- دانشجو
-- درس
-- مالی
-- کلاس
-- تاریخ کلاس
-- ظرفیت کلاس
--نام کلاس
-- رفرنس های آموزشی
-- تجهیزات
-- ت ت
-- آدرس
-- کد ملی
--مدرک ت
--سطح
-- a1 a2 
-- شماره دانشجو
-- نمره
-- حداقل نمره قبولی
-- ترم آموزشی
---------------------------------
--Teacher : fn , ln , ssn , gender , .............
--Student : fn , ln , ssn , gender , ..........
--Course  : code , title , duration , description , level , pre-course , course Type , is online , topics
--ClassRoom : title , qty , class room type , 
--Term      : start date - end date - course -  start time - end time - Teacher - IsOnline/Mixed - Class Room - Tution
--Term_Student : Term - Student - Grade
------------------------------------

-- قانون  - ماست - MUST
-- قرارداد - Convention - should / better

-- Rule 1 : هر جدولی حتمن باید یک کلید اصلی داشته باشد
-- PRIMARY KEY ( PK ) یک ستون با مقدار یونیک
-- کد ملی - شماره پاسپورت - کد دانشجویی - کد کارمندی - موبایل
-- ID ==> PK
-- 1- ID , Id
-- 2- Teacher : TeacherID , TEACHER_ID , 
-- TYPE : NUMBER ==> INT , BIGINT
--      : UniqueIdentifier ( hex ) 
-- Value: Auto Increment , Auto
-- وظیفه مقدار دهی با sql است
---------------------------------
--Teacher : ID , fn , ln , ssn , gender , .............
--Student : ID , fn , ln , ssn , gender , ..........
--Course  : ID , code , title , duration , description , level , pre-course , course Type , is online , topics
--ClassRoom :Code , title , qty , class room type , 
--Term      : ID ,  start date - end date - course -  start time - end time - Teacher - IsOnline/Mixed - Class Room - Tution
--Term_Student : ID , Term - Student - Grade
--ClassRoomType : Code , Title ....
--CourseType : Code , Title , ....
--
------------------------------------

-- Entity : 
-- 1- Record > 255  ==> ID , auto
-- 2- Record <= 255 ==> Code , value توسط خودمان - برنامه 

-- Type : TinyInt

----------------
-- کلید فنی
-- مقدار id  هیچ اهمیتی ندارد
-- ممکنه بین ش فاصله هم باشه GAP
--------------------

-- کلید بیزینسی
-- مقدار Code اهمیت دارد
-- Role : Code 1 : admin
--        Code 2 : user

-- if ( role.code == 1 ) ...... admin
-- HARD CODE

-----------------------------
-- Region.Code 1 == منطقه یک
-----------------------------

----------------
-- کلید فنی
-- مقدار id  هیچ اهمیتی ندارد
-- ممکنه بین ش فاصله هم باشه GAP

-- کلید بیزینسی هم دارد
-- کد سفارش هر روز ریست میشه پس کلید بیزینسی است

--------------------

-- قرارداد نام گذاری

-- از حروف فارسی استفاده نکنید
-- DB , Table , Column ==> PASCAL CASE ==> ClassRoomType

-- اسامی معنا و مفهوم داشته باشد

-- DONT USE ===>  tbl_product

-----------------------------------
-- جلوی ورود اطلاعات اشتباه را میگیرد
-- RELATION , .........
-- FK ( FOREIGN KEY ) کلید خارجی

-- Class Room : 1 , 2, 3, 4
-- Term       : 5 NOT OK
-- Term       : 4 ok
----------------------------
-- Role : Code
-- Person : ID , RoleCode
------------
-- Role : RoleCode
-- Person : PersonID , RoleCode
-----------

-- DATABASE ( TEAM (3-4), سیستم عملیاتی , OK )
-- بیزینس مسلط شدید - موجودیت - داده واقعی 

-- C# ( Fund...)
-- C# ( .... )
-- Web (... ) 

--------------------------------

-- ستون های رایج برای اکثر جدول ها

-- Create DateTime
-- Update DateTime
-- Note توضیحات اضافی
-- IsEnable 
-- IsVisible

-- جدول رایج
-- برای نگه داری تنظیمات کلی و داده های سراسری
-- SMS NO , PASSWORD PANEL , MINIMOM GRADE , ....

-- معمولن این جدول ها تک رکوردی هستند

--------------------------------------

-- BootCamp موجودیت ها و روابط 

-- Weblog
-- افراد در سایت ثبت نام میکنند
-- میتونن در قالب موضوع های مختلف مطلب بنویسیند
-- یا برای مطالب نوشته شده کامنت بزارند
-- بازدید کنندگان میتوانند بر اساس کلمات کلیدی نوشته شده
-- در هر مطلب جستجو انجام بدن
-- هر کاربری با نوشتن کامنت یا مطلب امتیاز مخصوص به آن کار را دریافت میکند
-- اگر میزان امتیازات کاربران از حدی بیشتر شود 
-- نقش آنها ارتقا پیدا میکند
-- اگر کاربری پسورد خود را فراموش کرد
-- برای بازیابی پسورد باید 
-- یکی از پسورد های قبلی خودش را وارد کند
----------------------------------------------------

-- DATA TYPE انواع داده ای

--https://learn.microsoft.com/en-us/sql/t-sql/data-types/data-types-transact-sql?view=sql-server-ver16

--Data type categories
--Data types in SQL Server are organized into the following categories:

--Exact numerics

--Unicode character strings

--Approximate numerics

--Binary strings

--Date and time

--Other data types

--Character strings

----------------------------------------------------------


-- Person ( id , fn , ln , role )
--        ( 1 , aaa , bbb ,  مدیر )
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


-- Person ( id , fn , ln , Spouse Name )
-- Person ( id , fn , ln , Spouse Name 1 , Spouse Name 2  )
-- Person ( id , fn , ln , Spouse Name 1 , Spouse Name 2  )
-- Person ( id , fn , ln , Spouse Name 1 , Spouse Name 2 , 3 , 4  )


-- قرارداد
-- اولین ستون یا ستون ها کلید اصلی باشند
-- ستون های بعدی کلید خارجی

-- Role ( Code , TitleFa , TitleEn )
-- Person( ID , RoleCode , fn , ln , .......... )
-- Marriage( ID , PersonID , SpouseName, Wedding Date , Divorce Date , .... )
-- Children(ID , MarriageID , ChildrenName , DateofBirth , ...)

-- بعدا این طراحی عوض میشود

-- Weak Entity

---------------------------------------------

-- 1:1  One to  One
-- 1:n  One to  Many
-- m:n  Many to Many

-- یک شخص فقط یک نقش حتما دارد
-- یک نقش را میتوان به چندین شخص اعطا کرد

-- Role ( Code , TitleFa , TitleEn )
-- Person( ID , RoleCode , fn , ln , .......... )

-------------------------------
--1:n
-- Comment
-- Post

------------------

-- Many to Many

-- یک مطلب میتواند شامل چندین کلمه کلیدی باشد
-- یک کلمه کلیدی میتواند در چندین مطلب وجود داشته باشد

-- پیاده سازی
-- نیاز به جدول واسط داریم 
-- Junction Table
-- Post    ( id , title , date, personid ,.............)
-- Keyword ( id , title)

-- قرارداد
-- نام گذاری جدول 
-- Junction
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

-----------------------------------------------

-- CRUD

SELECT *
FROM dbo.Activity
GO

INSERT INTO dbo.Activity(Code, Title,Point)
VALUES(1,N'مطلب گذاشتن', 10000 )
GO

--Violation of PRIMARY KEY constraint 'PK_Activity'. 
--Cannot insert duplicate key in object 'dbo.Activity'.
--The duplicate key value is (1).


INSERT INTO dbo.Activity(Code, Title,Point)
VALUES
(2,N'کامنت گذاشتن', 5000 ),
(3,N'لایک گذاشتن', 1000 )
GO

INSERT INTO dbo.Activity(Code, Title,Point)
VALUES
(4,N'الکی', 5000 ),
(5,N'الکی 2', 1000 )
GO


--Cannot insert explicit value for identity column 
--in table 'ActivityRate' 
--when IDENTITY_INSERT is set to OFF.

-- RESEED 

UPDATE dbo.Activity
SET Title = N'تست'
WHERE Code = 40 -- اکثر مواقع شرط تساوی روی PK
GO

UPDATE dbo.Activity
SET Title = N'تست2'
WHERE Code > 3 -- اکثر مواقع شرط روی PK
GO


UPDATE dbo.Activity
SET Title = N'تست2',
    Point = 20000
WHERE Code > 3 
GO

UPDATE dbo.Activity
SET Title = N'تست2',
    Point = 20000,
	Code =  Code + 1
WHERE Code > 3 
GO

UPDATE dbo.Activity
SET Title = N'تست2',
    Point = 20000,
	Code =  10
WHERE Code > 3 
GO

DELETE FROM dbo.Activity
WHERE Code = 4 -- شرط روی PK
GO


DELETE FROM dbo.Activity
WHERE Code > 4 -- شرط روی PK
GO

SELECT *
FROM dbo.Activity 
GO

------------------------

-- DELETE : 
-- DELETE , DROP , TRUNCATE

-- DELETE : SOFT DELETE / HARD DELETE 
--        : LOGICAL DELETE / PHYSICAL DELETE

-- IsDeleted BIT
-- Status    TINYINT ( 1 : insert , 2 : update , 3 : delete )

-- CASCADE DELETE

----------------------------------------------

--SCHEMA
--DEUTSCH شِما
--SCHENGEN
--

SELECT *
FROM Person.Activity 
GO

---------------------------------

-- DQL
-- SELECT

USE DotinBootCamp
GO

SELECT *
FROM dbo.Person
GO


SELECT Code,
       RoleCode,
       EducationCode,
       FirstName,
       LastName,
       Gender,
       BirthDate,
       Slogan
FROM dbo.Person
GO


SELECT P.Code , P.FirstName ,P.LastName
FROM dbo.Person AS P -- Alias اسم مستعار
GO

SELECT P.Code , 
       P.FirstName ,
	   P.LastName
FROM dbo.Person P -- Alias اسم مستعار
GO


SELECT P.Code , 
       P.FirstName + ' ' + P.LastName
FROM dbo.Person P 
GO

SELECT P.Code , 
       P.FirstName + ' ' + P.LastName AS FullName
FROM dbo.Person P 
GO

SELECT P.Code , 
       P.FirstName + ' ' + P.LastName FullName
FROM dbo.Person P 
GO



SELECT P.Code , 
       P.FirstName + ' ' + P.LastName 'FULL Name'
FROM dbo.Person P 
GO

--If aliases are standard identifiers, they do not need delimiters. 
--IF they are not, then they should be delimited by double-quotes, not single-quotes. 
--SQL Server and Sybase allow square brackets for the same purpose, but this is not ANSI Standard SQL. 
--String aliases are not part of the SQL standard, and have been deprecated by Microsoft when used with the assignment syntax. 
--So, for example, SQL Prompt will raise a violation of DEP021 for statements such as the following:
--For further details and examples, please see this Product Learning article: 
--SQL Prompt code analysis: avoid non-standard column aliases (ST002 and DEP021)


SELECT P.Code , 
       P.FirstName + ' ' + P.LastName 'نام و نام خانوادگی'
FROM dbo.Person P 
GO

SELECT P.Code , 
       P.FirstName + ' ' + P.LastName N'نام و نام خانوادگی'
FROM dbo.Person P 
GO

SELECT P.Code , 
       P.FirstName + ' ' + P.LastName [نام و نام خانوادگی]
FROM dbo.Person P 
GO

SELECT P.Code , 
       P.FirstName + ' ' + P.LastName [Full Name]
FROM dbo.Person P 
GO

SELECT P.Code , 
       CONCAT(P.FirstName,' ',P.LastName) [Full Name]
FROM dbo.Person P 
GO


--JFYI
--ESLint: The fully pluggable JavaScript code quality tool. 
--A pluggable and configurable linter tool for identifying and reporting on patterns in JavaScript. 
--Maintain your code quality with ease; TSLint: An extensible linter for the TypeScript language.


--TOP is being used in a SELECT statement without a subsequent ORDER BY clause.

-- OLD-Style
SELECT TOP 7
        P.Code , 
       CONCAT(P.FirstName,' ',P.LastName) [Full Name]
FROM dbo.Person P 
GO

SELECT TOP (7)
        P.Code , 
       CONCAT(P.FirstName,' ',P.LastName) [Full Name]
FROM dbo.Person P 
GO


SELECT TOP 50 PERCENT
        P.Code , 
       CONCAT(P.FirstName,' ',P.LastName) [Full Name]
FROM dbo.Person P 
GO

SELECT TOP (50) PERCENT
        P.Code , 
       CONCAT(P.FirstName,' ',P.LastName) [Full Name]
FROM dbo.Person P 
GO

SELECT TOP (7)
        P.Code , 
       CONCAT(P.FirstName,' ',P.LastName) [Full Name]
FROM dbo.Person P 
ORDER BY p.Code
GO


SELECT P.FirstName
FROM dbo.Person P 
GO

SELECT DISTINCT P.FirstName
FROM dbo.Person P 
GO

SELECT DISTINCT P.FirstName ,P.LastName
FROM dbo.Person P 
GO


SELECT DISTINCT p.Code , P.FirstName -- PK && DISTINCT !!!
FROM dbo.Person P 
GO


SELECT P.Code , 
       CONCAT(P.FirstName,' ',P.LastName) [Full Name],
	   DATEDIFF( YEAR , P.BirthDate , GETDATE()) Age
FROM dbo.Person P 
GO

SELECT P.Code , 
       CONCAT(P.FirstName,' ',P.LastName) [Full Name],
	   DATEDIFF( YEAR , P.BirthDate , GETDATE()) Age
FROM dbo.Person P 
ORDER BY Age
GO


SELECT P.Code , 
       CONCAT(P.FirstName,' ',P.LastName) [Full Name],
	   ISNULL(DATEDIFF( YEAR , P.BirthDate , GETDATE()),0) Age
FROM dbo.Person P 
ORDER BY Age
GO

SELECT P.Code , 
       CONCAT(P.FirstName,' ',P.LastName) [Full Name],
	   ISNULL(DATEDIFF( YEAR , P.BirthDate , GETDATE()),'N/A') Age
FROM dbo.Person P 
ORDER BY Age
GO

--Conversion failed when converting the varchar value 'N/A' to data type int.


SELECT P.Code , 
       CONCAT(P.FirstName,' ',P.LastName) [Full Name],
	   p.BirthDate,
	   ISNULL(DATEDIFF( YEAR , P.BirthDate , GETDATE()),0) Age
FROM dbo.Person P 
ORDER BY P.BirthDate
GO


SELECT P.Code , 
       CASE WHEN p.Gender = 0 THEN N'سر کار خانم' ELSE N'جناب آقای' END Title,
       CONCAT(P.FirstName,' ',P.LastName) [Full Name],
	   ISNULL(DATEDIFF( YEAR , P.BirthDate , GETDATE()),0) Age
FROM dbo.Person P 
ORDER BY P.BirthDate
GO


SELECT P.Code,
       CASE
           WHEN P.Gender = 0 THEN
               N'سر کار خانم'
           ELSE
               N'جناب آقای'
       END Title,
       CONCAT(P.FirstName, ' ', P.LastName) [Full Name],
       ISNULL(DATEDIFF(YEAR, P.BirthDate, GETDATE()), 0) Age
FROM dbo.Person P
ORDER BY P.BirthDate;
GO


SELECT P.Code,
       CONCAT(
       CASE
           WHEN P.Gender = 0 THEN
               N' سر کار خانم '
           ELSE
               N' جناب آقای '
       END ,
       CONCAT(P.FirstName, ' ', P.LastName)) [Full Name],
       ISNULL(DATEDIFF(YEAR, P.BirthDate, GETDATE()), 0) Age
FROM dbo.Person P
ORDER BY P.BirthDate;
GO

--------------

-- case when : جناب آقای کاربر علی علوی

-- نقش - جنسیت - اسم و فامیل

-------------------------------
USE DotinBootCamp
GO

SELECT * FROM dbo.Role
GO


SELECT P.Code,
       CONCAT(
       CASE
           WHEN P.Gender = 0 AND p.RoleCode = 2 THEN N' دانش جوی گرامی سرکار خانم '
           WHEN P.Gender = 1 AND p.RoleCode = 2 THEN N' دانش جوی گرامی جناب آقای '
		   ELSE ''
       END ,
       CONCAT(P.FirstName, ' ', P.LastName)) [Full Name],
       ISNULL(DATEDIFF(YEAR, P.BirthDate, GETDATE()), 0) Age
FROM dbo.Person P
ORDER BY P.BirthDate;
GO

-------------------------------------

SELECT *
FROM dbo.Person P
ORDER BY P.FirstName
GO

SELECT *
FROM dbo.Person P
ORDER BY P.FirstName ASC
GO

SELECT *
FROM dbo.Person P
ORDER BY P.FirstName DESC
GO

SELECT *
FROM dbo.Person P
ORDER BY P.FirstName ASC ,P.LastName DESC
GO

SELECT *
FROM dbo.Person P
ORDER BY 70 -- The ORDER BY position number 70 is out of range of the number of items in the select list.
GO

SELECT P.code , 
       ISNULL(DATEDIFF(YEAR, P.BirthDate, GETDATE()), 0) Age
FROM dbo.Person P
ORDER BY Age -- با الیاس اوکی است !!
GO

SELECT TOP(5) p.Code,
              p.RoleCode,
              p.EducationCode,
              p.FirstName,
              p.LastName,
              p.Gender,
              p.BirthDate,
              p.Slogan
FROM dbo.Person p
ORDER BY p.Code DESC
GO

-------------------------- اولین تسک تیمی

-- با دستوراتی که یاد گرفتیم

-- لیست افراد 
-- خانم ها به صورت صعودی مرتب شوند
-- آقایون به صورت نزولی مرتب شوند
-- بر اساس اسم 

--------------------------------------------------

ALTER TABLE dbo.Person
ADD FullName AS
(CONCAT(FirstName,' ',LastName))
GO

SELECT *
FROM dbo.Person
GO

-- تسک دوم
-- is persisted 
-- what?
-- yes / no کی نمیتونه یس باشه
-- 2 تا اسم مهم در جواب باید باشد

---------------------------------
USE Weblog2023Dotin
GO

ALTER TABLE Person.Activity
ADD CONSTRAINT Point_Range CHECK 
        (Point % 1000 = 0 AND Point BETWEEN 1000 AND 20000)
GO

UPDATE Person.Activity
SET Point = 5001
GO

--The UPDATE statement conflicted with the CHECK constraint "Point_Range". 
--The conflict occurred in database "Weblog2023Dotin", 
--table "Person.Activity", column 'Point'.

GO

USE DotinBootCamp
GO



-- CONDITION
-- LOGICAL OPERATOR
-- منطق 
-- AND / OR 
-- شرط همیشه درست
-- 1==1 2>1 

-- SQL INJECTION


SELECT *
FROM dbo.Person P
--WHERE 1=1
WHERE P.Gender = 0
GO

UPDATE dbo.Person
SET Gender = 1
WHERE Code = 29
GO

SELECT *
FROM dbo.Person P
--WHERE 1=1
--WHERE P.Gender = 0
--WHERE P.RoleCode = 1
--WHERE P.FirstName = 'علی'
--WHERE P.FirstName = N'علی'
--WHERE P.BirthDate > '2000-01-01'
--WHERE P.BirthDate > '1999-01-01' AND P.BirthDate < '2000-01-01'
--WHERE P.BirthDate BETWEEN '1999-01-01' AND '2000-01-01'
--WHERE P.BirthDate NOT BETWEEN '1999-01-01' AND '2000-01-01'
--WHERE P.RoleCode = 1 OR P.RoleCode = 2 OR P.RoleCode = 3
--WHERE P.RoleCode = 1 AND P.RoleCode = 2 AND P.RoleCode = 3
--WHERE P.RoleCode IN (1,2,3)
--WHERE P.RoleCode NOT IN (1,2,3)
--WHERE p.FirstName <> N'علی' AND p.FirstName <> N'فاطمه'
--WHERE p.Gender = 1 AND p.FirstName = N'علی'
WHERE p.Gender = 1 OR p.FirstName = N'علی'

GO

PRINT 1990-01-01
GO


ALTER TABLE dbo.Person
ADD MentorNote NVARCHAR(250) NULL
GO

UPDATE dbo.Person
SET mentornote = N'جهت تست'
WHERE Code % 2 = 1
GO


SELECT *
FROM dbo.Person P
--WHERE P.mentornote = NULL  -- چت 
--WHERE P.mentornote <> NULL
--WHERE p.mentornote IS NULL
--WHERE p.mentornote IS NOt NULL
--WHERE p.mentornote IN('aaa','bbb','ccc')
--WHERE p.mentornote IN('aaa','bbb','ccc',NULL)
WHERE p.mentornote IN('جهت تست','bbb','ccc',NULL) -- چت
GO


USE Weblog2023Dotin
GO

SELECT *
FROM dbo.Person
--WHERE FirstName LIKE N'%س%'
--WHERE FirstName LIKE N'س%'
--WHERE FirstName LIKE N'%%'
--WHERE FirstName LIKE N'%علی%'
--WHERE FirstName LIKE N'%رضا%'
--WHERE FirstName LIKE N'س%' AND FirstName LIKE N'%س'
WHERE FirstName LIKE N'س%س' 
GO

USE DotinBootCamp
GO

SET ANSI_NULLS OFF
GO

SELECT *
FROM dbo.Person P
--WHERE P.mentornote = NULL  -- چت 
--WHERE P.mentornote <> NULL
GO


SELECT COALESCE(NULL , 123 , NULL , 'abc')
GO


USE Weblog2023Dotin
GO

SELECT *
FROM dbo.Person
--WHERE FirstName LIKE N'%س%'
--WHERE FirstName LIKE N'س%'
--WHERE FirstName LIKE N'%%'
--WHERE FirstName LIKE N'%علی%'
--WHERE FirstName LIKE N'%رضا%'
--WHERE FirstName LIKE N'س%' AND FirstName LIKE N'%س'
--WHERE FirstName LIKE N'س%س' 
--WHERE FirstName LIKE N'_aren'
--WHERE FirstName LIKE N'__r%'
--WHERE FirstName LIKE N'[a-r]%'
--WHERE FirstName LIKE N'[^a-r]%'
--WHERE FirstName LIKE N'[abcf]%'
--WHERE FirstName LIKE N'[^abcf]%'
--WHERE FirstName LIKE N'%]%'
--WHERE FirstName LIKE N'%[[]%'
WHERE FirstName LIKE N'[%]%'
GO


-- اسم و سر گروه
-- T1 : alie , yasamin , mehran , mostafa , fateme(zohrabi)
-- T2 : fateme(rahimi) , hosein(najaf abadi) , amir ali , asal
-- T3 : Vafa , Peiman , Faeze , Bahar , Mohsen
-- T4 : Reihane , Roya , Hamid Reza , Amin Ghaderi
-- T5 : Farshad , Kianoosh , Saman , Amir Hosein
-- T6 : ali khadempour , zahra sadighi , newsha mortazavi , fateme syf
-- T7 : ali taheri  , mohamad amin ( ferghat) , masood , ali soltani

-----------------------------------------

https://learn.microsoft.com/en-us/sql/t-sql/functions/mathematical-functions-transact-sql?view=sql-server-ver16

https://learn.microsoft.com/en-us/sql/t-sql/functions/date-and-time-data-types-and-functions-transact-sql?view=sql-server-ver16

https://learn.microsoft.com/en-us/sql/t-sql/functions/string-functions-transact-sql?view=sql-server-ver16

https://learn.microsoft.com/en-us/sql/t-sql/functions/conversion-functions-transact-sql?view=sql-server-ver16

------------------------------------------

PRINT SQRT(9)
PRINT PI()
PRINT SQUARE(5)
PRINT SQUARE(9)
PRINT ROUND (12345.4555,2)
PRINT ROUND (12345.4666,2)
PRINT ROUND (12345.9999,2)
PRINT ROUND (12345.9999,0)
PRINT FLOOR (12345.9999) -- جز صحیح
PRINT ABS (-123) -- قدر مطلق
PRINT POWER(2,5)
PRINT POWER(5,2)

GO

PRINT GETDATE()
PRINT GETUTCDATE() 
PRINT CURRENT_TIMESTAMP

PRINT DATEADD(DAY,10,GETDATE())
PRINT DATEADD(MONTH,10,GETDATE())
PRINT DATEADD(YEAR,-10,GETDATE())

PRINT ISDATE(GETDATE())
PRINT ISDATE('1362/11/11')
PRINT ISDATE('2000/02/30')
PRINT ISDATE('2000/02/20')
PRINT ISDATE('2000/02/29')

-- اگر فقط شامل یک دستور بود
-- نیازی به بلوک ندارد
-- اینجا بلوک با 
-- BEGIN , END
-- مشخص میشود


IF ISDATE('2000/02/10') = 0
	PRINT ' ITS FALSE '
ELSE
	PRINT 'OKKKKKKKK'
GO




-- اگر  شامل بیش از یک دستور بود
-- حتمن نیاز به بلوک دارد
-- اینجا بلوک با 
-- BEGIN , END
-- مشخص میشود

IF ISDATE('2000/02/10') = 0
BEGIN
     PRINT 'FALSE1'
     PRINT 'FALSE2'
END
ELSE
BEGIN 
     PRINT 'OKKKKKKKK 1'
     PRINT 'OKKKKKKKK 2'
END
GO




-- چون بلوک ندارد فقط یک دستور را شامل میشود
--و دستورات بعدی مستقل از شرط هستند 

IF ISDATE('2000/02/30') = 0
	PRINT ' ITS FALSE '
PRINT ' ربطی به شرط ندارد'
GO


IF ISDATE('2000/02/10') = 0
    PRINT ' ITS FALSE '
PRINT ' ربطی به شرط ندارد'
GO

-- C,c++ is Case Sensitive

-- American Standard Code for Information Interchange

PRINT ASCII('A')
PRINT ASCII('Z')
PRINT ASCII('a')
PRINT ASCII('z')

PRINT UPPER('soroush')
PRINT LOWER('SADR123')

PRINT CHAR(38)
PRINT CHAR(39)
PRINT CHAR(40)

PRINT CHAR (97)
PRINT CHAR (65)

PRINT CHAR (1)
PRINT CHAR (2)
PRINT CHAR (3)
PRINT CHAR (4)
--------------------
PRINT LEFT('SOROUSH' , 2)
PRINT RIGHT('SOROUSH' , 2)

-- Remove White Spaces
PRINT LTRIM ('         ali            ')
PRINT RTRIM ('         ali            ')
PRINT TRIM ('          @         ali            !           ')

PRINT REPLICATE ('A',8000)
GO


DECLARE @FIRST_NAME NVARCHAR(50)
SET @FIRST_NAME = 'AAABBBCCC'
PRINT @FIRST_NAME
GO
PRINT @FIRST_NAME
GO

DECLARE @CODE UNIQUEIDENTIFIER -- C# : GUID
SET @CODE = NEWID()
PRINT @CODE
PRINT REPLACE(@CODE , '-','')
PRINT SUBSTRING(REPLACE(@CODE , '-',''),1,10) -- 10 تای اول
GO

PRINT CONCAT('ALIE',REPLACE(NEWID() , '-',''))
GO


DECLARE @MAX_VALUE INT = 100
PRINT CONCAT( 'Initial Value : ', @MAX_VALUE)

WHILE @MAX_VALUE < 130
BEGIN
    PRINT @MAX_VALUE
    SET @MAX_VALUE = @MAX_VALUE + 1
END
GO

-- تسک سوم 
-- کد اسکی به همراه کاراکتر آن

-- 65 : A
-- 97 : a
-- 1 : BB
-- 2 : CC
-- 3 : DD
--255

GO

--Conversion failed when converting the nvarchar value 'سروش صدر' to data type int.
SELECT P.ID + ' ' + P.FirstName AS NOTE
FROM Person P
GO


USE DotinBootCamp
GO

SELECT CAST(P.Code AS VARCHAR(10)) + ' : ' + P.FullName AS NOTE
FROM Person P
GO

SELECT CAST(P.Code AS VARCHAR(3)) + ' : ' + P.FullName AS NOTE
FROM Person P
GO

SELECT CONVERT(VARCHAR(3),P.Code) + ' : ' + P.FullName AS NOTE
FROM Person P
GO

USE Weblog2023Dotin
GO


SELECT P. ID , 
       P.FirstName , 
       P.CreateDateTime,
	   CAST (P.CreateDateTime AS DATE) JUSTDATE,
	   CONVERT(DATE,P.CreateDateTime) JUSTDATE2
FROM Person P
GO



--https://learn.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver16

SELECT P. ID , 
       P.FirstName , 
       P.BirthDate,
	   DATENAME(MONTH,p.birthdate),
	   DATENAME(WEEKDAY,p.birthdate),
	   DATENAME(QUARTER,p.birthdate),
	   MONTH(p.birthdate),
	   CONVERT(NVARCHAR(50),P.BirthDate,113) ,
	   CONVERT(NVARCHAR(50),P.BirthDate,101) ,
	   CONVERT(NVARCHAR(50),P.BirthDate,102),
	   CONVERT(NVARCHAR(50),P.BirthDate,103),
	   CONVERT(NVARCHAR(50),P.BirthDate,104),
	   CONVERT(NVARCHAR(50),P.BirthDate,105),
	   CONVERT(NVARCHAR(50),P.BirthDate,106),
	   CONVERT(NVARCHAR(50),P.BirthDate,107),
	   CONVERT(NVARCHAR(50),P.BirthDate,130),
	   CONVERT(NVARCHAR(50),P.BirthDate,131)
	   
FROM Person P
GO

/* استفاده همزمان از این دوتا
تیمی
SELECT CHOOSE(3,'AAA','BBB' ,'CCC','DDD')
DATENAME(QUARTER,p.birthdate),
*/

/* استفاده همزمان از این دوتا
تیمی
SELECT CHOOSE(3,'AAA','BBB' ,'CCC','DDD')
MONTH(p.birthdate),
*/

-- OLTP : ONLINE TRANSACTION PROCESS 
-- OLAP : ONLINE ANALYTICAL  PROCESS

-- چتی
--OLTP VS OLAP 

-----------------------------

-- AGGREGATE FUNCTIONS
-- SUM , COUNT , AVG , MAX , MIN , ...

USE DotinBootCamp
GO

SELECT COUNT(*) TEDAD
FROM dbo.Person
GO

-- SP SYSTEM , STORED PROCEDURE

sys.sp_spaceused @objname = N'dbo.Person'
GO

sp_spaceused N'dbo.Person'
GO

sp_spaceused
GO


SELECT COUNT(p.Code) TEDAD -- PK
FROM dbo.Person p
GO

SELECT COUNT(p.MentorNote) TEDAD
FROM dbo.Person p
GO

SELECT COUNT(p.FirstName) TEDAD
FROM dbo.Person p
GO

SELECT COUNT(DISTINCT p.FirstName) TEDAD
FROM dbo.Person p
GO

USE Weblog2023Dotin
GO

SELECT COUNT(a.Code) TEDAD,
       SUM(A.Point) SUM_POINT,
	   MAX(A.Point) MAX_POINT,
	   MIN(A.Point) MIN_POINT,
	   AVG(A.Point) AVG_POINT
FROM Person.Activity A
GO


--Column 'Person.Activity.Title' is invalid 
--in the select list 
--because it is not contained in either an aggregate function 
--or the GROUP BY clause.

SELECT A.Title ,
       SUM(A.Point) SUM_POINT
FROM Person.Activity A
GO
-- post : 16
-- comm : 16
-- like : 16

SELECT MIN(A.Title) max_title ,
       SUM(A.Point) SUM_POINT
FROM Person.Activity A
GO

SELECT p.Gender , COUNT(p.ID) tedad
FROM dbo.Person P
GROUP BY p.Gender
GO

SELECT p.Gender , 
       COUNT(p.ID) tedad
FROM dbo.Person P
WHERE 1=1
GROUP BY p.Gender
ORDER BY 1
GO

USE DotinBootCamp
GO

SELECT P.RoleCode , COUNT(P.Code)
FROM dbo.Person P
GO

SELECT MAX(P.RoleCode) , COUNT(P.Code)
FROM dbo.Person P
GO

SELECT P.RoleCode , COUNT(P.Code) TEDAD
FROM dbo.Person P
GROUP BY P.RoleCode
GO


SELECT P.FirstName , 
       COUNT(P.CODE) TEDAD
FROM dbo.Person P
GROUP BY P.FirstName
ORDER BY TEDAD DESC
GO

SELECT P.FirstName , 
       COUNT(P.CODE) TEDAD
FROM dbo.Person P
WHERE P.RoleCode = 2 -- بی اثر
GROUP BY P.FirstName
HAVING COUNT(P.CODE) > 1
ORDER BY TEDAD DESC
GO


SELECT P.CODE ,
       P.FirstName , 
       COUNT(P.CODE) TEDAD
FROM dbo.Person P
WHERE P.RoleCode = 2 -- بی اثر
GROUP BY P.FirstName , P.Code
ORDER BY TEDAD DESC
GO


SELECT P.BirthDate ,   
       COUNT(P.CODE) TEDAD
FROM dbo.Person P
WHERE P.RoleCode = 2 -- بی اثر
GROUP BY P.BirthDate
ORDER BY TEDAD DESC
GO

SELECT P.FirstName , P.BirthDate ,   
       COUNT(P.CODE) TEDAD
FROM dbo.Person P
WHERE P.RoleCode = 2 -- بی اثر
GROUP BY P.BirthDate , P.FirstName
ORDER BY P.BirthDate DESC
GO


SELECT YEAR(P.BirthDate)   YEAR,
       COUNT(P.CODE) TEDAD
FROM dbo.Person P
WHERE P.RoleCode = 2 -- بی اثر
GROUP BY YEAR(P.BirthDate)
ORDER BY TEDAD DESC
GO

SELECT MONTH(P.BirthDate)   MONTH_Code,
       COUNT(P.CODE) TEDAD
FROM dbo.Person P
WHERE P.RoleCode = 2 -- بی اثر
GROUP BY MONTH(P.BirthDate)
ORDER BY TEDAD DESC
GO


SELECT P.FirstName , 
       p.LastName,
       P.BirthDate ,   
       COUNT(P.CODE) TEDAD
FROM dbo.Person P
WHERE P.BirthDate IS NOT NULL
GROUP BY P.BirthDate , P.FirstName , p.LastName
ORDER BY TEDAD DESC
GO

SELECT P.FirstName , 
       p.LastName,
       P.BirthDate ,   
       COUNT(P.CODE) TEDAD
FROM dbo.Person P
WHERE P.BirthDate IS NOT NULL
GROUP BY P.FirstName,
         P.LastName,
         P.BirthDate
GO

SELECT P.FirstName , 
       COUNT(P.CODE) TEDAD
FROM dbo.Person P
WHERE P.BirthDate IS NOT NULL
GROUP BY P.FirstName,
         MONTH(p.BirthDate)
ORDER BY 1
GO

-- https://learn.microsoft.com/en-us/sql/relational-databases/user-defined-functions/deterministic-and-nondeterministic-functions?view=sql-server-ver16

USE Weblog2023Dotin
GO


SELECT COUNT(A.Code) TEDAD, 
       SUM(A.Point) TOTAL
FROM Person.Activity A
WHERE A.Code > 10
GO

-- NVL
SELECT COUNT(A.Code) TEDAD, 
       ISNULL(SUM(A.Point),0) TOTAL
FROM Person.Activity A
WHERE A.Code > 10
GO

-----------------  JOIN ------------------------
/*
1-Inner Join (natural join)
	includes only matching rows ==> PK , FK (فعلا)


2-Left outer join
	includes all rows from the left table
	regardless of whether a match exists,
	and matching rows from the right table

3-Right outer join
	includes all rows from the right table
	regardless of whether a match exists,
	and matching rows from the left table

4-Full outer join
	includes all the rows from both tables
	regardless of whether a match exists


5-Theta Join - اصطلاح
	Matches rows using a non-equal condition
	( < , > , <= , >= ,<> )


6-Cross Join (Unrestricted) Joins
	(No join connection) Produces a Cartesian Product

    The cross join, also called an unrestricted join,
    is a pure relational algebra multiplication of the two
    source tables.
    Without a join condition restricting the result set,
    the result set includes every possible
    combination of rows from the data sources.

 Each row in data set one is matched with every row in data
set two — for example, if the first data source has five rows
 and the second data source has four rows,
a cross join between them would result in 20 rows.
 This type of result set is referred to as a Cartesian
product.


7- Self Join اصطلاح
   A self-join is a join that refers back 
   to the same table. 

--------------------------------


----------------------------------
2- left/right Outer join

The common customer-order query demonstrates this problem well.
If the requirement is to build a query that
 lists all customers plus their recent orders,
only an outer join can retrieve every customer whether
the customer has placed an order or not.
An inner join between customers and orders would
miss every customer who did not place a recent order.	





----------------------------------
7- Self Join
   A self-join is a join that refers back to the same table. 

This type of unary relationship is often used to
extract data from a reflexive (also called a recursive)
 relationship, such as organizational charts (employee
to boss).
 Think of a self-join as a table being joined with a
 temporary copy of itself

-----------------------------------

Exotic Joins
Nearly all joins are based on a condition of equality
 between the primary key of a primary table and the
foreign key of a secondary table, 
which is why the inner join is sometimes called an equi-join.
 Although
it’s common place to base a join on a single equal condition,
 it is not a requirement.
 The condition
between the two columns is not necessarily equal,
 nor is the join limited to one condition.

 */

 -- WROX   ( ADV )
 -- APRESS
 -- MICROSOFT ( START )
 -- O'Reilly
 -- PAKT

 -----------------------------

 USE Weblog2023Dotin
 GO

SELECT P.ID,
       P.FirstName,
       P.LastName,
       R.TitleFa,
       R.TitleEn
FROM dbo.Person P
INNER JOIN dbo.Role R ON R.Code = P.RoleCode;
GO


SELECT P.ID ,
       P.FirstName , 
	   R.*
FROM dbo.Person P
INNER JOIN dbo.Role R ON R.Code = P.RoleCode;
GO

SELECT P.ID ,
       P.FirstName , 
	   R.*
FROM dbo.Person P
INNER JOIN dbo.Role R ON (R.Code = P.RoleCode)
GO

SELECT P.ID ,
       P.FirstName , 
	   R.*
FROM dbo.Person P JOIN dbo.Role R ON R.Code = P.RoleCode;
GO

SELECT * FROM dbo.Person
SELECT * FROM dbo.Role

SELECT R.* , P.FirstName
FROM dbo.Role R LEFT OUTER JOIN dbo.Person P
ON P.RoleCode = R.Code
GO

SELECT R.* , P.*
FROM dbo.Role R LEFT OUTER JOIN dbo.Person P
ON P.RoleCode = R.Code
GO

UPDATE dbo.Person
SET RoleCode = NULL
WHERE ID = 12
GO

--Cannot insert the value NULL into column 'RoleCode', 
--table 'Weblog2023Dotin.dbo.Person'; 
--column does not allow nulls. UPDATE fails.


ALTER TABLE dbo.Person
ALTER COLUMN RoleCode TINYINT NULL
GO

UPDATE dbo.Person
SET RoleCode = NULL
WHERE ID = 12
GO

SELECT P.ID ,
       P.FirstName , 
	   R.*
FROM dbo.Person P INNER JOIN dbo.Role R ON R.Code = P.RoleCode;
GO

SELECT P.ID ,
       P.FirstName , 
	   R.*
FROM dbo.Person P LEFT OUTER JOIN dbo.Role R ON R.Code = P.RoleCode;
GO

SELECT P.*, 
	   R.*
FROM dbo.Person P FULL OUTER JOIN dbo.Role R ON R.Code = P.RoleCode;
GO

SELECT *
FROM dbo.Person P
CROSS JOIN dbo.Role R
GO

SELECT *
FROM dbo.Person P , dbo.Role R
GO
------------------------------
-- به یه شکل دیگری طراحی شود
-- Size ( m,s,l,xl,xxl,...) ( code , title )
-- Color( blue , red , white ) (code , title )
-- Brand ( a,b,c,d )           ( code , title )
------------------------------

GO

SELECT PE.ID , 
       PE.FirstName , 
	   PO.Title , 
	   PO.Body
FROM dbo.Person PE
INNER JOIN dbo.Post PO ON PO.PersonID = PE.ID
GO


SELECT PE.ID , 
       PE.FirstName , 
	   C.Title CAT_TITLE,
	   PO.Title POST_TITLE, 
	   PO.Body
FROM dbo.Person PE
INNER JOIN dbo.Post PO ON PO.PersonID = PE.ID
INNER JOIN dbo.Category C ON C.ID = PO.CategoryID
GO


SELECT PE.ID , 
       PE.FirstName , 
	   CA.Title CAT_TITLE,
	   PO.Title POST_TITLE, 
	   PO.Body POST_BODY,
	   CO.Body COMMENT_BODY
FROM dbo.Person PE
INNER JOIN dbo.Post PO ON PO.PersonID = PE.ID
INNER JOIN dbo.Category CA ON CA.ID = PO.CategoryID
INNER JOIN dbo.Comment CO ON CO.PostID = PO.ID
GO


SELECT PE.ID , 
       PE.FirstName , 
	   R.TitleFa,
	   CA.Title CAT_TITLE,
	   PO.Title POST_TITLE, 
	   PO.Body POST_BODY,
	   CO.Body COMMENT_BODY
FROM dbo.Person PE
INNER JOIN dbo.Post PO ON PO.PersonID = PE.ID
INNER JOIN dbo.Category CA ON CA.ID = PO.CategoryID
LEFT OUTER JOIN dbo.Comment CO ON CO.PostID = PO.ID
INNER JOIN dbo.Role R ON R.Code = PE.RoleCode
GO


SELECT PE.ID , 
       PE.FirstName , 
	   R.TitleFa,
	   CA.Title CAT_TITLE,
	   PO.Title POST_TITLE, 
	   PO.Body POST_BODY,
	   CO.Body COMMENT_BODY,
	   K.Title KEY_TITLE
FROM dbo.Person PE
INNER JOIN dbo.Post PO ON PO.PersonID = PE.ID
INNER JOIN dbo.Category CA ON CA.ID = PO.CategoryID
LEFT OUTER JOIN dbo.Comment CO ON CO.PostID = PO.ID
INNER JOIN dbo.Role R ON R.Code = PE.RoleCode
INNER JOIN dbo.Post_Keyword PK ON PK.PostID = PO.ID
INNER JOIN dbo.Keyword K ON K.ID = PK.KeywordID
GO


SELECT PE.ID , 
       PE.FirstName , 
	   R.TitleFa,
	   CA.Title CAT_TITLE,
	   PO.Title POST_TITLE, 
	   PO.Body POST_BODY,
	   CO.Body COMMENT_BODY,
	   K.Title KEY_TITLE
FROM dbo.Person PE
INNER JOIN dbo.Post PO ON PO.PersonID = PE.ID
INNER JOIN dbo.Category CA ON CA.ID = PO.CategoryID
LEFT OUTER JOIN dbo.Comment CO ON CO.PostID = PO.ID
INNER JOIN dbo.Role R ON R.Code = PE.RoleCode
LEFT OUTER JOIN dbo.Post_Keyword PK ON PK.PostID = PO.ID
LEFT OUTER JOIN dbo.Keyword K ON K.ID = PK.KeywordID
GO



SELECT PE.ID , 
       PE.FirstName , 
	   R.TitleFa,
	   CA.Title CAT_TITLE,
	   PO.Title POST_TITLE, 
	   PO.Body POST_BODY,
	   CO.Body COMMENT_BODY,
	   STRING_AGG(K.Title,',') KEY_TITLE
FROM dbo.Person PE
INNER JOIN dbo.Post PO ON PO.PersonID = PE.ID
INNER JOIN dbo.Category CA ON CA.ID = PO.CategoryID
LEFT OUTER JOIN dbo.Comment CO ON CO.PostID = PO.ID
INNER JOIN dbo.Role R ON R.Code = PE.RoleCode
LEFT OUTER JOIN dbo.Post_Keyword PK ON PK.PostID = PO.ID
LEFT OUTER JOIN dbo.Keyword K ON K.ID = PK.KeywordID
GROUP BY PE.ID,
         PE.FirstName,
         R.TitleFa,
         CA.Title,
         PO.Title,
         PO.Body,
         CO.Body
GO

-- ACTIVITY
-- PERSON
-- PERSON_ACTIVITY

SELECT PE.FirstName , PE.LastName , SUM(A.Point) Total
FROM dbo.Person PE
INNER JOIN dbo.Person_Activity AP ON PE.ID = AP.PersonID
INNER JOIN Person.Activity A ON A.Code = AP.ActivityCode
GROUP BY PE.FirstName , PE.LastName , PE.ID
GO

SELECT PE.FirstName , PE.LastName , SUM(A.Point) Total
FROM dbo.Person PE
INNER JOIN dbo.Person_Activity AP ON PE.ID = AP.PersonID
INNER JOIN Person.Activity A ON A.Code = AP.ActivityCode
GROUP BY PE.FirstName , PE.LastName 
GO

---------------------------------------------


-----------------------SESSION 06------------------------
SELECT PE.FirstName,
       PE.LastName,
       SUM(A.Point) Total
FROM dbo.Person PE
    INNER JOIN dbo.Person_Activity AP
        ON PE.ID = AP.PersonID
    INNER JOIN Person.Activity A
        ON A.Code = AP.ActivityCode
GROUP BY FirstName,
         LastName,
         ID -- Ambiguous column name 'ID'.
ORDER BY Total DESC;
GO


SELECT PE.FirstName,
       PE.LastName,
      ISNULL(SUM(A.Point),0) Total
FROM dbo.Person PE
    LEFT OUTER JOIN dbo.Person_Activity AP
        ON PE.ID = AP.PersonID
    LEFT OUTER JOIN Person.Activity A
        ON A.Code = AP.ActivityCode
GROUP BY PE.FirstName,
         PE.LastName,
         PE.ID 
ORDER BY Total DESC;
GO


SELECT PE.FirstName,
       PE.LastName,
      ISNULL(SUM(A.Point),0) Total
FROM dbo.Person PE
    INNER JOIN dbo.Person_Activity AP
        ON PE.ID = AP.PersonID
    INNER JOIN Person.Activity A
        ON A.Code = AP.ActivityCode
GROUP BY PE.FirstName,
         PE.LastName,
         PE.ID 
HAVING ISNULL(SUM(A.Point),0) >= 10000
ORDER BY Total DESC;
GO

------------------------------------------

SELECT PE.ID , 
       PE.FirstName , 
	   R.TitleFa,
	   CA.Title CAT_TITLE,
	   PO.Title POST_TITLE, 
	   PO.Body POST_BODY,
	   CO.Body COMMENT_BODY,
	   PE_COM.FirstName COMMENT_AUTHOR,
	   STRING_AGG(K.Title,',') KEY_TITLE
FROM dbo.Person PE
INNER JOIN dbo.Post PO ON PO.PersonID = PE.ID
INNER JOIN dbo.Category CA ON CA.ID = PO.CategoryID
LEFT OUTER JOIN dbo.Comment CO ON CO.PostID = PO.ID
INNER JOIN dbo.Role R ON R.Code = PE.RoleCode
LEFT OUTER JOIN dbo.Post_Keyword PK ON PK.PostID = PO.ID
LEFT OUTER JOIN dbo.Keyword K ON K.ID = PK.KeywordID
INNER JOIN dbo.Person PE_COM ON PE_COM.ID = CO.PersonID
GROUP BY PE.ID,
         PE.FirstName,
         R.TitleFa,
         CA.Title,
         PO.Title,
         PO.Body,
         CO.Body,
		 PE_COM.FirstName
GO

SELECT PE.ID , 
       PE.FirstName , 
	   R.TitleFa,
	   CA.Title CAT_TITLE,
	   PO.Title POST_TITLE, 
	   PO.Body POST_BODY,
	   CO.Body COMMENT_BODY,
	   PE_COM.FirstName COMMENT_AUTHOR,
	   STRING_AGG(K.Title,',') KEY_TITLE
FROM dbo.Person PE
INNER JOIN dbo.Post PO ON PO.PersonID = PE.ID
INNER JOIN dbo.Category CA ON CA.ID = PO.CategoryID
LEFT OUTER JOIN dbo.Comment CO ON CO.PostID = PO.ID
INNER JOIN dbo.Role R ON R.Code = PE.RoleCode
LEFT OUTER JOIN dbo.Post_Keyword PK ON PK.PostID = PO.ID
LEFT OUTER JOIN dbo.Keyword K ON K.ID = PK.KeywordID
LEFT OUTER JOIN dbo.Person PE_COM ON PE_COM.ID = CO.PersonID
GROUP BY PE.ID,
         PE.FirstName,
         R.TitleFa,
         CA.Title,
         PO.Title,
         PO.Body,
         CO.Body,
		 PE_COM.FirstName
GO


-------------------------------------------
-- CSV : COMMA SEPARATORED VALUES

DECLARE @tags NVARCHAR(400) = 'clothing,road,,touring,bike'  
SELECT *  
FROM STRING_SPLIT(@tags, ',')  
GO


DECLARE @tags NVARCHAR(400) = 'clothing,road,,touring,bike'  
SELECT value  
FROM STRING_SPLIT(@tags, ',')  
GO

DECLARE @tags NVARCHAR(400) = 'clothing,road,,touring,bike'  
SELECT value  
FROM STRING_SPLIT(@tags, ',')  
WHERE TRIM(value) <> '';
GO

-- CROSS JOIN & S_S
--https://learn.microsoft.com/en-us/sql/t-sql/functions/string-split-transact-sql?view=sql-server-ver16

GO

SELECT STRING_ESCAPE('SALAM		CHETORI?','json')
GO

SELECT STRING_ESCAPE('SALAM						CHETORI?','json')
GO

SELECT STRING_ESCAPE('"SALAM"','json')
GO

-------

ALTER SCHEMA PERSON
TRANSFER dbo.Account
GO

SELECT *
FROM Person.Account
GO
---------
--The objects "dbo.Category" and "dbo.Category" 
--in the FROM clause have the same exposed names. 
--USE correlation names to distinguish them.

--SELECT *
--FROM dbo.Category 
--INNER JOIN dbo.Category ON 

SELECT C1.Title , 
       C2.Title 
FROM dbo.Category C1 
INNER JOIN dbo.Category C2 ON C2.ParentID = C1.ID
GO

SELECT PARENT.Title PARENT , 
       CHILD.Title CHILD
FROM dbo.Category PARENT 
INNER JOIN dbo.Category CHILD ON CHILD.ParentID = PARENT.ID
ORDER BY PARENT
GO

SELECT PARENT.Title PARENT , 
       CHILD.Title CHILD
FROM dbo.Category PARENT 
LEFT OUTER JOIN dbo.Category CHILD ON CHILD.ParentID = PARENT.ID
ORDER BY PARENT
GO


SELECT PARENT.Title PARENT , 
       STRING_AGG( CHILD.Title , ' | ') CHILD
FROM dbo.Category PARENT 
INNER JOIN dbo.Category CHILD ON CHILD.ParentID = PARENT.ID
GROUP BY PARENT.Title
ORDER BY PARENT
GO

SELECT PARENT.Title PARENT , 
       COUNT(CHILD.Title) TEDAD
FROM dbo.Category PARENT 
INNER JOIN dbo.Category CHILD ON CHILD.ParentID = PARENT.ID
GROUP BY PARENT.Title
ORDER BY TEDAD DESC
GO

----------------------UNION-------------------------------
/*
Using Unions
 The union operation is different from a join.
 
 In relational algebra terms, 
 a union is addition, whereas a join is multiplication.
 
 Instead of extending a row horizontally as a join would, 
 the union, stacks multiple result sets,into a single long table

-----

Unions come in three basic flavors:
 union,
 intersect union,
 difference (or except) union

----------------

Every SELECT must have the same number of columns, 
and each column must share the 
same data-type family 
with the columns in the other queries.


The column names, or aliases, are determined by the first SELECT.


The order by clause sorts, the results of all the SELECTs 
and must go, on the last SELECT,
but it uses the column names from the first SELECT.


Expressions may be added to the SELECT statements 
to identify the source of the row 
so long as the column is added to every SELECT.

*/

SELECT 1,2,3
UNION
SELECT 4,5
--All queries combined using a UNION, INTERSECT or EXCEPT operator 
--must have an equal number of expressions in their target lists.
GO

SELECT 1,2,3
UNION
SELECT 4,5,6
GO

--Conversion failed when converting date and/or time from character string.
SELECT 1,2,'salam'
UNION
SELECT 4,5,GETDATE()
GO


SELECT 1,2,3
UNION
SELECT 1,2,4
GO

SELECT 1,2,3
UNION
SELECT 1,2,3
GO

SELECT 1,2,3
UNION ALL
SELECT 1,2,3
GO


SELECT 1 A ,2 B,3 C
UNION
SELECT 1 D,2 E,4 F
GO

SELECT 1 A ,2 B,3 C
UNION
SELECT 1 D,2 E,4 F
ORDER BY A DESC
GO

SELECT PE.ID ,PE.FirstName , PE.LastName
FROM dbo.Person PE
INNER JOIN dbo.Post PO ON PO.PersonID = PE.ID

UNION

SELECT PE.ID ,PE.FirstName , PE.LastName
FROM dbo.Person PE
INNER JOIN dbo.Comment C ON C.PersonID = PE.ID
GO


SELECT DISTINCT PE.ID ,PE.FirstName , PE.LastName
FROM dbo.Person PE
INNER JOIN dbo.Post PO ON PO.PersonID = PE.ID

UNION

SELECT DISTINCT PE.ID ,PE.FirstName , PE.LastName
FROM dbo.Person PE
INNER JOIN dbo.Comment C ON C.PersonID = PE.ID
GO

SELECT DISTINCT PE.ID ,PE.FirstName , PE.LastName
FROM dbo.Person PE
INNER JOIN dbo.Post PO ON PO.PersonID = PE.ID

INTERSECT

SELECT DISTINCT PE.ID ,PE.FirstName , PE.LastName
FROM dbo.Person PE
INNER JOIN dbo.Comment C ON C.PersonID = PE.ID
GO

SELECT DISTINCT PE.ID ,PE.FirstName , PE.LastName
FROM dbo.Person PE
INNER JOIN dbo.Post PO ON PO.PersonID = PE.ID

EXCEPT

SELECT DISTINCT PE.ID ,PE.FirstName , PE.LastName
FROM dbo.Person PE
INNER JOIN dbo.Comment C ON C.PersonID = PE.ID
GO
------------------------------------

-- خروجی حتمن 2 ستون داشته باشد

-- ALI    10000
-- REZA   20000
-- MONA   30000
-- TOTAL  60000 

-----------------------------------

-- خروجی حتمن 2 ستون داشته باشد
-- اسم دیتابیس و شناسه دیتابیس

-- لیست دیتابیس ها - بجز دیتابیس های سیستمی
-- چالش اول
-- ردیف اول : 
-- لطفا یک دیتابیس را انتخاب فرمایید
-- 

--      PLZ CHOOSE ONE DB....
-- 1    MYDB1
-- 2    MYDB2
-- 3    MYDB3

--------------------------------------------
GO

------------------ Subquery -------------------

SELECT (SELECT 'SALAM')

SELECT * FROM dbo.Person WHERE RoleCode = 1
SELECT * FROM dbo.Person WHERE RoleCode = (SELECT R.Code FROM dbo.Role R WHERE R.Code = 1)
SELECT * FROM dbo.Person WHERE RoleCode IN (1,4)
SELECT * FROM dbo.Person WHERE RoleCode IN (SELECT R.Code FROM dbo.Role R WHERE R.Code IN(1,4))
SELECT * FROM dbo.Person WHERE RoleCode = (SELECT R.Code FROM dbo.Role R WHERE R.Code IN(1,4))
SELECT * FROM dbo.Person WHERE RoleCode = (SELECT R.Code FROM dbo.Role R)

--Subquery returned more than 1 value. 
--This is not permitted when the subquery follows =, !=, <, <= , >, >= 
--OR when the subquery is used as an expression.

GO

-- SUBQUERY 
-- 1- SELECT
-- 2- FROM
-- 3- WHERE 


SELECT PE.ID , 
       PE.FirstName,
	   COUNT(PO.ID) TEDAD
FROM dbo.Person PE
INNER JOIN dbo.Post PO ON PO.PersonID = PE.ID
GROUP BY PE.ID,
         PE.FirstName
GO

SELECT PE.ID,
       PE.FirstName,
	   (SELECT COUNT(PO.ID) 
	    FROM dbo.Post PO 
		WHERE PO.PersonID = PE.ID) TEDAD
FROM dbo.Person PE
ORDER BY TEDAD DESC
GO


-- TNX TO MEHRAN
SELECT PE.ID,
       PE.FirstName,
	   (SELECT PO.TITLE 
	    FROM dbo.Post PO 
		WHERE PO.PersonID = PE.ID) TEDAD
FROM dbo.Person PE
ORDER BY TEDAD DESC
GO

-- TNX TO MEHRAN
SELECT PE.ID,
       PE.FirstName,
	   (SELECT TOP(1) PO.TITLE 
	    FROM dbo.Post PO 
		WHERE PO.PersonID = PE.ID) TEDAD
FROM dbo.Person PE
ORDER BY TEDAD DESC
GO


-- TNX TO MYSELF :-)
SELECT PE.ID,
       PE.FirstName,
	   (SELECT STRING_AGG(PO.TITLE , ',')
	    FROM dbo.Post PO 
		WHERE PO.PersonID = PE.ID) TEDAD
FROM dbo.Person PE
ORDER BY TEDAD DESC
GO

SELECT PE.ID,
       PE.FirstName,
	   (SELECT COUNT(PO.ID) 
	    FROM dbo.Post PO 
		WHERE PO.PersonID = PE.ID) TEDAD
FROM dbo.Person PE
WHERE TEDAD > 0
ORDER BY TEDAD DESC
GO

SELECT PE.ID,
       PE.FirstName,
	   (SELECT COUNT(PO.ID) 
	    FROM dbo.Post PO 
		WHERE PO.PersonID = PE.ID
		--HAVING COUNT(PO.ID) > 0
		) TEDAD
FROM dbo.Person PE
ORDER BY TEDAD DESC
GO

SELECT PE.ID,
       PE.FirstName,
	   (SELECT COUNT(PO.ID) 
	    FROM dbo.Post PO 
		WHERE PO.PersonID = PE.ID) TEDAD
FROM dbo.Person PE
WHERE (SELECT COUNT(PO.ID) 
	    FROM dbo.Post PO 
		WHERE PO.PersonID = PE.ID) > 0
ORDER BY TEDAD DESC
GO


SELECT *
FROM (
SELECT PE.ID,
       PE.FirstName,
	   (SELECT COUNT(PO.ID) 
	    FROM dbo.Post PO 
		WHERE PO.PersonID = PE.ID) TEDAD
FROM dbo.Person PE
ORDER BY TEDAD DESC
) TMP
WHERE TMP.TEDAD > 0
GO

-- The ORDER BY clause is invalid in 
-- views, inline functions, derived tables, 
-- subqueries, and common table expressions, 
-- unless TOP, OFFSET or FOR XML is also specified.


-- trick ***
SELECT *
FROM (
SELECT PE.ID,
       PE.FirstName,
	   (SELECT COUNT(PO.ID) 
	    FROM dbo.Post PO 
		WHERE PO.PersonID = PE.ID) TEDAD
FROM dbo.Person PE
) TMP
WHERE TMP.TEDAD > 0
ORDER BY TEDAD DESC
GO


SELECT *
FROM dbo.Person P 
INNER JOIN (SELECT *
            FROM dbo.Person_Activity PA) TMP_PA
ON TMP_PA.PersonID = P.ID
GO

------------------ CTE -------------------------

WITH PERSON_TOTAL_POINT ( FN , LN , TOTAL_POINT ) AS
(
    SELECT PE.FirstName,
           PE.LastName,
          SUM(A.Point)
FROM dbo.Person PE 
INNER JOIN dbo.Person_Activity AP ON PE.ID = AP.PersonID
INNER JOIN Person.Activity A ON A.Code = AP.ActivityCode
GROUP BY PE.FirstName,
         PE.LastName,
         PE.ID 
)

SELECT * 
FROM PERSON_TOTAL_POINT
ORDER BY PERSON_TOTAL_POINT.TOTAL_POINT DESC
GO


--'PERSON_TOTAL_POINT' has more columns than were specified in the column list.
--'PERSON_TOTAL_POINT' has fewer columns than were specified in the column list.
WITH PERSON_TOTAL_POINT ( FN , LN , AAA   ) AS
(
    SELECT PE.FirstName,
           PE.LastName,
          SUM(A.Point) BBB
FROM dbo.Person PE 
INNER JOIN dbo.Person_Activity AP ON PE.ID = AP.PersonID
INNER JOIN Person.Activity A ON A.Code = AP.ActivityCode
GROUP BY PE.FirstName,
         PE.LastName,
         PE.ID 
)

SELECT * 
FROM PERSON_TOTAL_POINT
ORDER BY PERSON_TOTAL_POINT.AAA DESC
GO



--No column name was specified for column 3 of 'PERSON_TOTAL_POINT'.

WITH PERSON_TOTAL_POINT AS
(
    SELECT PE.FirstName,
           PE.LastName,
          SUM(A.Point)
FROM dbo.Person PE 
INNER JOIN dbo.Person_Activity AP ON PE.ID = AP.PersonID
INNER JOIN Person.Activity A ON A.Code = AP.ActivityCode
GROUP BY PE.FirstName,
         PE.LastName,
         PE.ID 
)

SELECT * 
FROM PERSON_TOTAL_POINT
ORDER BY PERSON_TOTAL_POINT.AAA DESC
GO


WITH PERSON_TOTAL_POINT AS
(
    SELECT PE.FirstName,
           PE.LastName,
          SUM(A.Point) TOTAL
FROM dbo.Person PE 
INNER JOIN dbo.Person_Activity AP ON PE.ID = AP.PersonID
INNER JOIN Person.Activity A ON A.Code = AP.ActivityCode
GROUP BY PE.FirstName,
         PE.LastName,
         PE.ID 
)

SELECT  PTP.FirstName , PTP.LastName , MAX(PTP.TOTAL)
FROM PERSON_TOTAL_POINT PTP
GROUP BY PTP.FirstName,
         PTP.LastName
GO

