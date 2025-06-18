#**Naming conventions**
This document outlines the naming convetions to be used for naming all the objects in the data warehouse such as tables, views, columns, schema etc.


Table of Contents:

1. General Principles
2. Table naming conventions
    a. Bronze Layer
    b. Silver Layer
    c. Gold Layer

3. Column naming convetions
    -surrogate keys
    -technical columns

4. Stored procedures


**General Principles**

1. The snake_case will be used (all objects written in lower case and words are separated by an underscore)
2. Every object is named in English
3. Do not use reserved words for names

**Table naming conventions**

*Bronze Layer*
Table names start with the source system and the table names matches the source system name.
format: <source_system>_<table_name>
e.g. crm_customers

*Silver Layer*
Table names start with the source system and the table names matches  the source system name.
format: <source_system>_<table_name>
e.g. crm_customers

*Gold Layer*
Table names are meaningful and prefixed with the category
format: <category>_<table_name>
e.g. fact_sales, dim_geography

where dim refers to a dimension table and fact refers to a fact table

**Column naming convetions**

*Surrogate keys*
All primary keys in dimension tables must be suffixed by _key
format: <table_name>_key
e.g. for the dim_geography table the primary key is named geography_key

*Technical Columns*
All system-generated columns must be prefixed by dwh
format: dwh_<column_name>
e.g. dwh_last_modified

**Stored Procedure**
All stored procedures for loading data must be named following this format:
load_<layer>:where 'layer' refers to the bronze,silver or gold layer that is being loaded
e.g. load_silver : stored procedure for loading data into the silver layer
