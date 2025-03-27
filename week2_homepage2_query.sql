#현재 지역에서 진행 가능한 미션 
SELECT
    um.craeted_time,
    m.point,
    m.payment,
    s.name,
    fk.name,
    datediff(um.created_time, new()),
    DATE_FORMAT(um.created_time, '%Y%m%d%H%i%s') AS cursor #미션의 생성 시간(유저 기준)을 기준으로 정렬하여 사용
from
	 mission as m on m.id = um.mission_id
join
	 user_mission as um
join
	store as s on s.id = m.store_id
join
	region as r on r.id = s.region_id
join
	food_category as fk on fk.id = s.food_category_id
where
	DATE_FORMAT(um.created_time, '%Y%m%d%H%i%s') < '이전 커서값' #최근의 미션을 cursor로 새로 페이징
and
	um.is_completed = 0 #진행중인 미션
and
	r.name = '장충동' #현재 선택 지역
order by
	cursor asc, m.point desc #남은 기한이 적은 순, 포인트가 큰 순으로 정렬 
LIMIT 10; #한번에 보여질 개수