select sum(c.population) as ans
from city c
join country co
on co.code = c.countrycode
where co.continent = 'Asia'
