
create or replace table pytorch-checkout.ny_bus_data.aggregated_bus_data_by_lid as 
select 
a.timekey as timekey,
b.LocationID as locationID,
sum(a.BusesThatReachedStop) as BusesThatReachedStop,
sum(a.BusesThatReachedLate) as BusesThatReachedLate,
sum(a.OnTimeBuses) as OnTimeBuses,
avg(a.AvgLeadTime) as AvgLeadTime,
avg(a.AvgLateTime) as AvgLateTime
from pytorch-checkout.ny_bus_data.aggregated_bus_data a
join `pytorch-checkout.ny_bus_data.geocodes` b on a.NextStopPointName=b.BusStop
group by a.timekey,b.LocationID