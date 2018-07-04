select hacker_id, name, sum(tot) as ans
from (
select h.hacker_id, h.name, s.challenge_id, max(s.score) as tot
from submissions s
join hackers h
on s.hacker_id = h.hacker_id
group by h.hacker_id, s.challenge_id, h.name
    ) result
    group by hacker_id, name
    having sum(tot) <> 0
    order by ans desc, hacker_id