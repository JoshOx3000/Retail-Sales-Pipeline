-- Creation of Staging Table
CREATE TABLE stg_sales(
	sale_id INT,
    customer_name VARCHAR(100),
    product VARCHAR(100),
    quantity INT,
    unit_price DECIMAL(10,2),
    sale_date DATE 
);

show tables;

-- Transform  the data stage
INSERT INTO stg_sales
SELECT DISTINCT sale_id,
    TRIM(customer_name),
    UPPER(product),
        CASE
			WHEN TRIM(quantity) = '' OR quantity IS NULL THEN 1
			WHEN CAST(quantity AS SIGNED) < 0 THEN ABS(CAST(quantity AS SIGNED))
			ELSE CAST(quantity AS SIGNED)
    END AS quantity,
    -unit_price,
    STR_TO_DATE(sale_date, '%d/%m/%Y')
FROM sales_data_raw;

-- quality check the data
SELECT *
FROM stg_sales;

-- Notice sale_id 2, john smith is lowercase, for mysql may have to turn off safe update mode

-- turn off safe update
SET SQL_SAFE_UPDATES = 0;

UPDATE stg_sales 
SET customer_name = 'John Smith'
WHERE sale_id = 2;

-- turn safe update back on
SET SQL_SAFE_UPDATES = 1;

-- quality check the data
SELECT *
FROM stg_sales;

