ssms , sql seerver  بهتر هست که نسخه 2019 به بالا باشه و موتور وظاهر اس کیو ال داریم که بهش میگن

Windows services = > from services Run the default MSSQLSERVER

the instace name of server when it is the first ssms: MSSQLSERVER but for other SSMS it should be written.


-- Red Gate ( SQL Toolbelt ) great intellisance for writing code in sql
-- SQL PROMPT

-- SQL : Structrued Query Language
-- SQL is not case sensitive but it is better to write in capital
-- T-SQL : SQL SERVER ( Microsoft )
-- PL-SQL: Procedural Oracle SQL Developer ( Oracle )
-- the syntax is the same 
-- DBMS ( DATA BASE MANAGEMENT SYSTEM ) 
-- RDBMS relational 
-- NoSQL
-- at the same time with hihgh performance and the huge users need to use database

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
--Course  : code , title , duration , description , level , pre-course , course Type , isonline ,topics
--ClassRoom : title , qty , class room type , 
--Term      : start date - end date - course -  start time - end time - Teacher - IsOnline/Mixed - Class Room - Tution
--Term_Student : Term - Student - Grade
------------------------------------

-- قانون  - MUST
-- قرارداد - Convention - should / better

-- Rule 1 : هر جدولی حتمن باید یک کلید اصلی داشته باشد
-- PRIMARY KEY ( PK ) یک ستون با مقدار یونیک
-- کد ملی - شماره پاسپورت - کد دانشجویی - کد کارمندی - موبایل
-- ID ==> PK
-- 1- ID , Id  Value: Auto Increment , Auto
-- وظیفه مقدار دهی با sql است
-- 2- Teacher : TeacherID , TEACHER_ID , 
-- TYPE : NUMBER ==> INT , BIGINT (تراکنش ها  راحت به دومیلیارد میرسه و حتی بیشتر پس این واحد عددی درسته براش)
-- GUID (in C#)  : UniqueIdentifier ,hex, (اگه نمیخوایم نوعش نامبر باشه می تونیم از این استفاده کنیم و اصلا مبنای عددی هم  نیست  )
--
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
----------------------------------------------------------
Unicode = > resave and change the encoding=> yes other encoding => choose Unicode UTF-8 

موجودیت ها بر اساس تعداد ردیف ها دو نوع میشن
-- Entity : 
-- 1- Record > 255  ==> ID , auto
-- 2- Record <= 255 ==> Code , value توسط خودمان - برنامه 

--------------------------------------------------------

-- کلید فنی
-- مقدار id  هیچ اهمیتی ندارد
-- ممکنه بین ش فاصله هم باشه GAP

--------------------------------------------------------

-- کلید بیزینسی
-- مقدار Code اهمیت دارد
-- Role : Code 1 : admin
--        Code 2 : user

-- Type : TinyInt (byte in C#)

-- if ( role.code == 1 ) ...... admin
-- HARD CODE  خودمون مقدار میدیم مقدارش محدود هست و برامون مهم هست عددش 

-- business Code
-- Region.Code 1 == منطقه یک
---------------------------------------------------------

-- کلید فنی
-- مقدار id  هیچ اهمیتی ندارد
-- ممکنه بین ش فاصله هم باشه GAP

-- ممکنه بیزینسی باشه که هم کلید فنی هم بیزینسی دارد مانند: 
-- کد سفارش هر روز ریست میشه پس کلید بیزینسی است و هر روز کد تکراری نداره 

--------------------------------------------------------

-- قرارداد نام گذاری

-- Table, Database, Columns all of them should be PascalCase


-- از حروف فارسی استفاده نکنید
-- DB , Table , Column ==> PASCAL CASE ==> ClassRoomType

-- اسامی معنا و مفهوم داشته باشد

--  همه جا یک مدل استفاده کنید و طبق قوانین یکسان

-- DONT USE ===>  tbl_product 

---------------------------------------------------------

-- جلوی ورود اطلاعات اشتباه را میگیرد
-- RELATION , .........
-- FK ( FOREIGN KEY ) کلید خارجی 
--  عدم ورود اطلاعات نامرتبط به دیتابیس 

-- Class Room : 1 , 2, 3, 4
-- Term       : 5 NOT OK
-- Term       : 4 or lower ok

--------------------------------------------------------

-- Role : Code
-- Person : ID , RoleCode

-or-------------------------------------------------------

-- Role : RoleCode
-- Person : PersonID , RoleCode
-------------------------------------------------------

-- DATABASE ( TEAM (3-4), سیستم عملیاتی , OK )
-- بیزینس مسلط شدید - موجودیت - داده واقعی 

-- C# ( Fund...)
-- C# ( .... )
-- Web (... ) 

------------------------------------------------------

-- ستون های رایج برای اکثر جدول ها

 -- هر جدول حداقل دو ستون باید داشته باشه

-- روی کاغذ اول بنویسید که بتونید پاکش کنید و  تا حد خوبی که جلو رفتین بعدش برین بسازینش

-- Create DateTime (Update or Delete DateTime)
-- Note توضیحات اضافی
-- IsEnable, IsVisible (true, false, dynsmic and force works)
-- note

--------------------------------------------------- جدول رایج
-- برای نگه داری تنظیمات کلی و داده های سراسری 
یه سری جداول فقط یه ردیف داره و قوانین کلی اونحا هست و یه ردیف داره سه تا ستون و از اونجا انتخاب می کنید 
-- SMS NO, PASSWORD PANEL, MINIMOM GRADE, ....
-- معمولن این جدول ها تک رکوردی هستند  به جز اینکه باید تاریخچه نگهداریم 

--------------------------------------------------

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

--Exact numerics  اعداد  دقیق: bigint, int, tinyint, smallint, numeric, decimal, money, smallmoney,
 

--Approximate numerics: float, real  اعشارشون تقریبی هست 

--Binary strings

--Date and time:  Date (it used for store birthdate), Datetime (  ثبت رکورد و تاریخ اون لحظه), Datetime2 (No limitation and have the time too),  Datetimeoffset : grinvic the timezone offset.

--Character strings

--Unicode character strings  رشته های کاراکتری : char (fixed size like NationalID always 10 numbers).

-- Unicode: nvarchar (varchar = variable ), nchar (n = ? storage = 2*?), ntext, nvarchar(max) = 8000

-- ntext image will be replaced by varbinary and varbinarymax

-- Unique: GUID = primary key 32 character

--Other data types


-----------Questions--------------------------------------------------------------------

-- what is row version? 

-- what is numeric? 