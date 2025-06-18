# Data Catalogue: Gold Layer

## Overview
This catalogue documents the Gold layer tables in the data warehouse, which represent the final dimension and fact tables in a star schema design. These tables are optimized for analytics and reporting.

## Tables

### 1. gold.dim_customers
**Description**: Dimension table containing customer information from both CRM and ERP systems.

**Columns**:
| Column Name | Data Type | Description | Source System | Transformation Rules |
|-------------|-----------|-------------|---------------|-----------------------|
| customer_key | INT | Surrogate key for dimension table | Generated | Sequential number assigned using ROW_NUMBER() |
| customer_id | VARCHAR | Original customer ID from CRM | silver.crm_cust_info | Direct mapping |
| customer_number | VARCHAR | Customer account number | silver.crm_cust_info | Direct mapping |
| first_name | VARCHAR | Customer's first name | silver.crm_cust_info | Direct mapping |
| last_name | VARCHAR | Customer's last name | silver.crm_cust_info | Direct mapping |
| country | VARCHAR | Customer's country | silver.erp_loc_a101 | Direct mapping from joined table |
| marital_status | VARCHAR | Customer's marital status | silver.crm_cust_info | Direct mapping |
| gender | VARCHAR | Customer's gender | Multiple | Prefers CRM data, falls back to ERP if 'n/a' in CRM |
| birthdate | DATE | Customer's date of birth | silver.erp_cust_az12 | Direct mapping from joined table |
| create_date | DATE | Date customer record was created | silver.crm_cust_info | Direct mapping |

**Source Tables**:
- silver.crm_cust_info (primary)
- silver.erp_cust_az12
- silver.erp_loc_a101

**Business Keys**: customer_id, customer_number

### 2. gold.dim_products
**Description**: Dimension table containing product information with category details.

**Columns**:
| Column Name | Data Type | Description | Source System | Transformation Rules |
|-------------|-----------|-------------|---------------|-----------------------|
| product_key | INT | Surrogate key for dimension table | Generated | Sequential number assigned using ROW_NUMBER() |
| product_id | VARCHAR | Original product ID | silver.crm_prd_info | Direct mapping |
| product_number | VARCHAR | Product SKU/number | silver.crm_prd_info | Direct mapping |
| product_name | VARCHAR | Name of the product | silver.crm_prd_info | Direct mapping |
| category_id | VARCHAR | ID of product category | silver.crm_prd_info | Direct mapping |
| category | VARCHAR | Product category name | silver.erp_px_cat_g1v2 | Direct mapping from joined table |
| subcategory | VARCHAR | Product subcategory | silver.erp_px_cat_g1v2 | Direct mapping from joined table |
| maintenance | VARCHAR | Maintenance requirements | silver.erp_px_cat_g1v2 | Direct mapping from joined table |
| cost | DECIMAL | Product cost | silver.crm_prd_info | Direct mapping |
| product_line | VARCHAR | Product line classification | silver.crm_prd_info | Direct mapping |
| start_date | DATE | Date product became active | silver.crm_prd_info | Direct mapping |

**Source Tables**:
- silver.crm_prd_info (primary)
- silver.erp_px_cat_g1v2

**Business Keys**: product_id, product_number

**Filter**: Only includes current products (prd_end_dt IS NULL)

### 3. gold.fact_sales
**Description**: Fact table containing sales transaction data with links to dimensions.

**Columns**:
| Column Name | Data Type | Description | Source System | Transformation Rules |
|-------------|-----------|-------------|---------------|-----------------------|
| order_number | VARCHAR | Sales order number | silver.crm_sales_details | Direct mapping |
| product_key | INT | Foreign key to dim_products | gold.dim_products | Lookup via product_number |
| customer_key | INT | Foreign key to dim_customers | gold.dim_customers | Lookup via customer_id |
| order_date | DATE | Date order was placed | silver.crm_sales_details | Direct mapping |
| shipping_date | DATE | Date order was shipped | silver.crm_sales_details | Direct mapping |
| due_date | DATE | Date order is due | silver.crm_sales_details | Direct mapping |
| sales_amount | DECIMAL | Total sales amount | silver.crm_sales_details | Direct mapping |
| quantity | INT | Quantity ordered | silver.crm_sales_details | Direct mapping |
| price | DECIMAL | Unit price | silver.crm_sales_details | Direct mapping |

**Source Tables**:
- silver.crm_sales_details (primary)
- gold.dim_products
- gold.dim_customers

**Grain**: One record per sales order line item

**Relationships**:
- Links to dim_products via product_key
- Links to dim_customers via customer_key

## Data Lineage
All gold layer tables are derived from silver layer tables with additional transformations and joins to create business-ready dimensional models. The gold layer follows star schema design principles with clearly defined dimensions and facts.

## Usage Notes
- These tables are optimized for analytical queries
- Dimensions contain slowly changing attributes
- Fact table contains measurable business metrics
- Tables should be queried directly for reporting and analytics
