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
SELECT customer_id, customer_name, phone, address FROM customer
WHERE customer_name LIKE '%Van%';

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
SELECT product_name, price FROM product;
SELECT product_name AS "TenSanPham", price AS "DonGia" FROM product;
SELECT product_name, price FROM product
ORDER BY price DESC;
SELECT product_id, product_name, price FROM product
WHERE price IS NOT NULL AND price > 0
ORDER BY price ASC
LIMIT 3;
