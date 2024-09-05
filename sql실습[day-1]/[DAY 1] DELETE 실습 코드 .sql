-- DELETE 실습 영상 샘플 데이터
-- 실습용 코드는 가능하면 직접 손으로 입력해서 연습해 보세요. 

-- 현재 데이터 확인
SELECT * FROM accommodation;

-- id가 1인 로우 삭제
DELETE FROM accommodation
WHERE id = 1
RETURNING *;

DELETE FROM accommodation
WHERE id = 2 OR id = 3
RETURNING *;