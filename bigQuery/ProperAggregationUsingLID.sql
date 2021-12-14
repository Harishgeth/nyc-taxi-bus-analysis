-- SELECT *  FROM `pytorch-checkout.ny_bus_data.aggregated_taxi_data` LIMIT 1000
create or replace table pytorch-checkout.ny_bus_data.aggregated_taxi_and_at_the_stop_bus_data_with_lid as
select a.*,
c.CountOfTrips as TaxiTripsBookedAtTimeSlot,
c.AvgFare as TaxiAvgFareAtTimeSlot,
c.AvgPassCount as TaxiAvgPassAtTimeSlot,
c.AvgTotalAmount as TaxiTotalFareAtTimeSlot,
c.AvgTripDist as TaxiAvgTripDistAtTimeSlot,
c.AvgTripTime as TaxiAvgTripTimeAtTimeSlot,

d.CountOfTrips as TaxiTripsBookedAtTMinusFiveSlot,
d.AvgFare as TaxiAvgFareAtTMinusFiveSlot,
d.AvgPassCount as TaxiAvgPassAtTMinusFiveSlot,
d.AvgTotalAmount as TaxiTotalFareAtTMinusFiveSlot,
d.AvgTripDist as TaxiAvgTripDistAtTMinusFiveSlot,
d.AvgTripTime as TaxiAvgTripTimeAtTMinusFiveSlot,

e.CountOfTrips as TaxiTripsBookedAtTMinusTenSlot,
e.AvgFare as TaxiAvgFareAtTMinusTenSlot,
e.AvgPassCount as TaxiAvgPassAtTMinusTenSlot,
e.AvgTotalAmount as TaxiTotalFareAtTMinusTenSlot,
e.AvgTripDist as TaxiAvgTripDistAtTMinusTenlot,
e.AvgTripTime as TaxiAvgTripTimeAtTMinusTenSlot,

f.CountOfTrips as TaxiTripsBookedAtTMinusFifteenSlot,
f.AvgFare as TaxiAvgFareAtTMinusFifteenSlot,
f.AvgPassCount as TaxiAvgPassAtTMinusFifteenSlot,
f.AvgTotalAmount as TaxiTotalFareAtTMinusFifteenSlot,
f.AvgTripDist as TaxiAvgTripDistAtTMinusFifteenSlot,
f.AvgTripTime as TaxiAvgTripTimeAtTMinusFifteenSlot,

g.CountOfTrips as TaxiTripsBookedAtTMinusTwentySlot,
g.AvgFare as TaxiAvgFareAtTMinusTwentySlot,
g.AvgPassCount as TaxiAvgPassAtTMinusTwentySlot,
g.AvgTotalAmount as TaxiTotalFareAtTMinusTwentySlot,
g.AvgTripDist as TaxiAvgTripDistAtTMinusTwentySlot,
g.AvgTripTime as TaxiAvgTripTimeAtTMinusTwentySlot

from `pytorch-checkout.ny_bus_data.aggregated_bus_data_by_lid` a
join `pytorch-checkout.ny_bus_data.aggregated_taxi_data` c on a.timekey=c.timekey and a.locationID=cast(c.pickup_location_id as Int64)
join `pytorch-checkout.ny_bus_data.aggregated_taxi_data` d on TIMESTAMP_SUB(a.timekey, INTERVAL 5 MINUTE) =d.timekey and a.LocationID=cast(d.pickup_location_id as Int64)
join `pytorch-checkout.ny_bus_data.aggregated_taxi_data` e on TIMESTAMP_SUB(a.timekey, INTERVAL 10 MINUTE) =e.timekey and a.LocationID=cast(e.pickup_location_id as Int64)
join `pytorch-checkout.ny_bus_data.aggregated_taxi_data` f on TIMESTAMP_SUB(a.timekey, INTERVAL 15 MINUTE) =f.timekey and a.LocationID=cast(f.pickup_location_id as Int64)
join `pytorch-checkout.ny_bus_data.aggregated_taxi_data` g on TIMESTAMP_SUB(a.timekey, INTERVAL 20 MINUTE) =g.timekey and a.LocationID=cast(g.pickup_location_id as Int64)

