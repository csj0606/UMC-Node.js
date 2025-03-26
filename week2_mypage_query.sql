SELECT
	ui.* # 유저의 정보 전체
from
	user as u
join
	user_info as ui on u.id = ui.user_id
where
	u.id = 1500 #유저의 고유 아이디