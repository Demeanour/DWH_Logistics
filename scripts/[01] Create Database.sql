-- drop and recreate the 'DataWarehouse' database.
if EXISTS (SELECT 1 from sys.databases where name = 'DataWarehouse')
BEGIN
	ALTER Database DataWarehouse SET SINGLE_USER WITH ROLLBACK Immediate;
	Drop Database DataWarehouse;
END;
GO;

-- Create the 'DataWarehouse' database.
CREATE DATABASE DataWarehouse;
GO;


use DataWarehouse;
GO
