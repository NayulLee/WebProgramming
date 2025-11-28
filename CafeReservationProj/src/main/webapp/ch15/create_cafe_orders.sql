use JSPBookDB; 

DROP TABLE IF EXISTS cafe_orders;

-- 2. cafe_orders 테이블 생성
CREATE TABLE cafe_orders (
    -- 기본 키 (주문 식별 번호)
    order_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    
    -- 고객 정보
    customer_name VARCHAR(50) NOT NULL,
    customer_phone VARCHAR(15), -- 연락처는 필수 아닐 수 있음
    
    -- 주문 항목
    menu_name VARCHAR(100) NOT NULL,
    size_code CHAR(1) NOT NULL, -- S/M/L/G/X
    temperature CHAR(1) NOT NULL, -- H(Hot)/I(Ice)
    quantity INT NOT NULL DEFAULT 1,
    
    -- 가격 정보
    unit_price INT NOT NULL, -- 단가
    total_price INT NOT NULL, -- 총액
    
    -- 기타 정보
    request_message VARCHAR(255),
    order_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP 
    -- 주문이 들어온 시각을 자동으로 기록
);

