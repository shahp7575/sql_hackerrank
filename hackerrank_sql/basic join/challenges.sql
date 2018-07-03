select c.hacker_id as id, h.name as name, COUNT(c.challenge_id) as cnt
from hackers h
join challenges c
on h.hacker_id = c.hacker_id
group by c.hacker_id, h.name
having count(c.challenge_id) = (select MAX(cnt)
from (
select hacker_id, count(challenge_id) as cnt
from challenges
group by hacker_id 
) result
)
or count(c.challenge_id) in (
select cnt
from (
select hacker_id, count(challenge_id) as cnt
from challenges
group by hacker_id
) result
group by cnt
having COUNT(cnt) = 1
)
order by cnt desc, c.hacker_id
