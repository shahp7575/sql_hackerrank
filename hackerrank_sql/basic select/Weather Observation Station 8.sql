select distinct city
from station
where left(city, 1) like '[aeiou]%' and right(city, 1) like '%[aeiou]'