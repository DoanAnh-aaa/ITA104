
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255),
    phone VARCHAR(15)
	address VARCHAR(255)
);
INSERT INTO Customer 
(customer_id, customer_name, phone, address) 
VALUES
(1, 'Nguyen Van A', '0901234567', 'Ha Noi'),
(2, 'Tran Thi B', '0901234568', 'Hai Phong'),
(3, 'Le Van C', '0901234569', 'Bac Ninh'),
(4, 'Pham Thi D', '0901234570', 'Vinh Phuc'),
(5, 'Hoang Van E', '0901234571', 'Can Tho'),
(6, 'Do Thi F', '0947123456', 'Ha Noi'),
(7, 'Nguyen Van G', '0901234573', 'Quang Ninh'),
(8, 'Tran Thi H', '0901234574', 'Nam Dinh'),
(9, 'Le Van I', '0901234575', 'Bac Ninh'),
(10,'Pham Thi K', '0901234576', 'Thanh Hoa');
SELECT*FROM customer;

DROP TABLE IF EXISTS product ;
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    price DECIMAL(10,2)
);
INSERT INTO Product 
(product_id, product_name, price) 
VALUES
(101, 'Sua tuoi', -30000),
(102, 'Banh mi', 15000),
(103, 'Snack', 5000),
(104, 'Com', 18000),
(105, 'Duong', 22000),
(106, 'Muoi', 5000),
(107, 'Nuoc mam', 35000),
(108, 'Dau an', 45000),
(109, 'Mi goi', 4000),
(110, 'Ca phe', 60000),
(111, 'Tra', 50000),
(112, 'Coca Cola', 10000),
(113, 'Pepsi', -10000),
(114, 'Nuoc cam', 25000),
(115, 'Dau goi', 70000),
(116, 'Xa phong', 15000),
(117, 'Kem danh rang', 30000),
(118, 'Ban chai', 20000),
(119, 'Bot giat', 80000),
(120, 'Nuoc rua chen', 40000);
SELECT*FROM product;
UPDATE product
SET price = 30000
WHERE product_id = 101 ;
UPDATE product
SET price = 10000
WHERE product_id = 113 ;

CREATE TABLE Invoice (
    invoice_id INT PRIMARY KEY,
    created_date TIMESTAMP,
    customer_id INT,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);
INSERT INTO Invoice (invoice_id, created_date, customer_id, total_amount) 
VALUES
(1001, '2026-03-01 10:00:00', 1, 60000),
(1002, '2026-03-02 14:30:00', 3, 45000),
(1003, '2026-03-03 15:20:00', 2, 30000); 
SELECT*FROM Invoice;
INSERT INTO Invoice (invoice_id, created_date, customer_id, total_amount) 
VALUES
(1004, '2025-12-01 11:00:00', 5, 60000),
(1005, '2026-01-02 17:25:00', 7, 75000),
(1006, '2025-04-03 16:18:00', 10, 50000),
(1007, '2025-10-01 11:00:00', 5, 20000),
(1008, '2026-04-02 17:35:00', 7, 40000),
(1009, '2025-10-18 09:38:00', 10, 30000);

CREATE TABLE Invoice_Detail (
    invoice_id INT,
    product_id INT,
    quantity INT,
    unprice DECIMAL(10,2),
    PRIMARY KEY (invoice_id, product_id),
    FOREIGN KEY (invoice_id) REFERENCES Invoice(invoice_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);
INSERT INTO Invoice_Detail (invoice_id, product_id, quantity, unit_price) 
VALUES
(1001, 101, 1, 30000),
(1001, 102, -2, 15000),
(1002, 103, 3, Null),
(1002, 102, 1, -15000)
SELECT*FROM Invoice_Detail;

insert into Invoice (invoice_id, created_date, customer_id, total_amount) 
values
(1004, '2025-12-01 11:00:00', 5, 60000),
(1005, '2026-01-02 17:25:00', 7, 75000),
(1006, '2025-04-03 16:18:00', 10, 50000),
(1007, '2025-10-01 11:00:00', 5, 20000),
(1008, '2026-04-02 17:35:00', 7, 40000),
(1009, '2025-10-18 09:38:00', 10, 30000);

EXPLAIN ANALYZE
SELECT*FROM customer WHERE phone = '0910099999'; 

CREATE INDEX idx_customer_phone ON customer(phone); 
drop index if exists idx_customer_phone ;

EXPLAIN ANALYZE 
INSERT INTO customer (customer_id, customer_name, phone, address) 
VALUES (11,'Test Index User', '0999999999', '123 Test Index'); 

create index idx_customer_address ON customer(address); 
EXPLAIN 
SELECT*FROM customer
WHERE address = 'Address 500' OR phone LIKE '091001%'; 

