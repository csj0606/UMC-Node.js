#목적 : 미션의 포인트, 지불할 금액, 미션이 주어진 가게 이름의 정보를 포인트, 미션의 생성 시간(유저 기준)을 기준으로 정렬하여 사용
SELECT
	m.point, 
    m.payment, 
    s.name, 
    um.created_time,
    concat(LPAD(m.point, 10, '0'), DATE_FORMAT(um.created_time, '%Y%m%d%H%i%s')) AS cursor
from 
	user_mission as um
join 
	mission as m on um.mission_id = m.id
join 
	store as s on m.store_id = s.id
where 
    CONCAT(LPAD(m.point, 10, '0'), '-', DATE_FORMAT(um.created_time, '%Y%m%d%H%i%s')) < '이전 커서값' #최근의 미션을 cursor로 새로 페이징
and
	um.user_id = 3 #사용자의 아이디
and 
	um.is_completed = 1  # 미션의 진행중/진행완료 여부 (0 or 1)
order by
	cursor DESC #cursor값을 사용해 정렬 (1. 포인트, 2. 최근 순 정렬)
limit 10; #한번에 보여잘 개수