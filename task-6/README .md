# Task 6 – Sales Trend Analysis Using Aggregations

## 📌 Overview
This project is part of my **Data Analyst Internship** at **Elevate Labs**.  
The goal is to analyze monthly revenue and order volume using SQL, and produce advanced time-series metrics (AOV, MoM/YoY growth, cumulative share, seasonality) to support business decisions.

## 🎯 Objectives
- Compute monthly revenue and order volume.
- Calculate Average Order Value (AOV), Month-over-Month (MoM) and Year-over-Year (YoY) growth.
- Identify top months and their cumulative contribution to revenue.
- Analyze product-line level trends and seasonality.
- Use advanced SQL features: CTEs, window functions, ranking, and aggregate analytics.
- Prepare deliverables: `queries.sql`, result screenshots, and concise insights.

## 🛠 Tools & Technologies
- PostgreSQL 17  
- pgAdmin 4 (or any SQL client)  
- CSV dataset (`online_sales.csv`)  
- Optional: Power BI / Excel for visualization

## 📂 Dataset (table: `online_sales`)
Key columns used:
- `ORDERNUMBER` — Order ID  
- `ORDERDATE` — Order date/time (or YEAR_ID / MONTH_ID if available)  
- `SALES` — Sales amount (numeric)  
- `QUANTITYORDERED` — Quantity  
- `PRODUCTLINE` — Product category  
- `COUNTRY` — Customer country  
- `MONTH_ID`, `YEAR_ID`, `QTR_ID` — Precomputed date parts (optional)  
- Other columns included: `PRICEEACH`, `MSRP`, `CUSTOMERNAME`, `DEALSIZE`, etc.

> Note: If `ORDERDATE` contains mixed formats, import it as `TEXT` first then convert to `DATE` in SQL.

## 📜 Queries Implemented (in `queries.sql`)
The repository includes a full set of SQL queries. Highlights:

1. **Create table & import dataset**
2. **Verify data** (`SELECT COUNT(*)`, `SELECT * LIMIT 10`)
3. **Convert ORDERDATE to DATE** (if required)
4. **Monthly Revenue & Order Volume**
5. **Top 3 / Top 5 Months by Revenue**
6. **Compare Monthly Trends by Year (month x year)**
7. **Monthly Average Order Value (AOV)**
8. **Top 5 Months with Cumulative Share** (window functions)
9. **Monthly AOV & Rank** (RANK()/ROW_NUMBER())
10. **Productline Monthly Revenue Trend**
11. **Seasonality Analysis** (average revenue by month across years)
12. **Advanced**: YoY growth per month, MoM growth, cumulative revenue over time

(Scripts use CTEs and window functions for clarity and performance.)

## ✅ How to run (quick)
1. Install PostgreSQL & pgAdmin.  
2. Create a database (e.g., `sales_db`).  
3. Create table schema (or use the `CREATE TABLE` script included).  
4. Import `online_sales.csv` via pgAdmin Import/Export (CSV, Header = Yes, Delimiter = ,).  
5. Open `queries.sql` in pgAdmin Query Tool and run desired queries.  
6. Export query results as CSV or take screenshots for submission.



