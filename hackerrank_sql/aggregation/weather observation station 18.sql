select cast(abs(((a-c) + (b-d))) as numeric(12,4)) as ans
from (
select min(lat_n) as a, min(long_w) as b, max(lat_n) as c, max(long_w) as d
from station
) result