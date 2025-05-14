This project uses T-SQL to divide data into 3 Layers 

# Bronze
This layer **loads raw data** from various sources into SQL using DDL commands 
Here we define all the data types
And Create Tables for the same 

# Silver
This layer refines raw data from the Bronze layer into **cleaned, structured, and business-ready datasets**. It focuses on data quality, standardization, and light transformations to prepare data for analytics.

# Gold

This layer delivers highly curated, aggregated, and analytics-ready data tailored for **specific business use cases**, dashboards, and reporting. It involves advanced transformations, business logic implementations, and joins across multiple Silver tables to generate insights-rich datasets.

The focus is on:

Business KPIs and metrics

Aggregated views and summaries

Dimensional modeling (e.g., star or snowflake schema)

Performance optimization for downstream consumption

Data in the Gold layer is consumed directly by BI tools, machine learning models, and reporting systems for decision-making.