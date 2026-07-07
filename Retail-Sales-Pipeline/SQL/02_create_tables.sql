-- Creation of Raw Table
CREATE TABLE raw_sales(
	sale_id INT,
    customer_name VARCHAR(100),
    quantity int,
    unit_price DECIMAL(10,2),
    sale_date VARCHAR(20)
);

show tables;
-- import csv file using mySQL work bench Table Data Import,
-- raw data import into sales_data_raw

-- Quality check- to check if data is in sales_data_raw
SELECT *
FROM sales_data_raw;

