[Database_Setup.sql](https://github.com/user-attachments/files/32612590/Database_Setup.sql)# global-electronics-sql-analysis
SQL Server analysis of global electronics retail data using joins, CTEs, window functions, customer segmentation, views, and business-focused queries.
# Global Electronics Retail SQL Analysis

## Project Overview

This project analyzes the sales performance of a global electronics retailer using Microsoft SQL Server and SQL Server Management Studio (SSMS).

The goal was to transform raw CSV files into a relational database and use SQL to answer business questions related to revenue, profitability, products, customers, sales channels, geographical performance, and sales trends.

The dataset contains more than 62,000 sales records covering the period from 2016 to 2021.

## Tools Used

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- SQL
- GitHub

## Database Structure

The database contains five main tables:

- Sales
- Customers
- Products
- Stores
- Exchange_Rates

Primary and foreign keys were used to create relationships between the tables.

The Sales table serves as the main transactional table.

## SQL Skills Demonstrated

This project demonstrates the use of:

- SELECT
- WHERE
- GROUP BY
- HAVING
- JOIN
- CASE
- Aggregate Functions
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions
- RANK()
- LAG()
- NTILE()
- PARTITION BY
- Views
- Primary Keys
- Foreign Keys
- Data Validation

## Business Questions

The analysis answered questions such as:

- What is the company's total revenue and profit?
- Which product categories generate the most revenue?
- Which products perform best?
- Which countries generate the most sales?
- How do online and physical-store sales compare?
- Who are the highest-value customers?
- How has revenue changed over time?
- What is the year-over-year revenue growth?
- Which products rank highest within each category?
- How can customers be segmented based on spending?

## Key Metrics

| Metric | Result |
|---|---:|
| Total Revenue | $55.76M |
| Total Profit | $32.66M |
| Profit Margin | 58.58% |
| Total Orders | 26,326 |
| Units Sold | 197,757 |
| Customers | 11,887 |
| Average Order Value | $2.12K |

## Key Findings

### Product Performance

Computers generated approximately $19.30 million in revenue, making them the highest-performing product category.

### Sales Channel Performance

Physical stores generated approximately $44.35 million, accounting for about 79.5% of total revenue.

Online sales generated approximately $11.40 million.

### Geographic Performance

The United States was the highest-performing physical-store market, generating approximately $23.76 million in revenue.

### Sales Trend

2019 recorded the highest annual revenue among the complete years in the dataset.

The 2021 data represents only part of the year and was therefore treated carefully when evaluating year-over-year performance.

### Customer Analysis

Customers were segmented into four spending groups using the SQL NTILE() window function:

- High Value
- Medium-High Value
- Medium-Low Value
- Low Value

This made it possible to analyze how customer groups contributed to total revenue.

## Advanced SQL Analysis

The project also includes:

- Product ranking within categories using RANK()
- Year-over-year growth using LAG()
- Customer segmentation using NTILE()
- Reusable reporting logic using SQL Views
- Multi-table analysis using INNER JOIN

## Repository Files

[Database_Setup.sql](https://github.com/user-attachments/files/32612658/Database_Setup.sql) – database structure, keys and relationships
[Data_validation.sql](https://github.com/user-attachments/files/32612656/Data_validation.sql) – duplicate, NULL and data-quality checks
[Busniess_analysis.sql](https://github.com/user-attachments/files/32612661/Busniess_analysis.sql) – core business analysis
[advanced_analysis.sql](https://github.com/user-attachments/files/32612660/advanced_analysis.sql)– CTEs and window functions
[customer_segmentation.sql](https://github.com/user-attachments/files/32612654/customer_segmentation.sql) – customer value segmentation
[View.sql](https://github.com/user-attachments/files/32612659/View.sql) – reusable SQL views

## Dataset

Global Electronics Retailer dataset from Maven Analytics Data Playground.

## Author

**Aaron Yunusa**


Data Analyst | Excel | SQL | Power BI | Python
