
create or replace table pytorch-checkout.ny_bus_data.aggregated_bus_data as
SELECT  NextStopPointName,
TIMESTAMP_SECONDS(5*60 * DIV(UNIX_SECONDS(cast(RecordedAtTime as timestamp)), 5*60)) timekey,
count(*) BusesThatReachedStop,
sum(LateCounter) BusesThatReachedLate,
sum(OnTimeCounter) OnTimeBuses,
sum(TimeBeforeSchedule) AvgLeadTime,
sum(TimeAfterSchedule) AvgLateTime,
APPROX_TOP_COUNT(PublishedLineName, 1) as MostFrequentLine
FROM `pytorch-checkout.ny_bus_data.bus_data_at_stop_with_useful_att` 
group by NextStopPointName,timekey
