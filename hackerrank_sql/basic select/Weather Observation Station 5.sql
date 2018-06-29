select city, length
from (
select top 1 city, len(city) as length
from station
where len(city) = (select max(len(city)) from station)
    order by city
union
select top 1 city, len(city) as length
from station
where len(city) = (select min(len(city)) from station)
    order by city
) result;
