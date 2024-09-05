-- SELECT 실습 영상 샘플 데이터

CREATE TABLE accommodation (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address TEXT NOT NULL,
    city VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    zip_code VARCHAR(20),
    phone_number VARCHAR(20),
    email VARCHAR(100),
    website VARCHAR(255),
    price_per_night DECIMAL(10, 2),
    rating DECIMAL(3, 2),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO accommodation (
    name, address, city, country, zip_code, phone_number, email, website, price_per_night, rating, description
) VALUES
(
    'Nomad House',
    '123 Freedom St, Suite 5',
    'Bali',
    'Indonesia',
    '80361',
    '+62 361 1234567',
    'contact@nomadhouse.com',
    'https://www.nomadhouse.com',
    45.00,
    4.75,
    '발리 중심부에 위치한 활기찬 공동 거주 공간으로, 고속 인터넷, 코워킹 공간, 같은 생각을 가진 디지털 노마드 커뮤니티를 제공합니다.'
),
(
    'Remote Work Paradise',
    '456 Innovation Ave',
    'Chiang Mai',
    'Thailand',
    '50200',
    '+66 53 123456',
    'info@remoteworkparadise.com',
    'https://www.remoteworkparadise.com',
    35.00,
    4.85,
    '치앙마이에 위치한 이 숙소는 현대적인 편의 시설, 아늑한 작업 환경, 다른 원격 근무자들과의 네트워킹 기회를 제공합니다.'
),
(
    'Digital Nomad Haven',
    '789 Tech Lane',
    'Medellin',
    'Colombia',
    '050021',
    '+57 4 1234567',
    'support@digitalnomadhaven.com',
    'https://www.digitalnomadhaven.com',
    50.00,
    4.90,
    '메데인 번화가에 위치한 이 숙소는 뛰어난 인터넷, 개인 작업 공간, 활기찬 디지털 노마드 커뮤니티를 제공합니다.'
),
(
    'Nomad Nest',
    '101 Explorer Rd',
    'Lisbon',
    'Portugal',
    '1100-001',
    '+351 21 1234567',
    'hello@nomadnest.com',
    'https://www.nomadnest.com',
    60.00,
    4.80,
    '리스본에 위치한 이 숙소는 넓은 작업 공간, 빠른 인터넷, 편안한 숙박 시설을 제공합니다.'
),
(
    'Techie Retreat',
    '202 Startup St',
    'Berlin',
    'Germany',
    '10115',
    '+49 30 123456',
    'contact@techieretreat.com',
    'https://www.techieretreat.com',
    55.00,
    4.70,
    '베를린에 위치한 이 숙소는 최신 기술을 갖춘 작업 공간과 활발한 디지털 노마드 커뮤니티를 제공합니다.'
),
(
    'Work Wander',
    '303 Travel Blvd',
    'Bangkok',
    'Thailand',
    '10110',
    '+66 2 123456',
    'info@workwander.com',
    'https://www.workwander.com',
    40.00,
    4.65,
    '방콕에 위치한 이 숙소는 편안한 작업 환경, 고속 인터넷, 다양한 문화 체험 기회를 제공합니다.'
),
(
    'Nomad Hub',
    '404 Freelancer Ln',
    'Ho Chi Minh City',
    'Vietnam',
    '700000',
    '+84 28 1234567',
    'support@nomadhub.com',
    'https://www.nomadhub.com',
    30.00,
    4.60,
    '호치민시에 위치한 이 숙소는 경제적인 가격, 넓은 작업 공간, 활기찬 커뮤니티를 제공합니다.'
),
(
    'Remote Base',
    '505 Digital Dr',
    'Tbilisi',
    'Georgia',
    '0105',
    '+995 32 123456',
    'hello@remotebase.com',
    'https://www.remotebase.com',
    25.00,
    4.55,
    '트빌리시에 위치한 이 숙소는 저렴한 가격, 편리한 위치, 쾌적한 작업 환경을 제공합니다.'
),
(
    'Wander Work',
    '606 Explorer Ave',
    'Budapest',
    'Hungary',
    '1051',
    '+36 1 1234567',
    'contact@wanderwork.com',
    'https://www.wanderwork.com',
    45.00,
    4.50,
    '부다페스트에 위치한 이 숙소는 멋진 도시 경관, 넓은 작업 공간, 편안한 숙박 시설을 제공합니다.'
),
(
    'Nomad Life',
    '707 Journey St',
    'Mexico City',
    'Mexico',
    '01000',
    '+52 55 1234567',
    'info@nomadlife.com',
    'https://www.nomadlife.com',
    35.00,
    4.65,
    '멕시코 시티에 위치한 이 숙소는 문화적인 체험, 빠른 인터넷, 편안한 작업 환경을 제공합니다.'
);
