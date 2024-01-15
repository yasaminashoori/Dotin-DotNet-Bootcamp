
-- REMOVE DUPLICATE RECORDS

CREATE TABLE #dupes
(
    Col1 INT NOT NULL,
    Col2 CHAR(1) NOT NULL
);

--2-7.2 Insert some rows
INSERT INTO #dupes
(
    Col1,
    Col2
)
VALUES
(1, 'a'),
(1, 'a'),
(2, 'b'),
(3, 'c'),
(4, 'd'),
(4, 'd'),
(5, 'e');

--2-7.3
SELECT Col1, Col2 
FROM #dupes; 

--2-8.1 Add ROW_NUMBER and Partition by all of the columns
    
SELECT ROW_NUMBER() OVER(PARTITION BY Col1, Col2 ORDER BY Col1) AS RowNumber,
       Col1, 
	   Col2
FROM #dupes;

--2-8.2 Delete the rows with RowNumber > 1
WITH Dupes AS (
      SELECT  Col1, 
	          Col2, 
              ROW_NUMBER() OVER(PARTITION BY Col1, Col2 ORDER BY Col1) AS RowNumber
    FROM #dupes)
DELETE FROM Dupes WHERE RowNumber > 1;

--2-8.3 The results
SELECT Col1, Col2 
FROM #dupes;

GO


--2-11.1 Create the table
CREATE TABLE #Numbers2(Number INT NOT NULL);
GO

--2-11.2 Populate the tally table

SELECT *
FROM sys.objects a
GO


-- SELECT INTO 


-- WITH OUT VALUES
INSERT INTO #Numbers2(Number)
SELECT TOP(10) ROW_NUMBER() OVER(ORDER BY a.object_id) 
FROM sys.objects a
CROSS JOIN sys.objects b
CROSS JOIN sys.objects c;
GO

SELECT * FROM #Numbers2
ORDER BY Number
GO


DROP TABLE #Numbers2
GO


USE AdventureWorks2019
GO

--2-12.1 Find the earliest date and the number of days


DECLARE @Min DATE
DECLARE @MAX DATE
DECLARE @DayCount INT


SELECT @Min = MIN(OrderDate), 
       @MAX = MAX(OrderDate),
	   @DayCount = DATEDIFF(DAY,MIN(OrderDate),MAX(OrderDate))
FROM Sales.SalesOrderHeader;

PRINT @Min
PRINT @DayCount
PRINT @MAX


--2-12.2 Change numbers to dates and then find missing
WITH Dates AS (
	SELECT TOP(1126) DATEADD(DAY,Number,'2011-05-31') AS OrderDate
	FROM #Numbers AS N
	ORDER BY Number
)
SELECT *
FROM Dates LEFT JOIN Sales.SalesOrderHeader AS SOH
	ON Dates.OrderDate = SOH.OrderDate -- JOIN CONDITION
--WHERE SOH.SalesOrderID IS NULL
ORDER BY SOH.SalesOrderID
go


SELECT *
FROM   Sales.SalesOrderHeader
GO

Use AdventureWorks2019
GO

SELECT --*
	ST.name AS Table_Name,
	SUM(DMS.row_count) AS NUMBER_OF_ROWS
FROM 
	SYS.TABLES AS ST 
	INNER JOIN SYS.dm_db_partition_stats AS DMS ON ST.object_id = DMS.object_id
WHERE DMS.index_id IN (0,1)

GROUP BY ST.NAME
ORDER BY NUMBER_OF_ROWS DESC

GO

----------------------------------------------------------

USE [Weblog2023Dotin]
GO

-- Register User
CREATE OR ALTER PROCEDURE [dbo].[usp_Person_InsertRow2]
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @Gender BIT,
    @Birthdate DATE,
	@Username VARCHAR(50),
	@Password NVARCHAR(15)
AS

BEGIN
    INSERT INTO Person.Person
    (
        RoleCode,
        FirstName,
        LastName,
        Gender,
        Birthdate
    )
    VALUES
    (3, @FirstName, @LastName, @Gender, @Birthdate);

	DECLARE @InsertedPersonID INT

	SET @InsertedPersonID = SCOPE_IDENTITY()

	 INSERT INTO Person.Account( PersonID, Username, IsDisabled)
	 VALUES(@InsertedPersonID,@Username,0)

	 INSERT INTO dbo.PasswordHistory ( PersonID, HashPassword )
	 VALUES (  @InsertedPersonID , HASHBYTES('SHA2_512', @Password) )
END
GO


EXEC	[dbo].[usp_Person_InsertRow2]
		@FirstName = N'سروش',
		@LastName = N'صدر',
		@Gender = 1,
		@Birthdate = '1984-01-31',
		@Username = N'soroush',
		@Password = N'123@456'


EXEC	[dbo].[usp_Person_InsertRow2]
		@FirstName = N'2سروش',
		@LastName = N'صدر',
		@Gender = 1,
		@Birthdate = '1984-05-31',
		@Username = N'soroush2',
		@Password = N'تست'
GO

CREATE OR ALTER PROC usp_Person_ChangePassword
@Username VARCHAR(50),
@Password NVARCHAR(15)
AS
BEGIN 

DECLARE @PersonID INT 

SELECT @PersonID = Acc.PersonID
FROM Person.Account Acc
WHERE acc.Username = @Username;

INSERT INTO dbo.PasswordHistory( PersonID,HashPassword)
VALUES(  @PersonID , HASHBYTES('SHA2_512', @Password) )

END
GO


EXEC dbo.usp_Person_ChangePassword @Username='soroush',@Password='123'
GO

EXEC dbo.usp_Person_ChangePassword @Username='soroush',@Password='1234'
GO

EXEC dbo.usp_Person_ChangePassword @Username='soroush',@Password='1235'
GO


SELECT *
FROM dbo.PasswordHistory
GO


CREATE OR ALTER PROC usp_Person_Login
@Username VARCHAR(50),
@Password NVARCHAR(15)
AS
BEGIN

DECLARE @Pass VARBINARY(MAX)
DECLARE @PersonID INT

SELECT @Pass = PH.HashPassword , 
       @PersonID = PH.PersonID
FROM Person.Account Acc
INNER JOIN  dbo.PasswordHistory PH
ON PH.PersonID = Acc.PersonID
WHERE Acc.Username = @Username
AND PH.ID = (SELECT MAX(ph2.ID)
             FROM dbo.PasswordHistory ph2
			 WHERE ph2.PersonID = Acc.PersonID
			 )

IF @Pass = HASHBYTES('SHA2_512', @Password)
RETURN  @PersonID
ELSE
RETURN 0

END
GO

DECLARE	@return_value int
EXEC	@return_value = [dbo].[usp_Person_Login]
		@Username = N'soroush',
		@Password = N'123'
PRINT	@return_value
GO

DECLARE	@return_value int
EXEC	@return_value = [dbo].[usp_Person_Login]
		@Username = N'soroush',
		@Password = N'123-5'
PRINT	@return_value
GO

EXEC dbo.usp_Person_ChangePassword @Username='soroush',@Password='123-5'
GO

DECLARE	@return_value int
EXEC	@return_value = [dbo].[usp_Person_Login]
		@Username = N'soroush',
		@Password = N'123-5'
PRINT	@return_value
GO

-----------------------------------

USE AdventureWorks2019
GO


CREATE NONCLUSTERED INDEX IX_Filtered_Dotin
ON Sales.SalesOrderHeader (
                              CustomerID,
                              AccountNumber,
                              OrderDate
                          )
WHERE OrderDate >= '2012-1-1' AND OrderDate <= '2012-12-31';
GO


CREATE NONCLUSTERED INDEX IX_NonFiltered_Dotin
ON Sales.SalesOrderHeader (
                              CustomerID,
                              AccountNumber,
                              OrderDate
                          );
GO

-----------------------------------

SELECT *
FROM sys.indexes
WHERE name IN ('IX_Filtered_Dotin','IX_NonFiltered_Dotin')
GO


SELECT DISTINCT ix.name ,  
    phyix.index_type_desc,
    phyix.page_count,
    phyix.record_count
FROM sys.indexes ix
join sys.dm_db_index_physical_stats(DB_ID('AdventureWorks2019'),OBJECT_ID('SalesOrderHeader'),NULL,NULL,'DETAILED') phyix ON phyix.index_id = ix.index_id
WHERE IX.name IN ('IX_Filtered_Dotin','IX_NonFiltered_Dotin') AND phyix.index_level = 0;
GO

------------------------------------

SET STATISTICS IO ON 
GO

SET STATISTICS TIME ON
GO

SELECT COUNT(H.SalesOrderID)
FROM Sales.SalesOrderHeader H
GO

SELECT COUNT(H.SalesOrderID)
FROM Sales.SalesOrderHeader H
WHERE OrderDate BETWEEN '2012-1-1' AND '2012-12-31'
GO


SET STATISTICS IO OFF 
GO

SET STATISTICS TIME OFF
GO
---------------------------------------------------
SELECT CustomerID, AccountNumber, OrderDate -- 95% , logical reads 216
    FROM Sales.SalesOrderHeader  
        WHERE OrderDate BETWEEN '2013-01-01' AND '2013-09-01'
GO

SELECT CustomerID, AccountNumber, OrderDate -- 5% , logical reads 29,
    FROM Sales.SalesOrderHeader  
        WHERE OrderDate BETWEEN '2012-01-01' AND '2012-09-01'
GO


SELECT CustomerID, AccountNumber, OrderDate , ShipDate
    FROM Sales.SalesOrderHeader  
        WHERE OrderDate BETWEEN '2012-01-01' AND '2012-09-01'
GO


----------------------------------------------------------------

SELECT CustomerID, AccountNumber, OrderDate
    FROM Sales.SalesOrderHeader 
	WITH(INDEX(IX_NonFiltered_Dotin))
    WHERE OrderDate BETWEEN '2012-01-01' AND '2012-09-01'
GO

--SQL Prompt will raise this performance warning if it detects use of the INDEX() table hint. 
--The SQL Server query optimizer usually selects the best index to use, 
--so this hint should be used only as a last resort, 
--by experienced developers and database administrators.

SELECT * FROM sys.indexes WHERE name='IX_Filtered'
GO

SELECT CustomerID, AccountNumber, OrderDate
    FROM Sales.SalesOrderHeader 
	WITH(INDEX(IX_Filtered_Dotin))
    WHERE OrderDate BETWEEN '2014-01-01' AND '2014-09-01'
GO

--TODO : 
--Query processor could not produce a query plan because of the hints defined in this query. 
--Resubmit the query without specifying any hints and without using SET FORCEPLAN.

----------------------------------------------------------------------------------
-- SP vs Adhoc Query

USE Weblog2023Dotin 
GO

CREATE OR ALTER PROC usp_Post_SelectByCategoryID 
@CategoryID INT
AS
    BEGIN

        SELECT  *
        FROM    Content.Post
        WHERE   CategoryID = @CategoryID
    END
GO

--View
    SELECT  *
    FROM    sys.dm_exec_cached_plans
GO

--Database Console Command
DBCC FREEPROCCACHE
GO


SELECT P.bucketid,
       P.usecounts,
       P.size_in_bytes,
       T.text,
       QP.query_plan
FROM sys.dm_exec_cached_plans P
    CROSS APPLY sys.dm_exec_sql_text(P.plan_handle) T
    CROSS APPLY sys.dm_exec_query_plan(P.plan_handle) QP
WHERE T.[text] LIKE '%Post%';
GO


--Database Console Command
DBCC FREEPROCCACHE
GO


EXEC dbo.usp_Post_SelectByCategoryID @CategoryID = 1
GO

EXEC dbo.usp_Post_SelectByCategoryID @CategoryID = 6
GO

EXEC dbo.usp_Post_SelectByCategoryID @CategoryID = 10
GO

EXEC dbo.usp_Post_SelectByCategoryID @CategoryID = 11
GO


SELECT  *
FROM    Content.Post
WHERE   CategoryID = 1
GO

SELECT  *
FROM    Content.Post
WHERE   CategoryID = 6
GO

SELECT  *
FROM    Content.Post
WHERE   CategoryID = 10
GO

SELECT  *
FROM    Content.Post
WHERE   CategoryID = 11
GO