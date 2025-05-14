CREATE TABLE ext_cust_info (
    customer_id    NUMBER,
    customer_name  VARCHAR2(100),
    region         VARCHAR2(50)
)
ORGANIZATION EXTERNAL (
    TYPE ORACLE_LOADER
    DEFAULT DIRECTORY ext_dir
    ACCESS PARAMETERS (
        RECORDS DELIMITED BY NEWLINE
        FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
        MISSING FIELD VALUES ARE NULL
        (
            customer_id,
            customer_name,
            region
        )
    )
    LOCATION ('cust_info.csv')
)
REJECT LIMIT UNLIMITED;

CREATE TABLE ext_prd_info (
    product_id     NUMBER,
    product_name   VARCHAR2(100),
    product_type   VARCHAR2(50),
    price          NUMBER
)
ORGANIZATION EXTERNAL (
    TYPE ORACLE_LOADER
    DEFAULT DIRECTORY ext_dir
    ACCESS PARAMETERS (
        RECORDS DELIMITED BY NEWLINE
        FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
        MISSING FIELD VALUES ARE NULL
        (
            product_id,
            product_name,
            product_type,
            price
        )
    )
    LOCATION ('prd_info.csv')
)
REJECT LIMIT UNLIMITED;

CREATE TABLE ext_sales_details (
    sale_id        NUMBER,
    customer_id    NUMBER,
    product_id     NUMBER,
    sale_date      DATE,
    quantity       NUMBER,
    total_amount   NUMBER
)
ORGANIZATION EXTERNAL (
    TYPE ORACLE_LOADER
    DEFAULT DIRECTORY ext_dir
    ACCESS PARAMETERS (
        RECORDS DELIMITED BY NEWLINE
        FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
        MISSING FIELD VALUES ARE NULL
        (
            sale_id,
            customer_id,
            product_id,
            sale_date DATE "YYYY-MM-DD",
            quantity,
            total_amount
        )
    )
    LOCATION ('sales_details.csv')
)
REJECT LIMIT UNLIMITED;

CREATE TABLE ext_loc_a101 (
    location_id     NUMBER,
    location_name   VARCHAR2(100),
    region          VARCHAR2(50)
)
ORGANIZATION EXTERNAL (
    TYPE ORACLE_LOADER
    DEFAULT DIRECTORY ext_dir
    ACCESS PARAMETERS (
        RECORDS DELIMITED BY NEWLINE
        FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
        MISSING FIELD VALUES ARE NULL
        (
            location_id,
            location_name,
            region
        )
    )
    LOCATION ('loc_a101.csv')
)
REJECT LIMIT UNLIMITED;

CREATE TABLE ext_cust_az12 (
    cust_id         NUMBER,
    cust_name       VARCHAR2(100),
    state           VARCHAR2(50)
)
ORGANIZATION EXTERNAL (
    TYPE ORACLE_LOADER
    DEFAULT DIRECTORY ext_dir
    ACCESS PARAMETERS (
        RECORDS DELIMITED BY NEWLINE
        FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
        MISSING FIELD VALUES ARE NULL
        (
            cust_id,
            cust_name,
            state
        )
    )
    LOCATION ('cust_az12.csv')
)
REJECT LIMIT UNLIMITED;

CREATE TABLE ext_px_cat_g1v2 (
    category_id     NUMBER,
    category_name   VARCHAR2(100),
    parent_id       NUMBER
)
ORGANIZATION EXTERNAL (
    TYPE ORACLE_LOADER
    DEFAULT DIRECTORY ext_dir
    ACCESS PARAMETERS (
        RECORDS DELIMITED BY NEWLINE
        FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
        MISSING FIELD VALUES ARE NULL
        (
            category_id,
            category_name,
            parent_id
        )
    )
    LOCATION ('px_cat_g1v2.csv')
)
REJECT LIMIT UNLIMITED;
