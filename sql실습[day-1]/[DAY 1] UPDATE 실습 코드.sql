-- UPDATE 실습 영상 샘플 데이터
-- 실습용 코드는 가능하면 직접 손으로 입력해서 연습해 보세요. 

-- 현재 데이터 확인
SELECT * FROM accommodation;

-- UPDATE 쿼리 실행 전 WHERE 조건 확인
SELECT * FROM accommodation
WHERE id = 1;

-- UPDATE 쿼리 실행
UPDATE accommodation
SET name = 'wow'
WHERE id = 1
RETURNING *;

-- 원래대로 변경
UPDATE accommodation
SET name = 'Nomad House'
WHERE id = 1
RETURNING *;

-- UPDATE 쿼리 실행 전 WHERE 조건 확인
SELECT * FROM accommodation
WHERE country = 'Thailand' AND rating < 5.0;

-- WHERE 조건에 해당하는 여러 로우의 값을 변경
-- 기존 rating 값을 활용할 수 있음
UPDATE accommodation
SET rating = rating + 0.1, price_per_night = price_per_night + 1
WHERE country = 'Thailand' AND rating < 5.0
RETURNING *;

-- 원래대로 변경
UPDATE accommodation
SET rating = rating - 0.1, price_per_night = price_per_night - 1
WHERE country = 'Thailand' AND rating < 5.0
RETURNING *;

-- WHERE를 뺴먹으면 로우 전체에 영향을 미칠 수 있다.
UPDATE accommodation
SET price_per_night = price_per_night - 1
RETURNING *;

-- 이전으로 변경
UPDATE accommodation
SET price_per_night = price_per_night + 1
RETURNING *;