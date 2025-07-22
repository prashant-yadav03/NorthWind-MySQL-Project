# 📊 NorthWind SQL Analysis Project

## 🧠 Overview
This SQL project presents an end-to-end business analysis on the classic **NorthWind database** using **MySQL**.
The project consists of 15 structured SQL queries, each designed to answer a specific business question using real-world concepts like customer profiling, 
order value segmentation, sales tracking, and supplier/product analysis.
This project was created to showcase practical SQL skills that are vital for roles in data analytics and business intelligence.

---

## 📦 Dataset Description
The **NorthWind** database simulates a trading company that imports and exports specialty foods. It contains the following key relational tables:

- `Customers` – customer details
- `Orders` – customer orders
- `OrderDetails` – line items of each order
- `Products` – product information
- `Employees` – staff handling orders
- `Suppliers` – vendors providing products
- `Shippers` – delivery providers
- `Categories` – classification of products
The database schema supports real-world business operations such as order tracking, customer relationship management, and sales analytics.

---

## 🎯 Objectives

The project focuses on solving a wide range of SQL problems with increasing complexity. Each question in the script targets a specific SQL concept:
1. Basic SELECT queries and filtering
2. JOINS across multiple tables
3. Aggregations using `GROUP BY` and `HAVING`
4. Subqueries and Common Table Expressions (CTEs)
5. Business-specific KPIs: Top products, high-value customers, etc.
6. Data-driven insights using logic-based filtering

---

## 🧰 Tools & Technologies

- **Database**: MySQL
- **Platform**: MySQL Workbench
- **Language**: SQL
- **Dataset Source**: NorthWind sample dataset

---

## ✅ Key Business Queries & Insights

| Query No. | Topic | SQL Concepts Used | Business Insight |
|----------|-------|-------------------|------------------|
| 1 | List all customers | `SELECT` | Explore customer base |
| 2 | Products below $15 | `WHERE`, filter | Budget-friendly products |
| 4 | Orders in 1997 | Date filters | Seasonal activity |
| 6 | Employee handling orders | Multi-table `JOIN` | Order flow analysis |
| 7 | Customers per country | `GROUP BY` | Market segmentation |
| 8 | Average price by category | Aggregation | High vs low-value categories |
| 9 | Orders per employee | `COUNT` + `GROUP BY` | Team performance |
| 11 | Top 3 ordered products | `SUM`, `ORDER BY`, `LIMIT` | Bestseller list |
| 12 | Customers who spent > $10K | `HAVING` | High-value customer identification |
| 14 | Largest single order | Nested subquery | Biggest one-time sale |
| 15 | Products never ordered | `NOT IN` | Dead stock detection |

---

## 🚀 How to Run This Project

1. Install **MySQL Server** and a GUI tool like **MySQL Workbench**
2. Download or clone this repository:
3. Import **NorthWind** database scheme into your local MySQL instance.
4. Open the file `Prashant_Yadav_CDPA_B4.sql`
5. Execute the queries section by section to view results and insights.

---

## 🧑‍💻 My Role & Learning Outcome

As the sole contributor to this project, I applied a wide range of SQL skills that are essential for data analytics and reporting roles.
Through this project, I:
1. Strengthened my understanding of relational databases
2. Practiced business-focused problem-solving using SQL
3. Gained experience with writing efficient and readable SQL code
4. Learned to extract meaningful insights from raw data

--- 

## 📎 File Structure
Prashant_Yadav_CDPA_B4.sql – Contains 15 section with SQL code and inline analysis.

---

## 📌 Summary
This project demonstrates real-world SQL capabilities including filtering, joins, aggregations, subqueries, and analytical querying.
