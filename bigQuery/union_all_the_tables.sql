
create or replace table pytorch-checkout.ny_bus_data.bus_data_at_the_stop
as
(select * from `pytorch-checkout.ny_bus_data.june_bus_data_at_stop`
union all
select * from `pytorch-checkout.ny_bus_data.august_bus_data_at_stop`
union all
select * from `pytorch-checkout.ny_bus_data.october_bus_data_at_stop`
union all
select * from `pytorch-checkout.ny_bus_data.december_bus_data_at_stop`)
