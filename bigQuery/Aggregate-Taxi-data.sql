-- SELECT * FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2017` LIMIT 1000


SELECT 
  TIMESTAMP_SECONDS(10*60 * DIV(UNIX_SECONDS(cast(pickup_datetime as timestamp)), 10*60)) timekey,
   pickup_location_id,
  count(*)
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2017`
where pickup_datetime>= cast('2017-07-01 00:00:00' as datetime)
GROUP BY timekey, pickup_location_id
order by timekey 
