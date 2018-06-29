select cast(min(lat_n) as numeric(12,4))
from station
where lat_n in 
(
    select lat_n
    from station
    where lat_n > 38.7780
)