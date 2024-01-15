

--انجام همزمان عملیات insert update delete در یک دستور
-- مشخص کردن سورس و مقصد
-- سورس میتواند یک کواری یا یک جدول باشد
--اما تارگت یک جدول است که روی آن عملیات را انجام میدهیم 
USE tempdb
GO
IF ( Object_id('UsingTable') > 0 )
  DROP TABLE UsingTable
GO
CREATE TABLE UsingTable
  (
     RefId INT ,
     name  VARCHAR(100)
  )
GO
IF ( Object_id('TargetTable') > 0 )
  DROP TABLE TargetTable
GO
CREATE TABLE TargetTable
  (
     ChildId INT,
     val     VARCHAR(100)
  )
GO
-- Inserting records in both tables
INSERT INTO UsingTable(RefId,name)
VALUES      (1,'S-1'),
            (2,'S-2'),
            (3,'S-3'),
            (4,'S-4'),
            (5,'S-555'),
            (7,'S-7')

GO
INSERT INTO TargetTable(ChildId,val)
VALUES      (1,'S-1'),
            (2,'S-2'),
            (3,'S-3'),
            (5,'S-5'),
            (6,'S-6') 
GO
SELECT * FROM UsingTable
SELECT * FROM TargetTable
GO
--------------------------------------------------------------------
BEGIN TRAN
GO

MERGE dbo.TargetTable AS TARGET_Table
USING dbo.UsingTable AS SOURCE_Table
ON (SOURCE_Table.RefId = TARGET_Table.ChildId)
WHEN MATCHED THEN 
	DELETE ; 
GO	





SELECT * FROM UsingTable
SELECT * FROM TargetTable
GO
ROLLBACK TRAN
go



--------------------------------------------------------------------
BEGIN TRAN
GO
MERGE dbo.TargetTable AS TARGET_Table
USING dbo.UsingTable AS SOURCE_Table
ON (SOURCE_Table.RefId = TARGET_Table.ChildId)
WHEN  NOT MATCHED BY SOURCE THEN--
	DELETE;
GO	




SELECT * FROM UsingTable
SELECT * FROM TargetTable
GO
ROLLBACK TRAN
--------------------------------------------------------------------
BEGIN TRAN
GO
MERGE DBO.TargetTable AS TARGET_Table
USING DBO.UsingTable AS SOURCE_Table
ON (SOURCE_Table.RefId = TARGET_Table.ChildId)
WHEN  NOT MATCHED BY TARGET THEN--
	INSERT (childId,val) 
	VALUES (SOURCE_Table.RefId,SOURCE_Table.NAME) ;
GO	




SELECT * FROM UsingTable
SELECT * FROM TargetTable
GO
ROLLBACK TRAN
--------------------------------------------------------------------ALL
BEGIN TRAN
GO
MERGE DBO.TargetTable AS TARGET_Table
USING DBO.UsingTable AS SOURCE_Table
ON (SOURCE_Table.RefId = TARGET_Table.ChildId)
WHEN MATCHED AND SOURCE_Table.NAME<>TARGET_Table.VAL THEN 
	UPDATE  SET TARGET_Table.VAL=SOURCE_Table.NAME 
WHEN  NOT MATCHED BY SOURCE THEN
	DELETE 
WHEN  NOT MATCHED BY TARGET THEN
	INSERT (childId,val)
		 VALUES (SOURCE_Table.RefId,SOURCE_Table.NAME) ;
GO	

SELECT * FROM UsingTable
SELECT * FROM TargetTable
GO
ROLLBACK TRAN
GO

--------------------------------------------------------------------
