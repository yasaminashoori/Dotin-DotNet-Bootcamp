USE DotinBootCamp
GO

CREATE DATABASE DotinTest
GO

USE DotinTest
GO

USE master
GO

IF EXISTS
(
    SELECT name
    FROM sys.databases
    WHERE name = 'FamilyRelationship'
)
BEGIN
    ALTER DATABASE FamilyRelationship SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE  FamilyRelationship;
END;
GO


DROP DATABASE IF EXISTS FamilyRelationship 
GO


CREATE DATABASE DotinFamilyRelationship
GO

USE DotinFamilyRelationship
GO

CREATE TABLE [dbo].[Person]
(
	ID          INT PRIMARY KEY  ,
	FatherID    INT NULL FOREIGN KEY REFERENCES dbo.Person (ID),
	MotherID    INT NULL FOREIGN KEY REFERENCES dbo.Person (ID),
	FirstName   NVARCHAR(50)  NULL,
	LastName    NVARCHAR(50)  NOT NULL,
	FullName    AS (CONCAT(ISNULL(FirstName,'_UnKnown'),' ' , LastName)),
	Gender      BIT NOT NULL,
	DateOfBirth DATE NULL,
	DateOfDeath DATE NULL
)

CREATE TABLE [dbo].[Marriage]
( 
	ID            INT PRIMARY KEY,
	HusbandID     INT NOT NULL FOREIGN KEY REFERENCES dbo.Person (ID),
	WifeID        INT NOT NULL FOREIGN KEY REFERENCES dbo.Person (ID),
	DateOfWedding DATE NULL,
	DateOfDivorce DATE NULL
)
GO




INSERT [dbo].[Person] ([ID], [FatherID], [MotherID], [FirstName], [LastName], [Gender], [DateOfBirth], [DateOfDeath]) VALUES (1, NULL, NULL, N'Kelly', N'Halloway', 0, CAST(N'1904-02-07 ' AS DATE), CAST(N'1987-05-13 ' AS DATE))
INSERT [dbo].[Person] ([ID], [FatherID], [MotherID], [FirstName], [LastName], [Gender], [DateOfBirth], [DateOfDeath]) VALUES (2, NULL, NULL, N'James', N'Halloway', 1, CAST(N'1899-04-12 ' AS DATE), CAST(N'2001-05-01 ' AS DATE))
INSERT [dbo].[Person] ([ID], [FatherID], [MotherID], [FirstName], [LastName], [Gender], [DateOfBirth], [DateOfDeath]) VALUES (3, NULL, NULL, N'Karen', N'Miller', 0, CAST(N'1909-09-11 ' AS DATE), CAST(N'1974-08-01 ' AS DATE))
INSERT [dbo].[Person] ([ID], [FatherID], [MotherID], [FirstName], [LastName], [Gender], [DateOfBirth], [DateOfDeath]) VALUES (4, NULL, NULL, N'Bryan', N'Miller', 1, CAST(N'1902-04-12 ' AS DATE), CAST(N'1948-04-16 ' AS DATE))
INSERT [dbo].[Person] ([ID], [FatherID], [MotherID], [FirstName], [LastName], [Gender], [DateOfBirth], [DateOfDeath]) VALUES (5, 2, 1, N'James', N'Halloway', 1, CAST(N'1922-05-19 ' AS DATE), CAST(N'1992-02-02 ' AS DATE))
INSERT [dbo].[Person] ([ID], [FatherID], [MotherID], [FirstName], [LastName], [Gender], [DateOfBirth], [DateOfDeath]) VALUES (6, 4, 3, N'Audry', N'Halloway', 0, CAST(N'1928-08-05 ' AS DATE), CAST(N'2002-03-12 ' AS DATE))
INSERT [dbo].[Person] ([ID], [FatherID], [MotherID], [FirstName], [LastName], [Gender], [DateOfBirth], [DateOfDeath]) VALUES (7, 5, 6, N'Corwin', N'Halloway', 1, CAST(N'1961-03-13 ' AS DATE), NULL)
INSERT [dbo].[Person] ([ID], [FatherID], [MotherID], [FirstName], [LastName], [Gender], [DateOfBirth], [DateOfDeath]) VALUES (8, 5, 6, N'Melanie', N'Campbell', 0, CAST(N'1951-08-19 ' AS DATE), CAST(N'2009-06-28 ' AS DATE))
INSERT [dbo].[Person] ([ID], [FatherID], [MotherID], [FirstName], [LastName], [Gender], [DateOfBirth], [DateOfDeath]) VALUES (9, 5, 6, N'Dara', N'Halloway', 0, CAST(N'1958-12-12 ' AS DATE), CAST(N'2010-04-14 ' AS DATE))
INSERT [dbo].[Person] ([ID], [FatherID], [MotherID], [FirstName], [LastName], [Gender], [DateOfBirth], [DateOfDeath]) VALUES (10, 5, 6, N'James', N'Halloway', 1, CAST(N'1953-08-30 ' AS DATE), CAST(N'2007-11-30 ' AS DATE))
INSERT [dbo].[Person] ([ID], [FatherID], [MotherID], [FirstName], [LastName], [Gender], [DateOfBirth], [DateOfDeath]) VALUES (11, NULL, NULL, N'Kimberly', N'Kidd', 0, CAST(N'1963-07-24 ' AS DATE), NULL)
INSERT [dbo].[Person] ([ID], [FatherID], [MotherID], [FirstName], [LastName], [Gender], [DateOfBirth], [DateOfDeath]) VALUES (12, NULL, NULL, N'Alysia', N'Halloway', 0, CAST(N'1953-03-05 ' AS DATE), NULL)
INSERT [dbo].[Person] ([ID], [FatherID], [MotherID], [FirstName], [LastName], [Gender], [DateOfBirth], [DateOfDeath]) VALUES (13, NULL, NULL, N'Walter ', N'Ramsey', 1, CAST(N'1945-09-30 ' AS DATE), NULL)
INSERT [dbo].[Person] ([ID], [FatherID], [MotherID], [FirstName], [LastName], [Gender], [DateOfBirth], [DateOfDeath]) VALUES (14, 7, 11, N'Logan', N'Halloway', 1, CAST(N'1994-02-06 ' AS DATE), NULL)
INSERT [dbo].[Person] ([ID], [FatherID], [MotherID], [FirstName], [LastName], [Gender], [DateOfBirth], [DateOfDeath]) VALUES (15, 13, 8, N'Shannon', N'Ramsey', 0, CAST(N'1970-04-01 ' AS DATE), NULL)
INSERT [dbo].[Person] ([ID], [FatherID], [MotherID], [FirstName], [LastName], [Gender], [DateOfBirth], [DateOfDeath]) VALUES (16, 13, 8, N'Jennifer', N'Ramsey', 0, CAST(N'1972-06-01 ' AS DATE), CAST(N'1972-06-01 ' AS DATE))
INSERT [dbo].[Person] ([ID], [FatherID], [MotherID], [FirstName], [LastName], [Gender], [DateOfBirth], [DateOfDeath]) VALUES (17, 10, 12, N'Allie', N'Halloway', 0, CAST(N'1979-08-14 ' AS DATE), NULL)
INSERT [dbo].[Person] ([ID], [FatherID], [MotherID], [FirstName], [LastName], [Gender], [DateOfBirth], [DateOfDeath]) VALUES (18, 10, 12, N'Abbie', N'Halloway', 0, CAST(N'1979-08-14 ' AS DATE), NULL)
INSERT [dbo].[Person] ([ID], [FatherID], [MotherID], [FirstName], [LastName], [Gender], [DateOfBirth], [DateOfDeath]) VALUES (19, 10, 12, N'James', N'Halloway', 1, CAST(N'1975-05-24 ' AS DATE), NULL)
INSERT [dbo].[Person] ([ID], [FatherID], [MotherID], [FirstName], [LastName], [Gender], [DateOfBirth], [DateOfDeath]) VALUES (20, NULL, NULL, N'Grace', N'Halloway', 0, CAST(N'1977-11-01 ' AS DATE), NULL)
INSERT [dbo].[Person] ([ID], [FatherID], [MotherID], [FirstName], [LastName], [Gender], [DateOfBirth], [DateOfDeath]) VALUES (21, 19, 20, N'James', N'Halloway', 1, CAST(N'2007-09-04 ' AS DATE), NULL)
INSERT [dbo].[Person] ([ID], [FatherID], [MotherID], [FirstName], [LastName], [Gender], [DateOfBirth], [DateOfDeath]) VALUES (22, 19, 20, N'Chris', N'Halloway', 1, CAST(N'2003-07-04 ' AS DATE), NULL)
INSERT [dbo].[Person] ([ID], [FatherID], [MotherID], [FirstName], [LastName], [Gender], [DateOfBirth], [DateOfDeath]) VALUES (23, NULL, 9, N'Joshua', N'Halloway', 1, CAST(N'1975-06-25 ' AS DATE), NULL)
INSERT [dbo].[Person] ([ID], [FatherID], [MotherID], [FirstName], [LastName], [Gender], [DateOfBirth], [DateOfDeath]) VALUES (24, NULL, 9, N'Laura', N'Halloway', 0, CAST(N'1977-05-29 ' AS DATE), NULL)
INSERT [dbo].[Person] ([ID], [FatherID], [MotherID], [FirstName], [LastName], [Gender], [DateOfBirth], [DateOfDeath]) VALUES (25, NULL, NULL, N'Katherine', N'Halloway', 0, CAST(N'1996-03-23 ' AS DATE), NULL)
INSERT [dbo].[Person] ([ID], [FatherID], [MotherID], [FirstName], [LastName], [Gender], [DateOfBirth], [DateOfDeath]) VALUES (26, NULL, NULL, N'Richard', N'Campbell', 1, CAST(N'1941-01-16 ' AS DATE), NULL)
INSERT [dbo].[Person] ([ID], [FatherID], [MotherID], [FirstName], [LastName], [Gender], [DateOfBirth], [DateOfDeath]) VALUES (27, 26, 32, N'Alexia', N'Campbell', 0, CAST(N'1970-08-12 ' AS DATE), CAST(N'1972-01-01 ' AS DATE))
INSERT [dbo].[Person] ([ID], [FatherID], [MotherID], [FirstName], [LastName], [Gender], [DateOfBirth], [DateOfDeath]) VALUES (28, 26, 32, N'Cameron', N'Campbell', 1, CAST(N'1965-03-13 ' AS DATE), NULL)
INSERT [dbo].[Person] ([ID], [FatherID], [MotherID], [FirstName], [LastName], [Gender], [DateOfBirth], [DateOfDeath]) VALUES (29, 26, 8, NULL, N'Campbell', 1, CAST(N'1981-01-30 ' AS DATE), NULL)
INSERT [dbo].[Person] ([ID], [FatherID], [MotherID], [FirstName], [LastName], [Gender], [DateOfBirth], [DateOfDeath]) VALUES (30, NULL, NULL, N'Amy', N'Campbell', 0, CAST(N'1959-02-27 ' AS DATE), NULL)
INSERT [dbo].[Person] ([ID], [FatherID], [MotherID], [FirstName], [LastName], [Gender], [DateOfBirth], [DateOfDeath]) VALUES (31, 28, 30, N'William', N'Campbell', 1, CAST(N'1987-01-01 ' AS DATE), CAST(N'1997-06-30 ' AS DATE))
INSERT [dbo].[Person] ([ID], [FatherID], [MotherID], [FirstName], [LastName], [Gender], [DateOfBirth], [DateOfDeath]) VALUES (32, NULL, NULL, N'Elizabeth', N'Campbell', 0, CAST(N'1939-06-24 ' AS DATE), CAST(N'1972-01-01 ' AS DATE))

GO

GO
INSERT [dbo].[Marriage] ([ID], [HusbandID], [WifeID], [DateOfWedding], [DateOfDivorce]) VALUES (1, 2, 1, CAST(N'1920-06-20 ' AS DATE), NULL)
INSERT [dbo].[Marriage] ([ID], [HusbandID], [WifeID], [DateOfWedding], [DateOfDivorce]) VALUES (2, 4, 3, CAST(N'1926-04-14 ' AS DATE), NULL)
INSERT [dbo].[Marriage] ([ID], [HusbandID], [WifeID], [DateOfWedding], [DateOfDivorce]) VALUES (3, 5, 6, CAST(N'1948-12-01 ' AS DATE), NULL)
INSERT [dbo].[Marriage] ([ID], [HusbandID], [WifeID], [DateOfWedding], [DateOfDivorce]) VALUES (4, 10, 12, CAST(N'1975-01-01 ' AS DATE), NULL)
INSERT [dbo].[Marriage] ([ID], [HusbandID], [WifeID], [DateOfWedding], [DateOfDivorce]) VALUES (5, 13, 8, CAST(N'1968-05-02 ' AS DATE), CAST(N'1974-01-01 ' AS DATE))
INSERT [dbo].[Marriage] ([ID], [HusbandID], [WifeID], [DateOfWedding], [DateOfDivorce]) VALUES (6, 14, 25, CAST(N'2018-04-14 ' AS DATE), NULL)
INSERT [dbo].[Marriage] ([ID], [HusbandID], [WifeID], [DateOfWedding], [DateOfDivorce]) VALUES (7, 26, 8, CAST(N'1977-09-04 ' AS DATE), NULL)
INSERT [dbo].[Marriage] ([ID], [HusbandID], [WifeID], [DateOfWedding], [DateOfDivorce]) VALUES (8, 19, 20, CAST(N'2000-08-25 ' AS DATE), CAST(N'2007-01-01 ' AS DATE))
INSERT [dbo].[Marriage] ([ID], [HusbandID], [WifeID], [DateOfWedding], [DateOfDivorce]) VALUES (9, 28, 30, CAST(N'1984-06-02 ' AS DATE), NULL)
INSERT [dbo].[Marriage] ([ID], [HusbandID], [WifeID], [DateOfWedding], [DateOfDivorce]) VALUES (10, 26, 32, CAST(N'1963-04-14 ' AS DATE), NULL)
GO


SELECT *
FROM dbo.Person
GO

SELECT *
FROM dbo.Marriage
GO


---------------------------

USE FamilyRelationship
GO

-- 1) چه اشخاصی در چند سالگی فوت کرده اند ؟

SELECT ID,
       FullName,
       CONVERT(VARCHAR(10), DateOfDeath, 120) AS Death,
       DATEDIFF(YEAR, DateOfBirth, DateOfDeath) AS Age
FROM dbo.Person
WHERE DateOfDeath IS NOT NULL
ORDER BY Age DESC;
GO


------------------------------------------------

--  2) چه اشخاصی در یک تاریخ خاص زنده بودن و چند ساله بودن ؟ 

SELECT FullName,
       CONVERT(VARCHAR(10), DateOfBirth, 120) AS BIRTH,
       CONVERT(VARCHAR(10), DateOfDeath, 120) AS Death,
       DATEDIFF(YEAR, DateOfBirth , '1/1/2000') AS Age
FROM dbo.Person
WHERE (
          DateOfDeath IS NULL OR CAST(DateOfDeath AS DATE) >= CAST('2000-01-01' AS DATE)
      )
      AND (DateOfBirth < CAST('2000-01-01' AS DATE))
ORDER BY Age ASC;
GO

SELECT FullName,
       CONVERT(VARCHAR(10), DateOfBirth, 120) AS BIRTH,
       CONVERT(VARCHAR(10), DateOfDeath, 120) AS Death,
       DATEDIFF(YEAR, DateOfBirth , '1/1/2000') AS Age
FROM dbo.Person
WHERE 
          DateOfDeath IS NOT NULL AND
		  
		 --CAST('2000-01-01' AS DATE) >= (DateOfBirth) AND  (CAST('2000-01-01' AS DATE) < SOME (CAST(DATEOFDEATH AS DATE)))

		 CAST('2000-01-01' AS DATE) BETWEEN CAST(DateOfBirth AS DATE) AND CAST(DateOfDeath AS DATE)

ORDER BY Age ASC;
       
GO
----------------------------------------------------------------

--  3) سن زوج ها را در تاریخ ازدواجشون لیست کنید .

SELECT CONVERT(VARCHAR(10), M.DateOfWedding, 120) AS WeddingDate,
       H.FullName AS Groom,
       DATEDIFF(yy, H.DateOfBirth, M.DateOfWedding) AS GroomAge,
       W.FullName AS Bride,
       DATEDIFF(yy, W.DateOfBirth, M.DateOfWedding) AS BrideAge
FROM dbo.Person H
    INNER JOIN dbo.Marriage M ON (H.ID = M.HusbandID)
    INNER JOIN dbo.Person W ON (W.ID = M.WifeID)
ORDER BY M.DateOfWedding;
GO




-----------------------------------------------------------

-- 4) چه اشخاصی پس از چند سال زندگی مشترک طلاق گرفته اند ؟

SELECT Hubby.FullName AS XHubby,
       Wife.FullName AS XWife,
       CAST(DateOfDivorce AS DATE) AS DateOfDivorce,
       DATEDIFF(yy, M.DateOfWedding, DateOfDivorce) AS YrsMarried
FROM dbo.Person Hubby
    INNER JOIN dbo.Marriage M ON (Hubby.ID = M.HusbandID)
    INNER JOIN dbo.Person Wife ON (Wife.ID = M.WifeID)
WHERE DateOfDivorce IS NOT NULL
ORDER BY YrsMarried DESC;
GO


-----------------------------------------------------------

-- 5) لیست تمام اشخاص به همراه اسم والدین ( ممکن است برای همه اشخاص اطلاعات والدین در دسترس نباشد ) 


SELECT P.ID,
       CONVERT(NVARCHAR(10), P.DateOfBirth, 120) AS BirthDate,
       P.FirstName,
       P.Gender,
       ISNULL(F.FullName, ' * unknown *') AS Father,
       ISNULL(M.FullName, ' * unknown *') AS Mother
FROM dbo.Person P
    LEFT JOIN dbo.Person F ON P.FatherID = F.ID
    LEFT JOIN dbo.Person M ON P.MotherID = M.ID
ORDER BY Father, Mother ASC;
GO

-- 6) هر مادری چند فرزند به دنیا آورده است ؟ 

SELECT*
FROM dbo.Person P
GO

SELECT P.ID,
       P.FullName,
       X.Children
FROM dbo.Person P
    INNER JOIN
    (
        SELECT M.MotherID,
               COUNT(M.ID) Children
        FROM dbo.Person M
        WHERE M.MotherID IS NOT NULL
        GROUP BY M.MotherID
    ) X
        ON P.ID = X.MotherID
ORDER BY X.Children DESC;
GO


-------------------------------------------

WITH ChildCountCTE (MotherID, [Count])
AS (SELECT MotherID,
           COUNT(ID)
    FROM dbo.Person
    WHERE MotherID IS NOT NULL
    GROUP BY MotherID)

SELECT P.ID,
       P.FullName,
       ChildCountCTE.[Count]
FROM dbo.Person P
    INNER JOIN ChildCountCTE ON P.ID = ChildCountCTE.MotherID
ORDER BY ChildCountCTE.[Count] DESC;
GO

-----------------------------------------------------------

-- 7) چه اشخاصی بیش از یک بار ازدواج کرده اند ؟

SELECT P.ID,
       P.FullName,
       P.Gender
FROM dbo.Person P
WHERE P.ID IN
      (
          SELECT M.HusbandID
          FROM Marriage M
          GROUP BY M.HusbandID
          HAVING COUNT(M.HusbandID) > 1
      )
      OR P.ID IN
         (
             SELECT M.WifeID
             FROM dbo.Marriage M
             GROUP BY M.WifeID
             HAVING COUNT(M.WifeID) > 1
         );
GO


SELECT P.ID,
       P.FullName,
       P.Gender
FROM dbo.Person P
WHERE EXISTS
      (
          SELECT M.HusbandID
          FROM dbo.Marriage M
		  WHERE M.HusbandID = p.ID --- should be bound.
          GROUP BY M.HusbandID
          HAVING COUNT(M.HusbandID) > 1
      )
      OR EXISTS
         (
             SELECT M.WifeID
             FROM dbo.Marriage M
			 WHERE M.WifeID = P.ID --- should be bound.
             GROUP BY M.WifeID
             HAVING COUNT(M.WifeID) > 1
         );
GO



--------------------- TASK : UNION ---------------------------



------------------------------------------------------------

-- 8) هر مادری در چند سالگی فرزند خود را به دنیا آورده است ؟ 

SELECT Mother.ID,
       Mother.FullName AS MotherName,
       DATEDIFF(YEAR, Mother.DateOfBirth, Child.DateOfBirth) AS MotherAge,
       Child.FirstName AS ChildName
FROM dbo.Person Mother
     INNER JOIN dbo.Person Child ON Mother.ID = Child.MotherID
ORDER BY Mother.ID,MotherAge
GO

---------------------------------------------------------------

-- 9) چه اشخاصی دوقلو هستند ؟ 

-- PERSON , PERSON 
-- SELF JOIN : TABLE + COPY OF ITSELF

SELECT P.ID , P.FirstName + ' ' + P.LastName AS Person,
       Twin.FirstName + ' ' + Twin.LastName AS Twin,
       CAST(P.DateOfBirth AS DATE) DateOfBirth,
       P.MotherID
FROM dbo.Person P
    INNER JOIN dbo.Person Twin
        ON (  P.MotherID = Twin.MotherID AND 
		      P.DateOfBirth = Twin.DateOfBirth AND 
			  P.ID <> Twin.ID )
WHERE P.DateOfBirth IS NOT NULL;
GO

--Theta Join : Matches rows using a non-equal condition ( < , > , <= , >= ,<> )


---------------پیاده سازی دوم  --------------------------------------------
SELECT P.FullName,
       Twin.FirstName + ' ' + Twin.LastName AS Twin,
       P.DateOfBirth
FROM dbo.Person P
    INNER JOIN dbo.Person Twin ON (P.MotherID = Twin.MotherID)
WHERE P.DateOfBirth = Twin.DateOfBirth AND 
      P.ID <> Twin.ID;
GO


---------------------------------------------------------- 


SELECT * FROM dbo.Person 
WHERE DateOfDeath IS NULL

GO

SELECT COUNT(*)--,COUNT(DateOfDeath),COUNT(ID)
FROM dbo.Person
WHERE ID > 1000
GO

SELECT SUM(ID)--,COUNT(DateOfDeath),COUNT(ID)
FROM dbo.Person
WHERE ID > 1000
GO

-- 10) هر خانومی چند اتفاق در زندگی خود داشته است ؟ (فرزندان - ازدواج - طلاق - فوت همسر و فرزند)


SELECT Woman.ID,
       Woman.FullName AS Woman,
       Marriages AS Marriages,
       Divorces AS Divorces,
       Children AS Children,
       HusbandDeaths AS HusbandDeaths,
       ChildDeaths AS ChildDeaths,

       -- جمع همه اتفاقات
       Marriages+ Divorces+ Children + HusbandDeaths + ChildDeaths AS TotalLifeEvents
FROM dbo.Person Woman

    -----------------------Marriages--------------------------------

    LEFT OUTER JOIN
    (
	  SELECT WifeID, 
	         COUNT(*) AS Marriages
	  FROM dbo.Marriage 
	  GROUP BY WifeID
	)M ON Woman.ID = M.WifeID

    -----------------------Children--------------------------------

    LEFT OUTER JOIN
    (
        SELECT MotherID,
               COUNT(*) AS Children
        FROM dbo.Person
        WHERE MotherID IS NOT NULL
        GROUP BY MotherID
    ) C ON Woman.ID = C.MotherID

    -----------------------Divorces--------------------------------

    LEFT OUTER JOIN
    (
        SELECT WifeID,
               COUNT(*) AS Divorces
        FROM dbo.Marriage
        WHERE DateOfDivorce IS NOT NULL 
        GROUP BY WifeID
    ) D ON Woman.ID = D.WifeID

    -----------------------ChildDeaths--------------------------------

    LEFT OUTER JOIN
    (
        SELECT Child.MotherID,
               COUNT(*) AS ChildDeaths
        FROM dbo.Person Child
            INNER JOIN dbo.Person M  ON (Child.MotherID = M.ID  AND Child.DateOfDeath < M.DateOfDeath)
        GROUP BY Child.MotherID
    ) CD
        ON Woman.ID = CD.MotherID

    -----------------------HusbandDeaths--------------------------------

    LEFT OUTER JOIN
    (
        SELECT P.ID,
               COUNT(*) AS HusbandDeaths
        FROM dbo.Person P
            INNER JOIN dbo.Marriage W ON P.ID = W.WifeID
            INNER JOIN dbo.Person H   ON (W.HusbandID = H.ID AND H.DateOfDeath < P.DateOfDeath)
        GROUP BY P.ID
    ) HD
        ON Woman.ID = HD.ID

WHERE Woman.Gender = 0
ORDER BY TotalLifeEvents DESC;
GO

--------------------------------------------

SELECT *
FROM
(
    SELECT Woman.ID,
           Woman.FullName AS Woman,
           ISNULL(Marriages, 0) AS Marriages,
           ISNULL(Divorces, 0) AS Divorces,
           ISNULL(Children, 0) AS Children,
           ISNULL(HusbandDeaths, 0) AS HusbandDeaths,
           ISNULL(ChildDeaths, 0) AS ChildDeaths,

           -- جمع همه اتفاقات

           ISNULL(Marriages, 0) + 
		   ISNULL(Divorces, 0) + 
		   ISNULL(Children, 0) + 
		   ISNULL(HusbandDeaths, 0) +
		   ISNULL(ChildDeaths, 0) AS TotalLifeEvents
    FROM dbo.Person Woman

        -----------------------Marriages--------------------------------

        LEFT OUTER JOIN
        (SELECT WifeID, COUNT(*) AS Marriages FROM dbo.Marriage GROUP BY WifeID) M
            ON Woman.ID = M.WifeID

        -----------------------Children--------------------------------

        LEFT OUTER JOIN
        (
            SELECT MotherID,
                   COUNT(*) AS Children
            FROM dbo.Person
            WHERE MotherID IS NOT NULL
            GROUP BY MotherID
        ) C
            ON Woman.ID = C.MotherID

        -----------------------Divorces--------------------------------

        LEFT OUTER JOIN
        (
            SELECT WifeID,
                   COUNT(*) AS Divorces
            FROM dbo.Marriage
            WHERE DateOfDivorce IS NOT NULL
            GROUP BY WifeID
        ) D
            ON Woman.ID = D.WifeID

        -----------------------ChildDeaths--------------------------------

        LEFT OUTER JOIN
        (
            SELECT Child.MotherID,
                   COUNT(*) AS ChildDeaths
            FROM dbo.Person Child
                INNER JOIN dbo.Person M ON (Child.MotherID = M.ID AND Child.DateOfDeath < M.DateOfDeath)
            GROUP BY Child.MotherID
        ) CD
            ON Woman.ID = CD.MotherID

        -----------------------HusbandDeaths--------------------------------

        LEFT OUTER JOIN
        (
            SELECT P.ID,
                   COUNT(*) AS HusbandDeaths
            FROM dbo.Person P
                INNER JOIN dbo.Marriage W ON P.ID = W.WifeID
                INNER JOIN dbo.Person H   ON (W.HusbandID = H.ID AND H.DateOfDeath < P.DateOfDeath)
            GROUP BY P.ID
        ) HD
            ON Woman.ID = HD.ID

    -------------------------------------------------------------------

    WHERE Woman.Gender = 0
) X
--WHERE X.TotalLifeEvents > 0
ORDER BY X.TotalLifeEvents DESC;
GO


----------------------------------------------------------------------------

-- چک شود

--11)  چه اشخاصی بزرگ خاندان هستند !!
-- آقا باشند
-- اطلاعات پدر مادر خودشان را نداشته باشیم
-- اطلاعات والدین همسرشان را نیز نداشته باشیم



SELECT P.ID,
       P.FullName AS Patriarch
FROM dbo.Person P
WHERE P.Gender = 1 AND 
      P.MotherID IS NULL AND 
	  P.FatherID IS NULL AND 
	  P.ID NOT IN
          (
              SELECT P2.ID
              FROM dbo.Person P2
                  INNER JOIN dbo.Marriage M ON P2.ID = M.HusbandID
                  INNER JOIN dbo.Person Wife ON M.WifeID = Wife.ID
              WHERE Wife.MotherID IS NOT NULL AND 
			        Wife.FatherID IS NOT NULL
          );
GO

---------------------------------------------------
SELECT P.ID,
       P.FullName AS Patriarch
FROM dbo.Person P
WHERE P.Gender = 1
      AND P.MotherID IS NULL
      AND P.FatherID IS NULL
      AND P.ID IN
          (
              SELECT P2.ID
              FROM dbo.Person P2
                  INNER JOIN dbo.Marriage M ON P2.ID = M.HusbandID
                  INNER JOIN dbo.Person Wife ON M.WifeID = Wife.ID
              WHERE Wife.MotherID IS NULL AND 
			        Wife.FatherID IS NULL
          );
GO

--------------------------------------------------

SELECT P.ID,
       P.FullName AS Patriarch
FROM dbo.Person P
WHERE P.Gender = 1 AND 
      P.MotherID IS NULL AND 
	  P.FatherID IS NULL AND 
	 NOT EXISTS
          (
              SELECT 1
              FROM dbo.Person P2
                  INNER JOIN dbo.Marriage M ON P2.ID = M.HusbandID
                  INNER JOIN dbo.Person Wife ON M.WifeID = Wife.ID
              WHERE p.ID = p2.ID AND
			        Wife.MotherID IS NOT NULL AND 
			        Wife.FatherID IS NOT NULL
          );
GO

---------------------------------------------------
SELECT P.ID,
       P.FullName AS Patriarch
FROM dbo.Person P
WHERE P.Gender = 1
      AND P.MotherID IS NULL
      AND P.FatherID IS NULL
      AND EXISTS
          (
              SELECT 1
              FROM dbo.Person P2
                  INNER JOIN dbo.Marriage M ON P2.ID = M.HusbandID
                  INNER JOIN dbo.Person Wife ON M.WifeID = Wife.ID
              WHERE Wife.MotherID IS NULL AND 
			        Wife.FatherID IS NULL AND
                    p2.ID = p.ID
          );
GO