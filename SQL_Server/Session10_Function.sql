--CREATE FUNCTION FunctionName
--( InputParameters )
--RETURNS DataType
--AS
--Begin

--Code;
--Return Expression

--end
-- Scalar Functions



USE Weblog2023Dotin
GO

--usp_
--fn_


CREATE OR ALTER FUNCTION DoSum ( @A INT, @B INT )
RETURNS INT
AS
    BEGIN
        RETURN @A + @B
    END
GO


SELECT  dbo.DoSum(40, 50) as [Sum]
GO

--SELECT  DoSum(40, 50) as [Sum]
--GO


--------------------------------

CREATE OR ALTER FUNCTION Multiply (@A INT, @B INT = 5)
RETURNS INT
AS
BEGIN
   RETURN @A * @B
END
GO


SELECT dbo.Multiply (3,4) AS Result 
SELECT dbo.Multiply (7, DEFAULT) AS 'Zarb' 
GO


----------------------------------------

CREATE FUNCTION Multiply2 ( @A INT, @B INT = 3, @C INT )  
RETURNS INT
AS
    BEGIN
        RETURN @A * @B * @C
    END
GO 



SELECT  dbo.Multiply2(3, 4, 2) AS ZARB
SELECT  dbo.Multiply2(7, DEFAULT, 1) AS Zarb
SELECT  dbo.Multiply2(7, DEFAULT, 2) AS Zarb
GO




IF (SELECT dbo.Multiply2(3, 4, 20)) > 100
BEGIN
	PRINT '> 100'
END
ELSE
BEGIN
	PRINT '< 100'
END
GO

USE DotinBootCamp
GO




CREATE FUNCTION [dbo].[Persian_To_Gregorian](@DateStr varchar(10))
RETURNS DATE
 
AS
 
BEGIN
 
   declare @YYear int,@MMonth int,@DDay int,@epbase int,@epyear int,@mdays int,@persian_jdn int,@i int,
 
   @j int,@l int,@n int,@TMPRESULT varchar(10),@IsValideDate int,@TempStr varchar(20),@TmpDateStr varchar(10)
 
   SET @i=charindex('/',@DateStr)
 
   IF LEN(@DateStr) - CHARINDEX('/', @DateStr,CHARINDEX('/', @DateStr,1)+1) = 4
 
   BEGIN
 
     IF ( ISDATE(@TmpDateStr) =1 )
 
       RETURN @TmpDateStr
 
     ELSE           
 
        RETURN NULL
 
   END
 
   ELSE
 
     SET @TmpDateStr = @DateStr
 
   IF ((@i<>0) and
 
        (ISNUMERIC(REPLACE(@TmpDateStr,'/',''))=1) and
 
        (charindex('.',@TmpDateStr)=0))
 
   BEGIN
 
       SET @YYear=CAST(SUBSTRING(@TmpDateStr,1,@i-1) AS INT)
 
                IF ( @YYear< 1300 )
 
                      SET @YYear =@YYear + 1300
 
                IF @YYear > 9999
 
                  RETURN NULL
 
                                SET @TempStr= SUBSTRING(@TmpDateStr,@i+1,Len(@TmpDateStr))
 
                                SET @i=charindex('/',@TempStr)
 
        SET @MMonth=CAST(SUBSTRING(@TempStr,1,@i-1) AS INT)
 
        SET @MMonth=@MMonth-- -1
 
        SET @TempStr= SUBSTRING(@TempStr,@i+1,Len(@TempStr)) 
 
        SET @DDay=CAST(@TempStr AS INT)
 
       SET @DDay=@DDay-- - 1
 
        IF ( @YYear >= 0 )
 
                     SET @epbase = @YYear - 474
 
                 Else
 
                     SET @epbase = @YYear - 473
 
                 SET @epyear = 474 + (@epbase % 2820)
 
        IF (@MMonth <= 7 )
 
                       SET @mdays = ((@MMonth) - 1) * 31
 
        Else
 
            SET @mdays = ((@MMonth) - 1) * 30 + 6
 
            SET @persian_jdn =(@DDay)  + @mdays + CAST((((@epyear * 682) - 110) / 2816) as int)  + (@epyear - 1) * 365  +  CAST((@epbase / 2820)  as int ) * 1029983  + (1948321 - 1)
 
        IF (@persian_jdn > 2299160)
 
         BEGIN
 
            SET @l = @persian_jdn + 68569
 
            SET @n = CAST(((4 * @l) / 146097) as int)
 
            SET @l = @l -  CAST(((146097 * @n + 3) / 4) as int)
 
            SET @i =  CAST(((4000 * (@l + 1)) / 1461001) as int)
 
            SET @l = @l - CAST( ((1461 * @i) / 4) as int) + 31
 
            SET @j =  CAST(((80 * @l) / 2447) as int)
 
            SET @DDay = @l - CAST( ((2447 * @j) / 80) as int)
 
            SET @l =  CAST((@j / 11) as int)
 
            SET @MMonth = @j + 2 - 12 * @l
 
            SET @YYear = 100 * (@n - 49) + @i + @l
 
         END
 
                SET @TMPRESULT=Cast(@MMonth as varchar(2))+'/'+CAST(@DDay as varchar(2))+'/'+CAST(@YYear as varchar(4))
 
                RETURN Cast(@TMPRESULT as varchar(10))
 
    END
 
    RETURN NULL    
END
 
 
GO

CREATE FUNCTION [dbo].[Gregorian_To_Persian] (@MDate DateTime)
RETURNS nVarchar(50)
AS
BEGIN
DECLARE @SYear as Integer
DECLARE @SMonth as Integer
DECLARE @SDay as Integer
DECLARE @AllDays as float
DECLARE @ShiftDays as float
DECLARE @OneYear as float
DECLARE @LeftDays as float
DECLARE @YearDay as Integer
DECLARE @Farsi_Date as Varchar(100)
 
DECLARE @SDay1 as Varchar(11)
DECLARE @SMonth1 as Varchar(11)
 
 
SET @MDate=@MDate-CONVERT(char,@MDate,114)
 
SET @ShiftDays=466699 +2
SET @OneYear= 365.24199
 
 
SET @SYear = 0
SET @SMonth = 0
SET @SDay = 0
SET @AllDays = CAst(@Mdate as Real)
 
SET @AllDays = @AllDays + @ShiftDays
 
SET @SYear = (@AllDays / @OneYear) --trunc
SET @LeftDays = @AllDays - @SYear * @OneYear
 
if (@LeftDays < 0.5)
begin
SET @SYear=@SYear+1
SET @LeftDays = @AllDays - @SYear * @OneYear
end;
 
SET @YearDay = @LeftDays --trunc
if (@LeftDays - @YearDay) >= 0.5
SET @YearDay=@YearDay+1
 
if ((@YearDay / 31) > 6 )
begin
SET @SMonth = 6
SET @YearDay=@YearDay-(6 * 31)
SET @SMonth= @SMonth+( @YearDay / 30)
if (@YearDay % 30) <> 0
SET @SMonth=@SMonth+1
SET @YearDay=@YearDay-((@SMonth - 7) * 30)
end
else
begin
SET @SMonth = @YearDay / 31
if (@YearDay % 31) <> 0
SET @SMonth=@SMonth+1
SET @YearDay=@YearDay-((@SMonth - 1) * 31)
end
SET @SDay = @YearDay
SET @SYear=@SYear+1
 
set @SMonth1=CAST (@SMonth  as VarChar(11))
if LEN(@SMonth)=1
set @SMonth1 = right(replicate('0', 2)+rtrim(ltrim(@SMonth)), 2)
 
 
set @SDay1=CAST (@SDay  as VarChar(11))
if LEN(@SDay)=1
set @SDay1 = right(replicate('0', 2)+rtrim(ltrim(@SDay)), 2)
 
--SET @Farsi_Date = CAST (@SYear as VarChar(10)) + '/' + CAST (@SMonth as VarChar(10)) + '/' + CAST (@SDay as VarChar(10))
SET @Farsi_Date = CAST (@SYear as nVarChar(10)) + '/' + @SMonth1 + '/' + @SDay1
Return @Farsi_Date
 
END
 
GO


SELECT [dbo].[Gregorian_To_Persian] (GETDATE())
GO

SELECT [dbo].[Persian_To_Gregorian] ('1362/11/11')
GO




CREATE OR ALTER PROCEDURE usp_Person_SelectAll
AS
BEGIN

SELECT P.FullName ,
      [dbo].[Gregorian_To_Persian](P.Birthdate) PersianBirthdate
	  --R.*
FROM Person P
INNER JOIN Role R ON P.RoleCode = R.Code
WHERE p.BirthDate IS NOT NULL
ORDER BY P.Code DESC 
END
GO

EXEC usp_Person_SelectAll
GO


ALTER TABLE dbo.Person
ADD PersianBirthdate
AS ([dbo].[Gregorian_To_Persian](Birthdate)) 
GO


SELECT *
FROM dbo.Person
GO

CREATE OR ALTER FUNCTION fn_Return_Age (@Birthdate date)
RETURNS INT
AS
BEGIN
    RETURN DATEDIFF(YYYY,@Birthdate,GETDATE())
END
GO

ALTER TABLE dbo.Person
ADD Age
AS ([dbo].[fn_Return_Age](Birthdate)) 
GO

SELECT *
FROM dbo.Person
ORDER BY AGE DESC
GO

------------------------------

-- DRY


-- post , comment , point , update role

-- post_insert ==> activity , if ( total point ) > 560000 => SP (update role ( advance user )) 
-- comment_insert ==> activity , if ( total point ) > 560000 => update role ( advance user ) 

-- SCALAR FUNCTION ==> TOTAL POINT

-- RESULT OK 
-- BEHINE 
-- LOGICAL ERROR