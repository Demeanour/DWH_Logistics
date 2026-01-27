USE DataWarehouse;
IF OBJECT('bronze_customers', 'U') IS NOT NULL
	DROP TABLE bronze_customers
create table bronze_customers(
customer_id varchar(50),
customer_name varchar(50),
customer_type varchar(50),
credit_terms_days varchar(50),
primary_freight_type varchar(50),
account_status varchar(50),
contract_start_date DATE ,
annual_revenue_potential int
);
