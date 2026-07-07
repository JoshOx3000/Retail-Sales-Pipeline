# Retail-Sales-Pipeline
Simple ETL (Extract, Transform, Load) data pipeline built using MySQL and Vanilla SQL

Open to work with others  LinkedIn: https://www.linkedin.com/in/joshua-oxner-615074107/

MySQL Retail Sales Data Pipeline
Project Overview

This project demonstrates a simple ETL (Extract, Transform, Load) data pipeline built using MySQL and Vanilla SQL. The goal is to simulate a real-world data engineering workflow by ingesting raw sales data from a CSV file, validating data quality, transforming the data, and loading it into a clean staging table for downstream analytics.

This project was built as hands-on practice to understand the daily workflow of a Data Engineer using a relational database management system (RDBMS).

Project Objectives
Import raw CSV data into MySQL
Validate data quality issues
Clean and standardize the data
Transform raw data into a staging table
Prepare clean data for analytics and reporting
Practice a basic ETL pipeline using SQL
Technologies Used
Database: MySQL
Language: SQL (Vanilla SQL)
Data Source: CSV File
Environment: MySQL Workbench
Project Structure
Retail-Pipeline/
│
├── 01_create_database.sql
├── 02_create_tables.sql
├── 03_load_csv.sql
├── 04_validation.sql
├── 05_transformation.sql
└── README.md
ETL Workflow
CSV File
      │
      ▼
Raw Table (sales_data_raw)
      │
      ▼
Data Validation
      │
      ▼
Data Transformation
      │
      ▼
Staging Table (stg_sales)
      │
      ▼
Analytics / Reporting
Step 1 — Create Database

Create the project database.

CREATE DATABASE retail_pipeline;

USE retail_pipeline;
Step 2 — Create Raw Table

Create a table to receive raw CSV data without applying business rules.

Example columns include:

Sale ID
Customer Name
Product
Quantity
Unit Price
Sale Date

This table acts as the landing zone for incoming data.

Step 3 — Load Raw Data

Import the CSV file using the MySQL Workbench Table Data Import Wizard into the sales_data_raw table.

After importing, verify the data:

SELECT *
FROM sales_data_raw;
Step 4 — Validate Data Quality

Before transforming the data, several quality checks are performed.

Duplicate Records
GROUP BY sale_id
HAVING COUNT(*) > 1;
Missing Quantities
WHERE quantity IS NULL
Negative Quantities
WHERE quantity < 0
Blank Customer Names

Check for missing or blank customer names.

Invalid Dates

Validate that all dates can be converted into MySQL DATE format.

Step 5 — Transform Data

A staging table is created to store cleaned data.

During the transformation process:

Remove duplicate records using DISTINCT
Remove leading and trailing spaces with TRIM()
Standardize product names using UPPER()
Replace missing quantities with a default value
Convert negative quantities into positive values using ABS()
Convert text dates into MySQL DATE format using STR_TO_DATE()

Example transformations include:

" laptop " → "LAPTOP"
NULL Quantity → 1
-5 → 5
"13/01/2025" → 2025-01-13
Skills Demonstrated
SQL Data Cleaning
ETL Pipeline Design
Data Validation
Data Transformation
Data Standardization
Data Quality Checks
Staging Tables
SQL CASE Statements
String Functions
Date Conversion
MySQL Best Practices
Concepts Practiced
Relational Databases (RDBMS)
ETL Workflow
Data Engineering Fundamentals
Data Quality Management
SQL Transformations
Data Standardization
Staging Layer Design
What I Learned

Through this project I practiced the core responsibilities of a Data Engineer by building a basic ETL pipeline entirely with SQL. I learned how to separate raw and cleaned data, identify common data quality issues, apply business rules during transformation, and prepare datasets for downstream analytics. Although this project is intentionally simple, it reflects the foundational workflow used in production data pipelines.

Future Improvements
Add logging and error handling
Automate pipeline execution with scheduled jobs
Create stored procedures
Build a star schema for analytics
Add dimension and fact tables
Perform incremental data loads
Generate reporting views
Build a dashboard using Power BI or Tableau
Key Skills

MySQL • SQL • ETL • Data Engineering • Data Cleaning • Data Validation • Data Transformation • CSV Import • RDBMS • Staging Tables • CASE Statements • TRIM() • UPPER() • STR_TO_DATE()

One suggestion that would make this portfolio project even stronger

Right now your pipeline ends at the staging table, which is a solid start. To better mirror a real data engineering workflow, consider extending it to:

CSV
   │
   ▼
Raw Table
   │
   ▼
Validation
   │
   ▼
Staging Table
   │
   ▼
Fact Table
   │
   ▼
SQL Analytics
