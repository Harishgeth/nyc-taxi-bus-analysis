-- SELECT * FROM `pytorch-checkout.ny_bus_data.bus_data_at_the_stop` LIMIT 1000;


-- SELECT 
--   TIMESTAMP_SECONDS(10*60 * DIV(UNIX_SECONDS(cast(pickup_datetime as timestamp)), 10*60)) timekey,
--    pickup_location_id,
--   count(*)
-- FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2017`
-- where pickup_datetime>= cast('2017-07-01 00:00:00' as datetime)
-- GROUP BY timekey, pickup_location_id
-- order by timekey 

-- select * from pytorch-checkout.ny_bus_data.geocodes

create or replace table pytorch-checkout.ny_bus_data.missing_bus_stops as
select distinct(NextStopPointName) from pytorch-checkout.ny_bus_data.bus_data_at_the_stop a
where not exists (select 'x' from pytorch-checkout.ny_bus_data.geocodes b where a.NextStopPointName=b.BusStop);
-- select stop_zone,LocationID,BusStop from pytorch-checkout.ny_bus_data.geocodes limit 5;