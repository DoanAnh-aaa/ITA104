-- 1. Danh mục sản phẩm
CREATE TABLE product_categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);
INSERT INTO product_categories (category_id, category_name) 
VALUES
(1,'Đồ uống'),
(2,'Thực phẩm khô'),
(3,'Đồ đông lạnh'),
(4,'Mỹ phẩm'),
(5,'Gia dụng'),
(6,'Đồ ăn vặt'),
(7,'Thực phẩm tươi sống'),
(8,'Đồ tiện lợi'),
(9,'Quần áo'),
(10,'Đồ dùng cá nhân');
select*from product_categories ;

-- 2. Nhà cung cấp
DROP TABLE IF EXISTS suppliers ;
CREATE TABLE suppliers (
    supplier_id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(150) NOT NULL,
    contact_phone VARCHAR(15),
    email VARCHAR(100)
);
INSERT INTO suppliers (supplier_id, supplier_name, contact_phone, email) 
VALUES
(17,'Công ty CP Sữa TH ', '0987654321', 'thtruemilk@gmail.com'),
(11,'Công ty Thực phẩm Hảo Hạng', '0912345678', 'haofood@gmail.com'),
(06,'Coca Cola VN', '0909000001', 'cocavn@gmail.com'),
(09,'Unilever VN', '0909000002', 'uni@gmail.com'),
(21,'Nhà cung cấp ABC', '0909000003', 'abc@gmail.com'),
(10,'Công ty LOF Việt Nam', '0986675322', 'lof@gmail.com'),
(12,'3 Concept Eyes', '0938241678', '3cevn@gmail.com'),
(18,'Công ty TNHH Việt Nhật', '0909011001', 'vietnhatgroup@gmail.com'),
(02,'Tập đoàn CP VN', '0909000002', 'cpfood@gmail.com'),
(08,'DELIZ VN', '0909000003', 'delizvn@gmail.com');
SELECT*FROM suppliers;

-- 3. Sản phẩm
DROP TABLE IF EXISTS products CASCADE;
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    category_id INT NOT NULL,
    supplier_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES product_categories(category_id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);
INSERT INTO products (product_id, product_name, price, category_id, supplier_id) 
VALUES
(1,'Coca Cola lon',10000,1,06),
(2,'Pepsi lon',10000,1,06),
(3,'Trà xanh 0 độ',12000,1,21),
(4,'Oreo 119g',15000,6,09),
(5,'Nước suối Lavie',8000,1,21),
(6,'Sữa tươi tiệt trùng TH',30000,1,17),
(7,'Mì tôm Hảo Hảo',5000,2,11),
(8,'Mì Omachi bò hầm',8000,2,11),
(9,'Snack Oishi ',5000,6,11),
(10,'Bánh mì',8000,8,11),
(11,'Bún khô',12000,2,21),
(12,'Phở gói',15000,2,21),
(13,'Gạo ST25',25000,2,21),
(14,'Đậu xanh khô',20000,2,21),
(15,'Cá basa phi lê',60000,3,02),
(16,'Thịt bò đông lạnh',120000,3,02),
(17,'Gà đông lạnh',90000,3,02),
(18,'Tôm đông lạnh',150000,3,02),
(19,'Cá viên đông lạnh',70000,3,02),
(20,'Sữa chua có đường TH',30000,8,17),
(21,'Sữa đậu nành',15000,8,17),
(22,'Sữa hạnh nhân',35000,8,17),
(23,'Sữa Milo',28000,8,10),
(24,'Dầu gội Clear',80000,4,09),
(25,'Sữa tắm Lifebuoy',90000,4,09),
(26,'Kem đánh răng P/S',30000,4,09),
(27,'Nước rửa tay',40000,4,09),
(28,'Nước giặt OMO',150000,4,09),
(29,'Nước xả Comfort',120000,4,09),
(30,'Son dưỡng 3ce',280000,4,09),
(31,'Phấn má hồng 3ce',390000,4,09),
(32,'Nước tẩy trang kiềm dầu ',30000,4,09),
(33,'Nồi cơm điện',500000,5,18),
(34,'Chảo chống dính',200000,5,18),
(35,'Ấm đun nước',150000,5,18),
(36,'Ly thủy tinh',50000,5,18),
(37,'Hộp nhựa đựng đồ',70000,5,18),
(38,'Dao nhà bếp',80000,5,18),
(39,'Cà chua',20000,7,21),
(40,'Khoai tây',25000,7,21),
(41,'Cà rốt',18000,7,11),
(42,'Bắp cải',22000,7,21),
(43,'Rau muống',10000,7,11),
(44,'Dưa leo',15000,7,11),
(45,'Táo Mỹ',50000,7,11),
(46,'Chuối',20000,7,21),
(47,'Cam sành',30000,7,11),
(48,'Xoài',40000,7,21),
(49,'Dưa hấu',35000,7,11),
(50,'Thanh long',30000,7,21),
(51,'Xúc xích ăn liền',25000,8,10),
(52,'Hamburger',50000,8,10),
(53,'Pizza mini',60000,8,10),
(54,'Gà rán',70000,8,10),
(55,'Khoai tây chiên',40000,8,10),
(56,'Hotdog',30000,8,10),
(57,'Kẹo dẻo',15000,6,10),
(58,'Socola Kitkat',30000,6,10),
(59,'Bánh Chocopie',35000,6,10),
(60,'Bánh quy bơ',40000,6,10),
(61,'Áo thun nam',120000,9,08),
(62,'Áo sơ mi nữ',180000,9,08),
(63,'Bàn chải đánh răng',20000,10,09),
(64,'Quần jean nam',250000,9,08),
(65,'Khăn mặt',30000,10,12),
(66,'Lăn khử mùi',70000,10,09),
(67,'Nước hoa mini',150000,10,12),
(68,'Váy nữ',220000,9,08),
(69,'Áo khoác',300000,9,08),
(70,'Váy tiệc dáng suông',520000,9,08);
SELECT*FROM products ;

-- 4. Khách hàng
DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(150) NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(100) UNIQUE,
    address TEXT
);
INSERT INTO customers (customer_id, customer_name, phone, email, address)
SELECT 
	i,
    'Khách hàng ' || i,
    '0910000' || LPAD(i::text,3,'0'),
    'customer' || i || '@gmail.com',
    (ARRAY[
        'Hà Nội',
        'TP.HCM',
        'Bắc Ninh',
        'Hải Phòng',
        'Thanh Hóa',
        'Ninh Bình',
        'Nghệ An',
        'Quảng Ninh'
    ])[floor(random()*8 + 1)]
FROM generate_series(1,100) AS i;
SELECT*FROM customers;

-- 5. Nhân viên
DROP TABLE IF EXISTS employees CASCADE ;
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(150) NOT NULL,
    job_title VARCHAR(100),
    hire_date DATE NOT NULL
);
INSERT INTO employees (employee_id, employee_name, job_title, hire_date) VALUES
(1,'Nguyễn Văn An', 'Thu ngân', '2023-01-01'),
(2,'Trần Thị Bình', 'Quản lý', '2022-05-10'),
(3,'Lê Văn Cường', 'Bán hàng', '2023-03-15'),
(4,'Phạm Thị Dung', 'Thu ngân', '2024-01-20'),
(5,'Hoàng Văn Én', 'Kho', '2023-07-07'),
(6,'Nguyễn Văn Phú', 'Bán hàng', '2023-09-09'),
(7,'Trần Văn Giang', 'Kho', '2024-02-02'),
(8,'Lý Thị Huyền', 'Thu ngân', '2023-11-11'),
(9,'Đỗ Văn Ích', 'Bán hàng', '2022-12-12'),
(10,'Vũ Thị Khánh Ngân', 'Quản lý', '2021-06-06'),
(11,'Nguyễn Quang Bách', 'Thu ngân', '2022-01-01'),
(12,'Trần Thị Bé', 'Quản lý', '2021-05-12'),
(13,'Lê Văn Chiến', 'Bán hàng', '2023-05-15'),
(14,'Phạm Thị Diệu Linh', 'Thu ngân', '2025-01-20'),
(15,'Hoàng Ngọc Sơn', 'Kho', '2021-10-07'),
(16,'Nguyễn Văn Tiến', 'Bán hàng', '2023-09-22'),
(17,'Trần Văn Tâm', 'Thu ngân', '2022-02-02'),
(18,'Lý Thị Hoa', 'Thu ngân', '2021-11-11'),
(19,'Đỗ Văn Dũng', 'Bán hàng', '2022-06-12'),
(20,'Vũ Thị Kim', 'Quản lý', '2021-06-25');
SELECT*FROM employees;

-- 6. Khuyến mãi
DROP TABLE IF EXISTS promotions CASCADE;
CREATE TABLE promotions (
    promotion_id SERIAL PRIMARY KEY,
    promotion_name VARCHAR(150),
    description TEXT,
    discount_percent DECIMAL(5,2) CHECK (discount_percent >= 0),
    start_date DATE,
    end_date DATE
);
INSERT INTO promotions (promotion_id, promotion_name, description, discount_percent, start_date, end_date) 
VALUES
(1,'Sale Tết', 'Giảm giá Tết', 10, '2025-01-01', '2025-01-31'),
(2,'Black Friday', 'Siêu giảm giá', 20, '2025-11-25', '2025-11-30'),
(3,'Summer Sale', 'Khuyến mãi mùa hè', 15, '2025-06-01', '2025-06-30'),
(4,'Tết Hời', 'Siêu khuyến mại đón Tết', 25 , '2026-01-01', '2026-02-15'),
(5,' New Arrival Day', 'Hàng mới về giá siêu iu', 30, '2026-03-22', '2026-04-01');
SELECT*FROM promotions;

-- 7. Đơn hàng
DROP TABLE IF EXISTS orders CASCADE;
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    employee_id INT NOT NULL,
    promotion_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (promotion_id) REFERENCES promotions(promotion_id)
);
INSERT INTO orders (customer_id, employee_id, promotion_id, order_date)
SELECT 
    (RANDOM() * 99 + 1)::INT,
    (RANDOM() * 19 + 1)::INT,
    (RANDOM() * 4 + 1)::INT, 
    TIMESTAMP '2025-01-01' + (RANDOM() * INTERVAL '460 days')
FROM generate_series(1,200);
SELECT*FROM orders;

-- 8. Chi tiết đơn hàng
DROP TABLE IF EXISTS order_items CASCADE ;
CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO order_items (order_id, product_id, quantity, price)
SELECT
    o.order_id,
    (RANDOM() * 69 + 1)::INT,
    (RANDOM() * 5 + 1)::INT,
    (RANDOM() * 100000 + 10000)::INT
FROM orders o,
generate_series(1,5)
WHERE RANDOM() < 0.6;
SELECT*FROM order_items;

SELECT o.order_id, c.customer_name, e.employee_name, o.order_date,
    SUM(oi.quantity * oi.price) AS tong_tien
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN employees e ON o.employee_id = e.employee_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id, c.customer_name, e.employee_name, o.order_date
ORDER BY o.order_date DESC
LIMIT 10;

SELECT pr.category_id, pr.category_name,
    SUM(od.quantity * od.price) AS tong_doanh_thu
FROM order_items od
JOIN products p ON od.product_id = p.product_id
JOIN product_categories pr ON p.category_id = pr.category_id
GROUP BY pr.category_id, pr.category_name
HAVING SUM(od.quantity * od.price) > 1000000
ORDER BY tong_doanh_thu DESC;

SELECT product_id, product_name, price
FROM products
WHERE supplier_id = (SELECT supplier_id FROM suppliers
    WHERE supplier_name = 'Công ty Thực phẩm Hảo Hạng'
);

SELECT e.employee_id, e.employee_name,
    SUM(od.quantity * od.price) AS tong_doanh_thu,
    DENSE_RANK() OVER (ORDER BY SUM(od.quantity * od.price) DESC) AS rank_salers
FROM orders o
JOIN employees e ON o.employee_id = e.employee_id
JOIN order_items od ON o.order_id = od.order_id
WHERE EXTRACT(MONTH FROM o.order_date) = 10 AND EXTRACT(YEAR FROM o.order_date) = 2025
GROUP BY e.employee_id, e.employee_name;

INSERT INTO customers (customer_id, customer_name, phone, email, address)
SELECT 
	i,
    'Khách hàng ' || i,
    '09' || LPAD(i::text,8,'0'),
    'customer' || i || '@gmail.com',
    (ARRAY[
        'Hà Nội',
        'TP.HCM',
        'Bắc Ninh',
        'Hải Phòng',
        'Thanh Hóa',
        'Ninh Bình',
        'Nghệ An',
        'Quảng Ninh',
		'Phú Thọ',
		'Hưng Yên',
		'Lạng Sơn',
		'Tuyên Quang'
    ])[floor(random()*9 + 1)]
FROM generate_series(101,50000) AS i;

EXPLAIN ANALYZE
SELECT*FROM customers
WHERE email = 'customer17@gmail.com';

CREATE INDEX idx_customers_email ON customers(email);
EXPLAIN ANALYZE
SELECT*FROM customers
WHERE email = 'customer17@gmail.com';
