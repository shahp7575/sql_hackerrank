select cast(sqrt((b-a)*(b-a) + (d-c)*(d-c)) as numeric(12,4)) as ans
from 
(
select min(lat_n) as a, max(lat_n) as b, min(long_w) as c, max(long_w) as d
from station
) result