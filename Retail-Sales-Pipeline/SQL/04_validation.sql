-- Validate Data

-- Check for duplicates
SELECT 
	sale_id,
    COUNT(*) AS duplicates
FROM sales_data_raw
GROUP BY sale_id
HAVING COUNT(*) > 1;
-- sale_id 5 have 2 duplicates


-- Find missing quantities
SELECT *
FROM sales_data_raw
WHERE quantity IS NULL OR quantity = "";
-- Sales_id 3 has missing quantity

-- Find negative quantities
SELECT *
FROM sales_data_raw
WHERE quantity < 0;
-- result two negative quantity found: same user sale_id 5 has -1 quantity

-- Find blank customer names
SELECT *
FROM sales_data_raw
WHERE customer_name IS NULL OR
	 customer_name = '';
-- result no blank customer names found 
