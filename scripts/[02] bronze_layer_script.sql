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
contract_start_date DATE,
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

IF OBJECT('bronze_driver_monthly_metrics', 'U') IS NOT NULL
	DROP TABLE bronze_driver_monthly_metrics
create TABLE bronze_driver_monthly_metrics(
driver_id varchar(50),
driver_month DATE,
trips_completed int,
total_miles int,
total_revenue DECIMAL(8,2),
average_mpg DECIMAL(4,2),
total_fuel_gallons decimal(5,1),
on_time_delivery_rate Decimal(5,4),
average_idle_hours Decimal(3,2)
);

IF OBJECT('bronze_drivers', 'U') IS NOT NULL
	DROP TABLE bronze_drivers
create TABLE bronze_drivers(
driver_id varchar(50),
first_name varchar(50),
last_name varchar(50),
hire_date DATE,
termination_date DATE,
license_number varchar(50),
license_state varchar(50),
date_of_birth date,
home_terminal varchar(50),
employment_status Varchar(50),
cdl_class char(10),
years_experience int
);

IF OBJECT('bronze_facilities', 'U') IS NOT NULL
	DROP TABLE bronze_facilities
create TABLE bronze_facilities(
facility_id varchar(50),
facility_name varchar(50),
facility_type varchar(50),
city varchar(50),
state char(10),
latitude varchar(50),
longitude varchar(50),
dock_doors int,
operating_hours Varchar(50)
);

IF OBJECT('bronze_fuel_purchases', 'U') IS NOT NULL
	DROP TABLE bronze_fuel_purchases
create TABLE bronze_fuel_purchases(
fuel_purchase_id varchar(50),
trip_id varchar(50),
truck_id varchar(50),
driver_id varchar(50),
purchase_date datetime,
location_city varchar(50),
location_state char(10),
gallons DECIMAL(4,1),
price_per_gallon DECIMAL(5,3),
total_cost varchar(20),
fuel_card_number varchar(50)
);

IF OBJECT('bronze_loads', 'U') IS NOT NULL
	DROP bronze_loads
create Table bronze_loads(
load_id varchar(50),
customer_id varchar(50),
route_id varchar(50),
load_date date,
load_type varchar(50),
weight_lbs int,
pieces int,
revenue DECIMAL(10,2),
fuel_surcharge DECIMAL(10,2),
accessorial_charges int,
load_status varchar(50),
booking_type varchar(50)
);

IF OBJECT('bronze_maintenance_records', 'U') IS NOT NULL
	DROP bronze_maintenance_records
create Table bronze_maintenance_records(
maintenance_id varchar(50), 
truck_id varchar(50),
maintenance_date date,
maintenance_type varchar(50),
odometer_reading int,
labor_hours DECIMAL(3,3),
labor_cost DECIMAL(10, 2),
parts_cost DECIMAL(10, 2),
total_cost DECIMAL(10, 2),
facility_location varchar(50),
downtime_hours Decimal(4,1),
service_description varchar(100)
);

IF OBJECT('bronze_routes', 'U') IS NOT NULL
	DROP bronze_routes
create Table bronze_routes(
route_id varchar(50),
origin_city varchar(50),
origin_state varchar(50),
destination_city varchar(50),
destination_state varchar(50),
typical_distance_miles int,
base_rate_per_mile DECIMAL(10,3),
fuel_surcharge_rate Decimal(5,3),
typical_transit_days int
);

IF OBJECT('bronze_safety_incidents', 'U') IS NOT NULL
	DROP bronze_safety_incidents
CREATE TABLE bronze_safety_incidents(
incident_id varchar(50),
trip_id varchar(50),
truck_id varchar(50),
driver_id varchar(50),
incident_date datetime,
incident_type varchar(50),
location_city varchar(50),
location_state char(10),
at_fault_flag char(10),
injury_flag char(10),
vehicle_damage_cost DECIMAL(10,2),
cargo_damage_cost DECIMAL(10,2),
claim_amount DECIMAL(10,2),
preventable_flag Varchar(50),
description varchar(50)
);
if OBJECT('bronze_trailers', 'U') IS NOT NULL
	DROP bronze_trailers
Create Table bronze_trailers(
trailer_id varchar(50),
trailer_number INT,
trailer_type varchar(50),
length_feet int,
model_year int(4),
vin varchar(50),
acquisition_date DATE,
status char(30),
current_location varchar(50)
);

IF OBJECT('bronze_trips', 'U') IS NOT NULL
	DROP TABLE bronze_trips
Create Table bronze_trips(
trip_id varchar(50),
load_id varchar(50),
driver_id varchar(50),
truck_id varchar(50),
trailer_id varchar(50),
dispatch_date DATE,
actual_distance_miles int,
actual_duration_hours DECIMAL(10,1),
fuel_gallons_used DECIMAL(10,1),
average_mpg DECIMAL(10,3),
idle_time_hours DECIMAL(3,1),
trip_status varchar(50)
);

IF OBJECT('truck_utilization_metrics','U') IS NOT NULL
	DROP truck_utilization_metrics
Create Table truck_utilization_metrics(
truck_id varchar(50),
utilization_month date,
trips_completed int,
total_miles int,
total_revenue DECIMAL(10,2),
average_mpg DECIMAL(5,2),
maintenance_events int,
maintenance_cost DECIMAL(10,2),
downtime_hours DECIMAL(5,2),
utilization_rate DECIMAL(9,3)
);

IF OBJECT('bronze_trucks', 'U') IS NOT NULL
	DROP bronze_trucks
CREATE TABLE bronze_trucks(
truck_id varchar(50),
unit_number int,
make varchar(50),
model_year int(4),
vin varchar(50),
acquisition_date date,
acquisition_mileage int,
fuel_type varchar(40),
tank_capacity_gallons int,
status char(20),
home_terminal varchar(50)
);


-- Load Data Into the tables --
-- load customer
LOAD DATA Local INFILE '../../dataFiles/ukrain/customers.csv' 
into table bronze_customers 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 Rows;

LOAD DATA Local INFILE '../../dataFiles/ukrain/delivery_events.csv' 
into table bronze_delivery_events 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 Rows;

LOAD DATA Local INFILE '../../dataFiles/ukrain/driver_monthly_metrics.csv' 
into table bronze_driver_monthly_metrics 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 Rows;

LOAD DATA Local INFILE '../../dataFiles/ukrain/drivers.csv' 
into table drivers 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 Rows;

LOAD DATA Local INFILE '../../dataFiles/ukrain/facilities.csv' 
into table facilities 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 Rows;

LOAD DATA Local INFILE '../../dataFiles/ukrain/fuel_purchases.csv' 
into table fuel_purchases 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 Rows;

LOAD DATA Local INFILE '../../dataFiles/ukrain/loads.csv' 
into table loads 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 Rows;

LOAD DATA Local INFILE '/home/paracelsus/Documents/Projects/Logistics/dataFiles/ukrain/maintenance_records.csv' 
into table maintenance_records 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 Rows;


LOAD DATA Local INFILE '../../dataFiles/ukrain/routes.csv' 
into table routes 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 Rows;


LOAD DATA Local INFILE '/home/paracelsus/Documents/Projects/Logistics/dataFiles/ukrain/safety_incidents.csv' 
into table safety_incidents 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 Rows;

LOAD DATA Local INFILE '/home/paracelsus/Documents/Projects/Logistics/dataFiles/ukrain/trailers.csv' 
into table trailers 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 Rows;

LOAD DATA Local INFILE '../../dataFiles/ukrain/trips.csv' 
into table trips 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 Rows;

LOAD DATA Local INFILE '../../dataFiles/ukrain/truck_utilization_metrics.csv' 
into table truck_utilization_metrics 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 Rows;

LOAD DATA Local INFILE '../../dataFiles/ukrain/trucks.csv' 
into table trucks 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 Rows;
