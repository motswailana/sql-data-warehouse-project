Data Warehouse and Analytics Project
This repository showcases my implementation of a data warehousing and analytics solution, demonstrating skills in data engineering, ETL development, and analytical reporting. The project follows industry best practices for building a scalable data pipeline.

Data Architecture
The solution implements a Medallion Architecture with three layers:

https://drive.google.com/file/d/1G_KMDJ7t8dYA2rwWdj4nIxJ246owxJgi/view?usp=sharing

Bronze Layer: Raw data ingestion from CSV sources into SQL Server

Silver Layer: Data cleansing, standardization, and quality checks

Gold Layer: Business-ready star schema models optimized for analytics

Project Highlights
This implementation demonstrates:

End-to-end data pipeline from source systems to analytical insights

SQL-based ETL processes with documented transformation logic

Dimensional modeling following the star schema best practices

Actionable reporting on key business metrics

This project involves:
1. **Data Architecture**: Designing a Modern Data Warehouse Using Medallion Architecture **Bronze**, **Silver**, and **Gold** layers.
2. **ETL Pipelines**: Extracting, transforming, and loading data from source systems into the warehouse.
3. **Data Modeling**: Developing fact and dimension tables optimized for analytical queries.
4. **Analytics & Reporting**: Creating SQL-based reports and dashboards for actionable insights.

## Project Requirements

### Building the Data Warehouse (Data Engineering)

#### Objective
Develop a modern data warehouse using SQL Server to consolidate sales data, enabling analytical reporting and informed decision-making.

#### Specifications
- **Data Sources**: Import data from two source systems (ERP and CRM) provided as CSV files.
- **Data Quality**: Cleanse and resolve data quality issues prior to analysis.
- **Integration**: Combine both sources into a single, user-friendly data model designed for analytical queries.
- **Scope**: Focus on the latest dataset only; historization of data is not required.
- **Documentation**: Provide clear documentation of the data model to support both business stakeholders and analytics teams.

---

### BI: Analytics & Reporting (Data Analysis)

#### Objective
Develop SQL-based analytics to deliver detailed insights into:
- **Customer Behavior**
- **Product Performance**
- **Sales Trends**

These insights empower stakeholders with key business metrics, enabling strategic decision-making.  

If you would like more details, please refer to

Repository Structure

data-warehouse-project/

├── datasets/               # Source CSV files (ERP + CRM systems)

├── docs/                   # Architecture diagrams & documentation

│   ├── data_models.drawio  # Star schema diagram

│   └── data_catalog.md     # Dataset documentation

├── scripts/                # SQL implementation

│   ├── bronze/             # Raw data ingestion

│   ├── silver/             # Transformation logic 

│   └── gold/               # Analytical models

└── tests/                  # Data quality checks

License
This project is licensed under the MIT License.

Note: Inspired by tutorial concepts from YT: Data With Baraa
