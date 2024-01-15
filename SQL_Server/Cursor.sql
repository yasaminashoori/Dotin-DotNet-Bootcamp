/* Cursor
در بسیاری مواقع شما نیاز دارید اطلاعات را به صورت رکورد به رکورد بررسی کنید، 
همانطور که مشخص است دستور سلکت این کار را برای ما انجام می دهد
با این تفاوت که نمی توانیم تک تک رکوردها را بررسی کنیم 
بلکه خروجی دستور سلکت یک مجموعه جواب یا در واقع یک دیتاست است.
دستور کرسر  می تواند خروجی دستور سلکت را در حافظه نگه دارد و تک تک آنها را بررسی کند.
*/



USE tempdb
GO

CREATE TABLE dbo.Account
    (
      ID INT PRIMARY KEY IDENTITY ,
      UserName VARCHAR(20) NOT NULL ,
      Password VARBINARY(MAX) NOT NULL
    )
GO


INSERT  INTO dbo.Account
        ( UserName, Password )
VALUES  ( 'aaa', HASHBYTES('SHA2_512', 'AAA' )),
        ( 'bbb', HASHBYTES('SHA2_512', 'BBB' ) )
GO

SELECT * FROM dbo.Account
GO

----------------------------------------------

DECLARE cursor1 CURSOR
FOR
    SELECT  ID ,
            UserName ,
            Password
    FROM    dbo.Account

-- باز کردن کرسر از طریق نام آن
OPEN cursor1

-- در ادامه

FETCH NEXT FROM cursor1 

-- در آخر
-- ترتیب مهم است 
CLOSE cursor1
DEALLOCATE cursor1

GO

------------------------------------------------

DECLARE cursor2 CURSOR FORWARD_ONLY LOCAL READ_ONLY 
FOR
    SELECT  ID ,
            UserName ,
            Password
    FROM    dbo.Account

OPEN cursor2
PRINT @@FETCH_STATUS
FETCH  NEXT FROM cursor2 
PRINT @@FETCH_STATUS
WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT @@FETCH_STATUS
    FETCH NEXT FROM cursor2
END
PRINT @@FETCH_STATUS
CLOSE cursor2
DEALLOCATE cursor2

GO
-------------------------------------------------------

DECLARE @name VARCHAR(50) -- database name  
DECLARE @path VARCHAR(256) -- path for backup files  
DECLARE @fileName VARCHAR(256) -- filename for backup  
DECLARE @fileDate VARCHAR(20) -- used for file name 

SET @path = 'F:\IT\Dotin\BootCamp\SQL\12\BKP\'  



--SELECT @fileDate = CONVERT(VARCHAR(20),GETDATE(),112) 
SELECT @fileDate ='2020-11-11' --CONVERT(VARCHAR(20),DATEADD(DAY,GETDATE(),1),112) 


--PRINT @fileDate

DECLARE db_cursor CURSOR LOCAL READ_ONLY FORWARD_ONLY
FOR  
	SELECT name
	FROM sys.databases 
	WHERE name IN ('Weblog','Weblog1401','Weblog2021','AdventureWorks2019','Weblog2023Dotin') 
	--WHERE name NOT IN ('master','model','msdb','tempdb','ReportServer','ReportServerTempDB') 
	
OPEN db_cursor   
FETCH NEXT FROM db_cursor INTO @name   

WHILE @@FETCH_STATUS = 0   
BEGIN   
       SET @fileName = @path + @name + '_' + @fileDate + '.BAK'  
       BACKUP  DATABASE @name TO DISK = @fileName  WITH COMPRESSION 
       FETCH NEXT FROM db_cursor INTO @name   
END   

CLOSE db_cursor   
DEALLOCATE db_cursor

GO
---------------------------------------------------------------

ROLLBACK --The ROLLBACK TRANSACTION request has no corresponding BEGIN TRANSACTION.
--

GO

USE [master];
GO
CREATE DATABASE [TestCursorDB2];
GO

USE TestCursorDB2;
GO


CREATE TABLE [dbo].[Person]
(
    [ID] [INT] IDENTITY(1, 1) NOT NULL,
    [FirstName] [NVARCHAR](50) NOT NULL,
    [LastName] [NVARCHAR](50) NOT NULL,
    [BirthDate] [DATE] NOT NULL,
    CONSTRAINT [PK_Person]
        PRIMARY KEY CLUSTERED ([ID] ASC)
);
GO


CREATE TABLE [dbo].[Profile]
(
    [ID] [INT] IDENTITY(1, 1) NOT NULL,
    [FN] [NVARCHAR](50) NOT NULL,
    [LN] [NVARCHAR](50) NOT NULL,
    [Note] [NVARCHAR](50) NOT NULL,
    [InsertedDateTime] [DATETIME] NOT NULL DEFAULT GETDATE(),
    CONSTRAINT [PK_Profile]
        PRIMARY KEY CLUSTERED ([ID] ASC)
);

GO

SET IDENTITY_INSERT [dbo].[Person] ON;

INSERT [dbo].[Person]
(
    [ID],
    [FirstName],
    [LastName],
    [BirthDate]
)
VALUES
(1, N'AAA1', N'AAA2', CAST(N'1990-01-01' AS DATE));
INSERT [dbo].[Person]
(
    [ID],
    [FirstName],
    [LastName],
    [BirthDate]
)
VALUES
(2, N'AAA3', N'AAA4', CAST(N'1995-01-01' AS DATE));
INSERT [dbo].[Person]
(
    [ID],
    [FirstName],
    [LastName],
    [BirthDate]
)
VALUES
(3, N'AAA5', N'AAA6', CAST(N'1980-01-01' AS DATE));
INSERT [dbo].[Person]
(
    [ID],
    [FirstName],
    [LastName],
    [BirthDate]
)
VALUES
(4, N'AAA7', N'AAA8', CAST(N'1985-01-01' AS DATE));
INSERT [dbo].[Person]
(
    [ID],
    [FirstName],
    [LastName],
    [BirthDate]
)
VALUES
(5, N'AAA9', N'AAA10', CAST(N'2000-01-01' AS DATE));
INSERT [dbo].[Person]
(
    [ID],
    [FirstName],
    [LastName],
    [BirthDate]
)
VALUES
(6, N'AAA11', N'AAA12', CAST(N'2010-01-01' AS DATE));
INSERT [dbo].[Person]
(
    [ID],
    [FirstName],
    [LastName],
    [BirthDate]
)
VALUES
(7, N'AAA13', N'AAA14', CAST(N'2009-01-01' AS DATE));
INSERT [dbo].[Person]
(
    [ID],
    [FirstName],
    [LastName],
    [BirthDate]
)
VALUES
(8, N'AAA15', N'AAA16', CAST(N'1990-01-01' AS DATE));
SET IDENTITY_INSERT [dbo].[Person] OFF;

GO

SELECT *
FROM dbo.Person;
GO

SELECT *
FROM dbo.Profile;
GO


CREATE OR ALTER PROC [dbo].[usp_Person_Get]
AS
BEGIN

    DECLARE @FN NVARCHAR(50);
    DECLARE @LN NVARCHAR(50);
    DECLARE @BD DATE;

    DECLARE cursor1 CURSOR READ_ONLY LOCAL FORWARD_ONLY FOR
    SELECT P.FirstName,
           P.LastName,
           P.BirthDate
    FROM dbo.Person P;

    OPEN cursor1;

    FETCH NEXT FROM cursor1
    INTO @FN,
         @LN,
         @BD;

    WHILE @@FETCH_STATUS = 0
    BEGIN

        IF (YEAR(@BD) < 2000)
        BEGIN

            INSERT INTO [dbo].[Profile]
            (
                [FN],
                [LN],
                [Note]
            )
            VALUES
            (@FN, @LN, N'قدیمی ها');

        END;

        IF (YEAR(@BD) >= 2000)
        BEGIN

            INSERT INTO [dbo].[Profile]
            (
                [FN],
                [LN],
                [Note]
            )
            VALUES
            (@FN, @LN, N'جدیدی ها');

        END;


        FETCH NEXT FROM cursor1
        INTO @FN,
             @LN,
             @BD;

    END;

    CLOSE cursor1;
    DEALLOCATE cursor1;

END;
GO

EXEC dbo.usp_Person_Get
GO

SELECT * FROM dbo.Profile
GO
