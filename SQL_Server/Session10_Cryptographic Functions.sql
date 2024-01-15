-- Cryptographic Functions

-- Encryption Hashing

--0x 6DCD 4CE2 3D88 E2EE 9568 BA54 6C00 7C63 D913 1C1B = 40 Char

-- الگوریتم های هش یک طرفه هستند

PRINT HASHBYTES('SHA1', 'A');
PRINT HASHBYTES('SHA1', 'a');
PRINT HASHBYTES('SHA1', N'A');
PRINT HASHBYTES('SHA1', 'سروش'); --7146
PRINT HASHBYTES('SHA1', N'سروش');--9397
PRINT HASHBYTES('SHA1', '');
PRINT HASHBYTES('SHA1', NULL);

--------------------
PRINT REPLICATE('a', 8);
GO

PRINT REPLICATE('a', 8000);
GO


PRINT HASHBYTES('SHA1', REPLICATE('a', 7999)); --8093
GO

PRINT HASHBYTES('SHA1', REPLICATE('a', 8000)); -- 937....DE7
GO

PRINT HASHBYTES('SHA1', REPLICATE('a', 8001));
GO


PRINT @@VERSION
GO



-- algorithm = MD2 | MD4 | MD5 | SHA | SHA1 | SHA2_256 | SHA2_512   
--The output conforms to the algorithm standard:
-- 128 bits (16 bytes) for MD2, MD4, and MD5;
-- 160 bits (20 bytes) for SHA and SHA1; 
-- 256 bits (32 bytes) for SHA2_256 : applies to SQL Server 2012 through SQL Server 2016.
-- 512 bits (64 bytes) for SHA2_512 : applies to SQL Server 2012 through SQL Server 2016.

-- For SQL Server 2014 and earlier, allowed input values are limited to 8000 bytes.

-- Beginning with SQL Server 2016 (13.x), all algorithms other than SHA2_256, and SHA2_512 are deprecated.

PRINT HASHBYTES('MD5', 'A');
PRINT HASHBYTES('SHA1', 'A');
PRINT HASHBYTES('SHA2_256','A')
PRINT HASHBYTES('SHA2_512', 'A');
GO


------------------------------------------

-- 0x 7FC5 6270 E7A7 0FA8 1A59 35B7 2EAC BE29 = 32 Char
PRINT HASHBYTES('MD5', 'A');
PRINT HASHBYTES('MD5', 'a');
PRINT HASHBYTES('MD5', N'A');

-------------------------------------

USE tempdb;
GO

DROP TABLE IF EXISTS  dbo.PasswordHistory
GO

CREATE TABLE dbo.PasswordHistory
(
    ID INT PRIMARY KEY IDENTITY,
    Username VARCHAR(50) NOT NULL,
    HashPassword VARBINARY(MAX) NOT NULL
);


INSERT INTO dbo.PasswordHistory
(
    Username,
    HashPassword
)
VALUES
('Soroush', HASHBYTES('SHA2_512', '123')),
('Ali'    , HASHBYTES('SHA2_512', '456')),
('Reza'   , HASHBYTES('SHA2_512', '456'))
GO

SELECT *
FROM dbo.PasswordHistory
GO

SELECT *
FROM dbo.PasswordHistory
--WHERE Username='Reza' AND  HashPassword = HASHBYTES('SHA2_512', '123');
WHERE Username='Reza' AND  HashPassword = HASHBYTES('SHA2_512', '456');
GO

----------------------------------------

-- PLAIN TEXT

-- MUST ==> HASH PASSWORD , ACCOUNT , 
-- FORGOT PASSWORD ==>  RESET PASSWORD , NEW PASSWORD
-- COMPLEX ? STRONG ? 
-- COMMON PASSWORD ==> ALL HASH ALG ==> GENERATE 

-- SALT  => RANDOM PER USER , ==> ABC  
-- PASSWORD ==> 123 ==> ABC123ABC ==> HASH , 

----------------------------------------


---------------------------Symmetric Encryption and Decryption----------------------------

--Encryption
--Encrypt data with a passphrase using the TRIPLE DES algorithm with a 128 key bit length.
--SQL Server 2017 and later versions encrypts data with a passphrase using an AES256 key.


--A passphrase is a password that includes spaces. 
--The advantage of using a passphrase is that it is easier to remember
--a meaningful phrase or sentence than to remember a comparably long string of characters.

--This function does not check password complexity.

DECLARE @Key VARCHAR(100);
DECLARE @PlainText NVARCHAR(100);
DECLARE @ENC1 VARBINARY(MAX);
DECLARE @ENC2 VARBINARY(MAX);
DECLARE @ENC3 VARBINARY(MAX);

SET @Key = '123Session456!';
SET @PlainText = N'سروش صدر';

SET @ENC1 = ENCRYPTBYPASSPHRASE(@Key, @PlainText);
SET @ENC2 = ENCRYPTBYPASSPHRASE(@Key, @PlainText);
SET @ENC3 = ENCRYPTBYPASSPHRASE(@Key, @PlainText);

PRINT @ENC1 ;
PRINT @ENC2 ;
PRINT @ENC3 ;

-------------------------------------------------

-- Decryption
PRINT DECRYPTBYPASSPHRASE(@Key, @ENC1);
PRINT CAST(DECRYPTBYPASSPHRASE(@Key, @ENC1) AS NVARCHAR(MAX));
PRINT CAST(DECRYPTBYPASSPHRASE(@Key, @ENC2) AS NVARCHAR(MAX));
PRINT CAST(DECRYPTBYPASSPHRASE('FAKE', @ENC3) AS NVARCHAR(MAX));
PRINT CAST(DECRYPTBYPASSPHRASE(@Key, @ENC3) AS NVARCHAR(MAX));

GO

-- usp_Person_Register
-- fn , ln , username , password

-- PERSON ( ID , FN , LN , ...)
-- ACCOUNT ( ID , PID , USERNAME , ... )
-- Password History ( id , pid , hashpassword , ... )
---------------------------------------
