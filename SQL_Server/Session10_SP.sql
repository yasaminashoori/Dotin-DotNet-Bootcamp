USE Weblog2023Dotin
GO

-- رویه های ذخیره شده
-- Stored Procedure (SP)

-- TABLE => SELECT ALL
--       => SELECT ROW
--       => INSERT
--		 => UPDATE
--	     => DELETE


-- Cache شدن Execute Plan

-- LIVE CHANGES


---------------------

-- CRUD
-- INSERT , UPDATE , DELETE , SELECT ALL , SELECT ROW 
---------------------------

-- sp_ ?? نام گذاری ش اوکی است ؟

-----------------------

CREATE OR ALTER PROCEDURE usp_Activity_SelectAll
AS
BEGIN
SELECT *
FROM Person.Activity
ORDER BY Code DESC
END
GO


EXEC dbo.usp_Activity_SelectAll
GO

EXEC usp_Activity_SelectAll
GO
 
usp_Activity_SelectAll
GO


CREATE OR ALTER PROCEDURE Person.usp_Activity_SelectAll
AS
BEGIN
SELECT *
FROM Person.Activity
ORDER BY Code
END
GO

EXEC Person.usp_Activity_SelectAll
GO

Person.usp_Activity_SelectAll
GO


usp_Activity_SelectAll
GO


[Person].[usp_Activity_SelectAll]


DROP PROCEDURE dbo.usp_Activity_SelectAll
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
GO

dbo.usp_Activity_SelectRow @Code = 1
GO

dbo.usp_Activity_SelectRow @Code = 2
GO

dbo.usp_Activity_SelectRow @Code = 3
GO

dbo.usp_Activity_SelectRow @Code = 4
GO

dbo.[usp_Activity_SelectRow] 3
GO
 
GO

CREATE OR ALTER PROC usp_Activity_InsertRow
    @Code TINYINT,
    @Title NVARCHAR(50),
    @Point SMALLINT
AS
BEGIN

    INSERT INTO [Person].[Activity]
    (
        [Code],
        [Title],
        [Point]
    )
    VALUES
    (@Code, @Title, @Point);

END;
GO


[dbo].[usp_Activity_InsertRow]
		@Code = 4,
		@Title = N'اینسرت از طریق SP',
		@Point = 1000
GO

[Person].[usp_Activity_SelectAll]
GO


CREATE OR ALTER PROC usp_Activity_UpdateRow
    @Code TINYINT,
    @Title NVARCHAR(50),
    @Point SMALLINT
AS
BEGIN

    UPDATE Person.Activity
    SET Title = @Title,
        Point = @Point
    WHERE Code = @Code;

END;

GO


[dbo].[usp_Activity_UpdateRow]
		@Code = 4,
		@Title = N'به روز رسانی',
		@Point = 1000
GO

[Person].[usp_Activity_SelectAll]




CREATE OR ALTER PROC usp_Activity_DeleteRow
@Code TINYINT
AS
BEGIN

    DELETE FROM Person.Activity
    WHERE Code = @Code;

END;

GO

.

--------------------------------------------

CREATE OR ALTER PROCEDURE usp_Person_InsertRow

@RoleCode tinyint,
@FirstName nvarchar(50),
@LastName nvarchar(50),
@BirthDate date,
@Gender bit

AS
BEGIN


INSERT INTO [Person].[Person]
           ([RoleCode]
           ,[FirstName]
           ,[LastName]
           ,[BirthDate]
           ,[Gender]
           )
     VALUES
           (@RoleCode, 
            @FirstName, 
            @LastName, 
            @BirthDate, 
            @Gender)
END

GO

[dbo].[usp_Person_InsertRow]
		@RoleCode = 1,
		@FirstName = N'تست',
		@LastName = N'تستی',
		@BirthDate = '2000-10-10',
		@Gender = 0
GO



CREATE OR ALTER PROCEDURE usp_Person_SelectAll
AS
BEGIN

SELECT *
FROM Person.Person
ORDER BY FirstName


END
GO


dbo.usp_Person_SelectAll
GO

ALTER TABLE PERSON.Person
ADD ExtraCol INT NOT NULL DEFAULT(100)
GO

dbo.usp_Person_SelectAll
GO


-- SELECT *
-- با افزودن ستون جدید به جدول - SP متوجه آن شد

GO


CREATE OR ALTER PROCEDURE Person.usp_Post_InsertRow
@PersonID int,
@CategoryID int,
@Title nvarchar(100),
@Body nvarchar(max)

AS

BEGIN

INSERT INTO [Content].[Post]
           ([PersonID]
           ,[CategoryID]
           ,[Title]
           ,[Body])
     VALUES (@PersonID, @CategoryID,  @Title, @Body )


INSERT INTO Person.Person_Activity
(
    PersonID,
    ActivityCode  
)
VALUES(@PersonID,1) -- HARD CODE

END


GO

Person.[usp_Post_InsertRow]
		@PersonID = 10,
		@CategoryID = 10,
		@Title = N'عنوان SP 10',
		@Body = N'بادی SP 10'
GO

---------------------------------------------


ALTER PROC Person.[usp_Post_InsertRow]

@PersonID int,
@CategoryID int,
@Title nvarchar(50),
@Body nvarchar(max)

AS
BEGIN

INSERT INTO [CONTENT].[Post]
           ([PersonID]
           ,[CategoryID]
           ,[Title]
           ,[Body])   VALUES(@PersonID,@CategoryID,  @Title,  @Body)

DECLARE @POST_ID INT
SET @POST_ID = @@IDENTITY

INSERT INTO [PERSON].[Person_Activity]
           ([PersonID]
           ,[ActivityCode] )
     VALUES
           (@PersonID,
            1 -- HARD CODE - POST 
			)

RETURN @POST_ID
END
GO

DECLARE @RESULT INT
EXEC    @RESULT = Person.[usp_Post_InsertRow]
		@PersonID = 10,
		@CategoryID = 10,
		@Title = N'عنوان SP 3',
		@Body = N'بادی SP 3'
PRINT @RESULT
GO





----------------------------------

CREATE OR ALTER PROC usp_Post_InsertRow

@PersonID int,
@CategoryID int,
@Title nvarchar(50),
@Body nvarchar(max)

AS
BEGIN

INSERT INTO [CONTENT].[Post]
           ([PersonID]
           ,[CategoryID]
           ,[Title]
           ,[Body])   VALUES(@PersonID,@CategoryID,  @Title,  @Body)

DECLARE @POST_ID INT
SET @POST_ID = SCOPE_IDENTITY()

INSERT INTO [PERSON].[Person_Activity]
           ([PersonID]
           ,[ActivityCode] )
     VALUES
           (@PersonID,
            1 -- HARD CODE - POST 
			)

RETURN @POST_ID
END
GO


DECLARE @RESULT INT
EXEC    @RESULT = [dbo].[usp_Post_InsertRow]
		@PersonID = 15,
		@CategoryID = 1,
		@Title = N'عنوان SP 3',
		@Body = N'بادی SP 3'
PRINT @RESULT
GO

-- در قالب یک SP
-- SP INSERT PERSON ==> SCOPE_IDENTITY , INSERT PERSON , INSERT ACCOUNT , INSERT PASSWORD HISTORY 

GO


ALTER TABLE Person.Person
ADD AdminNote NVARCHAR(250) NULL
GO


CREATE OR ALTER PROCEDURE usp_Person_Update_AdminNote
    @ID INT,
    @AdminNote NVARCHAR(200)
AS
BEGIN
    UPDATE Person.Person
    SET AdminNote = @AdminNote
    WHERE ID = @ID;
END;

GO

dbo.usp_Person_SelectAll

usp_Person_Update_AdminNote 15,N'توضیحات مدیر SP'
GO

sys.sp_helptext @objname = N'usp_Person_Update_AdminNote'
Go


CREATE OR ALTER PROC usp_Post_InsertRow
@PersonID int,
@CategoryID int,
@Title nvarchar(50),
@Body nvarchar(max)
WITH ENCRYPTION
AS
BEGIN

INSERT INTO [CONTENT].[Post]
           ([PersonID]
           ,[CategoryID]
           ,[Title]
           ,[Body])   VALUES(@PersonID,@CategoryID,  @Title,  @Body)

DECLARE @POST_ID INT
SET @POST_ID = SCOPE_IDENTITY()

INSERT INTO [PERSON].[Person_Activity]
           ([PersonID]
           ,[ActivityCode] )
     VALUES
           (@PersonID,
            1 -- HARD CODE - POST 
			)

RETURN @POST_ID
END
GO

sys.sp_helptext @objname = N'usp_Post_InsertRow'
Go
--The text for object 'usp_Post_InsertRow' is encrypted.


CREATE OR ALTER PROCEDURE usp_Activity_GetPointByTitle
@Title NVARCHAR(50) ,
@Point SMALLINT OUTPUT

AS
BEGIN

SELECT @Point = A.Point
FROM Person.Activity A
WHERE a.Title = @Title

END
GO


DECLARE @Result SMALLINT

EXEC	 [dbo].[usp_Activity_GetPointByTitle]
		@Title = N'مطلب گذاشتن',
		@Point = @Result OUTPUT



SELECT	@Result  AS result
PRINT @Result
GO


CREATE OR ALTER PROCEDURE usp_Activity_GetAllByCode
@Code  TINYINT,
@Title NVARCHAR(50) OUT,
@Point SMALLINT OUTPUT

AS
BEGIN

-- A SELECT statement that assigns a value to a variable 
--must not be combined with data-retrieval operations.

SELECT    @Point = A.Point,
          @Title = A.Title
FROM Person.Activity A
WHERE a.Code = @Code

END
GO


DECLARE	
		@Title1 nvarchar(50),
		@Point1 smallint

EXEC	[dbo].[usp_Activity_GetAllByCode]
		@Code = 2,
		@Title = @Title1 OUTPUT,
		@Point = @Point1 OUTPUT

PRINT CONCAT (@Title1, ' : ' , @Point1)
GO


--Must pass parameter number 2 and subsequent parameters as '@name = value'. 
--After the form '@name = value' has been used, 
--all subsequent parameters must be passed in the form '@name = value'.

/*
DECLARE	
		@Title1 nvarchar(50),
		@Point1 smallint

EXEC	[dbo].[usp_Activity_GetAllByCode]
		@Code = 2,
		 @Title1 OUTPUT,
		 @Point1 OUTPUT

PRINT CONCAT (@Title1, ' : ' , @Point1)
*/
GO

-- تمرین DEFAULT VALUE برای SP
-- PAGING  ( PAGE NO  = 1 , ITEM PER PAGE = 5 )
-- SP 

------------------------------------------------

CREATE OR ALTER PROC usp_Activity_UpdateRow
@Code  tinyint,
@Title nvarchar(50) = NULL,
@Point smallint = NULL

AS
BEGIN

UPDATE PERSON.Activity
SET Title = CASE WHEN @Title IS NOT NULL THEN @Title ELSE Title END ,
    Point = CASE WHEN @Point IS NULL THEN POINT ELSE @Point END
WHERE Code = @Code
END
GO

usp_Activity_UpdateRow @Code = 1 , @point = 9000
GO

usp_Activity_UpdateRow @Code = 1 , @TITLE = N'پست'
GO

usp_Activity_UpdateRow @Code = 1 , 
                       @TITLE = N'پست گذاشتن' ,
					   @point = 10000
GO

usp_Activity_UpdateRow @Code = 1                   
GO

SELECT * FROM PERSON.Activity
GO


--------------------------------------------------

CREATE OR ALTER PROC usp_Person_Search
@FirstName nvarchar(50) = NULL,
@LastName nvarchar(50) = NULL,
@BirthDate date = null,
@RoleCode tinyint = null
AS
BEGIN

SELECT *
FROM PERSON.Person P
WHERE (@FirstName IS NULL OR P.FirstName = @FirstName) AND
      (@LastName IS NULL OR P.LastName = @LastName) AND
	  (@BirthDate IS NULL OR P.BirthDate = @BirthDate) AND
	  (@RoleCode IS NULL OR P.RoleCode = @RoleCode) 
END
GO


usp_Person_Search
GO

usp_Person_Search @FIRSTnAME = N'امیر'
GO

usp_Person_Search @lASTNAME = N'صدر'
GO

usp_Person_Search @lASTNAME = N'صدر', @FIRSTnAME = N'امیر'
GO


CREATE OR ALTER PROC usp_Person_Search
@FirstName nvarchar(50) = NULL,
@LastName nvarchar(50) = NULL,
@BirthDate date = null,
@RoleCode tinyint = null
AS
BEGIN

SELECT *
FROM PERSON.Person P
WHERE (@FirstName IS NULL OR P.FirstName LIKE '%' + @FirstName +'%' ) AND
      (@LastName IS NULL OR P.LastName = @LastName) AND
	  (@BirthDate IS NULL OR P.BirthDate = @BirthDate) AND
	  (@RoleCode IS NULL OR P.RoleCode = @RoleCode) 
END
GO


usp_Person_Search @FIRSTnAME = N'س'
GO