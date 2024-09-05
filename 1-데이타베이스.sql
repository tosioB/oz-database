-- 데이터베이스(DBNS) - 데이터 모음을 보다 편리하고 효율적으로 관리하는 소프트웨어

/** 데이터베이스의 필요성
 * 데이터의 중복, 종속 > 엄밀한 데이터
 * 동시 접근 이상 > 동시성 제어
 * 제한된 View > 용도에 맞는 View
 * 데이터 결손 > 데이터 무결성
 * 복잡피곤한 업무 > 쉽고 편한안 업무
 */

/** 데이터베이스의 종류 - 관계형 데이터베이스(RDBMS)
 * 구조화된 테이블 형식
 * 강력한 데이터 무결성
 * 복잡한 쿼리에 유리
 * 종류 - MySQL, SQLite, ORACLE, SQL Server,  PostgreSQL
 */

/** 데이터베이스의 종류 - 비관계형 데이터베이스(NoSQL DBMS)
 * 유연한 데이터 모델
 * 수평적 확장
 * 대규모 데이터 처리에 유리
 * 종류 - mongoDB, cassandra, Redis, neo4j
 */

/** 데이터 모델링이란?
 * 현실 세계의 요구사항을 데이터의 관계로 표현하는 과정
 */

/** 데이터 모델링 과정
 * 1. 요구사항 분석
 * 2. 개념적 데이터 모델링
 * 3. 논리적 데이터 모델링
 * 4. 물리적 데이터 모델링
 */

/** 엔터티와 속성
 * 어떤 "것"으로 다뤄야 하는 모든 "것"이 엔터티가 될 수 있다.
 */

/** 엔터티는 크게 세가지로 나눌 수 있다.
 * 1. 유형 엔터티 - 회원, 책과 같이 형태를 명확하게 확인할 수 있는 유형 엔터티
 * 2. 무형 엔터티 - 회원등급이나 대출상태처럼 형태를 확인할 수 없는 무형 엔터티
 * 3. 사건 엔터티 - 현실세계에서 일어나는 사건중 대출과 같이 만들고자 하는 애플리케이션과 연관이 있는 사건 엔터티
 * 
 * 인스턴스 - 엔터티의 구체적인 사례
 * 속성 - 엔터티의 특징, 성질
 */

/** 개념적 모델링
 * 엔터티
 * 속성
 * 인스턴스
 */

/** 관계형 데이터베이스
 * 테이블
 * 컬럼
 * 로우
 */

/** 관계형 데이터베이스
 * 관계형 모델을 기반으로 한 데이터베이스
 * 데이터베이스의 핵심요소로 테이블이 있다.
 */

/** 1티어 아키텍처
 * - 초심자가 SQL과 DBMS를 학습하기에 적합하다.
 * 구조가 간단하여 처음 시작하기 좋다.
 * 컴퓨터가 망가지면 장애 대응이 불가하다.
 */

/** supabase
 * Full PostgreSQL DB제공
 * 유저 인증, 서버리스 함수, API 자동 생성
 * SQL Explorer
 */

/** PostgreSQL
 * 오픈소스, 무료
 * SQL 표준 94% 준수
 * 사용량 증가 추세
 * MVCC 동시성 제어 기술
 */

/** SQL
 * - 관계형 데이터베이스의 데이터를 다루는 언어
 * DDL - 데이터 구조를 정의하기 위한 언어 (CREATE, DROP, ALTER ...)
 * DML - 데이터 조회, 조작을 위한 언어 (SELECT, INSERT, UPDATE, DELETE ...)
 * DCL - 데이터베이스 접근 권한, 회수를 위한 언어 (GRANT, REVOKE ...)
 * TCL - 트렌젝션별 제어를 위한 언어 (COMMIT, END ...)
 * DCL, TCL은 주로 중,고급 개발자가 다룬다.
 */

/** SELECT * FROM pg_database;
 * 생성된 모든 데이터베이스를 볼 수 있다.
 */

/** CREATE DATABASE my_database;
 * CREATE DATABASE라는 명령어를 통해서
 * 이름이 my_database인 데이터베이스를 [생성]
 */

/** DROP DATABASE my_database;
 * DROP DATABASE라는 명령어를 통해서
 * my_database인 데이터베이스를 [삭제]
 */

/** CREATE TABLE accommodation (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  address TEXT NOT NULL,
  city VARCHAR(100) NOT NULL,
  country VARCHAR(100) NOT NULL,
  rating DECIMAL(3, 2),
  description TEXT,
  create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

 * CREATE TABLE - SQL에서 새로운 테이블을 생성하는 명령어
 * accommodation - 테이블이름
 * 
 * id SERIAL PRIMARY KEY, // 고유 식별자, 자동 증가하는 정수형 기본 키
 * name VARCHAR(255) NOT NULL, // 숙소의 이름, 255자 이내의 문자열, 필수 입력
 * address TEXT NOT NULL, // 숙소의 주소, 긴 문자열, 필수 입력
 * city VARCHAR(100) NOT NULL, // 도시 이름, 100자 이내의 문자열, 필수 입력
 * country VARCHAR(100) NOT NULL, // 국가 이름, 100자 이내의 문자열, 필수 입력
 * rating DECIMAL(3, 2), // 숙소의 평점, 최대 3자리 숫자 중 소수점 2자리 (예: 9.99)
 * description TEXT, // 숙소의 상세 설명, 긴 문자열
 * create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP // 레코드 생성 시각, 기본값은 현재 시각
 */

/** DROP TABLE accommodation
 * CREATE TABLE - SQL에서 새로운 테이블을 삭제하는 명령어
 * accommodation - 테이블이름
 */

/** INSERT INTO - SQL에서 테이블에 새로운 레코드를 추가하는 데 사용되는 명령어
INSERT INTO accommodation (name, address, city, country, rating, description)
VALUES
  ('Nomad House', '123 Beach Rd', 'Canggu', 'Indonesia', 4.5, '멋진 바다');

// ---------------------------------------------------------------------------- //

INSERT INTO accommodation (name, address, city, country, rating, description)
VALUES
  ('Romote Work Haven', '456 Mountain St', 'Chiang Mai', 'Thailand', 4.7, '아름다운 산'),
  ('Digital Nomad Loft', '789 City Center', 'Medellin', 'Colombia', 4.8, '도시 중심');

 * 로우와 로우 사이는 쉼표로 구분한다
 * INSERT INTO할 때 주의할점 - 테이블에서 엄격하게 정한 테이블 타입을 넣지 않으면 오류가 난다(문자열 길이를 지키지 않는 경우, 데이터의 타입이 맞지 않는 경우)
 */

/** SELECT
 * SELECT는 INSERT 순서대로 조회 보장 X
 * 테이블 로우 조회 - WHERE
 * 테이블 로우 조회(정렬) - ORDER BY

 * SELECT * FROM accommodation; // accommodation테이블의 모든 [컬럼, 로우] 조회
 * SELECT name, address FROM accommodation; // accommodation테이블의 name, address같이 특정 [컬럼] 조회

 * SELECT * FROM accommodation WHERE rating >= 4.5; // 평점 4.5점 이상
 * SELECT * FROM accommodation WHERE rating BETWEEN 4.5 AND 4.6; // 평점 4.5점 이상 4.6 이하
 * SELECT * FROM accommodation WHERE id IN (1, 3); // ID가 1, 3
 * SELECT * FROM accommodation WHERE id NOT IN (1, 3); // ID가 1, 3이 아님
 * SELECT * FROM accommodation WHERE city = 'Chiang Mai'; // city가 Chiang Mai인 것을 조회
 * SELECT * FROM accommodation WHERE city = 'Chiang Mai' OR city = 'Canggu'; // city가 Chiang Mai 또는 Canggu인 것을 조회

 * SELECT * FROM accommodation ORDER BY rating DESC LIMIT 2; // 일부 [로우] 조회
 * SELECT * FROM accommodation ORDER BY rating ASC; // 평점 오름차순 정렬(낮은거>높은거)
 * SELECT * FROM accommodation ORDER BY rating DESC; // 평점 내림차순 정렬(높은거>낮은거)
 * SELECT * FROM accommodation ORDER BY rating DESC LIMIT 2; // 평점 상위 2개 조회

 * SELECT AVG(rating) as avg_rating FROM accommodation; // 전체 평점 평균
 * SELECT DISTINCT city FROM accommodation; // 중복되지 않는 고유한 city 값을 선택

 * = 같다
 * !=, <> 같지 않다
 * > 초과
 * < 미만
 * >- 이상
 * <= 이하
 * BETWEEN ~부터 ~까지
 * IN 포함

 * COUNT(*) - 선택한 그룹의 갯수
 * SUM() - 선택한 숫자 그룹의 합
 * AVG() - 선택한 숫자 그룹의 평균
 * MIN() - 선택한 숫자 그룹의 최소값
 * MAX() - 선택한 숫자 그룹의 최대값

 * 전체 컬럼 조회는 꼭 필요한 경우에만 하는 것을 권장
 * 조회할때 컬럼 갯수를 제한하거나 조건을 거는 게 좋다.
 * 필요하지 않은 데이터를 조회하면 할수록 DBMS가 리소스를 더 많이 사용하기 때문이다.
 * 즉 데이터베이스 시스템이 불필요하게 할 일을 늘리게 된다.
 */

/** UPDATE
 * UPDATE accommodation SET rating = 4.9 WHERE id = 1; // rating을 4.9로 변경
 * 
 * // 로우 하나의 여러 값을 변경
 * // 이름이 Remote Work Heven인 로우를 골라서 address와 city값을 수정
 * UPDATE accommodation SET address = 'New Address 123', city = 'New City' WHERE name ='Remote Work Heven';
 * 
 * // 로우 하나의 여러 값을 변경
 * city가 Medellin이면서 rating이 5.0보다 작은 로우의 rating을 +0.1점 하고 description을 서비스 개선이라고 수정
 * UPDATE accommodation SET rating = rating + 0.1, description - '서비스 개선' WHERE city = 'Medellin' AND rating < 5.0;
 * 
 * 업데이트 했을때 치명적인 실수를 할 수 있기때문에 같은 조건의 값으로 조회 후 확인작업을 진행한 뒤 업데이트 하는 과정을 습관화
 * UPDATE accommodation SET rating = rating + 0.1 WHERE city = 'Chiang Mai' RETURNING *; // RETURNING * - RETURNING *구분으로 영향받는 로우를 바로 조회
 */

/** DELETE
 * DELETE FROM accommodation WHERE id = 1; // id가 1인 로우 삭제
 * DELETE FROM accommodation WHERE rating < 4.8; // 평점이 4.8보다 낮은 로우 삭제
 */

-- supabase에서 테이블 보기
-- supabase - 메뉴 - Table Editor에서 accommodation 테이블 확인 가능