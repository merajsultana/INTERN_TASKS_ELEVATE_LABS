# 🛒 Task 7 – Sales Summary using SQLite & Python

## 📖 Objective
This project connects **Python** with a **SQLite database** to pull simple sales information and generate a **basic + advanced sales summary** with visualizations.

---

## ⚙️ Tools Used
- Python 
- SQLite (built into Python, no installation needed)
- Pandas
- Matplotlib
- Google Colab / Jupyter Notebook

---

## 📂 Files in this Repository
- `create_sales_db.py` → Creates `sales_data.db` with sample sales table & data.
- `sales_summary.py` → Fetches data, prints summary, and plots bar chart.
- `sales_data.db` → SQLite database file (generated).
- `revenue_chart.png` → Revenue by product (bar chart).
- `quantity_pie.png` → Quantity share by product (pie chart).
- `README.md` → Project documentation.

---

## 🗄️ Database Schema
**Table: sales**

| Column   | Type    | Description                        |
|----------|---------|------------------------------------|
| id       | INTEGER | Primary Key (auto increment)       |
| product  | TEXT    | Product Name                       |
| quantity | INTEGER | Quantity Sold                      |
| price    | REAL    | Price per Unit                     |

---


