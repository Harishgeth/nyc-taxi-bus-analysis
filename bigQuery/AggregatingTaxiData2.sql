
-- SELECT 
--   TIMESTAMP_SECONDS(10*60 * DIV(UNIX_SECONDS(cast(RecordedAtTime as timestamp)), 10*60)) timekey,
--    NextStopPointName,
--   count(*),
--   avg()
-- FROM `pytorch-checkout.ny_bus_data.june_bus_data_full`
-- GROUP BY timekey, NextStopPointName
-- order by timekey 

create or replace table pytorch-checkout.ny_bus_data.aggregated_taxi_data as 
SELECT 
  TIMESTAMP_SECONDS(5*60 * DIV(UNIX_SECONDS(cast(pickup_datetime as timestamp)), 5*60)) timekey,
   pickup_location_id,
  count(*) as CountOfTrips,
  avg(passenger_count) as AvgPassCount,
avg(COALESCE(fare_amount , 0))  as AvgFare,
avg(COALESCE(total_amount, 0)) as AvgTotalAmount,
avg(COALESCE(trip_distance, 0)) as AvgTripDist,
avg(timestamp_diff(dropoff_datetime,pickup_datetime,MINUTE)) as AvgTripTime
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2017`
where pickup_datetime>= cast('2017-06-01 00:00:00' as datetime)
GROUP BY timekey, pickup_location_id
order by timekey 

-- select * from bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2017 limit 100