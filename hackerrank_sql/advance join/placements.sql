select s.name
from students s
join friends f
on s.id = f.id
join packages p
on s.id = p.id
join packages pa
on pa.id = f.friend_id
where pa.salary > p.salary
order by pa.salary
