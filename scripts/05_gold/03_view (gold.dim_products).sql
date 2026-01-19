CREATE VIEW gold.dim_products AS
SELECT 
	ROW_NUMBER() OVER(ORDER BY prd_start_dt,prd_key) AS product_key,
	pdi.prd_id AS product_id,
	pdi.prd_key AS product_number,
	pdi.prd_nm AS product_name,
	pdi.cat_id AS category_id,
	pcg.cat AS category,
	pcg.subcat AS sub_category,
	pcg.maintenance,
	pdi.prd_cost AS cost,
	pdi.prd_line AS product_line,
	pdi.prd_start_dt AS start_date
FROM silver.crm_prd_info pdi
	LEFT JOIN silver.erp_px_cat_g1v2 pcg
		ON pdi.cat_id = pcg.id
WHERE prd_end_dt IS NULL -- Filter out all historical data;
 

