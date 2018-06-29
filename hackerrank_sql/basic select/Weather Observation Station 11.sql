select distinct city
from station
where city like '[^aeiou]%' OR city like '%[^aeiou]'