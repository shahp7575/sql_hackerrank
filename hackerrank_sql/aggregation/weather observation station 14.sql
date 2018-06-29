select cast(max(lat_n) as numeric(12, 4))
from station
where lat_n<137.2345