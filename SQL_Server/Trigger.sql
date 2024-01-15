/*

A trigger is a special type of stored procedure 
that automatically runs when an event occurs in the database server.

DML triggers run when a user tries to modify data through a data manipulation language (DML) event. 
DML events are INSERT, UPDATE, or DELETE statements on a table or view. 
These triggers fire when any valid event fires, whether table rows are affected or not. 

DDL triggers run in response to a variety of data definition language (DDL) events.
These events primarily correspond to Transact-SQL CREATE, ALTER, and DROP statements, 
and certain system stored procedures that perform DDL-like operations.

*/



USE Weblog2023Dotin;
GO

CREATE TABLE dbo.[Log]
(
    ID INT PRIMARY KEY IDENTITY,
    Title NVARCHAR(100) NOT NULL,
    LogDateTime DATETIME NOT NULL DEFAULT GETDATE()
);

GO


CREATE OR ALTER TRIGGER TriggerAfterUpdate
ON Person.Activity
AFTER UPDATE
AS
PRINT 'You Updated 1 row';

INSERT INTO DBO.[Log]
(
    Title
)
VALUES
('u updated 1 row');
GO


SELECT *
FROM Person.Activity
GO

SELECT *
FROM dbo.Log
GO


UPDATE Person.Activity
SET Title = 'Harchi'
WHERE Code = 1;
GO

CREATE OR ALTER TRIGGER TriggerAfterInsert
ON Person.Activity
AFTER INSERT
AS
PRINT 'u Inserted 1 row';

INSERT INTO [Log]
(
    Title
)
VALUES
('u inserted 1 row');
GO

INSERT INTO Person.Activity
(
    Code,
    Title,
    Point
)
VALUES
(   6,   -- Code - tinyint
    N'TEST', -- Title - nvarchar(50)
    10000   -- Point - smallint
    )
GO

CREATE TRIGGER TriggerInsteadUpdate
ON Person.Activity
INSTEAD OF UPDATE
AS
PRINT N'واقعن آپدیت انجام نمی شود';

INSERT INTO Log
(
    Title
)
VALUES
(N'آپدیت نداریم');

GO


UPDATE Person.Activity
SET Title = N'آیا انجام می شود؟'
WHERE Code = 1;
GO


sp_helptrigger @tabname = 'Person.Activity';
GO

USE AdventureWorks2019
GO
SELECT *
FROM sys.triggers;

SELECT *
FROM sys.trigger_events;
GO


SELECT *
FROM SYS.triggers T
JOIN SYS.TRIGGER_EVENTS TE ON TE.object_id = T.object_id
GO


USE Weblog2023Dotin
GO


EXEC sp_helptext @objname = 'Person.TriggerInsteadUpdate';
GO

--------------------------------

USE tempdb;
GO

DROP TABLE IF EXISTS dbo.Person;
GO

CREATE TABLE dbo.Person
(
    ID INT PRIMARY KEY IDENTITY,
    NAME NVARCHAR(50) NOT NULL,
    Family NVARCHAR(50) NOT NULL
);
GO

INSERT INTO dbo.Person
(
    NAME,
    Family
)
OUTPUT Inserted.*
VALUES('Soroush', 'Sadr');
GO


INSERT INTO dbo.Person
(
    NAME,
    Family
)
OUTPUT Inserted.ID,
       Inserted.NAME,
       Inserted.Family
VALUES
(N'سروش', N'صدر');
GO


SELECT * FROM dbo.Person
GO

--Delete
DELETE FROM dbo.Person
OUTPUT Deleted.*
WHERE ID = 2;
GO


SELECT *
FROM dbo.Person;
GO


--Update
UPDATE dbo.Person
SET Family = 'SeyedSadr',
    Name = 'Ali'
OUTPUT Deleted.ID AS [Old_ID],
       Deleted.NAME AS [Old_Name],
       Deleted.Family AS [Old_Family],
       Inserted.ID AS [New_ID],
       Inserted.NAME AS [New_Name],
       Inserted.Family AS [New_Family]
WHERE ID = 1;
GO

----------------------------------------

USE tempdb
GO

CREATE OR ALTER TRIGGER ShowInsertedData
ON Person
AFTER INSERT
AS
SELECT *
FROM Inserted;
GO

INSERT INTO Person
(
    NAME,
    Family
)
VALUES
(N'سروش', N'صدر');
GO

CREATE TABLE dbo.Person_Log
(
    ID INT PRIMARY KEY IDENTITY,
    PersonID INT NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    Family NVARCHAR(50) NOT NULL,
    ActionType NVARCHAR(30) NOT NULL,
    ActionDate DATETIME NOT NULL DEFAULT GETDATE()
);
GO


-------------------Insert-----------------------------

CREATE OR ALTER TRIGGER PersonInsert
ON Person
AFTER INSERT
AS
INSERT INTO dbo.Person_Log
(
    PersonID,
    Name,
    Family,
    ActionType
)
SELECT ID,
       NAME,
       Family,
       'Insert'
FROM Inserted;
GO


INSERT INTO dbo.Person
(
    NAME,
    Family
)
VALUES
(N'22سروش', N'2صدر2');
GO


SELECT * FROM dbo.Person_Log
GO

SELECT * FROM dbo.Person
GO


sp_helptrigger @tabname = 'Person';
GO


INSERT INTO dbo.Person
(
    NAME,
    Family
)
VALUES
(N'2سروش', N'صدر2');

SELECT *
FROM [dbo].[Person_Log];
GO
---------------------------------------------------------

---------------------Update----------------------------

CREATE TRIGGER PersonUpdate
ON Person
AFTER UPDATE
AS
INSERT INTO Person_Log
(
    PersonID,
    Name,
    Family,
    ActionType  
)
SELECT ID,
       NAME,
       Family,
       'Update-Old'    
FROM Deleted;

INSERT INTO Person_Log
(
    PersonID,
    Name,
    Family,
    ActionType  
)
SELECT ID,
       NAME,
       Family,
       'Update-New' 
FROM Inserted;
GO

UPDATE [dbo].[Person]
SET [NAME] = 'Ali'
WHERE ID = 4;

SELECT *
FROM [dbo].[Person_Log];
GO

------------------------------------------------------
-----------------------Delete------------------------
CREATE TRIGGER PersonDelete
ON Person
AFTER DELETE
AS
INSERT INTO Person_Log
(
    PersonID,
    Name,
    Family,
    ActionType
    
)
SELECT ID,
       NAME,
       Family,
       'Delete'
      
FROM Deleted;
GO

DELETE FROM Person
WHERE ID = 3;
GO

SELECT *
FROM Person;
SELECT *
FROM dbo.Person_Log;
GO

-------------------------------------

CREATE TRIGGER TriggerAdvanced
ON Person
AFTER UPDATE
AS
BEGIN
    DECLARE @msg NVARCHAR(500);
    SELECT @msg = D.NAME + N' Changed To ' + I.NAME
    FROM Inserted I
         INNER JOIN Deleted D ON I.ID = D.ID;
    PRINT @msg;
END;

UPDATE [dbo].[Person]
SET NAME = N'Soroush2'
WHERE ID = 4;
GO

------------------

USE tempdb;
GO

SELECT *
FROM dbo.Person;
GO


DROP TABLE IF EXISTS dbo.Person;
GO

CREATE TABLE dbo.Person
(
    ID INT PRIMARY KEY IDENTITY,
    NAME NVARCHAR(50) NOT NULL,
    Family NVARCHAR(50) NOT NULL
);
GO


CREATE OR ALTER TRIGGER SitAndRelax
ON Person
AFTER INSERT, UPDATE, DELETE
AS
BEGIN TRY
    PRINT 'Sit and Relax !';
    ROLLBACK TRANSACTION;
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
END CATCH;
GO


INSERT INTO Person
(
    NAME,
    Family
)
VALUES
(N'سروش', N'صدر');
GO
DELETE FROM Person
WHERE ID = 10;
GO
UPDATE Person
SET Name = 'WhatEver!!'
WHERE ID = 3;
GO

SELECT *
FROM Person;
GO

DISABLE TRIGGER SitAndRelax ON dbo.Person;
GO

ENABLE TRIGGER SitAndRelax ON dbo.Person;
GO

CREATE OR ALTER TRIGGER SitAndRelax2
ON Person
INSTEAD OF INSERT, UPDATE, DELETE
AS
BEGIN TRY
    PRINT 'Sit and Relax 2 !';
    ROLLBACK TRANSACTION;
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
END CATCH;
GO

DISABLE TRIGGER SitAndRelax2 ON dbo.Person;
GO

------------------------------------------------

CREATE OR ALTER TRIGGER DenyDropTable
ON ALL SERVER
FOR DROP_TABLE
AS
BEGIN
    PRINT 'U Should disable Trigger DenyDropTable!!!! ';
    ROLLBACK;
END;
GO


USE tempdb
go
SELECT *
FROM sys.triggers
GO

USE tempdb
GO

SELECT *
FROM sys.triggers
GO

SELECT *
FROM sys.server_triggers
GO


USE Weblog2023
GO

DROP TABLE dbo.Log
GO

USE tempdb
GO

DROP TABLE dbo.Test1
GO

ENABLE TRIGGER DenyDropTable ON ALL SERVER
GO

DISABLE TRIGGER DenyDropTable ON ALL SERVER
GO
