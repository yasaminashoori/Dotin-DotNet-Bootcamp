USE Weblog2023Dotin
GO


-- INDEX
-- PK ==> خودش Clustered Index
-- ترتیب چیدمان فیزیکی رکورد ها
-- هر جدول فقط و فقط یک ایندکس کلاستر میتواند داشته باشد

-- Index 
-- سرعت جستجو
-- یونیک کردن اطلاعات


-- INDEX : TYPE OF INDEX ( CLUSTERED (PK) , NON CLUS )


-- Non-Clustered Index


--------------------------------
--select * from
--insert into table

CREATE SCHEMA TMP
GO

SELECT *
INTO TMP.Person2
FROM Person.PERSON
GO

SELECT *
INTO TMP.Person3
FROM Person.PERSON WHERE 1=0
GO

SELECT *
INTO TMP.ROLE2
FROM dbo.Role
GO

SELECT * FROM PERSON.Person
SELECT * FROM TMP.Person2
SELECT * FROM TMP.Person3
GO

sys.sp_help @objname = N'PERSON.Person' 
GO
sys.sp_help @objname = N'TMP.Person2' 
GO

sys.sp_helpindex @objname = N'PERSON.Person' 
GO
sys.sp_helpindex @objname = N'TMP.Person2' 
GO

sys.sp_help @objname = N'dbo.Role' 
GO


SELECT * FROM PERSON.Person WHERE RoleCode = 4
SELECT * FROM TMP.PERSON2 WHERE RoleCode = 4
GO


SELECT * FROM PERSON.Person WHERE ID = 1
SELECT * FROM TMP.PERSON2 WHERE ID = 1
GO

-------------------------------------------
-- یک سلکت ای یافت کنید که
-- لیست تمام جداول یک دیتابیس به همراه تعداد رکورد هایشان
-- سرچ کنید


USE AdventureWorks2019
GO

SP_SPACEUSED 'sALES.SalesOrderDetail' -- 121317              
GO

SP_SPACEUSED 'PurchasING.PurchaseOrderDetail' -- 8845                              
GO

CREATE SCHEMA TMP
GO

SELECT * INTO TMP.SalesOrderDetail2
FROM sALES.SalesOrderDetail
GO

--43-57
--46-54
SELECT * FROM sALES.SalesOrderDetail
SELECT * FROM TMP.SalesOrderDetail2
GO

-- MISSING INDEX 
-- 48-52
SELECT * FROM sALES.SalesOrderDetail WHERE ProductID = 784
SELECT * FROM TMP.SalesOrderDetail2 WHERE ProductID = 784
GO


SELECT COUNT(*) FROM sALES.SalesOrderDetail WHERE ProductID = 784
SELECT COUNT(*) FROM TMP.SalesOrderDetail2 WHERE ProductID = 784
GO


sys.sp_help @objname = N'sALES.SalesOrderDetail' -- nvarchar(776)
GO

SYS.SP_HELPINDEX @objname = N'sALES.SalesOrderDetail'	
GO


--PK_SalesOrderDetail_SalesOrderID_SalesOrderDetailID	
--clustered, unique, primary key located on PRIMARY	
--SalesOrderID, SalesOrderDetailID

--22-78 PK 1 ==> MISSING INDEX
SELECT * FROM sALES.SalesOrderDetail WHERE SalesOrderDetailID = 10805
SELECT * FROM TMP.SalesOrderDetail2 WHERE SalesOrderDetailID = 10805
GO

-- PK 2 0-100
SELECT * FROM sALES.SalesOrderDetail WHERE SalesOrderID = 46608
SELECT * FROM TMP.SalesOrderDetail2 WHERE SalesOrderID = 46608
GO
----------------------------------------------------------------------


USE tempdb
GO

CREATE TABLE dbo.Test1
( 
ID INT NOT NULL,
Title NVARCHAR(50) NOT NULL,
Email NVARCHAR(50) NOT NULL
)

INSERT INTO dbo.Test1
(
    ID,
    Title,
    Email
)
VALUES(10,N'Title10',N'Title10@gmail.com'),
	  (2,N'Title2',N'Title2@gmail.com'),
	  (20,N'Title20',N'Title20@gmail.com'),
	  (3,N'Title3',N'Title3@gmail.com'),
	  (30,N'Title30',N'Title30@gmail.com'),
	  (1,N'Title1',N'Title1@gmail.com')
GO

SELECT * FROM dbo.Test1
GO

sp_helpindex @objname = 'Test1'
GO

CREATE UNIQUE CLUSTERED INDEX IX_PK ON dbo.Test1 (ID)
GO

CREATE UNIQUE CLUSTERED INDEX IX_UQ_Email ON dbo.Test1 (Email)
GO

--Cannot create more than one clustered index on table 'dbo.Test1'. 
--Drop the existing clustered index 'IX_PK' before creating another.
GO


CREATE UNIQUE NONCLUSTERED INDEX IX_UQ_Email ON dbo.Test1 (Email)
GO

INSERT INTO dbo.Test1
(
    ID,
    Title,
    Email
)
VALUES(4,N'Title4',N'Title10@gmail.com')
GO

--Cannot insert duplicate key row in object 'dbo.Test1' 
--with unique index 'IX_UQ_Email'.
--The duplicate key value is (Title10@gmail.com).

GO

CREATE UNIQUE NONCLUSTERED INDEX IX_UQ_Email2 ON dbo.Test1 (Email)
GO

sp_helpindex @objname = 'Test1'
GO

DROP INDEX IX_UQ_Email2 ON dbo.Test1
GO

--------------------------------

CREATE TABLE dbo.Person
(
	ID INT IDENTITY PRIMARY KEY,
	[Name] NVARCHAR(50) NOT NULL,
	Family NVARCHAR(50) NOT NULL,
	SSN NVARCHAR(20) NULL
)
GO


SP_HELPINDEX @objname = Person 


INSERT dbo.Person(Name, Family, SSN) VALUES
    (N'سروش', N'صدر1', '123456890'),
	(N'سروش', N'صدر2', '123456780'),
	(N'سروش', N'صدر3', '123456789'),
	(N'سروش', N'صدر4', NULL),
	(N'سروش', N'صدر5', ''),
    (N'سروش', N'صدر6', ''),
	(N'سروش', N'صدر7', '')
GO

SELECT * FROM dbo.Person
GO

--CREATE UNIQUE NONCLUSTERED INDEX IX_UQ_SSN ON dbo.Person(SSN)
--GO

CREATE UNIQUE NONCLUSTERED INDEX IX_UQ_SSN ON dbo.Person(SSN)
WHERE (SSN IS NOT NULL AND SSN <> '')
GO

INSERT dbo.Person(Name, Family, SSN) VALUES (N'سروش', N'صدر1', '123456890')
GO

INSERT dbo.Person(Name, Family, SSN) VALUES (N'سروش', N'صدر1', '')
GO

INSERT dbo.Person(Name, Family, SSN) VALUES (N'سروش', N'صدر1', NULL)
GO

SELECT * FROM sys.indexes
--WHERE name='IX_UQ_SSN'
WHERE has_filter = 1
GO

-- یک ایندکس برای رکورد های سال جاری 

-- سال مالی جاری

-- 1401/01/01 => 1401/12/29

-- SELECT * FROM TBL WHERE DATE BETWEEN 1401/05/05 AND 1401/9/9

-- WITH ( نام ایندکس دلخواه برای اجرای این کوئری خاص )
------------------


-- تعداد پیج ها و رکورد هایی که هر ایندکس در بر میگیرد



--------------

USE AdventureWorks2019
GO

-- MISSING INDEX ON FirstName
SELECT * FROM Person.Person P
WHERE P.FirstName = 'ABC'
GO

-------------------

-- https://learn.microsoft.com/en-us/sql/relational-databases/indexes/indexes?view=sql-server-ver16

-- Column Store Index

-------------------------------------------
-- Stored Procedure (SP)

-- TABLE => SELECT ALL
--       => SELECT ROW
--       => INSERT
--		 => UPDATE
--	     => DELETE

---------------------------

USE Weblog2023Dotin
GO


CREATE PROCEDURE usp_Activity_SelectAll
AS
BEGIN

SELECT *
FROM Person.Activity
ORDER BY Code
END
GO


EXEC dbo.usp_Activity_SelectAll
GO

EXEC usp_Activity_SelectAll
GO
 
usp_Activity_SelectAll
GO


CREATE OR ALTER PROCEDURE usp_Activity_SelectRow
@Code TINYINT
AS
BEGIN
SELECT Code,
       Title,
       Point
FROM Person.Activity
WHERE Code = @Code
END
GO

-- RESULT MAX ONE ROW ( 0 - 1 )
dbo.usp_Activity_SelectRow @Code = 0
dbo.usp_Activity_SelectRow @Code = 1
dbo.usp_Activity_SelectRow @Code = 2
dbo.usp_Activity_SelectRow @Code = 3
dbo.usp_Activity_SelectRow @Code = 4
dbo.[usp_Activity_SelectRow] 3
GO


