-- Check for invalid dates
SELECT NULLIF(sls_order_dt,0)sls_order_dt
FROM silver.crm_sales_details
WHERE sls_order_dt <= 0 
OR LEN(sls_order_dt) != 8
OR sls_order_dt > 20500101
OR sls_order_dt <19000101;

-- Check for invalid dates
SELECT *
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_due_dt OR sls_order_dt > sls_ship_dt;

-- Check data consistency; Between sales, quantity and price
-- >> Sales = Quantity * Price
-- >> Values must not be null, zero or negative.
SELECT 
sls_sales,
sls_quantity,
sls_price
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price 
OR sls_sales IS NULL OR sls_quantity IS NULL OR sls_price IS NULL
OR sls_sales <= 0 OR sls_quantity <= 0 OR sls_price <= 0
ORDER BY sls_sales, sls_price  

SELECT * FROM silver.crm_sales_details