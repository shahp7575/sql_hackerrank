select c.company_code, c.founder, count(distinct l.lead_manager_code), count(distinct s.senior_manager_code), count(distinct m.manager_code), count(distinct e.employee_code)
from company c
join lead_manager l
on c.company_code = l.company_code
join senior_manager s
on s.lead_manager_code = l.lead_manager_code
and s.company_code = c.company_code
join manager m
on m.senior_manager_code = s.senior_manager_code
and m.lead_manager_code = l.lead_manager_code
and c.company_code = m.company_code
join employee e
on e.manager_code = m.manager_code
and e.senior_manager_code = s.senior_manager_code
and e.lead_manager_code = l.lead_manager_code
and e.company_code = c.company_code
group by c.company_code, c.founder
order by c.company_code