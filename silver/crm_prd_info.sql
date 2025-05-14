INSERT INTO [silver].[crm_prd_info]
(
		prd_id,
		cat_id,
		prd_key,
		prd_nm,
		prd_cost,
		prd_line,
		prd_start_dt,
		prd_end_dt
		)
SELECT [prd_id]
      ,REPLACE(SUBSTRING(prd_key,1,5),'-','_') AS cat_id
	  ,TRIM(SUBSTRING(prd_key,7,LEN(prd_key))) AS prd_key
      ,[prd_nm]
      ,ISNULL([prd_cost], 0) as prd_cost
      ,CASE 
			WHEN UPPER(TRIM(prd_line))='R' THEN 'road'
			WHEN UPPER(TRIM(prd_line))='M' THEN 'mountain'
			WHEN UPPER(TRIM(prd_line))='S' THEN 'other_sales'
			WHEN UPPER(TRIM(prd_line))= 'T' THEN 'touring'
		ELSE 'n/a'
		END AS prd_line
      ,CAST([prd_start_dt] AS DATE) as prd_start_dt
      ,CAST(LEAD(prd_start_dt) OVER (PARTITION BY prd_key ORDER BY prd_start_dt)-1 AS DATE) as prd_end_dt
  FROM [proj1].[bronze].[crm_prd_info]
GO
