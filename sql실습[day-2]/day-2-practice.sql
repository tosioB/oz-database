-- 강사 코멘트: 페어프로그래밍, 그룹 활동 권장

-- Day 2에서 사용한 Pagila 데이터베이스로 SELECT 쿼리를 추가로 실습합니다.
-- ERD를 참고하여 요구사항에 맞는 테이블을 찾고 문제를 스스로 혹은 동료와 해결하시기 바랍니다.

-- Practice 1:
-- Queen과 Kris Kristofferson의 음악이 예상치 못한 부활을 맞이했습니다.
-- 의도하지 않은 결과로, K와 Q로 시작하는 영화도 인기가 급상승했습니다.
-- 언어가 영어인 K와 Q로 시작하는 영화 제목을 표시하세요.

-- Practice 1: 정답
SELECT
  film.film_id
  ,film.title
  ,film.language_id
  ,language.name
FROM film
  LEFT JOIN language ON film.language_id = language.language_id
WHERE language.name = 'English'
      AND (film.title ILIKE 'k%' OR film.title ILIKE 'q%')
ORDER BY film.title
;

-- Practice 2:
-- 캐나다에서 이메일 마케팅 캠페인을 진행하려고 하는데,
-- 이를 위해 모든 캐나다 고객의 이름과 이메일 주소가 필요합니다.
-- JOIN을 사용하여 이 정보를 검색하세요.

-- Practice 2: 정답
SELECT
  customer.first_name
  ,customer.last_name
  ,customer.email
FROM customer
  INNER JOIN address ON customer.address_id = address.address_id
  INNER JOIN city ON address.city_id = city.city_id
  INNER JOIN country ON city.country_id = country.country_id
WHERE country ILIKE 'Canada'
;


-- Practice 3:
-- 젊은 가족들 사이에서 판매가 부진하고 있어, 가족 영화를 대상으로 한 프로모션을 진행하고자 합니다. 
-- 가족 영화로 분류된 모든 영화를 식별하세요.
SELECT
  film.title     AS film_title
  ,category.name AS film_category
FROM film
  INNER JOIN film_category ON film.film_id = film_category.film_id
  INNER JOIN category ON film_category.category_id = category.category_id
WHERE category.name ILIKE 'family%'
;

-- Practice 4:
-- 가장 많이 렌트된 영화를 내림차순으로 조회하세요.
SELECT
  film.title
  ,film.film_id
  ,COUNT(rental.rental_id) AS rented_count
FROM rental
  INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id
  INNER JOIN film ON inventory.film_id = film.film_id
GROUP BY film.title
  ,film.film_id
ORDER BY rented_count DESC
;

-- Practice 5:
-- 총 수익 기준으로 상위 5개의 장르를 내림차순으로 나열하세요.
SELECT
  category.name
  ,SUM(payment.amount)
FROM rental
  INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id
  INNER JOIN payment ON rental.rental_id = payment.rental_id
  INNER JOIN film ON inventory.film_id = film.film_id
  INNER JOIN film_category ON film.film_id = film_category.film_id
  INNER JOIN category ON film_category.category_id = category.category_id
GROUP BY category.name
ORDER BY SUM(payment.amount) DESC
LIMIT 5
;