-- INSERT INTO 실습 영상 샘플 데이터
-- 실습용 코드는 가능하면 직접 손으로 입력해서 연습해 보세요. 

-- 데이터베이스 생성
CREATE DATABASE my_database;

-- 데이터베이스 삭제
DROP DATABASE my_database;
DROP TABLE accommodation;

CREATE TABLE accommodation (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address TEXT NOT NULL,
    city VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    rating DECIMAL(3, 2),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 레코드가 하나도 없기 때문에 나오지 않는다.
SELECT * FROM accommodation;

INSERT INTO accommodation (name, address, city, country, rating, description)
VALUES
    ('Nomad House', '123 Beach Rd', 'Canggu', 'Indonesia', 4.5, '멋진 바다'),
    ('Remote Work Haven', '456 Mountain St', 'Chiang Mai', 'Thailand', 4.7, '아름다운 산'),
    ('Digital Nomad Loft', '789 City Center', 'Medellin', 'Colombia', 4.8, '도시 중심');
    
-- 컬럼 이름과 레코드가 나올 것이다.
SELECT * FROM accommodation;

-- 당연히 추가로 더 삽입할 수 있다.
INSERT INTO accommodation (name, address, city, country, rating, description)
VALUES
    ('Freelancer Hub', '321 Riverbank Ave', 'Lisbon', 'Portugal', 4.6, 'A trendy hub for freelancers with co-working spaces and a great community.'),
    ('Work & Play Retreat', '654 Historic District', 'Tbilisi', 'Georgia', 4.7, 'Combines workspaces and cultural experiences in a historic city.'),
    ('Nomad Nest', '987 Coastal Rd', 'Playa del Carmen', 'Mexico', 4.5, 'A beachside accommodation perfect for work and leisure.'),
    ('Remote R&R', '213 Lakeview Blvd', 'Bansko', 'Bulgaria', 4.6, 'Ideal for remote work with beautiful mountain views and fast internet.'),
    ('Digital Den', '567 Urban St', 'Budapest', 'Hungary', 4.7, 'Located in a bustling city with great nightlife and work facilities.'),
    ('Freelance Lodge', '345 Sunset Blvd', 'Barcelona', 'Spain', 4.8, 'Offers a dynamic environment for freelancers with excellent amenities.'),
    ('Nomad Base', '678 Green Park', 'Ho Chi Minh City', 'Vietnam', 4.5, 'A modern base for digital nomads with all necessary facilities.');

-- 엑셀이나 구글 시트와 다른 점은, 테이블에서 엄격하게 정한 데이터 타입을 넣지 않으면 오류가 난다는 점이다.
INSERT INTO accommodation (name, address, city, country, rating, description)
VALUES
    ('Nomad Dosi', '123 Teheran-ro', 'Seoul', 'Korea', 'Not a number', '서울에도 멋진 호텔이 있다');

INSERT INTO accommodation (name, address, city, country, rating, description)
VALUES
    ('Nomad City', '123 Teheran-ro', 'Seoul', '데이터를 삽입해 봅시다. INSERT INTO 명령을 하면 데이터를 삽입할 수 있습니다. INSERT INTO는 문법을 주의하셔야 하는데, INSERT INTO 뒤에는 컬럼 명을 작성하고, VALUES 뒤에는 실제 삽입할 데이터를 넣으면 됩니다. 이제는 우리가 로우를 배웠으니 데이터라고 부르지 않고 로우라고 부르겠습니다.', 4.4, 'description');
