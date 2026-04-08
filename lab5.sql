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
update Invoice_Detail
set quantity = 5
where price = 15000 ;
update Invoice_Detail
set price = 70000
where invoice_id = 1002 ;
update Invoice_Detail
set price = 25000
where product_id = 102 ;

select p.product_name, i.invoice_id, i.quantity, i.price
from product p
inner join invoice_detail i on p.price = i.price ;

select c.customer_id, c.customer_name, i.invoice_id
from customer c
left join invoice i on c.customer_id = i.customer_id ;

select p.product_name, i.invoice_id
from invoice_detail i
right join product p on p.price = i.price ;

select*from suppliers;

alter table suppliers
add contact_phone VARCHAR(15) UNIQUE ;
update suppliers
set contact_phone = '0987654321'
where supplier_id = 11 ;
update suppliers
set contact_phone = '0912345678'
where supplier_id = 17 ;

select customer_name as ContactName, phone as PhoneNumber
from customer
union
select supplier_name as ContactName, contact_phone as PhoneNumber
from suppliers ;

insert into Product 
(product_id, product_name, price) 
values
(121, 'Sua chua', 30000),
(122, 'kem sua chua vinamilk', 15000),
(123, 'Kem vinamilk vani', 5000);
select*from product;

alter table product
add supplier_id INT ;
update product
set supplier_id = 17
where product_id in (102,103,105,106,107,108,109,110,112,114,115,116,117,118,119,120) ;
update product
set supplier_id = 11
where product_id in (101,104,111,113,121,122,123) ;

select product_name, price
from product 
where supplier_id in (
    select supplier_id
    from suppliers
    where supplier_name = 'Công ty Sữa Việt Nam'
);
select product_name, price ,
    (select AVG (price) from product) as avg_price
from product ;

select*from (select invoice_id, SUM(quantity * price) as total_value
	from invoice_detail
	group by invoice_id) as order_total
where total_value > 50000 ;

select 	supplier_id, supplier_name
from suppliers s
where exists (select 1 from product p where p.supplier_id = s.supplier_id
) ;
