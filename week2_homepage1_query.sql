#완료한 미션의 개수
SELECT
	count(*)
from
	user_mission as um
join
	mission as m on m.id = um.mission_id
join
	store as s on s.id = m.store_id
join
	region as r on r.id = s.region_id
where
	um.is_completed = 1 #완료한 미션인지
and
	r.name = '장충동'; #현재 선택 지역
    