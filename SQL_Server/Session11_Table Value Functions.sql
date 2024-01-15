USE Weblog2023Dotin;
GO

--- Table Value Functions


CREATE OR ALTER FUNCTION fn_GetPostByCatID
(
    @CatID INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM Content.Post P
    WHERE P.CategoryID = @CatID
);
GO

SELECT * FROM dbo.fn_GetPostByCatID(6) func
GO


CREATE OR ALTER FUNCTION fn_GetPostByCatID2
(
    @CatID INT
)
RETURNS @Result TABLE
(
    ID   INT NOT NULL,
    Title NVARCHAR(50) NOT NULL,
    Body NVARCHAR(MAX) NOT NULL
)
AS
BEGIN

   --Fill Table
    INSERT INTO @Result
    (
	    ID,
        Title,
        Body
    )
    SELECT P.ID,
	       P.Title,
           P.Body
    FROM Content.Post P
    WHERE P.CategoryID = @CatID

	RETURN

END;
GO


SELECT *
FROM dbo.fn_GetPostByCatID2(1) 
GO

-------------------------------------------------

SELECT  *
FROM    dbo.Category C
        INNER JOIN Content.Post P ON P.CategoryID = C.ID
GO


SELECT  *
FROM    dbo.Category C
        CROSS APPLY ( SELECT    *
                      FROM      Content.Post P
                      WHERE     C.ID = p.CategoryID
                    ) A 
GO 


-----------------------------------------

SELECT  *
FROM    dbo.Category C
        LEFT OUTER JOIN Content.Post P ON P.CategoryID = C.ID
GO


SELECT  *
FROM    dbo.Category C
        OUTER APPLY ( SELECT    *
                      FROM      Content.Post P
                      WHERE     C.ID = p.CategoryID
                    ) A 
GO 

SELECT  *
FROM    dbo.Category C
        CROSS APPLY dbo.fn_GetPostByCatID(C.ID) fn
GO 

SELECT  *
FROM    dbo.Category C
        CROSS APPLY dbo.fn_GetPostByCatID2(C.ID) fn
GO 

SELECT  *
FROM    dbo.Category C
        OUTER APPLY dbo.fn_GetPostByCatID(C.ID) fn
GO 

SELECT  *
FROM    dbo.Category C
        OUTER APPLY dbo.fn_GetPostByCatID2(C.ID) fn
GO 



-- INNER
-- OUTER ( LEFT , RIGHT , FULL )

SELECT *
FROM Person.Person
GO

SELECT *
FROM Person.Person
WHERE 1=2
GO

SELECT *
FROM Person.Person
WHERE 1=1
GO

SELECT  deqs.last_execution_time AS [Time] ,
        dest.text AS [Query]
FROM    sys.dm_exec_query_stats AS deqs
        CROSS APPLY sys.dm_exec_sql_text(deqs.sql_handle) AS dest
ORDER BY deqs.last_execution_time DESC
GO

-------------------------------------------------------------


USE [tempdb] 
GO 
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'[Employee]')
                    AND type IN ( N'U' ) )
    BEGIN 
        DROP TABLE [Employee] 
    END 
GO 
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'[Department]')
                    AND type IN ( N'U' ) )
    BEGIN 
        DROP TABLE [Department] 
    END 



CREATE TABLE [Department]
    (
      [DepartmentID] [INT] NOT NULL PRIMARY KEY ,
      [Name] VARCHAR(250) NOT NULL, 
    )
ON  [PRIMARY] 
INSERT  [Department]
        ( [DepartmentID], [Name] )
VALUES  ( 1, N'Engineering' ) 
INSERT  [Department]
        ( [DepartmentID], [Name] )
VALUES  ( 2, N'Administration' ) 
INSERT  [Department]
        ( [DepartmentID], [Name] )
VALUES  ( 3, N'Sales' ) 
INSERT  [Department]
        ( [DepartmentID], [Name] )
VALUES  ( 4, N'Marketing' ) 
INSERT  [Department]
        ( [DepartmentID], [Name] )
VALUES  ( 5, N'Finance' ) 
GO 
CREATE TABLE [Employee]
    (
      [EmployeeID] [INT] NOT NULL PRIMARY KEY ,
      [FirstName] VARCHAR(250) NOT NULL ,
      [LastName] VARCHAR(250) NOT NULL ,
      [DepartmentID] [INT] NOT NULL REFERENCES [Department] ( DepartmentID ), 
    )
ON  [PRIMARY] 
GO 
INSERT  [Employee]
        ( [EmployeeID] ,
          [FirstName] ,
          [LastName] ,
          [DepartmentID]
        )
VALUES  ( 1 ,
          N'Orlando' ,
          N'Gee' ,
          1
        ) 
INSERT  [Employee]
        ( [EmployeeID] ,
          [FirstName] ,
          [LastName] ,
          [DepartmentID]
        )
VALUES  ( 2 ,
          N'Keith' ,
          N'Harris' ,
          2
        ) 
INSERT  [Employee]
        ( [EmployeeID] ,
          [FirstName] ,
          [LastName] ,
          [DepartmentID]
        )
VALUES  ( 3 ,
          N'Donna' ,
          N'Carreras' ,
          3
        ) 
INSERT  [Employee]
        ( [EmployeeID] ,
          [FirstName] ,
          [LastName] ,
          [DepartmentID]
        )
VALUES  ( 4 ,
          N'Janet' ,
          N'Gates' ,
          3
        )


SELECT *
FROM dbo.Employee
GO

SELECT  *
FROM    Department D
        CROSS APPLY ( SELECT    *
                      FROM      Employee E
                      WHERE     E.DepartmentID = D.DepartmentID
					  --ORDER BY 1
                    )X 
GO 




SELECT  *
FROM    Department D
        INNER JOIN Employee E ON D.DepartmentID = E.DepartmentID 
GO

-----------------------------------------


SELECT  *
FROM    Department D
        OUTER APPLY ( SELECT    *
                      FROM      Employee E
                      WHERE     E.DepartmentID = D.DepartmentID
                    ) A 
GO 



SELECT  *
FROM    Department D
        LEFT OUTER JOIN Employee E ON D.DepartmentID = E.DepartmentID 
GO 


SELECT  *
FROM    Department D
        CROSS APPLY Employee E
		WHERE d.DepartmentID = E.DepartmentID
GO

SELECT  *
FROM    Department D
        OUTER APPLY  Employee E
		WHERE d.DepartmentID = E.DepartmentID
GO


-------------------------------------------------------------------------------

IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'[fn_GetAllEmployeeOfADepartment]')
                    AND type IN ( N'IF' ) )
    BEGIN 
        DROP FUNCTION dbo.fn_GetAllEmployeeOfADepartment 
    END 
GO

CREATE FUNCTION dbo.fn_GetAllEmployeeOfADepartment ( @DeptID AS INT )
RETURNS TABLE
AS 
RETURN
    ( SELECT    *
      FROM      Employee E
      WHERE     E.DepartmentID = @DeptID
    ) 
GO 



SELECT  D.DepartmentID,
        D.Name,
        f.EmployeeID,
        f.FirstName,
        f.LastName,
        f.DepartmentID
FROM    DBO.Department D
        CROSS APPLY dbo.fn_GetAllEmployeeOfADepartment(D.DepartmentID) f
GO 


SELECT  *
FROM    Department D
        OUTER APPLY dbo.fn_GetAllEmployeeOfADepartment(D.DepartmentID) 
GO

--------------------------------------------------------


USE tempdb 
GO 
SELECT  DB_NAME(database_id) AS [Database] ,
        [text] AS [Query]
FROM    sys.dm_exec_requests r
        CROSS APPLY sys.dm_exec_sql_text(r.plan_handle) st
WHERE   session_id > 50           -- Consider spids for users only, no system spids. 
       -- AND session_id NOT IN ( @@SPID )
  -- Don't include request from current spid.

--------------------------



--Create Employees table and insert values.

USE master
GO


CREATE DATABASE CrossApplyExample
GO


USE CrossApplyExample
GO

CREATE TABLE Employee
    (
      ID INT NOT NULL ,
      ManagerID INT NULL ,
      Name VARCHAR(25) NOT NULL ,
      Salary MONEY NOT NULL CONSTRAINT PK_Employee PRIMARY KEY ( ID )
    );
GO


INSERT  INTO Employee
VALUES  ( 1, NULL, 'Nancy', $10000.00 );
INSERT  INTO Employee
VALUES  ( 2, 1, 'Andrew', $5000.00 );
INSERT  INTO Employee
VALUES  ( 3, 1, 'Janet', $5000.00 );
INSERT  INTO Employee
VALUES  ( 4, 1, 'Margaret', $5000.00 );
INSERT  INTO Employee
VALUES  ( 5, 2, 'Steven', $2500.00 );
INSERT  INTO Employee
VALUES  ( 6, 2, 'Michael', $2500.00 );
INSERT  INTO Employee
VALUES  ( 7, 3, 'Robert', $2500.00 );
INSERT  INTO Employee
VALUES  ( 8, 3, 'Laura', $2500.00 );
INSERT  INTO Employee
VALUES  ( 9, 3, 'Ann', $2500.00 );
INSERT  INTO Employee
VALUES  ( 10, 4, 'Ina', $2500.00 );
INSERT  INTO Employee
VALUES  ( 11, 7, 'David', $2000.00 );
INSERT  INTO Employee
VALUES  ( 12, 7, 'Ron', $2000.00 );
INSERT  INTO Employee
VALUES  ( 13, 7, 'Dan', $2000.00 );
INSERT  INTO Employee
VALUES  ( 14, 11, 'James', $1500.00 );
GO
--Create Departments table and insert values.
CREATE TABLE Department
    (
      ID INT NOT NULL
             PRIMARY KEY ,
      Name VARCHAR(25) NOT NULL ,
      EmployeeManagerID INT NULL
                            REFERENCES Employee
    );
GO
INSERT  INTO Department
VALUES  ( 1, 'HR', 2 );
INSERT  INTO Department
VALUES  ( 2, 'Marketing', 7 );
INSERT  INTO Department
VALUES  ( 3, 'Finance', 8 );
INSERT  INTO Department
VALUES  ( 4, 'R&D', 9 );
INSERT  INTO Department
VALUES  ( 5, 'Training', 4 );
INSERT  INTO Department
VALUES  ( 6, 'Gardening', NULL );

GO

SELECT  *
FROM    dbo.Employee

SELECT  *
FROM    dbo.Department

GO


--Most departments in the Departments table have a manager ID that corresponds to
-- an employee in the Employees table. 
--The following table-valued function accepts an employee ID as an argument
--and returns that employee and all of his or her subordinates


--Recursive common table expression 
--'Employees_Subtree' does not contain 
--a top-level UNION ALL operator.

CREATE FUNCTION dbo.fn_GetSubTree ( @empID AS INT )
RETURNS @TREE TABLE
    (
      EmpID INT NOT NULL ,
      EmpName VARCHAR(25) NOT NULL ,
      ManagerID INT NULL ,
      [Level] INT NOT NULL
    )
AS
    BEGIN
        WITH    Employees_Subtree ( EmpID, EmpName, ManagerID, [Level] )
                  AS ( 
                       SELECT   ID ,
                                Name ,
                                ManagerID ,
                                0
                       FROM     Employee
                       WHERE    ID = @empID

                       UNION ALL
    
    -- Recursive Member (RM)
                       SELECT   e.ID ,
                                e.Name ,
                                e.ManagerID ,
                                es.[Level] + 1
                       FROM     Employee AS e
                                JOIN Employees_Subtree AS es ON e.ManagerID = es.EmpID
                     )
            INSERT  INTO @TREE
            SELECT  * FROM    Employees_Subtree;


			RETURN
    END
GO


---------------------------------------------------------

--To return all of the subordinates in all levels for the manager of each department,
-- use the following query.

SELECT  
        D.Name ,
        D.EmployeeManagerID ,
        ST.EmpName ,
        ST.ManagerID,
		ST.Level
FROM    Department AS D
        CROSS APPLY dbo.fn_GetSubTree(D.EmployeeManagerID) AS ST;

GO

SELECT *
FROM dbo.fn_GetSubTree(7)
GO


------------------------------------------------

-- (1) Create table to store heirachical data (EmployeeManager)
CREATE TABLE Employee2
    (
      EmployeeID INT ,
      Name VARCHAR(40) ,
      ManagerID INT
    );
GO

-- (2) Populate table with hierarchical data
INSERT  INTO dbo.Employee2
VALUES  ( 1, 'Asif', NULL )
,       ( 2, 'Mike', 1 )
,       ( 3, 'Peter', 1 )
,       ( 4, 'Sarah', 2 )
,       ( 5, 'Andy', 3 )
,       ( 6, 'Asad', 5 )
GO

-- (3) View table with heirarchical data - INNER JOIN
SELECT  'USING INNER JOIN'
SELECT  EMP.EmployeeID ,
        EMP.Name ,
        EMP.ManagerID ,
        MAN.Name AS ManagerName
FROM    dbo.Employee2 EMP
        INNER JOIN dbo.Employee2 MAN ON EMP.ManagerID = MAN.EmployeeID;
GO

-- (4) View table with hierarchical data - CROSS APPLY
SELECT  'USING CROSS APPLY'
SELECT  EMP.EmployeeID ,
        EMP.Name ,
        MAN.ManagerName
FROM    dbo.Employee2 EMP
        CROSS APPLY ( SELECT    MAN.Name AS ManagerName
                      FROM      dbo.Employee2 MAN
                      WHERE     MAN.EmployeeID = EMP.ManagerID
                    ) AS MAN;
GO


