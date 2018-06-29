select 
case 
    when g.grade < 8 then 'NULL'
    else s.name 
end as name, 
g.grade, s.marks 
from students s
left outer join grades g
on s.marks between g.min_mark and g.max_mark
order by g.grade desc, name