select 
case 
    when count(lat_n)%2=0 then 
    (
		select cast(AVG(CAST(lat_n as numeric(12,4))) as numeric(12,4))
		from
		( 
		select lat_n, ROW_NUMBER() over(order by lat_n) as n
		from station e1
		) result
		where n in (
		select (count(lat_n) + 1)/2 as median
		from station
		union
		select ((count(lat_n) + 1)/2) + 1 as median
		from station
		)
    )
    when count(lat_n)%2!=0 then 
    (
		select cast(AVG(CAST(lat_n as numeric(12,4))) as numeric(12,4))
		from
		( 
		select lat_n, ROW_NUMBER() over(order by lat_n) as n
		from station e1
		) result
		where n = (
		select (count(lat_n) + 1)/2 as median
		from station
		) 
    )
    else 'unknown'
end as idk
from station