-- INSERT INTO 개념학습 영상 샘플 데이터

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

INSERT INTO accommodation (name, address, city, country, rating, description)
VALUES
    ('Nomad House', '123 Beach Rd', 'Canggu', 'Indonesia', 4.5, '멋진 바다'),
    ('Remote Work Haven', '456 Mountain St', 'Chiang Mai', 'Thailand', 4.7, '아름다운 산'),
    ('Digital Nomad Loft', '789 City Center', 'Medellin', 'Colombia', 4.8, '도시 중심');
