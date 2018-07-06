select a.x, a.y
from (
select f1.x, f1.y
from functions f1
join functions f2
on (f1.x = f2.y and f1.y = f2.x) and (f1.x != f1.y)
where f1.x <  f1.y
union
select f1.x, f1.y
from functions f1
join functions f2
on (f1.x = f2.y and f1.y = f2.x) and (f1.x = f1.y)
group by f1.x, f1.y
having COUNT(1) > 1
) a
order by a.x
