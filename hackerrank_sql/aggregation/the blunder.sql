select cast(ceiling(avg(cast(salary as float)) - avg(cast(replace(cast(salary as varchar(10)), '0', '') as float))) as int) as diff
from employees