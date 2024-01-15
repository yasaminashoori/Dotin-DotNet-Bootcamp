--https://learn.microsoft.com/en-us/sql/t-sql/language-elements/begin-transaction-transact-sql?view=sql-server-ver16
GO

USE Weblog2023Dotin;
GO

UPDATE dbo.Person2
SET FirstName = 'X1'
WHERE ID = 10;

UPDATE dbo.Person2
SET FirstName = 'X2'
WHERE ID = 11;

UPDATE dbo.Person2
SET FirstName = 'X3'
WHERE ID = '12x';

GO

SELECT *
FROM dbo.Person2;
GO

BEGIN TRY

    BEGIN TRANSACTION;

    UPDATE dbo.Person2
    SET FirstName = 'X11'
    WHERE ID = 10;

    UPDATE dbo.Person2
    SET FirstName = 'X22'
    WHERE ID = 11;

    UPDATE dbo.Person2
    SET FirstName = 'X33'
    WHERE ID = '12x';

    COMMIT TRANSACTION;

END TRY
BEGIN CATCH
    RAISERROR('اجرای کوئری با مشکل مواجه شد', 16, 1);
    ROLLBACK TRANSACTION;	
END CATCH;

GO


SELECT *
FROM dbo.Person2;
GO



USE tempdb;
GO

CREATE TABLE dbo.Product
(
    ID INT PRIMARY KEY IDENTITY,
    Title NVARCHAR(50) NOT NULL
);


BEGIN TRAN;
INSERT INTO dbo.Product(Title)
VALUES(N'Water');
BEGIN TRAN;
INSERT INTO dbo.Product(Title)
VALUES(N'Fanta');
COMMIT TRAN;
ROLLBACK TRAN;
GO


SELECT *
FROM dbo.Product;
GO

------------------------

INSERT INTO dbo.Product(Title)
VALUES(N'Water2'),('123'),('456');
ROLLBACK;
GO


BEGIN TRAN;
INSERT INTO dbo.Product(Title)
VALUES(N'Water');
ROLLBACK;
GO

SELECT *
FROM dbo.Product;
GO

USE Weblog2023Dotin;
GO

SELECT *
FROM Person.Activity;
GO

INSERT INTO Person.Activity
(
    Code,
    Title,
    Point
)
VALUES
(4, N'تست', 10000);
GO


BEGIN TRY
    BEGIN TRAN;
    DELETE FROM Person.Activity
    WHERE Code = 4;
    BEGIN TRANSACTION;
    INSERT INTO Person.Person_Activity
    (
        [PersonID],
        [ActivityCode]
    )
    VALUES
    (1, 4);

    COMMIT TRAN;
    COMMIT TRAN;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT ERROR_MESSAGE();
END CATCH;
GO

------------------------------

CREATE OR ALTER FUNCTION [dbo].[fn_GetTotalPoint]
(
    @APersonID INT
)
RETURNS INT
AS
BEGIN

    DECLARE @Total INT;

    SELECT @Total = SUM(A.Point)
    FROM Person.Person_Activity PA
        JOIN Person.Activity A
            ON A.Code = PA.ActivityCode
    WHERE PA.PersonID = @APersonID;

    RETURN @Total;

END;

GO


CREATE OR ALTER PROCEDURE [dbo].[usp_Post_InsertRow]
    @APersonID INT,
    @ACategoryID INT,
    @ATitle NVARCHAR(150),
    @ABody NVARCHAR(MAX)
AS
BEGIN

    INSERT INTO Content.Post
    (
        PersonID,
        CategoryID,
        Title,
        Body
    )
    VALUES
    (@APersonID, @ACategoryID, @ATitle, @ABody);

    INSERT INTO Person.Person_Activity
    (
        PersonID,
        ActivityCode
    )
    VALUES
    (@APersonID, 1);


    IF ((SELECT dbo.fn_GetTotalPoint(@APersonID)) > 50000)
    BEGIN
        UPDATE Person.Person
        SET RoleCode = 3
        WHERE ID = @APersonID;
    END;
END;

GO


CREATE OR ALTER PROCEDURE [dbo].[usp_Post_InsertRow]
    @APersonID INT,
    @ACategoryID INT,
    @ATitle NVARCHAR(150),
    @ABody NVARCHAR(MAX)
AS
BEGIN

    INSERT INTO Content.Post
    (
        PersonID,
        CategoryID,
        Title,
        Body
    )
    VALUES
    (@APersonID, @ACategoryID, @ATitle, @ABody);

    INSERT INTO Person.Person_Activity
    (
        PersonID,
        ActivityCode
    )
    VALUES
    (@APersonID, 1);

    DECLARE @PersonPoint INT;
    SET @PersonPoint =
    (
        SELECT TOP (1) dbo.fn_GetTotalPoint(@APersonID) Total ORDER BY Total
    );

    IF (@PersonPoint > 50000)
    BEGIN
        UPDATE Person.Person
        SET RoleCode = 3
        WHERE ID = @APersonID;
    END;
END;
GO


---------------------------

CREATE OR ALTER FUNCTION [dbo].[fn_HasRole]
(
    @APersonID INT,
    @ARoleCode TINYINT
)
RETURNS BIT
AS
BEGIN

    DECLARE @Count TINYINT;

    SELECT @Count = COUNT(P.ID)
    FROM Person.Person P
    WHERE P.ID = @APersonID
          AND P.RoleCode = @ARoleCode;

    IF (@Count > 0)
    RETURN 1;
RETURN 0;

END;
GO


CREATE OR ALTER PROCEDURE [dbo].[usp_Post_InsertRow]
    @APersonID INT,
    @ACategoryID INT,
    @ATitle NVARCHAR(150),
    @ABody NVARCHAR(MAX)
AS
BEGIN

    INSERT INTO Content.Post
    (
        PersonID,
        CategoryID,
        Title,
        Body
    )
    VALUES
    (@APersonID, @ACategoryID, @ATitle, @ABody);

    INSERT INTO Person.Person_Activity
    (
        PersonID,
        ActivityCode
    )
    VALUES
    (@APersonID, 1);

    IF (
       (
           SELECT TOP (1) dbo.fn_HasRole(@APersonID, 2) HASROLE ORDER BY HASROLE
       ) = 1
       )
    BEGIN
        IF (
           (
               SELECT TOP (1) dbo.fn_GetTotalPoint(@APersonID) TOTAL ORDER BY TOTAL
           ) > 50000
           )
        BEGIN

            UPDATE Person.Person
            SET RoleCode = 3
            WHERE ID = @APersonID;
        END;
    END;
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[usp_Post_InsertRow]
    @APersonID INT,
    @ACategoryID INT,
    @ATitle NVARCHAR(150),
    @ABody NVARCHAR(MAX)
AS
BEGIN

    BEGIN TRY

        BEGIN TRANSACTION;

        INSERT INTO Content.Post
        (
            PersonID,
            CategoryID,
            Title,
            Body
        )
        VALUES
        (@APersonID, @ACategoryID, @ATitle, @ABody);

        INSERT INTO Person.Person_Activity
        (
            PersonID,
            ActivityCode
        )
        VALUES
        (@APersonID, 1);

        IF (
           (
               SELECT TOP (1) dbo.fn_HasRole(@APersonID, 2) HASROLE ORDER BY HASROLE
           ) = 1
           )
        BEGIN
            IF (
               (
                   SELECT TOP (1) dbo.fn_GetTotalPoint(@APersonID) TOTAL ORDER BY TOTAL
               ) > 50000
               )
            BEGIN

                UPDATE Person.Person
                SET RoleCode = 3
                WHERE ID = @APersonID;
            END;
        END;

        COMMIT;

    END TRY
    BEGIN CATCH

        ROLLBACK;

    END CATCH;

END;

GO
-----------------------------

USE tempdb
GO

CREATE TABLE DBO.Person3
(
ID INT PRIMARY KEY,
NAME NVARCHAR(50) NOT NULL,
Famil NVARCHAR(50) NOT NULL
)
GO

sp_helpconstraint [Person3]
GO

INSERT INTO dbo.Person3
        ( ID, NAME, Famil )
VALUES  (221,'aaa' ,'bbb')

SELECT *
FROM dbo.Person3

DBCC LOGINFO

SELECT *
FROM sys.fn_dblog(NULL,null)
GO

--Log Sequence Number

-- Writes all dirty pages for the current database to disk.
-- Dirty pages are data pages that have been entered into the buffer cache and modified,
-- but not yet written to disk. 
--Checkpoints save time during a later recovery by creating
-- a point at which all dirty pages are guaranteed to have been written to disk.
CHECKPOINT
GO


 UPDATE dbo.Person3
 SET NAME = N'سروش'
 GO

 DELETE FROM dbo.Person3
 WHERE ID = 60
 GO

 ---------------------------------------------

 INSERT INTO dbo.Person3
 VALUES  ( 50,'ff' , 'ggg'),
   ( 60,'ff' , 'ggg'),
  ( 70,'ff' , 'ggg'),
   ( 80,'ff' , 'ggg')

 ---------------------------

 SELECT 'Soroush' AS FN,'Sadr' AS LN
 INTO MyTempTable2014

 GO
 
 SELECT * into  MyTempTable
 from Person3
           
SELECT 'Soroush2' AS FN,'Sadr2' AS LN
 INTO MyTempTable2014

 GO

INSERT INTO MyTempTable2014
VALUES('dddd','ggt')

use AdventureWorks2019
go

SELECT *
FROM sys.fn_dblog(NULL,null)
GO

checkpoint
go


select * into MySalesOrderDetail33
 from [Sales].[SalesOrderDetail]

GO


 USE Weblog2023Dotin
 GO
