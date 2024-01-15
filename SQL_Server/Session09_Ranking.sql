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
USE Weblog2023Dotin
GO

ALTER SCHEMA Person
TRANSFER dbo.Person
GO

ALTER TABLE Person.Person
ADD FullName AS 
( CONCAT(FirstName,' ',LastName))
GO

CREATE SCHEMA Content
GO

ALTER SCHEMA Content
TRANSFER dbo.Post
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

DECLARE @PageNumber INT 
DECLARE @ItemsPerPage TINYINT

SET @PageNumber = 1
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


SELECT 
       YEAR(P.DATETIME) YEAR,
	   MONTH(P.DATETIME) MONTH,
	   COUNT(MONTH(P.DATETIME)) TEDAD
FROM Content.Post P
GROUP BY 
         YEAR(P.DATETIME) ,
	     MONTH(P.DATETIME)
ORDER BY TEDAD DESC
GO

SELECT ROW_NUMBER() OVER (PARTITION BY MONTH(P.DATETIME) ORDER BY P.ID ) [ROW_NUMBER] ,
       DATENAME(MONTH ,P.DATETIME) [MONTH],
	   P.Title , 
	   P.Body
FROM Content.Post P
GO

SELECT ROW_NUMBER() OVER (PARTITION BY YEAR(P.DATETIME) ORDER BY P.ID ) [ROW_NUMBER] ,
       DATENAME(YEAR ,P.DATETIME) [YEAR],
	   P.Title , 
	   P.Body
FROM Content.Post P
GO



-- Finding the First N Rows of Every Group 


-- اولین پست هر ماه


SELECT X.[ROW_NUMBER],
       X.ID,
       X.[YEAR],
       X.Title,
       X.Body
FROM 
(
SELECT ROW_NUMBER() OVER (PARTITION BY YEAR(P.DATETIME) ORDER BY P.ID ) [ROW_NUMBER] ,
       P.ID,
       YEAR(P.DATETIME) YEAR,
	   P.Title , 
	   P.Body
FROM Content.Post P

)X
WHERE X.ROW_NUMBER = 1
GO


SELECT X.[ROW_NUMBER],
       X.[MONTH],
       X.Title,
       X.Body
FROM 
(
SELECT ROW_NUMBER() OVER (PARTITION BY MONTH(P.DATETIME) ORDER BY P.ID ) [ROW_NUMBER] ,
       MONTH(P.DATETIME) MONTH,
	   P.Title , 
	   P.Body
FROM Content.Post P
) X
WHERE X.ROW_NUMBER = 1
GO




SELECT P.ID PERSON_ID , 
       P.FullName , 
	   X2.[MONTH] ,
	   X2.ID POST_ID ,
	   X2.Title , 
	   X2.Body
FROM 
(

SELECT X.[ROW_NUMBER],
       X.[MONTH],
       X.Title,
       X.Body,
       X.PersonID,
       X.ID
FROM 
(
SELECT ROW_NUMBER() OVER (PARTITION BY MONTH(P.DATETIME) ORDER BY P.ID ) [ROW_NUMBER] ,
       MONTH(P.DATETIME) MONTH,
	   P.Title , 
	   P.Body,
	   P.PersonID,
	   P.ID
FROM Content.Post P
) X
WHERE X.[ROW_NUMBER] = 1

)X2 INNER JOIN Person.Person P ON X2.PersonID = P.ID
GO




----------------------------------
SELECT P.ID PERSON_ID , 
       P.FullName , 
	   X2.[MONTH] ,
	   CHOOSE(X2.[MONTH] ,'January','February','March','April','May','June','July','August','September','October','November','December') Month_Names,
	   X2.ID POST_ID ,
	   X2.Title , 
	   X2.Body
FROM 
(
SELECT *
FROM 
(
SELECT ROW_NUMBER() OVER (PARTITION BY MONTH(P.DATETIME) ORDER BY P.ID ) [ROW_NUMBER] ,
       MONTH(P.DATETIME) MONTH,
	   P.Title , 
	   P.Body,
	   P.PersonID,
	   P.ID
FROM Content.Post P
) X
WHERE X.ROW_NUMBER = 1

)X2 INNER JOIN Person.Person P ON X2.PersonID = P.ID
GO


---------- Task : what is Tally Table, or table of numbers?
GO


-------------------------------------- Rank ---------------------------------------

-- تابع رنک باعث ایجاد 
--GAP
-- میشود

SELECT RANK() [RANK] , -- The function 'RANK' must have an OVER clause.
       P.ID 
FROM Person.Person P
GO

SELECT RANK() OVER() [RANK] , -- The function 'RANK' must have an OVER clause with ORDER BY.
       P.ID 
FROM Person.Person P
GO

SELECT RANK() OVER ( ORDER BY P.RoleCode ) [RANK] ,
       DENSE_RANK() OVER ( ORDER BY P.RoleCode ) [DENSE_RANK] ,
       P.ID , 
	   P.RoleCode,
	   P.FullName , 
	   P.BirthDate   
FROM Person.Person P
GO


SELECT RANK() OVER ( ORDER BY P.ID ) [RANK] ,
       P.ID , 
	   P.RoleCode,
	   P.FullName , 
	   P.BirthDate   
FROM Person.Person P
GO

SELECT RANK() OVER ( PARTITION BY p.RoleCode ORDER BY P.ID ) [RANK] ,
       P.ID , 
	   P.RoleCode,
	   P.FullName , 
	   P.BirthDate   
FROM Person.Person P
GO


SELECT RANK() OVER ( PARTITION BY p.RoleCode ORDER BY P.BirthDate ) [RANK] ,
       P.ID , 
	   P.RoleCode,
	   P.FullName , 
	   P.BirthDate   
FROM Person.Person P
GO

------------------ MORE COMPLEX EXAMPLES -------------------------

ALTER SCHEMA Person
TRANSFER dbo.Person_Activity
GO


WITH PersonPointCTE
AS
(
SELECT p.ID , P.FullName , SUM(a.Point) Total_Sum
FROM Person.Person P
INNER JOIN Person.Person_Activity PA ON PA.PersonID = P.ID
INNER JOIN Person.Activity A ON A.Code = PA.ActivityCode
GROUP BY P.ID,
         P.FullName
)

SELECT PersonPointCTE.ID,
       PersonPointCTE.FullName,
       PersonPointCTE.Total_Sum,
	   RANK() OVER (ORDER BY PersonPointCTE.Total_Sum DESC) [Rank]
FROM PersonPointCTE
GO

--------------------------------

WITH PersonPointCTE
AS
(
SELECT p.ID , P.FullName , SUM(a.Point) Total_Sum
FROM Person.Person P
INNER JOIN Person.Person_Activity PA ON PA.PersonID = P.ID
INNER JOIN Person.Activity A ON A.Code = PA.ActivityCode
GROUP BY P.ID,
         P.FullName
)

SELECT Derived_Table.ID,
       Derived_Table.FullName,
       Derived_Table.Total_Sum,
       Derived_Table.[Rank],
	   ROW_NUMBER() OVER( PARTITION BY Derived_Table.[Rank]  ORDER BY Derived_Table.ID) [ROW_NUMBER]
FROM( 

SELECT PersonPointCTE.ID,
       PersonPointCTE.FullName,
       PersonPointCTE.Total_Sum,
	   RANK() OVER (ORDER BY PersonPointCTE.Total_Sum DESC) [Rank]
FROM PersonPointCTE

)Derived_Table 
GO






-------------------------------------------------------

WITH PersonPointCTE
AS
(
SELECT p.ID , P.FullName , SUM(a.Point) Total_Sum
FROM Person.Person P
INNER JOIN Person.Person_Activity PA ON PA.PersonID = P.ID
INNER JOIN Person.Activity A ON A.Code = PA.ActivityCode
GROUP BY P.ID,
         P.FullName
)


SELECT OUTER_Derived_Table.ID,
       OUTER_Derived_Table.FullName,
       OUTER_Derived_Table.Total_Sum,
       OUTER_Derived_Table.[Rank],
       OUTER_Derived_Table.[ROW_NUMBER]
FROM 
(

SELECT INNER_Derived_Table.ID,
       INNER_Derived_Table.FullName,
       INNER_Derived_Table.Total_Sum,
       INNER_Derived_Table.[Rank],
	   ROW_NUMBER() OVER( PARTITION BY INNER_Derived_Table.[Rank]  ORDER BY INNER_Derived_Table.ID) [ROW_NUMBER]
FROM( 

SELECT PersonPointCTE.ID,
       PersonPointCTE.FullName,
       PersonPointCTE.Total_Sum,
	   RANK() OVER (ORDER BY PersonPointCTE.Total_Sum DESC) [Rank]
FROM PersonPointCTE

)INNER_Derived_Table

) OUTER_Derived_Table
WHERE OUTER_Derived_Table.[ROW_NUMBER] = 1
GO



----------------------DENSE RANK------------------
-- تابع دنس رنک باعث ایجاد 
--GAP
-- نمیشود
-- Closely Compacted in Substance.

SELECT DENSE_RANK() [DENSE_RANK] , -- The function 'DENSE_RANK' must have an OVER clause.
       P.ID 
FROM Person.Person P
GO

SELECT DENSE_RANK() OVER() [DENSE_RANK] , -- The function 'DENSE_RANK' must have an OVER clause with ORDER BY.
       P.ID 
FROM Person.Person P
GO

------------------ MORE COMPLEX EXAMPLES -------------------------

WITH PersonPointCTE
AS
(
SELECT p.ID , P.FullName , SUM(a.Point) Total_Sum
FROM Person.Person P
INNER JOIN Person.Person_Activity PA ON PA.PersonID = P.ID
INNER JOIN Person.Activity A ON A.Code = PA.ActivityCode
GROUP BY P.ID,
         P.FullName
)

SELECT PersonPointCTE.ID,
       PersonPointCTE.FullName,
       PersonPointCTE.Total_Sum,
	   RANK()       OVER (ORDER BY PersonPointCTE.Total_Sum DESC) [Rank],
	   DENSE_RANK() OVER (ORDER BY PersonPointCTE.Total_Sum DESC) [DENSE_RANK],
	   RANK()       OVER (ORDER BY PersonPointCTE.Total_Sum ) [REVERSE_Rank],
	   DENSE_RANK() OVER (ORDER BY PersonPointCTE.Total_Sum ) [REVERSE_DENSE_RANK]

FROM PersonPointCTE
GO

--------------------------------------------------
WITH PersonPointCTE
AS
(
SELECT p.ID , P.FullName , SUM(a.Point) Total_Sum
FROM Person.Person P
INNER JOIN Person.Person_Activity PA ON PA.PersonID = P.ID
INNER JOIN Person.Activity A ON A.Code = PA.ActivityCode
GROUP BY P.ID,
         P.FullName
)

SELECT Derived_Table.ID,
       Derived_Table.FullName,
       Derived_Table.Total_Sum,
       Derived_Table.[Rank],
	   Derived_Table.[DENSE_RANK],
	   ROW_NUMBER() OVER( PARTITION BY Derived_Table.[Rank]  ORDER BY Derived_Table.ID) [ROW_NUMBER]
FROM( 

SELECT PersonPointCTE.ID,
       PersonPointCTE.FullName,
       PersonPointCTE.Total_Sum,
	   RANK() OVER (ORDER BY PersonPointCTE.Total_Sum DESC) [Rank],
	   DENSE_RANK() OVER (ORDER BY PersonPointCTE.Total_Sum DESC) [DENSE_Rank]

FROM PersonPointCTE

)Derived_Table 
GO
---------------------------------------------------

WITH PersonPointCTE
AS
(
SELECT p.ID , P.FullName , SUM(a.Point) Total_Sum
FROM Person.Person P
INNER JOIN Person.Person_Activity PA ON PA.PersonID = P.ID
INNER JOIN Person.Activity A ON A.Code = PA.ActivityCode
GROUP BY P.ID,
         P.FullName
)

SELECT OUTER_Derived_Table.ID,
       OUTER_Derived_Table.FullName,
       OUTER_Derived_Table.Total_Sum,
       OUTER_Derived_Table.[Rank],
       OUTER_Derived_Table.[DENSE_Rank],
       OUTER_Derived_Table.[ROW_NUMBER]
FROM 
(

SELECT INNER_Derived_Table.ID,
       INNER_Derived_Table.FullName,
       INNER_Derived_Table.Total_Sum,
       INNER_Derived_Table.[Rank],
       INNER_Derived_Table.[DENSE_Rank],
	   ROW_NUMBER() OVER( PARTITION BY INNER_Derived_Table.Rank  ORDER BY INNER_Derived_Table.ID) [ROW_NUMBER]
FROM( 

SELECT PersonPointCTE.ID,
       PersonPointCTE.FullName,
       PersonPointCTE.Total_Sum,
	   RANK() OVER (ORDER BY PersonPointCTE.Total_Sum DESC) [Rank],
	   DENSE_RANK() OVER (ORDER BY PersonPointCTE.Total_Sum DESC) [DENSE_Rank]

FROM PersonPointCTE

)INNER_Derived_Table 

) OUTER_Derived_Table
WHERE OUTER_Derived_Table.[ROW_NUMBER] = 1
GO

-------------------------------------
/* NTILE (X)
For example if the total number of rows is 53 and the number of groups is five, 
the first three groups will have 11 rows and the two remaining groups will have 10 rows each.

If on the other hand the total number of rows is divisible by the number of groups,
the rows will be evenly distributed among the groups. 
For example, if the total number of rows is 50, 
and there are five groups, each bucket will contain 10 rows.
*/

WITH PersonPointCTE
AS
(
SELECT p.ID , P.FullName , SUM(a.Point) Total_Sum
FROM Person.Person P
INNER JOIN Person.Person_Activity PA ON PA.PersonID = P.ID
INNER JOIN Person.Activity A ON A.Code = PA.ActivityCode
GROUP BY P.ID,
         P.FullName
)

SELECT PersonPointCTE.ID,
       PersonPointCTE.FullName,
       PersonPointCTE.Total_Sum,
	   NTILE(1) OVER (ORDER BY PersonPointCTE.Total_Sum DESC) [NTILE1],
	   NTILE(2) OVER (ORDER BY PersonPointCTE.Total_Sum DESC) [NTILE2],
	   NTILE(3) OVER (ORDER BY PersonPointCTE.Total_Sum DESC) [NTILE3],
	   NTILE(4) OVER (ORDER BY PersonPointCTE.Total_Sum DESC) [NTILE4],
	   NTILE(5) OVER (ORDER BY PersonPointCTE.Total_Sum DESC) [NTILE5]
FROM PersonPointCTE
GO


WITH PersonPointCTE
AS
(
SELECT p.ID , P.FullName , SUM(a.Point) Total_Sum
FROM Person.Person P
INNER JOIN Person.Person_Activity PA ON PA.PersonID = P.ID
INNER JOIN Person.Activity A ON A.Code = PA.ActivityCode
GROUP BY P.ID,
         P.FullName
)


SELECT Derived_Table.ID,
       Derived_Table.FullName,
       Derived_Table.Total_Sum,
       Derived_Table.[NTILE]
FROM (
SELECT PersonPointCTE.ID,
       PersonPointCTE.FullName,
       PersonPointCTE.Total_Sum,
	   NTILE(4) OVER (ORDER BY PersonPointCTE.Total_Sum DESC) [NTILE]

FROM PersonPointCTE
) Derived_Table
WHERE Derived_Table.[NTILE] = 2
GO

-------------

-- انبار داری سخت است
-- یک شرکت میتواند چندین انبار داشته باشد
-- هر انبار حداقل یگ انبار دار دارد
-- رسید  و حواله
-- انبار گردانی
-- حواله برگشتی 
-- جنس معیوب
-- تاریخ انقضا

----------------------------

-- اموال ( ID , TITLE , LABLE  , PRODUCT ID )  
-- محصول  ( ID , TITLE , ........... )

-----------------------------------------

-- مدیریت موجودی کالا اوکی است

-- سفارشات 
-- هرچیزی که بار مالی دارد باید تا ابد نگه داری شود
-- فروشگاه + فروش آنلاین
-- شماره سفارش 1234
-- برای یک سفارش یک مشتری بارها تلاش به پرداخت پول در درگاه بانکی کرده باشد
-- هر بار میتواند با شماره کارت متفاوتی پرداخت انجام بده

-- جدول جداگانه برای ذخیره اطلاعات بازگشتی از طریق 
-- API درگاه بانکی

-- ORDER : ID , وضعیت نهایی سفارش

-- ID , ORDER ID , کد رهگیری - وضعیت پرداخت و ..... شماره کارت

--------------------------------------------
