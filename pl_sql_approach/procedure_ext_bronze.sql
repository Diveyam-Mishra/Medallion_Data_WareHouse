CREATE OR REPLACE PROCEDURE load_bronze AS
    v_start_time      TIMESTAMP;
    v_end_time        TIMESTAMP;
    v_batch_start     TIMESTAMP := SYSTIMESTAMP;
    v_batch_end       TIMESTAMP;
BEGIN
    DBMS_OUTPUT.PUT_LINE('====');
    DBMS_OUTPUT.PUT_LINE('Loading Bronze Layer');
    DBMS_OUTPUT.PUT_LINE('====');

    DBMS_OUTPUT.PUT_LINE('------------------');
    DBMS_OUTPUT.PUT_LINE('Loading CRM Tables');
    DBMS_OUTPUT.PUT_LINE('------------------');

    -- crm_cust_info
    v_start_time := SYSTIMESTAMP;
    DBMS_OUTPUT.PUT_LINE('>> Truncating Table: bronze.crm_cust_info');
    EXECUTE IMMEDIATE 'TRUNCATE TABLE bronze.crm_cust_info';
    DBMS_OUTPUT.PUT_LINE('>> Inserting Data Into: bronze.crm_cust_info');
    INSERT INTO bronze.crm_cust_info SELECT * FROM ext_cust_info;
    v_end_time := SYSTIMESTAMP;
    DBMS_OUTPUT.PUT_LINE('>> Load Duration: ' || ROUND((v_end_time - v_start_time)*24*60*60) || ' seconds');

    -- crm_prd_info
    v_start_time := SYSTIMESTAMP;
    DBMS_OUTPUT.PUT_LINE('>> Truncating Table: bronze.crm_prd_info');
    EXECUTE IMMEDIATE 'TRUNCATE TABLE bronze.crm_prd_info';
    DBMS_OUTPUT.PUT_LINE('>> Inserting Data Into: bronze.crm_prd_info');
    INSERT INTO bronze.crm_prd_info SELECT * FROM ext_prd_info;
    v_end_time := SYSTIMESTAMP;
    DBMS_OUTPUT.PUT_LINE('>> Load Duration: ' || ROUND((v_end_time - v_start_time)*24*60*60) || ' seconds');

    -- crm_sales_details
    v_start_time := SYSTIMESTAMP;
    DBMS_OUTPUT.PUT_LINE('>> Truncating Table: bronze.crm_sales_details');
    EXECUTE IMMEDIATE 'TRUNCATE TABLE bronze.crm_sales_details';
    DBMS_OUTPUT.PUT_LINE('>> Inserting Data Into: bronze.crm_sales_details');
    INSERT INTO bronze.crm_sales_details SELECT * FROM ext_sales_details;
    v_end_time := SYSTIMESTAMP;
    DBMS_OUTPUT.PUT_LINE('>> Load Duration: ' || ROUND((v_end_time - v_start_time)*24*60*60) || ' seconds');

    DBMS_OUTPUT.PUT_LINE('------------------');
    DBMS_OUTPUT.PUT_LINE('Loading ERP Tables');
    DBMS_OUTPUT.PUT_LINE('------------------');

    -- erp_loc_a101
    v_start_time := SYSTIMESTAMP;
    DBMS_OUTPUT.PUT_LINE('>> Truncating Table: bronze.erp_loc_a101');
    EXECUTE IMMEDIATE 'TRUNCATE TABLE bronze.erp_loc_a101';
    DBMS_OUTPUT.PUT_LINE('>> Inserting Data Into: bronze.erp_loc_a101');
    INSERT INTO bronze.erp_loc_a101 SELECT * FROM ext_loc_a101;
    v_end_time := SYSTIMESTAMP;
    DBMS_OUTPUT.PUT_LINE('>> Load Duration: ' || ROUND((v_end_time - v_start_time)*24*60*60) || ' seconds');

    -- erp_cust_az12
    v_start_time := SYSTIMESTAMP;
    DBMS_OUTPUT.PUT_LINE('>> Truncating Table: bronze.erp_cust_az12');
    EXECUTE IMMEDIATE 'TRUNCATE TABLE bronze.erp_cust_az12';
    DBMS_OUTPUT.PUT_LINE('>> Inserting Data Into: bronze.erp_cust_az12');
    INSERT INTO bronze.erp_cust_az12 SELECT * FROM ext_cust_az12;
    v_end_time := SYSTIMESTAMP;
    DBMS_OUTPUT.PUT_LINE('>> Load Duration: ' || ROUND((v_end_time - v_start_time)*24*60*60) || ' seconds');

    -- erp_px_cat_g1v2
    v_start_time := SYSTIMESTAMP;
    DBMS_OUTPUT.PUT_LINE('>> Truncating Table: bronze.erp_px_cat_g1v2');
    EXECUTE IMMEDIATE 'TRUNCATE TABLE bronze.erp_px_cat_g1v2';
    DBMS_OUTPUT.PUT_LINE('>> Inserting Data Into: bronze.erp_px_cat_g1v2');
    INSERT INTO bronze.erp_px_cat_g1v2 SELECT * FROM ext_px_cat_g1v2;
    v_end_time := SYSTIMESTAMP;
    DBMS_OUTPUT.PUT_LINE('>> Load Duration: ' || ROUND((v_end_time - v_start_time)*24*60*60) || ' seconds');

    v_batch_end := SYSTIMESTAMP;
    DBMS_OUTPUT.PUT_LINE('======');
    DBMS_OUTPUT.PUT_LINE('Loading Bronze Layer is Completed');
    DBMS_OUTPUT.PUT_LINE('   - Total Load Duration: ' || ROUND((v_batch_end - v_batch_start)*24*60*60) || ' seconds');
    DBMS_OUTPUT.PUT_LINE('======');

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('======');
        DBMS_OUTPUT.PUT_LINE('ERROR OCCURRED DURING LOADING BRONZE LAYER');
        DBMS_OUTPUT.PUT_LINE('Error Message: ' || SQLERRM);
        DBMS_OUTPUT.PUT_LINE('======');
END;
