
-- VIEW : VIRTUAL TABLE

-- Actor   : id , email , address , tel
-- Person  : actorid , fn , ln , کد ملی , تاریخ تولد
-- Company : actorid , title , تاریخ ثبت شرکت , شناسه ملی

-- select a join actor
-- select b join person
-- select c join company

-- select d join (person , company) 

-- vw_All_Actor

-- select d join vw_All_Actor
------------------


USE Weblog2023Dotin
GO


SELECT P.FullName,
       SUM(A.Point) AS TotalPoint
FROM Person.Person P
    INNER JOIN Person.Person_Activity PA
        ON PA.PersonID = P.ID
    INNER JOIN Person.Activity A
        ON A.Code = PA.ActivityCode
GROUP BY P.FullName,p.ID
UNION
SELECT N'جمع کل',
       SUM(A.Point)
FROM Person.Person_Activity PA
    INNER JOIN Person.Activity A
        ON A.Code = PA.ActivityCode
ORDER BY TotalPoint;

GO


CREATE OR ALTER VIEW vw_Person_TotalPoint
AS

SELECT P.FullName,
       SUM(A.Point) AS TotalPoint
FROM Person.Person P
    INNER JOIN Person.Person_Activity PA
        ON PA.PersonID = P.ID
    INNER JOIN Person.Activity A
        ON A.Code = PA.ActivityCode
GROUP BY P.FullName , p.ID
UNION
SELECT N'جمع کل',
       SUM(A.Point)
FROM Person.Person_Activity PA
    INNER JOIN Person.Activity A
        ON A.Code = PA.ActivityCode
--ORDER BY TotalPoint
GO

SELECT * 
FROM dbo.vw_Person_TotalPoint
GO


SELECT FullName,
       TotalPoint
FROM dbo.vw_Person_TotalPoint
ORDER BY TotalPoint ASC; 
GO	


SELECT *
FROM dbo.vw_Person_TotalPoint
WHERE TotalPoint > 40000
ORDER BY 2;
GO

EXEC sp_depends @objname = 'vw_Person_TotalPoint';
GO


SELECT * 
FROM sys.dm_sql_referenced_entities('DBO.vw_Person_TotalPoint','OBJECT')
GO


--------------------------------------------------------------------

sp_helptext @objname = 'vw_Person_TotalPoint'; 
GO

sp_helptext @objname = 'usp_Person_SelectAll'; 
GO


SELECT *
FROM INFORMATION_SCHEMA.VIEWS
WHERE TABLE_NAME = 'vw_Person_TotalPoint';
GO

SELECT *
FROM sys.sql_modules
WHERE object_id = OBJECT_ID('vw_Person_TotalPoint');
GO

USE master
GO
sp_helptext @objname = 'sys.sql_modules'; 
GO

-----------------------ENCRYPTION---------------------------------------------

USE Weblog2023Dotin
GO


CREATE OR ALTER VIEW vw_TotalPoint_Sec
WITH ENCRYPTION
AS
SELECT P.FullName,
       SUM(A.Point) AS TotalPoint
FROM Person.Person P
    INNER JOIN Person.Person_Activity PA
        ON PA.PersonID = P.ID
    INNER JOIN Person.Activity A
        ON A.Code = PA.ActivityCode
GROUP BY P.FullName , p.ID
UNION
SELECT N'جمع کل',
       SUM(A.Point)
FROM Person.Person_Activity PA
    INNER JOIN Person.Activity A
        ON A.Code = PA.ActivityCode
GO

sp_depends @objname = 'vw_TotalPoint_Sec';
GO

SELECT * 
FROM sys.dm_sql_referenced_entities('DBO.vw_TotalPoint_Sec','OBJECT')
GO

----------------------------------
--Try to See the Text

sp_helptext @objname = 'vw_TotalPoint_Sec'; -- Display Text of View
GO

SELECT *
FROM INFORMATION_SCHEMA.VIEWS
WHERE TABLE_NAME = 'vw_TotalPoint_Sec';
GO

SELECT *
FROM sys.sql_modules
WHERE object_id = OBJECT_ID('vw_TotalPoint_Sec');
GO


----------------------------------

-- Try Edit Script
ALTER VIEW vw_TotalPoint_Sec
AS
SELECT *
FROM Person.Person;
GO


sp_helptext @objname = 'vw_TotalPoint_Sec';
GO


SELECT * INTO Person2
FROM Person.Person
GO


CREATE OR ALTER VIEW vw_Person2
AS
SELECT *      
FROM Person2 P 
GO


SELECT *
FROM vw_Person2
GO


ALTER TABLE [dbo].[Person2]
ADD EXTRA1 NVARCHAR(50) NULL
GO

SELECT *
FROM vw_Person2
GO

sp_refreshview @viewname = 'vw_Person2';
GO



ALTER TABLE [dbo].[Person2]
DROP COLUMN Gender
GO

SELECT *
FROM vw_Person2
GO

sp_refreshview @viewname = 'vw_Person2';
GO


ALTER TABLE [dbo].[Person2]
ADD EXTRA2 NVARCHAR(50) 
GO

--------------------Schema_Binding---------------------

CREATE OR ALTER VIEW vw_Person2_Schema_Binding
WITH SCHEMABINDING
AS
SELECT *   -- Syntax '*' is not allowed in schema-bound objects.  
FROM Person2 P 
GO


CREATE OR ALTER VIEW vw_Person2_Schema_Binding
WITH SCHEMABINDING
AS
SELECT P.ID , 
	   P.FirstName , 
	   P.LastName , 
	   P.[EXTRA1]
FROM Person2 P  -- Names must be in two-part format and an object cannot reference itself.
GO


CREATE OR ALTER VIEW vw_Person2_Schema_Binding
WITH SCHEMABINDING
AS
SELECT P.ID , 
	   P.FirstName , 
	   P.LastName , 
	   P.[EXTRA1]
FROM dbo.Person2 P 
GO



SELECT *
FROM [dbo].[vw_Person2_Schema_Binding]
GO

sp_depends @objname = '[vw_Person2_Schema_Binding]';
GO

ALTER TABLE [dbo].[Person2]
ADD EXTRA3 NVARCHAR(50) 
GO


ALTER TABLE [dbo].[Person2]
DROP COLUMN [LastName]
GO
--The object 'vw_Person2_Schema_Binding' is dependent on column 'LastName'.
--ALTER TABLE DROP COLUMN LastName failed because one or more objects access this column.

GO


--------------------------------------

-- View ==> Update ==> Table Update

-- View ==> Insert ==> Table Insert

-------------------------------------



UPDATE [dbo].[vw_All_Person] 
SET [PersonName] = N'جناب آقای / سرکار خانم ' + [PersonName]
GO

-- Update or insert of view or function 'dbo.vw_All_Person' failed because
-- it contains a derived or constant field.

UPDATE [dbo].[vw_All_Person] 
SET [SSN] = 'ABCDABCDCD'
GO

SELECT *
FROM Person
GO



UPDATE [dbo].[vw_Person2] 
SET [FirstName] = N'جناب آقای / سرکار خانم ' + [FirstName]
GO

SELECT *
FROM Person2
GO

INSERT INTO [dbo].[vw_Person2] ([ActorID],[FirstName],[LastName], [EXTRA1])
VALUES (100,'aJAB !!' , '2jAB !!' , 'eXTRA :-)')
GO

SELECT *
FROM Person2
GO

SET NOCOUNT ON
GO

SET STATISTICS TIME OFF
GO


UPDATE [dbo].[Person2]
SET FirstName = N'آقا '  + FirstName;
GO



CREATE OR ALTER VIEW vw_Person3
AS
SELECT *
FROM Person2 
WHERE FirstName LIKE N'آقا%'
WITH CHECK OPTION
GO



SELECT *
FROM [dbo].[vw_Person3]


INSERT INTO [dbo].[vw_Person2] ([ActorID],[FirstName],[LastName], [EXTRA1])
VALUES (100,'aJAB !!' , '2jAB !!' , 'eXTRA :-)')
GO

INSERT INTO [dbo].[vw_Person3] ([ActorID],[FirstName],[LastName], [EXTRA1])
VALUES (100,'aJAB !!' , '3jAB !!' , 'eXTRA :-)')
GO

-- The attempted insert or update failed because
-- one or more rows resulting from the operation did not qualify under the CHECK OPTION constraint.
GO

