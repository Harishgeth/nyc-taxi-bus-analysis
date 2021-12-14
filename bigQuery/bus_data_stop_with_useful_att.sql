
-- SELECT 
--   TIMESTAMP_SECONDS(10*60 * DIV(UNIX_SECONDS(cast(RecordedAtTime as timestamp)), 10*60)) RecoredTimeSlice,
--    NextStopPointName,
--   count(*) CountOfBuses,
--   avg(adherence) 
-- FROM `pytorch-checkout.ny_bus_data.june_bus_data_full`
-- GROUP BY RecoredTimeSlice, NextStopPointName
-- order by RecoredTimeSlice 


-- CREATE OR REPLACE TABLE pytorch-checkout.ny_bus_data.bus_data_at_the_stop_test AS 
-- SELECT PublishedLineName,late,adherence,NOT(late) as  FROM pytorch-checkout.ny_bus_data.bus_data_at_the_stop;

-- select * from pytorch-checkout.ny_bus_data.bus_data_at_the_stop limit 10;
-- select * from pytorch-checkout.ny_bus_data.geocodes limit 100;
create or replace table pytorch-checkout.ny_bus_data.bus_data_at_stop_with_useful_att as
select 
a.PublishedLineName,
a.DestinationName,
a.NextStopPointName,
a.RecordedAtTime,
coalesce(a.DistanceFromStop,0) as DistanceFromStop, 
if(a.late,1,0) as LateCounter,
if(a.late,0,1) as OnTimeCounter,
if(a.adherence>0,a.adherence,0) as TimeBeforeSchedule, 
if(a.adherence<0,-1*a.adherence,0) as TimeAfterSchedule,
b.LocationID,
b.stop_zone
FROM pytorch-checkout.ny_bus_data.bus_data_at_the_stop a
join pytorch-checkout.ny_bus_data.geocodes b on a.NextStopPointName=b.BusStop;