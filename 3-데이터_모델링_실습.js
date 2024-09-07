CREATE Table film_post (
  post_id SERIAL PRIMARY KEY,
  film_id int,
  content Text,
  created_at timestamp,
  updated_at timestamp
);

-- 영화 포스트와 영화 간의 관계를 설정
-- 영화 포스트 film_id FK -> film film_id (film - film_post = 1: n)
ALTER TABLE "film_post" ADD FOREIGN KEY ("film_id") REFERENCES "film" ("film_id");

CREATE Table film_comment (
  comment_id SERIAL PRIMARY KEY, // PK
  post_id int, // FK
  customer_id int, // FK
  context text,
  created_at timestamp,
  updated_at timestamp
);

// film_comment 테이블의 post_id 열에 외래 키 제약 조건을 추가한다. 이 외래 키는 film_post 테이블의 post_id 열을 참조한다.
ALTER TABLE "film_comment" ADD FOREIGN KEY ("post_id") REFERENCES "film_post" ("post_id");

// film_comment 테이블의 customer_id 열에 외래 키 제약 조건을 추가한다. 이 외래 키는 customer 테이블의 customer_id 열을 참조한다.
ALTER TABLE "film_comment" ADD FOREIGN KEY ("customer_id") REFERENCES "customer" ("customer_id");

CREATE TYPE reaction_type AS ENUM (
  'LIKE',
  'HEART',
  'SMILE',
  'ANGRY'
);

CREATE TABLE post_reaction  (
  reaction_id SERIAL PRIMARY KEY, // PK
  reaction_type reaction_type,
  post_id int, // FK
  customer_id int, // FK
  create_at timestamp
);

// post_reaction 테이블의 post_id 열에 외래 키 제약 조건을 추가한다. 이 외래 키는 film_post 테이블의 post_id 열을 참조한다.
ALTER TABLE "post_reaction" ADD FOREIGN KEY ("post_id") REFERENCES "film_post" ("post_id");

// post_reaction 테이블의 customer_id 열에 외래 키 제약 조건을 추가한다. 이 외래 키는 customer 테이블의 customer_id 열을 참조한다.
ALTER TABLE "post_reaction" ADD FOREIGN KEY ("customer_id") REFERENCES "customer" ("customer_id");

// post_reaction 테이블에 유니크 제약 조건을 추가하는 명령
// post_id와 customer_id의 조합이 유니크해야 한다는 제약을 설정
// ADD CONSTRAINT "unique_post_customer": unique_post_customer라는 이름의 제약 조건을 추가
// post_id와 customer_id 열의 조합이 유니크해야 한다는 제약을 설정
ALTER TABLE "post_reaction" ADD CONSTRAINT "unique_post_customer" UNIQUE ("post_id", "customer_id"); -- [1, 1] [1, 2] [1, 1] (X)

CREATE TABLE mention (
  mention_id SERIAL PRIMARY KEY,
  created_at TIMESTAMP,
  comment_id INT,
  mentioned_customer_id INT
);

// mention 테이블의 comment_id 열에 외래 키 제약 조건을 추가한다. 이 외래 키는 film_comment 테이블의 comment_id 열을 참조한다.
ALTER TABLE "mention" ADD FOREIGN KEY ("comment_id") REFERENCES "film_comment" ("comment_id");

// mention 테이블의 mentioned_customer_id 열에 외래 키 제약 조건을 추가한다. 이 외래 키는 customer 테이블의 customer_id 열을 참조한다.
ALTER TABLE "mention" ADD FOREIGN KEY ("mentioned_customer_id") REFERENCES "customer" ("customer_id");

CREATE TABLE notification (
  notification_id SERIAL PRIMARY KEY,
  mentioner_id INT,
  mention_id INT UNIQUE,
  content TEXT,
  create_at TIMESTAMP,
  is_read BOOLEAN,
  read_at TIMESTAMP
);

ALTER TABLE "notification" ADD FOREIGN KEY ("mention_id") REFERENCES "customer" ("customer_id");
ALTER TABLE "notification" ADD FOREIGN KEY ("mention_id") REFERENCES "mention" ("mention_id");




// SERIAL PRIMARY KEY - 1, 2, 3 ... 순차적으로 늘어나는 아이디를 만듦으로써 각 아이디의 고유성을 지킬 수 있다.

/** composite unique constraint(복합 고유 제약조건)
 * Primary Key도 일종의 제약 조건
 * 
 * 대표적인 제약조건
 * Primary Key(기본키)
 * Foreign Key(외래키)
 * Unique(고유)
 * NOT NULL
 * CHECK
 * DEFAULT
 * Auto_Increment(자동증가)
 */