DROP TABLE IF EXISTS customers;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    phone VARCHAR(15) UNIQUE,
	address VARCHAR(255)
);
INSERT INTO Customers 
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
SELECT*FROM customers;
ALTER TABLE customers 
ALTER COLUMN phone TYPE VARCHAR(20);
UPDATE customers
SET address = 'Bac Ninh'
WHERE customer_id = 5;
DELETE FROM customers
WHERE customer_name = 'Le%';

DROP TABLE IF EXISTS products ;
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) CHECK (price > 0) 
);
INSERT INTO Products 
(product_id, product_name, price) 
VALUES
(101, 'Sua tuoi', 30000),
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
(113, 'Pepsi', 10000),
(114, 'Nuoc cam', 25000),
(115, 'Dau goi', 70000),
(116, 'Xa phong', 15000),
(117, 'Kem danh rang', 30000),
(118, 'Ban chai', 20000),
(119, 'Bot giat', 80000),
(120, 'Nuoc rua chen', 40000);
SELECT*FROM products;
ALTER TABLE products
ALTER COLUMN product_name TYPE VARCHAR(200);
UPDATE products 
SET price = price - price*0.1
WHERE product_id = 114;
DELETE FROM products
WHERE product_id = 112;

DROP TABLE IF EXISTS invoices;
CREATE TABLE invoices (
    invoice_id INT PRIMARY KEY,
    created_date TIMESTAMP NOT NULL,
    customer_id INT NOT NULL,
    total_amount DECIMAL(10,2) CHECK (total_amount >= 0),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);
INSERT INTO Invoices 
(invoice_id, created_date, customer_id, total_amount) 
VALUES
(1001, '2026-03-01 10:00:00', 1, 60000),
(1002, '2026-03-02 14:30:00', 3, 45000),
(1003, '2026-03-03 15:20:00', 2, 30000); 
SELECT*FROM Invoices;
ALTER TABLE invoices
ALTER COLUMN created_date TYPE DATE;
UPDATE invoices
SET customer_id = 2
WHERE invoice_id = 1002;
UPDATE invoices
SET customer_id = 3
WHERE invoice_id = 1003;
DELETE FROM invoices
WHERE invoice_id = 1001;

DROP TABLE IF EXISTS InvoiceDetail;
CREATE TABLE InvoiceDetail (
    invoice_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT CHECK (quantity > 0),
    unit_price DECIMAL(10,2) CHECK (unit_price > 0),
    PRIMARY KEY (invoice_id, product_id),
    FOREIGN KEY (invoice_id) REFERENCES Invoice(invoice_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);
INSERT INTO InvoiceDetail 
(invoice_id, product_id, quantity, unit_price) 
VALUES
(1001, 101, 1, 30000),
((1001, 102, 2, 15000),
(1002, 103, 3, Null),
(1002, 102 , 1, 15000)
SELECT*FROM InvoiceDetail;
UPDATE InvoiceDetail
SET unit_price = 20000
WHERE product_id = 103;
DELETE FROM InvoiceDetail
WHERE unit_price >=20000;

DROP TABLE IF EXISTS suppliers;
CREATE TABLE suppliers(
	supplier_id INT PRIMARY KEY,
	supplier_name VARCHAR(255) NOT NULL,
	contact_phone VARCHAR(15) UNIQUE ,
CONSTRAINT fk_supplier
	FOREIGN KEY (supplier_id)
	REFERENCES Suppliers(supplier_id)
);
SELECT*FROM suppliers;
ALTER TABLE suppliers
ADD email VARCHAR(100);
ALTER TABLE products
ADD supplier_id INT ;
INSERT INTO suppliers
(supplier_id, supplier_name, contact_phone, email)
VALUES
(11,'Công ty Sữa Việt Nam', '0987654321', 'contact@vinamilk.vn'),
(17,'Công ty Thực phẩm Á Châu', '0912345678', 'contact@acecook.vn') 
UPDATE suppliers
SET contact_phone = 0911112222
WHERE supplier_id = 17;
DELETE FROM products
WHERE product_id = 108;

CREATE TABLE test_table(
	test_id INT
);
SELECT*FROM test_table;
ALTER TABLE suppliers
DROP COLUMN contact_phone;
DROP TABLE test_table;
