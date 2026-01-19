SELECT TOP (1000) [prd_id]
      ,[prd_key]
      ,[prd_nm]
      ,[prd_cost]
      ,[prd_line]
      ,[prd_start_dt]
      ,[prd_end_dt]
  FROM [DataWarehouse].[bronze].[crm_prd_info];

  SELECT * FROM bronze.crm_sales_details

  -- Checking for duplicates
  -- Expectation: No results
  SELECT prd_id, COUNT(*)
  FROM [bronze].[crm_prd_info]
  GROUP BY prd_id
  HAVING COUNT(*) > 1;

  -- Checking for unwanted spaces
  -- Expectation: no result
  SELECT prd_nm 
  FROM bronze.crm_prd_info
  WHERE prd_nm != TRIM(prd_nm);

  -- Checking for nulls or negative numbers
  -- Expectation: no result
SELECT *
FROM bronze.crm_prd_info
WHERE prd_cost IS NULL OR prd_cost < 0;

-- Data standardization and consistency
SELECT DISTINCT prd_line
FROM bronze.crm_prd_info 

-- Check for invalid date order
-- Expectation: No result
SELECT *
FROM bronze.crm_prd_info 
WHERE prd_start_dt > prd_end_dt



