
  -- Checking for duplicates
  -- Expectation: No results
  SELECT prd_id, COUNT(*)
  FROM [silver].[crm_prd_info]
  GROUP BY prd_id
  HAVING COUNT(*) > 1;

  -- Checking for unwanted spaces
  -- Expectation: no result
  SELECT prd_nm 
  FROM silver.crm_prd_info
  WHERE prd_nm != TRIM(prd_nm);

  -- Checking for nulls or negative numbers
  -- Expectation: no result
SELECT *
FROM silver.crm_prd_info
WHERE prd_cost IS NULL OR prd_cost < 0;

-- Data standardization and consistency
SELECT DISTINCT prd_line
FROM silver.crm_prd_info 

-- Check for invalid date order
SELECT *
FROM silver.crm_prd_info 
WHERE prd_start_dt > prd_end_dt

SELECT *, CAST(LEAD(prd_start_dt) OVER(PARTITION BY prd_key ORDER  BY prd_start_dt ASC) -1 AS DATE) AS prd_key_test
FROM silver.crm_prd_info 
WHERE prd_key IN ('AC-HE-HL-U509-R', 'AC-HE-HL-U509')


SELECT * 
FROM silver.crm_prd_info;


