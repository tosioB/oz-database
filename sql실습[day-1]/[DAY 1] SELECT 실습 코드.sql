-- SELECT 실습 영상 샘플 데이터
-- 실습용 코드는 가능하면 직접 손으로 입력해서 연습해 보세요. 

-- 전체 조회
SELECT * FROM accommodation;

-- 일부 컬럼 조회
SELECT name, description FROM accommodation;

-- WHERE로 일부 조회
SELECT * FROM accommodation WHERE city = 'Bali';

-- WHERE + OR
SELECT * FROM accommodation WHERE city = 'Chiang Mai' OR city = 'Bali';

-- 평점 4.75점 이상
SELECT * FROM accommodation WHERE rating >= 4.75;

-- 평점 4.5점 이상 4.6 이하
SELECT * FROM accommodation WHERE rating BETWEEN 4.5 AND 4.6;

-- ID가 1, 3
SELECT * FROM accommodation WHERE id IN (1, 3);

-- ID가 1, 3이 아님
SELECT * FROM accommodation WHERE id NOT IN (1, 3);

-- 내림차순 (큰 것 부터)
SELECT * FROM accommodation ORDER BY rating DESC;

-- PostgreSQL은 id 순서롤 보장하지 않기 때문에, 순서가 중요한 경우 꼭 sort를 해준다.
SELECT * FROM accommodation;
SELECT * FROM accommodation ORDER BY id ASC;
SELECT * FROM accommodation ORDER BY created_at ASC;

-- 평점 상위 3개
SELECT * FROM accommodation ORDER BY rating DESC LIMIT 3;

-- 전체 로우 갯수
SELECT COUNT(*) FROM accommodation;

-- 전체 평점 평균, 최솟값, 최댓값
SELECT AVG(rating) as avg_rating FROM accommodation;
SELECT MIN(rating) as min_rating FROM accommodation;
SELECT MAX(rating) as max_rating FROM accommodation;

-- 전체 하루 숙박 가격 평균, 최솟값, 최댓값
SELECT AVG(price_per_night) as avg_price FROM accommodation;
SELECT MIN(price_per_night) as min_price FROM accommodation;
SELECT MAX(price_per_night) as max_price FROM accommodation;

-- 테이블이 가지고 있는 모든 국가
SELECT DISTINCT country FROM accommodation;
SELECT COUNT(DISTINCT country) FROM accommodation;