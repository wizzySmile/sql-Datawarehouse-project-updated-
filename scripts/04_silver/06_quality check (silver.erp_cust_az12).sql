-- Invalid/impossible date check
SELECT
cid,
bdate,
gen
FROM silver.erp_cust_az12
WHERE bdate > GETDATE();

-- Data standardization & consistency
SELECT DISTINCT gen,
CASE 
	WHEN UPPER(TRIM(gen)) IN ('M', 'MALE') THEN 'Male'
	WHEN UPPER(TRIM(gen)) IN ('F', 'Female') THEN 'Female'
	ELSE 'n/a'
END AS gen
FROM silver.erp_cust_az12;

