USE Weblog2023Dotin;
GO


SELECT *
FROM Person.Person
WHERE ID = '12X';
GO


BEGIN TRY
    SELECT 1/0   
END TRY
BEGIN CATCH
    PRINT 'خسته نباشید';
END CATCH;
GO



BEGIN TRY
    SELECT *
    FROM Person.Person
    WHERE ID = '12X';
END TRY
BEGIN CATCH
    PRINT 'خسته نباشید';
END CATCH;
GO




BEGIN TRY
    SELECT *
    FROM Person.Person
    WHERE ID = '12x';
END TRY
BEGIN CATCH
    RAISERROR('اجرای کوئری با مشکل مواجه شد',16,1);
END CATCH;
GO


BEGIN TRY
    SELECT *
    FROM Person.Person
    WHERE ID = '12x';
END TRY
BEGIN CATCH
    PRINT 'اجرای کوئری با مشکل مواجه شد';
    THROW; 
END CATCH;
GO

SELECT *
FROM sys.messages;


BEGIN TRY
   
   RAISERROR('LINE 62 OK',10,1);
   
	SELECT *
    FROM Person.Person
    WHERE ID = '1';

	RAISERROR('LINE 68 OK',10,1);

	SELECT *
    FROM Person.Person
    WHERE ID = '2';

	DECLARE @TEST INT
	SET @TEST = 12345

	DECLARE @MSG VARCHAR(50)
	SET @MSG = CONCAT('LINE 80 TEST = ', @TEST)

	RAISERROR(@MSG,10,1);

END TRY
BEGIN CATCH
    PRINT 'اجرای کوئری با مشکل مواجه شد'
END CATCH;
GO

BEGIN TRY
   
   RAISERROR('اجرای کوئری با مشکل اصلی مواجه شد',16,1);

	SELECT *
    FROM Person.Person
    WHERE ID = '1';

END TRY
BEGIN CATCH
    PRINT 'اجرای کوئری با مشکل مواجه شد'
END CATCH;
GO


BEGIN TRY
    SELECT *
    FROM Person.Person
    WHERE ID = '12x';
END TRY
BEGIN CATCH
   
    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    SELECT
        @ErrorMessage = ERROR_MESSAGE(),
        @ErrorSeverity = ERROR_SEVERITY(),
        @ErrorState = ERROR_STATE();

    PRINT CONCAT('MSG : ',@ErrorMessage,' Severity : ', @ErrorSeverity,' State : ',@ErrorState)
    RAISERROR (@ErrorMessage, @ErrorSeverity,  @ErrorState  );

END CATCH;
GO



--Error severity levels greater than 18 can only be specified by members of the sysadmin role, using the WITH LOG option.
BEGIN TRY

	SELECT *
    FROM Person.Person
    WHERE ID = '1x';

END TRY
BEGIN CATCH
   RAISERROR('اجرای کوئری با مشکل اصلی مواجه شد',25,1);
END CATCH;
GO


