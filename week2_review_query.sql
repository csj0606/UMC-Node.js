SELECT
	r.*
from
	review as r
join
	store as s on r.store_id = s.id
where
	s.name = '장충동왕족발보쌈' #해당 가게 이름
order by
	r.craeted_time desc;