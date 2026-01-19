-- Check for nulls or duplicate in the primary key
-- Expectation: no results
SELECT cst_id, COUNT(*)
FROM bronze.crm_cust_info 
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL;

-- Check for unwanted spaces
-- Expectation: no results
SELECT cst_firstname, TRIM(cst_firstname)
FROM bronze.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname);

-- Data standardization & consistency
SELECT DISTINCT cst_gndr
FROM bronze.crm_cust_info;

SELECT DISTINCT cst_marital_status
FROM bronze.crm_cust_info;

