CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255),
    phone VARCHAR(15),
    address VARCHAR(255)
);
INSERT INTO Customer 
(customer_id, customer_name, phone, address) 
VALUES
(1, 'Nguyen Van A', '0901234567', 'Ha Noi'),
(2, 'Tran Thi B', 'abcd345678', 'Bac Ninh'),
(3, NULL, '0923456789', 'Da Nang');

CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    price DECIMAL(10,2)
);
INSERT INTO Product (product_id, product_name, price) 
VALUES
(101, 'Sua tuoi', -30000),
(102, 'Banh mi', 15000),
(103, 'oreo', Null);

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
(1002, '2026-03-02 14:30:00', 99, 45000),
(1003, 'invalid_date', 2, 30000); 

CREATE TABLE Invoice_Detail (
    invoice_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    PRIMARY KEY (invoice_id, product_id),
    FOREIGN KEY (invoice_id) REFERENCES Invoice(invoice_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);
INSERT INTO Invoice_Detail (invoice_id, product_id, quantity, unit_price) 
VALUES
(1001, 101, 1, 30000),
(1001, 102, -2, 15000),
(1002, 103, 3, Null),
(1002, 102, 1, -15000);
