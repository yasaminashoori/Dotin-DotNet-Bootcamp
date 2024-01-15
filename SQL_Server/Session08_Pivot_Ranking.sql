-- PIVOT
-- Rotating Rows into Columns


USE Weblog2023Dotin
GO

  SELECT A.Code , A.Point
  FROM Person_Activity PA
  JOIN Person.ACTIVITY A ON A.Code = PA.ActivityCode
GO

  SELECT A.Code , SUM( A.Point)
  FROM Person_Activity PA
  JOIN Person.ACTIVITY A ON A.Code = PA.ActivityCode
  GROUP BY A.Code
GO
            

SELECT *
FROM ( SELECT A.Code , A.Point
       FROM Person_Activity PA
       JOIN Person.ACTIVITY A ON 
	        A.Code = PA.ActivityCode
	 ) AllData
	 PIVOT(SUM(AllData.Point) 
	       FOR AllData.Code IN([1],[2],[3]))
		 AS PVT
GO




SELECT     ISNULL([1], 0) SumPost,
           ISNULL([2], 0) SumComment,
           ISNULL([3], 0) SumLike
    FROM
    (
        SELECT A.Code , A.Point
        FROM Person_Activity PA
            JOIN Person.ACTIVITY A ON A.Code = PA.ActivityCode
    ) AllData
    PIVOT
    (
        SUM(AllData.Point)
        FOR AllData.Code IN ([1], [2], [3])
    ) AS pvt
Go




SELECT     ISNULL([1], 0) SumPost,
           ISNULL([2], 0) SumComment,
           ISNULL([3], 0) SumLike,
           ISNULL([4], 0) SumALaki
    FROM
    (
        SELECT A.Code , A.Point
        FROM Person_Activity PA
            JOIN Person.ACTIVITY A
                ON A.Code = PA.ActivityCode
    ) AllData
    PIVOT
    (
        SUM(Point)
        FOR AllData.Code IN ([1], [2], [3], [4])
    ) AS pvt
GO


SELECT     ISNULL([1], 0) SumPost,
           ISNULL([2], 0) SumComment,
           ISNULL([3], 0) SumLike,
           ISNULL([4], 0) SumALaki,
		   ISNULL([6], 0) SumALaki2
    FROM
    (
        SELECT A.Code , A.Point
        FROM Person_Activity PA
            JOIN Person.ACTIVITY A
                ON A.Code = PA.ActivityCode
    ) AllData
    PIVOT
    (
        SUM(Point)
        FOR AllData.Code IN ([1], [2], [3], [4] , [5])
    ) AS pvt
GO


SELECT pvt.ID,
       pvt.FirstName,
       ISNULL(PVT.[1], 0) SumPost,
       ISNULL(PVT.[2], 0) SumComment,
       ISNULL(PVT.[3], 0) SumLike
	   
FROM
(
    SELECT A.Code,
           A.Point,
           P.ID,
           P.FIRSTNAME
    FROM Person_Activity PA
        JOIN [Person].[Activity] A       ON A.Code = PA.ActivityCode
        JOIN [Person] P ON P.ID   = PA.PersonID
) AllData
PIVOT
(
    SUM(Point)
    FOR AllData.Code IN ([1], [2], [3])
) AS pvt;
GO


=

 -- تمرین آفلاین
 -- جمع کل هر شخص هم نمایش داده شود

 SELECT x.ID , 
        X.FirstName , 
		X.SumPost,
		X.SumComment,
		X.SumLike,
		(X.SumPost + X.SumComment + X.SumLike) SUM_PERSON
 FROM
 (
	SELECT pvt.ID,
       pvt.FirstName,
       ISNULL([1], 0) SumPost,
       ISNULL([2], 0) SumComment,
       ISNULL([3], 0) SumLike
FROM
(
    SELECT A.Code,
           A.Point,
           P.ID,
           P.FirstName
    FROM Person_Activity PA
        JOIN [Person].[Activity] A ON A.Code = PA.ActivityCode
        JOIN [Person]     P ON P.ID = PA.PersonID
) AllData
PIVOT
(
    SUM(Point)
    FOR AllData.Code IN ([1], [2], [3])
) AS pvt

UNION

    SELECT 0 
	      ,'جمع کل' , 
	   ISNULL([1], 0) ,
       ISNULL([2], 0) ,
       ISNULL([3], 0) 
    FROM
    (
        SELECT A.Point , PA.ActivityCode 
        FROM Person_Activity PA
            JOIN [Person].[Activity] A ON A.Code = PA.ActivityCode
    ) AllData
    PIVOT
    (
        SUM(Point)
        FOR AllData.ACTIVITYCODE IN ([1], [2], [3])
    ) AS pvt
 )X
 ORDER BY X.SumPost
 GO

 -- GROUP BY - JOIN - TOTAL SUM - UNION - جمع کل - SubQuery - PIVOT -

-----------------------------------------------------

PRINT DB_ID('DotinSimpleShop')
GO

-----------------------------------------

IF (DB_ID('DotinSimpleShop') > 0)
BEGIN
 USE master
 ALTER DATABASE SimpleShop SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
 DROP DATABASE  SimpleShop;
END

CREATE DATABASE DotinSimpleShop
GO

USE DotinSimpleShop
GO

-- invoice
-- invoice item
--order detail اقلام سفارش
-- product : id , title , desc , [price !!!]
-- customer : id , name
-- order    : id ,total sum, date ,cid   
-- order item  :id , orderid , pid,qty,discount , tax, ....


--- product
-- order  -- invoice -- order header
-- order item - order detail - invoice item
-- order footer

CREATE TABLE [dbo].[Customer0]
(
    [ID] INT IDENTITY NOT NULL PRIMARY KEY,
    [FullName] NVARCHAR(50) NOT NULL
);
GO

CREATE TABLE [dbo].[Customer]
(
    [ID] INT IDENTITY NOT NULL,
    [FullName] NVARCHAR(50) NOT NULL,
    CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED ([ID])
);
GO




CREATE TABLE [dbo].[Product]
(
    [ID] INT IDENTITY(1, 1) NOT NULL,
    [Code] NVARCHAR(50) NOT NULL,
    [Title] NVARCHAR(50) NOT NULL,
    CONSTRAINT [PK_Product] PRIMARY KEY ([ID])
);

CREATE TABLE [dbo].[Order]
(
	[ID] INT IDENTITY(1,1) NOT NULL,
	[CustomerID] INT NOT NULL,
	[Datetime] DATETIME NOT NULL,
    CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED ([ID])
)
GO

ALTER TABLE [dbo].[Order] 
ADD CONSTRAINT [DF_Order_Datetime] 
DEFAULT (GETDATE()) FOR [Datetime]
GO


ALTER TABLE [dbo].[Order]  
WITH CHECK ADD CONSTRAINT [FK_Order_Customer]
FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO

CREATE TABLE [dbo].[OrderDetail]
(
	[ID] int IDENTITY(1,1) NOT NULL,
	[OrderID] int NOT NULL,
	[ProductID] int NOT NULL,
	[Qty] tinyint NOT NULL,
    CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED ([ID])
)

ALTER TABLE [dbo].[OrderDetail]  
WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order]
FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
GO


ALTER TABLE [dbo].[OrderDetail]  
WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product]
FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO


--Cannot insert explicit value for identity column in table 'Customer' 
--when IDENTITY_INSERT is set to OFF.


--IDENTITY_INSERT is already ON for table 'SimpleShop.dbo.Order'. 
--Cannot perform SET operation for table 'dbo.Product'.


USE [DotinSimpleShop]
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([ID], [FullName]) VALUES (1, N'مشتری اول')
INSERT [dbo].[Customer] ([ID], [FullName]) VALUES (2, N'مشتری دوم')
INSERT [dbo].[Customer] ([ID], [FullName]) VALUES (3, N'مشتری سوم')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO


SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [CustomerID], [Datetime]) VALUES (1, 1, CAST(N'2019-09-28T09:24:19.540' AS DateTime))
INSERT [dbo].[Order] ([ID], [CustomerID], [Datetime]) VALUES (2, 2, CAST(N'2019-09-28T09:24:21.697' AS DateTime))
INSERT [dbo].[Order] ([ID], [CustomerID], [Datetime]) VALUES (3, 3, CAST(N'2019-09-28T09:24:23.283' AS DateTime))

SET IDENTITY_INSERT [dbo].[Order] OFF

GO



SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Code], [Title]) VALUES (1, N'P1', N'محصول یک')
INSERT [dbo].[Product] ([ID], [Code], [Title]) VALUES (2, N'P2', N'محصول دو')
INSERT [dbo].[Product] ([ID], [Code], [Title]) VALUES (3, N'P3', N'محصول سه')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO


SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Qty]) VALUES (1, 1, 1, 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Qty]) VALUES (2, 1, 2, 2)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Qty]) VALUES (3, 1, 3, 3)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Qty]) VALUES (4, 2, 1, 10)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Qty]) VALUES (5, 2, 2, 20)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Qty]) VALUES (6, 2, 3, 30)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Qty]) VALUES (7, 3, 1, 11)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Qty]) VALUES (8, 3, 2, 12)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Qty]) VALUES (9, 3, 3, 13)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO




SELECT C.fullname,
       SUM(OD.Qty) TotalOrderCount
FROM dbo.[Order] O
    INNER JOIN [dbo].[Customer] C ON O.CustomerID = C.ID
    INNER JOIN dbo.OrderDetail OD ON OD.OrderID = O.ID
GROUP BY O.CustomerID,
         C.fullname
ORDER BY TotalOrderCount DESC
GO


SELECT P.Title,
       SUM(OD.QTY) TotalSum
FROM dbo.[ORDER] O
    INNER JOIN dbo.OrderDetail OD ON OD.OrderID = O.ID
	INNER JOIN dbo.Product P ON P.ID = OD.ProductID
GROUP BY P.Title, P.ID
GO

SELECT *
FROM
(
    SELECT P.Title , OD.Qty , C.fullname
	FROM dbo.[ORDER] O
    INNER JOIN dbo.OrderDetail OD ON OD.OrderID = O.ID
	INNER JOIN dbo.Product P ON P.ID = OD.ProductID
	INNER JOIN [dbo].[Customer] C ON C.ID = O.CustomerID

) AllData -- تمام ستون هایی که نیاز داریم 

PIVOT
(
    SUM(QTY)
    FOR AllData.fullname IN ([مشتری اول], [مشتری دوم],[مشتری سوم] )
) AS pvt
ORDER BY pvt.Title;
GO






SELECT pvt.Title,
       pvt.[مشتری سوم],
       pvt.[مشتری دوم],
       pvt.[مشتری سوم]
FROM
(
    SELECT P.Title , OD.Qty , C.fullname
	FROM dbo.[ORDER] O
    INNER JOIN dbo.OrderDetail OD ON OD.OrderID = O.ID
	INNER JOIN dbo.Product P ON P.ID = OD.ProductID
	INNER JOIN [dbo].[Customer] C ON C.ID = O.CustomerID

) AllData PIVOT
(
    SUM(QTY)
    FOR AllData.fullname IN ([مشتری اول], [مشتری دوم],[مشتری سوم] )
) AS pvt
ORDER BY pvt.Title;
GO


SELECT *
FROM
(
    SELECT P.Title , OD.Qty , C.fullname
	FROM dbo.[ORDER] O
    INNER JOIN dbo.OrderDetail OD ON OD.OrderID = O.ID
	INNER JOIN dbo.Product P ON P.ID = OD.ProductID
	INNER JOIN [dbo].[Customer] C ON C.ID = O.CustomerID

) AllData 

PIVOT
(
    SUM(QTY)
    FOR AllData.fullname IN ([مشتری اول], [مشتری دوم],[مشتری سوم] , [تست] )
) AS pvt
ORDER BY pvt.Title;
GO


SELECT pvt.Title,
       ISNULL( pvt.تست , 0) [تست],
       pvt.[مشتری سوم],
       pvt.[مشتری دوم],
       pvt.[مشتری اول]
FROM
(
    SELECT P.Title , OD.Qty , C.fullname
	FROM dbo.[ORDER] O
    INNER JOIN dbo.OrderDetail OD ON OD.OrderID = O.ID
	INNER JOIN dbo.Product P ON P.ID = OD.ProductID
	INNER JOIN [dbo].[Customer] C ON C.ID = O.CustomerID

) AllData 

PIVOT
(
    SUM(QTY)
    FOR AllData.fullname IN ([مشتری اول], [مشتری دوم],[مشتری سوم] , [تست] )
) AS pvt
ORDER BY pvt.Title;
GO

------------------------------------------------------

-- هر مشتری از هر محصول چه تعداد خریداری کرده است
-- بر اساس مشتری
-- Pivot Table ordered by Customer

SELECT [FullName],
       pvt.[محصول سه],
       pvt.[محصول دو],
       pvt.[محصول یک]
FROM
(  SELECT P.Title , OD.Qty , C.[FullName]
	FROM dbo.[ORDER] O
    INNER JOIN dbo.OrderDetail OD ON OD.OrderID = O.ID
	INNER JOIN dbo.Product P ON P.ID = OD.ProductID
	INNER JOIN [dbo].[Customer] C ON C.ID = O.CustomerID
 ) AllData
PIVOT
(
    SUM(QTY)
    FOR AllData.Title IN ([محصول یک], [محصول دو], [محصول سه])
) AS pvt
ORDER BY 1
GO
-------------------------DYNAMIC QUERY -----------------------------

USE Weblog2023Dotin
GO

SELECT 1 + 1;

PRINT 'SELECT 1+1';

EXEC ('SELECT 1+2');

EXECUTE ('SELECT 1+1 AS TEST');

EXEC sp_sqlexec @p1 = 'SELECT 1+1 AS TEST';
GO

sp_sqlexec @p1 = 'SELECT 1+1 AS TEST';
GO

USE Weblog
GO

EXEC ('select [FirstName] as ''First Name'' from [Person].[Person] ');

EXEC ('select [FirstName] as [First Name] from [Person].[Person] ');

EXEC (N'select * from [Person].[Person]');

EXEC sys.sp_executesql N'select * from [Person].[Person] ';
GO

EXEC sys.sp_executesql @P1 = N'select * from [Person].[Person] ';
GO

EXEC sys.sp_sqlexec @p1 = N'select * from [Person].[Person] ';
GO

-- ad hoc query

/*EXECUTE('SQL script') is being used to execute a SQL batch in a string.
Avoid using EXEC to run dynamic SQL. 
It is there for backward compatibility only
and is commonly used for SQL injection. 
Use sp_executesql instead,
because it allows parameter substitutions for both inputs and outputs 
and also because the execution plan that sp_executesql produces
is more likely to be reused.*/


USE Weblog;
GO

DECLARE @X NVARCHAR(MAX);
SET @X = N'';
SELECT @X = +@X + CAST(ID AS VARCHAR(10)) + N','
FROM [PERSON].[Person]
PRINT @X;
SET @X = LEFT(@X, LEN(@X) - 1); --حذف كاما آخر
PRINT @X;

EXEC ('SELECT * FROM [PERSON].[Person] where ID IN (' + @X + ')');
PRINT (' SELECT * FROM  [PERSON].[Person] where ID IN (' + @X + ')');
GO

USE DotinSimpleShop
GO

DECLARE @X NVARCHAR(MAX);
SET @X = N'';
SELECT @X = +@X + P.Title + N','
FROM dbo.Product p
PRINT @X;
SET @X = LEFT(@X, LEN(@X) - 1); --حذف كاما آخر
PRINT @X;
GO

DECLARE @ProductTitles NVARCHAR(MAX);
DECLARE @Query NVARCHAR(MAX);

SET @ProductTitles = N'';
SELECT @ProductTitles = + @ProductTitles + '[' + P.Title + ']' + N','
FROM dbo.Product p
PRINT @ProductTitles;
SET @ProductTitles = LEFT(@ProductTitles, LEN(@ProductTitles) - 1); 
PRINT @ProductTitles;
SET @Query = 'SELECT *
FROM
(  SELECT P.Title , OD.Qty , C.[FullName]
	FROM dbo.[ORDER] O
    INNER JOIN dbo.OrderDetail OD ON OD.OrderID = O.ID
	INNER JOIN dbo.Product P ON P.ID = OD.ProductID
	INNER JOIN [dbo].[Customer] C ON C.ID = O.CustomerID
 ) AllData PIVOT
(
    SUM(QTY)
    FOR AllData.Title IN ('+ @ProductTitles +')) AS pvt ORDER BY 1 '

PRINT @Query
EXEC sys.sp_executesql @p1 = @Query
GO

----------------------

-- OOP => ارث بری
-- ACTOR ( pERSON , COMPANY )

-- SQL ==> رابطه ای

-- ACTOR ( ID(PK) , EMAIL , WEBSITE , TEL , ... )
-- PERSON ( ACTOR_ID(PK,FK) , FN , LN , ....)
-- COMPANY ( ACTOR_ID(PK,FK) , TITLE , .... )

----------------------------------

------------------------
-- RANKING FUNCTIONS

-- Return a ranking value for each row in a partition. 
-- Depending on the function that is used, 
-- some rows might receive the same value as other rows.

-- ROW NUMBER
-- RANK
-- DENSE RANK
-- NTILE


----------------------
USE Weblog
GO

--The function 'ROW_NUMBER' must have an OVER clause.
-- OVER clause creates a new window on the data ==> New Perspective | Independent Ordering of the Rows

SELECT ROW_NUMBER() [ROW_NUMBER] , 
       P.ID , 
	   P.FullName , 
	   P.BirthDate
FROM Person.Person P
GO

--The function 'ROW_NUMBER' must have an OVER clause with ORDER BY.
SELECT ROW_NUMBER() OVER () [ROW_NUMBER] , 
       P.ID , 
	   P.FullName , 
	   P.BirthDate
FROM Person.Person P
GO

SELECT ROW_NUMBER() OVER (ORDER BY P.ID DESC) [ROW_NUMBER] , 
       P.ID , 
	   P.FullName , 
	   P.BirthDate
FROM Person.Person P
GO

SELECT ROW_NUMBER() OVER (ORDER BY P.ID) ROWNUMBER , 
       P.ID , 
	   P.FullName , 
	   P.BirthDate
FROM Person.Person P
WHERE ROWNUMBER BETWEEN 4 AND 10 -- Invalid column name 'ROWNUMBER'.
GO


SELECT ROW_NUMBER() OVER (ORDER BY P.ID) ROWNUMBER , 
       P.ID , 
	   P.FullName , 
	   P.BirthDate
FROM Person.Person P
WHERE ROW_NUMBER() OVER (ORDER BY P.ID) BETWEEN 4 AND 10 


-- Windowed functions can only appear in the SELECT or ORDER BY clauses.
GO

SELECT X.ROWNUMBER,
       X.ID,
       X.FullName,
       X.Birthdate
FROM 
(SELECT ROW_NUMBER() OVER (ORDER BY P.ID) ROWNUMBER , 
       P.ID , 
	   P.FullName , 
	   P.BirthDate
FROM Person.Person P) X
WHERE X.ROWNUMBER BETWEEN 4 AND 10
GO


WITH RowNumberCTE AS
(
SELECT ROW_NUMBER() OVER (ORDER BY P.ID) ROWNUMBER , 
       P.ID , 
	   P.FullName , 
	   P.BirthDate
FROM Person.Person P
)

SELECT *
FROM RowNumberCTE
WHERE ROWNUMBER BETWEEN 4 AND 10
GO

-- PAGE NO    : 1 
-- PAGE SIZE  : 10

-- 1 : 1-10
-- 2 : 11-20
-- 3 : 21:30

---- PAGING-------------------

-- PAGE NO ?        1 
-- ITEMS PER PAGE ? 10 
--  1-10            1*ITEM
--  11-20           (P-1)*i + 1
--  21-30     


--If this statement is a CTE, the previous statement must be terminated with a semicolon.

SET NOCOUNT OFF
GO

DECLARE @PageNumber INT 
DECLARE @ItemsPerPage TINYINT

SET @PageNumber = 3
SET @ItemsPerPage = 10;

WITH RowNumberCTE AS
(
SELECT ROW_NUMBER() OVER (ORDER BY P.ID) ROWNUMBER , 
       P.ID , 
	   P.FullName , 
	   P.BirthDate
FROM Person.Person P
)

SELECT *
FROM RowNumberCTE
WHERE ROWNUMBER BETWEEN (@PageNumber-1)*@ItemsPerPage + 1  AND 
                         @PageNumber *@ItemsPerPage
GO

----------------------------------------------------

SELECT 
       P.ID , 
	   P.FullName , 
	   P.BirthDate,
	   ROW_NUMBER() OVER (ORDER BY P.ID ) [ROW_NUMBER_LAST_COLUMN] 
FROM Person.Person P
GO


SELECT ROW_NUMBER() OVER ( PARTITION BY P.ROLECODE ORDER BY P.ID ) [ROW_NUMBER] ,
       P.ID , 
	   P.RoleCode,
	   P.FullName , 
	   P.BirthDate   
FROM Person.Person P
GO

