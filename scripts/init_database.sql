/*
======================================================
CREATE DATABASE AND SCHEMAS
======================================================

Purpose:
This script checks for the existence of the DataWarehouse database, drops it if it exists, and then recreates it.
It also creates three schemas, namely bronze, silver, and gold.

Warning:

Dropping the database erases it and permanently deletes all the data it contains.
Proceed with caution, and ensure proper backups are in place.
*/

USE master;
GO

--Drop the 'DataWarehouse' database and kick out active users

IF EXISTS(SELECT 1 FROM sys.databases WHERE name='DataWarehouse')
BEGIN 
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE ;
	DROP DATABASE DataWarehouse;
END;
GO

--Create 'Datawarehouse'

CREATE DATABASE DataWarehouse;
GO
Use DataWarehouse;
GO
--Create bronze, silver, and gold schemas

CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;

