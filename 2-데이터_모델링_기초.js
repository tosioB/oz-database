-- chapter4. 1강 테이블 잘 만들기(1NF)
/** 정규화
 * 데이터베이스의 데이터를 체계적으로 정리하는 과정
 */

/** 정규 형식
 * 정규적인, 즉, "규정에 맞고 정상"인 형식
 */ 

/** 1NF 
 * 제 1정규형
 * 비정규화 테이블 -> 정규화 테이블
 * 테이블 한 칸에는 하나의 값만
 * 중복 로우, 컬럼X
 * Primary Key 필수
 * 한 컬럼에는 같은 데이터 타입 사용
 */

/** 장점
 * 데이터 중복 제거
 * 데이터 무결성 준수
 * 이상 현상 방지
 */

/** Primary Key
 * 테이블과 컬럼을 대표할 수 있는 값
 * Primary Key특징 - Primary Key는 고유성, 최소성을 가져야 한다.
 */




-- chapter4. 2강 테이블 나누기(FK)
/** 테이블 나누기
 * 테이블에 엔터티가 너무 많으면 다른 테이블로 분리할 수 있다.
 * 데이터 중복을 제거하고, 무결성을 준수하며, 이상 현상을 없앤다.
 */

/** PK, FK
 * 한 테이블에서 다른 테이블의 PK를 참조하게 할 수 있다.
 * 이 컬럼을 FK라고 한다.
 */

/** ERD
 * ERD로 테이블 간의 관계를 표시할 수 있다.
 */

/** Foreign Key
 * 다른 테이블의 PK를 참조하는 키
 */




-- chapter4. 3강 테이블 관계
/** 1:1 관계
 * 하나의 로우에 대응하는 로우가 하나
 * ex)유저 - 프로필
 */

/** 1:다 관계
 * 하나의 로우에 대응하는 로우가 여러 개
 * ex)책 - 대여, 유저 - 게시물
 */

/** 다:다 관계
 * 테이블 A 로우 하나에 대응하는 테이블 B 로우가 여러개
 * 테이블 B 로우 하나에 대응하는 테이블 A 로우가 여러개
 * ex)학생 - 수강과목
 */

/** 다:다 -> 1:다
 * 중간에 연결 테이블을 두어 데이터 중복을 해결하고,
 * 요구사항을 더 잘 표현할 수 있다.
 */




-- chapter5. 1강 테이블 붙이기(JOIN)
/** JOIN
 * 테이블을 연결하여 데이터를 조회하는 기법
 */

/** INNER JOIN
 * 두 테이블 공통의 로우를 JOIN
 * INNER JOIN은 INNER를 생략하고 JOIN만 적어도 된다.
 * 주로 'ON 테이블A.PK = 테이블B.FK'와 같이 PK와 FK를 기준으로 JOIN한다.
 * 
 * LEFT JOIN - 왼쪽 테이블을 기준으로 로우를 JOIN
 * RIGHT JOIN - 오른쪽 테이블을 기준으로 로우를 JOIN
 * FULL JOIN - 두 테이블의 모든 로우를 JOIN
 * CROSS JOIN - 두 테이블의 가능한 모든 조합
 * SELF JOIN - 테이블 자신을 JOIN
 */

/**
SELECT * FROM book b                         -- 테이블 조회
JOIN loan l ON b.call_number = l.call_number -- 합치고자 하는 테이블 이름을 적고 어떤 기준으로 합칠지 조건 작성
ORDER BY b.call_number;
 * 
 * - 코드설명
 * SELECT * - 데이터베이스에서 모든 열을 선택
 * FROM book b - book 테이블에서 가져온다. / b는 book테이블의 별칭
 * JOIN loan l - loan테이블을 조인한다. / l은 loan 테이블의 별칭
 * ON b.call_number = l.call_number - 조인 조건을 정의 / book테이블의 call_number 열과 loan테이블의 call_number열이 같은 값을 가진 행들끼리 결합
 * ORDER BY - 쿼리 결과를 정렬하는 명령어
 * b.call_number - 정렬 기준이 되는 열 / 여기서는 book테이블의 call_number열을 기준으로 정렬한다.
 * 
 * - 결론
 * book 테이블과 loan 테이블을 call_number 열을 기준으로 조인하여 두 테이블의 관련 데이터를 결한한 후
 * 그 결과를 book 테이블의 call_number 열을 기준으로 오름차순으로 정렬하여 반환하는 것이다.
 * 
 */

/** LEFT JOIN
SELECT * FROM book b                                    - FROM book b < 왼쪽이 기준
LEFT OUTER JOIN loan l ON b.call_number = l.call_number - JOIN loan l < 오른쪽
ORDER BY b.call_number;
 * 
 * - 코드설명
 * LEFT OUTER JOIN loan l - loan테이블을 book테이블과 왼쪽 외부 조인 한다.
 * ON b.call_number = l.call_number - 조인 조건을 정의 / book테이블의 call_number 열과 loan테이블의 call_number 열이 같은 값을 가진 행들끼리 결합
 * 
 * - 결론
 * book 테이블과 loan 테이블을 call_number 열을 기준으로 왼쪽 외부 조인하여 결합한다
 * 모든 book 테이블의 행을 포함하며, loan 테이블에서 일치하는 call_number가 있을 경우에만 해당 데이터를 결합한다.
 * 결합된 결과를 book 테이블의 call_number 열을 기준으로 오름차순으로 정렬하여 반환한다.
 */

/** RIGHT JOIN
SELECT * FROM loan l                                    - FROM loan l < 왼쪽
RIGHT OUTER JOIN book b ON b.call_number = l.call_number - JOIN book b < 오른쪽이 기준
ORDER BY b.call_number;
 */

/** FULL JOIN
SELECT * FROM student
FULL JOIN course ON student.course_id = course.course_id;

 * - 코드설명
 * FROM student - student 테이블에서 데이터를 가져온다.
 * FULL JOIN course - course 테이블과 student 테이블을 전체 외부 조인 / course 테이블은 오른쪽 테이블
 * ON student.course_id = course.course_id - student 테이블의 course_id와 course 테이블의 course_id 열을 기준으로 두 테이블을 결합
 * 
 * - 결론
 * FULL OUTER JOIN은 두 테이블의 모든 행을 포함하며, 일치하는 데이터가 있으면 해당 데이터를 결합한다.
 * 두 테이블 중 어느 한쪽에 일치하는 데이터가 없는 경우, 다른 쪽의 열은 NULL로 표시된다.
 */

/** CROSS JOIN
SELECT * FROM course CROSS JOIN student;
 * 
 * - 코드설명
 * CROSS JOIN student - student 테이블과 course 테이블을 교차 조인
 * CROSS JOIN은 두 테이블의 모든 행을 조합하여 결과를 생성
 * 
 * - 결론
 * CROSS JOIN의 결과는 course 테이블의 각 행이 student 테이블의 모든 행과 결합된 것이다.
 * 여기서 결과 집합은 course 테이블의 모든 과목과 student 테이블의 모든 학생의 조합을 보여준다.
 */




-- chapter5. 2강 GROUP BY / HAVING
/** GROUP BY
 * 특정 컬럼을 기준으로 데이터를 그룹화
 */

/** 
SELECT department_id
FROM employee
GROUP BY department_id;
 * 
 * -코드설명
 * SELECT department_id - department_id 열을 선택
 * FROM employee - 데이터가 employee 테이블에서 추출
 * GROUP BY department_id - department_id를 기준으로 데이터를 그룹화
 * 
 * -결론
 * employee 테이블에서 각 부서의 department_id를 추출하고,
 * 이들 department_id 값을 중복 없이 나열하는 결과를 반환
 */

/**
SELECT department_id, AVG(salary)
FROM employee
GROUP BY department_id;
 * 
 * - 코드설명
 * AVG(salary) - salary 열의 평균 값을 계산하는 집계 함수
 * 
 * - 결론
 * 각 부서별로 직원들의 평균 급여를 보여준다.
 */

/**
SELECT department_id, AVG(salary)
FROM employee
GROUP BY department_id
HAVING AVG(salary) > 70000;
 * 
 * - 코드설명
 * HAVING AVG(salary) > 70000 - 평균 급여가 70,000을 초과하는 부서만 결과로 포함
 */