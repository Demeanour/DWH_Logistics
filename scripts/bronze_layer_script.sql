USE DataWarehouse;

-- Create Customers table
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

-- Create Deliver_event table
IF OBJECT('bronze_delivery_events', 'U') IS NOT NULL
	DROP TABLE bronze_delivery_events
create table bronze_delivery_events(
event_id varchar(50),
load_id varchar(50),
trip_id varchar(50),
event_type varchar(50),
facility_id varchar(50),
scheduled_datetime dateTime,
actual_datetime datetime,
detention_minutes varchar(50),
on_time_flag varchar(50),
location_city varchar(50),
location_state varchar(50)
);


