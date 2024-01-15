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

USE Weblog2023Dotin
GO

SELECT CONCAT(P.FirstName , ' ' , P.LastName) FULLNAME, 
       SUM(A.Point) TOTALPOINT
FROM dbo.Person P
INNER JOIN dbo.Person_Activity PA ON PA.PersonID = P.ID
JOIN Person.Activity A ON A.Code = PA.ActivityCode
GROUP BY CONCAT(P.FirstName, ' ', P.LastName) , P.ID

UNION 

SELECT 'جمع کل' , 
        SUM(A.Point)
FROM dbo.Person_Activity PA 
JOIN Person.Activity A ON A.Code = PA.ActivityCode

ORDER BY TOTALPOINT ASC
GO


SELECT db.database_id , db.name
FROM SYS.databases db
WHERE db.name NOT IN ('tempdb','master','model','msdb')

UNION

SELECT 0 , 'لطفا یک دیتابیس انتخاب کنید'

ORDER BY db.database_id ASC
GO

SELECT p.id , p.FirstName
FROM dbo.Person p

EXCEPT

SELECT DISTINCT P.ID , P.FirstName
FROM dbo.Person P
INNER JOIN dbo.Person_Activity PA ON PA.PersonID = P.ID
GO

------------------ Subquery -------------------

SELECT (SELECT 'SALAM')

SELECT * FROM dbo.Person WHERE RoleCode = 1
SELECT * FROM dbo.Person WHERE RoleCode = (SELECT R.Code FROM dbo.Role R WHERE R.Code = 1)
SELECT * FROM dbo.Person WHERE RoleCode IN (1,4)
SELECT * FROM dbo.Person WHERE RoleCode IN (SELECT R.Code FROM dbo.Role R WHERE R.Code IN(1,4))
SELECT * FROM dbo.Person WHERE RoleCode = (SELECT R.Code FROM dbo.Role R WHERE R.Code IN(1,4))
SELECT * FROM dbo.Person WHERE RoleCode = (SELECT R.Code FROM dbo.Role R)

--Only one expression can be specified in the select list
--when the subquery is not introduced with EXISTS.
SELECT * FROM dbo.Person WHERE RoleCode IN (SELECT* FROM dbo.Role R)
GO


--Subquery returned more than 1 value. 
--This is not permitted when the subquery follows =, !=, <, <= , >, >= 
--OR when the subquery is used as an expression.

GO

SELECT *
FROM dbo.Person
WHERE RoleCode IN
      (
          SELECT R.Code FROM dbo.Role R WHERE R.Code IN ( 1, 4 )
      );


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

---------------------------------------

--https://www.mssqltips.com/sqlservertip/6038/sql-server-derived-table-example/


--The ORDER BY clause is invalid in 

--views, 
--inline functions, 
--derived tables, 
--subqueries, 
--common table expressions, 

--unless TOP, OFFSET or FOR XML is also specified.
GO

----------------------- TASK 3 ----------------------

-- QTY : 100
-- DISTINCT QTY : 1 , 1 , 1


-- HARD CODE 
DECLARE @QTY INT
SET @QTY = 3
PRINT @QTY
GO

-- CALCULATE
DECLARE @QTY INT
SET @QTY = (SELECT COUNT(A.Code) FROM Person.Activity A ) 
PRINT @QTY

SELECT P.ID ,     
       P.FirstName , 
     COUNT(PA.PersonID),
	 COUNT(DISTINCT PA.ActivityCode)
FROM dbo.Person P
JOIN dbo.Person_Activity PA ON PA.PersonID = P.ID
GROUP BY P.ID, P.FirstName
GO


DECLARE @QTY INT
SET @QTY = (SELECT COUNT(A.Code) FROM Person.Activity A ) 

SELECT P.ID ,     
       P.FirstName , 
	   COUNT(DISTINCT PA.ActivityCode) DISTINCT_QTY
FROM dbo.Person P
JOIN dbo.Person_Activity PA ON PA.PersonID = P.ID
GROUP BY P.ID, P.FirstName
HAVING COUNT(DISTINCT PA.ActivityCode) = @QTY
GO


-- WITH X  AS (...............) , 
--      X2 AS (..............) ,
--      X3 AS (..............)

WITH ALL_ACTIVITIES_QTY
AS
(
    SELECT COUNT(A.Code) TEDAD
	 FROM Person.Activity A 
),
ALL_DISTINCT_PERSON_ACTIVITIES
AS
(
   SELECT P.ID ,     
          P.FirstName , 
	      COUNT(DISTINCT PA.ActivityCode) TEDAD
FROM dbo.Person P
JOIN dbo.Person_Activity PA ON PA.PersonID = P.ID
GROUP BY P.ID, P.FirstName
)

----------------------------- JOIN WITHOUT PK , FK ----------------
SELECT *
FROM ALL_ACTIVITIES_QTY AAL
INNER JOIN ALL_DISTINCT_PERSON_ACTIVITIES DIS
ON  AAL.TEDAD = DIS.TEDAD
GO






SELECT P.ID ,     
       P.FirstName , 
     COUNT(PA.PersonID) DUPLICATE_QTY,
	 COUNT(DISTINCT PA.ActivityCode) DISTINCT_QTY
FROM dbo.Person P
JOIN dbo.Person_Activity PA ON PA.PersonID = P.ID
GROUP BY P.ID, P.FirstName
GO

SELECT P.ID ,     
       P.FirstName , 
     COUNT(PA.PersonID) DUPLICATE_QTY,
	 COUNT(DISTINCT PA.ActivityCode) DISTINCT_QTY,
	 DUPLICATE_QTY - DISTINCT_QTY DIFF
FROM dbo.Person P
JOIN dbo.Person_Activity PA ON PA.PersonID = P.ID
GROUP BY P.ID, P.FirstName
GO

SELECT P.ID ,     
       P.FirstName , 
     COUNT(PA.PersonID) DUPLICATE_QTY,
	 COUNT(DISTINCT PA.ActivityCode) DISTINCT_QTY,
	 COUNT(PA.PersonID) -  COUNT(DISTINCT PA.ActivityCode) DIFF
FROM dbo.Person P
JOIN dbo.Person_Activity PA ON PA.PersonID = P.ID
GROUP BY P.ID, P.FirstName
GO


SELECT TMP.ID,
       TMP.FirstName,
       TMP.DUPLICATE_QTY,
       TMP.DISTINCT_QTY,
	   TMP.DUPLICATE_QTY - TMP.DISTINCT_QTY
FROM (
SELECT P.ID ,     
       P.FirstName , 
     COUNT(PA.PersonID) DUPLICATE_QTY,
	 COUNT(DISTINCT PA.ActivityCode) DISTINCT_QTY
FROM dbo.Person P
JOIN dbo.Person_Activity PA ON PA.PersonID = P.ID
GROUP BY P.ID, P.FirstName
) TMP
GO
------------------------------------

SELECT X2.ID,
       X2.FirstName,
       X2.AllAct,
       X2.DisAct,
       X2.DIFF
FROM 
(
SELECT X.* , 
       X.AllAct - X.DisAct DIFF
FROM (
SELECT P.ID , 
       P.FirstName, 
	   COUNT(PA.ActivityCode) AllAct, 
	   COUNT(DISTINCT PA.ActivityCode) DisAct
FROM dbo.Person P
INNER JOIN DBO.Person_Activity PA ON P.ID = PA.PersonID
GROUP BY P.ID , P.FirstName ) X
) X2
WHERE X2.DIFF > 0
ORDER BY X2.FirstName
GO

SELECT X.*,
       X.AllAct - X.DisAct DIFF
FROM
(
    SELECT P.ID,
           P.FirstName,
           COUNT(PA.ActivityCode) AllAct,
           COUNT(DISTINCT PA.ActivityCode) DisAct
    FROM DBO.Person P
        INNER JOIN DBO.Person_Activity PA
            ON P.ID = PA.PersonID
    WHERE X.AllAct - X.DisAct > 0 -- The multi-part identifier "X.AllAct" could not be bound.
    GROUP BY P.ID,
             P.FirstName
) X;
GO


SELECT X.* , 
       X.AllAct - X.DisAct DIFF
FROM (
SELECT P.ID , 
       P.FirstName , 
	   COUNT(PA.ActivityCode) AllAct, 
	   COUNT(DISTINCT PA.ActivityCode) DisAct
FROM DBO.Person P
INNER JOIN DBO.Person_Activity PA ON P.ID = PA.PersonID
GROUP BY P.ID , P.FirstName ) X
--WHERE DIFF > 0
WHERE X.AllAct - X.DisAct > 0
GO


SELECT P.ID , 
       P.FirstName , 
	   COUNT(PA.ActivityCode) AllAct, 
	   COUNT(DISTINCT PA.ActivityCode) DisAct,
	   COUNT(PA.ActivityCode) - COUNT(DISTINCT PA.ActivityCode) DIFF
FROM DBO.Person P
INNER JOIN DBO.Person_Activity PA ON P.ID = PA.PersonID
GROUP BY P.ID , P.FirstName
HAVING COUNT(PA.ActivityCode) - COUNT(DISTINCT PA.ActivityCode) > 0
GO


-- **** روش سلکت استار روی یک کوئری موجود را در ذهن داشته باشید
-- اگر جایی هیچ روش دیگری جواب نداد از آن استفاده کنید

-----------------------------------------------------------------------

GO

WITH Person_Total_Point
AS(
SELECT P.FirstName,
       SUM (A.Point)  TotalPoint
FROM DBO.Person P
INNER JOIN DBO.Person_Activity PA ON P.ID = PA.PersonID
INNER JOIN Person.Activity A ON PA.ActivityCode = A.Code
GROUP BY P.ID, P.FirstName)

--SELECT  *
--FROM Person_Total_Point PTP
--ORDER BY 2 DESC

SELECT TOP (1) WITH TIES PTP.FirstName,
                         PTP.TotalPoint
FROM Person_Total_Point PTP
ORDER BY PTP.TotalPoint
GO

--WITH TIES Returns two or more rows that tie for last place in the limited results set. 
--You must use this argument with the ORDER BY clause. 
--WITH TIES might cause more rows to be returned than the value specified in expression. 
--For example, if expression is set to 5 but two additional rows match 
--the values of the ORDER BY columns in row 5, 
--the result set will contain seven rows.

----------------------

-- لیست افرادی با کمترین یا بیشترین امتیاز

WITH Person_Total_Point
AS(
SELECT P.FirstName,
       SUM (A.Point)  TotalPoint
FROM DBO.Person P
INNER JOIN DBO.Person_Activity PA ON P.ID = PA.PersonID
INNER JOIN Person.Activity A ON PA.ActivityCode = A.Code
GROUP BY P.ID, P.FirstName)

SELECT *
FROM Person_Total_Point PTP
WHERE TotalPoint = (SELECT MAX(P.TotalPoint) FROM Person_Total_Point P)
--WHERE TotalPoint = (SELECT MIN(P.TotalPoint) FROM Person_Total_Point P)
ORDER BY 1
GO

----------------------------------------------

--(= some) === in
--However, (!some) !=== not in

--(! all) === not in
--However, (= all) !=== in


-- همه بجز کمترین ها
-- همه بجز بیشترین ها


-- افرادی که حداقل از یک نفر بیشتر امتیاز دارند
-- افرادی که حداقل از یک نفر کمتر امتیاز دارند


WITH Person_Total_Point
AS(
SELECT P.FirstName,
       SUM (A.Point)  TotalPoint
FROM DBO.Person P
INNER JOIN DBO.Person_Activity PA ON P.ID = PA.PersonID
INNER JOIN PERSON.Activity A ON PA.ActivityCode = A.Code
GROUP BY P.ID, P.FirstName)


SELECT *
FROM Person_Total_Point PTP
WHERE TotalPoint > SOME (SELECT MIN(P.TotalPoint) FROM Person_Total_Point P)
ORDER BY 2
GO

--------------------------------------------------

WITH Person_Total_Point
AS(
SELECT P.FirstName,
       SUM (A.Point)  TotalPoint
FROM DBO.Person P
INNER JOIN DBO.Person_Activity PA ON P.ID = PA.PersonID
INNER JOIN PERSON.Activity A ON PA.ActivityCode = A.Code
GROUP BY P.ID, P.FirstName)


SELECT *
FROM Person_Total_Point PTP
--WHERE TotalPoint > SOME (SELECT MAX(P.TotalPoint) FROM Person_Total_Point P)
--WHERE TotalPoint >= SOME (SELECT MAX(P.TotalPoint) FROM Person_Total_Point P)
--WHERE TotalPoint < SOME (SELECT MAX(P.TotalPoint) FROM Person_Total_Point P)
WHERE TotalPoint < SOME (SELECT (P.TotalPoint) FROM Person_Total_Point P)

ORDER BY 2
GO
-------------------------------------------

WITH Person_Total_Point
AS(
SELECT P.FirstName,
       SUM (A.Point)  TotalPoint
FROM Person P
INNER JOIN Person_Activity PA ON P.ID = PA.PersonID
INNER JOIN PERSON.Activity A ON PA.ActivityCode = A.Code
GROUP BY P.ID, P.FirstName)


SELECT *
FROM Person_Total_Point PTP
--WHERE TotalPoint < ALL (SELECT MIN(P.TotalPoint) FROM Person_Total_Point P)
--WHERE TotalPoint <= ALL (SELECT MIN(P.TotalPoint) FROM Person_Total_Point P)
--WHERE TotalPoint > ALL (SELECT MAX(P.TotalPoint) FROM Person_Total_Point P)
--WHERE TotalPoint >= ALL (SELECT MAX(P.TotalPoint) FROM Person_Total_Point P)

-- TNX TO ROYA
WHERE PTP.TotalPoint > SOME  (SELECT ID FROM dbo.Person)
ORDER BY 2
GO

-------------------------------------------
--FYI : FOR YOUR INFORMATION
SELECT ALL * FROM DBO.Person
GO
---------------------------------------------


----------------------------------------------------

-- توابع بازگشتی
-- 5! = 5*4*3*2*1 ==> FOR , REC ( NO FOR ) , EXIT CONDITION ==> STACK OVERFLOW EXCEPTION
-- 5! = 5 * 4!
-- N! = N * (N-1)!

/*
WITH expression_name (column_list)
AS
(
    -- Anchor member
    initial_query  

    UNION ALL

    -- Recursive member that references expression_name.
    recursive_query  
)
-- references expression name

SELECT *
FROM   expression_name

*/

WITH RecursiveCTE
AS
(
    SELECT 0 AS RecursiveValue

	UNION ALL

	SELECT *
	FROM RecursiveCTE Rec
)

SELECT *
FROM RecursiveCTE
GO

--Recursive common table expression 'RecursiveCTE' 
--does not contain a top-level UNION ALL operator.
--The statement terminated. 
--The maximum recursion 100 has been exhausted before statement completion.



WITH RecursiveCTE
AS
(
    SELECT 0 AS X

	UNION ALL 

	SELECT Rec.X + 1
	FROM RecursiveCTE Rec
	WHERE Rec.X < 200
)
SELECT *
FROM RecursiveCTE
OPTION (MAXRECURSION 200)
GO


--An incorrectly composed recursive CTE may cause an infinite loop. 
--For example, if the recursive member query definition returns the same values for both the parent and child columns, 
--an infinite loop is created. 

--To prevent an infinite loop, you can limit the number of recursion levels allowed for a particular statement 
--by using the MAXRECURSION hint and a value between 0 and 32,767 in the OPTION clause of the INSERT, UPDATE, DELETE, or SELECT statement.

--This lets you control the execution of the statement until you resolve the code problem that is creating the loop.
--The server-wide default is 100. 
--When 0 is specified, no limit is applied. 

--Only one MAXRECURSION value can be specified per statement. 




SELECT *
FROM dbo.Category
GO



WITH AllChildCTE
AS
(
   SELECT BaseParent.ID , BaseParent.Title
   FROM dbo.Category BaseParent
   WHERE BaseParent.ID = 5 -- Hard Code

   UNION ALL

   SELECT C.ID , C.Title
   FROM AllChildCTE ACC
   INNER JOIN dbo.Category C ON C.ParentID = ACC.ID
)

SELECT *
FROM AllChildCTE
GO

--------------------------


WITH AllChildCTE
AS
(
   SELECT BaseParent.ID , BaseParent.Title
   FROM dbo.Category BaseParent
   WHERE BaseParent.ParentID IS NULL -- همه والد ها

   UNION ALL

   SELECT C.ID , C.Title
   FROM AllChildCTE ACC
   INNER JOIN dbo.Category C ON C.ParentID = ACC.ID
)

SELECT *
FROM AllChildCTE
GO


WITH AllChildCTE
AS
(
   SELECT BaseParent.ID , BaseParent.Title
   FROM dbo.Category BaseParent
   WHERE BaseParent.ParentID IS NULL -- همه والد ها

   UNION ALL

   SELECT C.ID , C.Title
   FROM AllChildCTE ACC
   LEFT OUTER JOIN dbo.Category C ON C.ParentID = ACC.ID
   --Outer join is not allowed in the recursive part of
   --a recursive common table expression 'AllChildCTE'.
)

SELECT *
FROM AllChildCTE
GO


-------------------------
WITH AllChildCTE
AS
(
   SELECT BaseParent.ID , BaseParent.Title
   FROM dbo.Category BaseParent
   WHERE BaseParent.ParentID is null -- Hard Code

   UNION ALL

   SELECT C.ID , C.Title
   FROM AllChildCTE ACC
   INNER JOIN dbo.Category C ON C.ParentID = ACC.ID
)

SELECT *
FROM AllChildCTE
OPTION (MAXRECURSION 3 )
GO
--The statement terminated. The maximum recursion 2 has been exhausted before statement completion.




WITH AllChildCTE
AS
(
   SELECT BaseParent.ID , BaseParent.Title
   FROM dbo.Category BaseParent
   WHERE BaseParent.ParentID IS NOT NULL -- Hard Code

   UNION ALL

   SELECT C.ID , C.Title
   FROM AllChildCTE ACC
   INNER JOIN dbo.Category C ON C.ParentID = ACC.ID
)

SELECT AllChildCTE.ID,
       AllChildCTE.Title
FROM AllChildCTE

UNION ALL

   SELECT C.ID , C.Title
   FROM dbo.Category C
   WHERE C.ParentID IS NULL

   ORDER BY AllChildCTE.ID ASC
   
GO

--https://www.sqlservertutorial.net/sql-server-basics/sql-server-recursive-cte/

/*
WITH cte_org AS (
    SELECT       
        staff_id, 
        first_name,
        manager_id
        
    FROM       
        sales.staffs
    WHERE manager_id IS NULL
    UNION ALL
    SELECT 
        e.staff_id, 
        e.first_name,
        e.manager_id
    FROM 
        sales.staffs e
        INNER JOIN cte_org o 
            ON o.staff_id = e.manager_id
)
SELECT * FROM cte_org;
*/


----------------------------------------- EXISTS

--Exists return true when subquery contains any rows 


SELECT * FROM Person 
WHERE RoleCode IN ( SELECT * FROM Role WHERE Code = 1 )
GO

--Consider using EXISTS instead of IN

--Only one expression can be specified in the select 
--list when the subquery is not introduced with EXISTS.


SELECT * FROM dbo.Person WHERE EXISTS (SELECT * FROM Role)
SELECT * FROM dbo.Person WHERE EXISTS (SELECT * FROM Role WHERE Code > 10)

SELECT * FROM dbo.Person WHERE EXISTS (SELECT 1)
SELECT * FROM dbo.Person WHERE EXISTS (SELECT 0)
SELECT * FROM dbo.Person WHERE EXISTS (SELECT NULL)

SELECT 1/0  -- Divide by zero error encountered.

SELECT * FROM dbo.Person WHERE EXISTS (SELECT 1/0)
GO

SELECT *
FROM dbo.Person PE
WHERE EXISTS
(
    SELECT * 
	FROM dbo.Post PO 
	WHERE PE.ID = PO.PersonID
);
GO


SELECT *
FROM dbo.Person PE
WHERE EXISTS
(
    SELECT 1 
	FROM dbo.Post PO 
	WHERE PE.ID = PO.PersonID
);
GO



-- اطلاعات در هم ضرب میشود
SELECT PE.*
FROM Person PE
INNER JOIN Post po ON po.PersonID = PE.ID
GO


-- از جداول دیگر هم میتوانید در خروجی ، ستونی را داشته باشید
SELECT *
FROM Person PE
INNER JOIN Post po ON po.PersonID = PE.ID
GO


SELECT *
FROM dbo.Person PE
WHERE NOT EXISTS
(
    SELECT 1 FROM dbo.Post PO WHERE PE.ID = PO.PersonID
);
GO

/* 

At one time, the EXISTS logical operator was faster than IN, when comparing data sets using a subquery. 

For example, in cases where the query had to perform a certain task, but only if the subquery returned any rows, 
then when evaluating WHERE EXISTS (subquery), the database engine could quit searching as soon as it had found just one row, 
whereas WHERE IN (subquery) would always collect all the results from the sub-query, before further processing.However, 
the query optimizer now treats EXISTS and IN the same way, whenever it can, so you’re unlikely to see any significant performance differences.

For the NOT IN (subquery) or NOT EXISTS (subquery) variants, 
there can never be any performance difference regardless (the entire result set must be read in either case).
However, you need to be cautious when using the NOT IN operator if the subquery’s source data contains NULL values. 
If so, you should always consider using a NOT EXISTS operator instead of NOT IN, or recast the statement as a left outer join.

For more information, and examples, see the following Product Learning article: 
Consider using [NOT] EXISTS instead of [NOT] IN (subquery)

*/


SELECT *
FROM dbo.Person P
ORDER BY 
CASE WHEN P.Gender = 0 THEN P.FirstName END ASC ,
CASE WHEN P.Gender = 1 THEN P.FirstName END DESC 
GO

SELECT *
FROM Person P
ORDER BY 
CASE WHEN P.Gender = 1 THEN P.FirstName END DESC ,
CASE WHEN P.Gender = 0 THEN P.FirstName END ASC 
GO
-----------------------------------------------------------

-- FAMILY DATABASE