/*
=====================================================
Create database and Schemas
=====================================================
Script Purpose:
	This script creates a new database name 'DataWarehouse' after checking if it already exists.
	If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
	with in the database: Bronze, Silver, and Gold

Warning:
	Running this script will drop the entire database if it exists.
	All the data in the database will be permanently deleted. Proceed with caution
	and ensure that you have proper backups before running this script
*/
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
