-- Creation of Analytic Table
CREATE TABLE fact_sales AS
SELECT
	sale_id,
    customer_name,
    product,
    quantity,
    unit_price,
    quantity*unit_price AS total_sale,
    sale_date
FROM stg_sales;

-- Quality Check
SELECT *
FROM fact_sales;

-- Quality check verify the pipeline
SELECT COUNT(*)
FROM sales_data_raw;

SELECT COUNT(*)
FROM stg_sales;

SELECT COUNT(*)
FROM fact_sales; 


-- Serve to data analyst

-- Will answer some business questions

-- Total Revenue
SELECT 
	SUM(total_sale)
FROM fact_sales;

-- Top product by sales
SELECT
	product,
    SUM(total_sale) AS revenue
FROM fact_sales
GROUP BY product
ORDER BY revenue DESC;

-- Top Products sold
SELECT 
	product,
    COUNT(product) AS sold_product
FROM fact_sales
GROUP BY product
ORDER BY COUNT(product) DESC;


-- Monthly Sales
SELECT
	YEAR(sale_date),
    MONTH(sale_date),
    SUM(total_sale)
FROM fact_sales
GROUP BY YEAR(sale_date), MONTH(sale_date);

