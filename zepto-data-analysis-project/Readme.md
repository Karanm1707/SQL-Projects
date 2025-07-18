🛒 Zepto E-commerce SQL Data Analyst Portfolio Project

A complete end-to-end data analyst portfolio project built using real-world e-commerce inventory data scraped from Zepto — one of India’s fastest-growing quick-commerce startups.

This project simulates how actual data analysts work in fast-paced product and retail analytics environments, covering everything from raw data setup to actionable business insights using SQL.

🚀 Who Is This Project For?
📊 Aspiring Data Analysts looking to showcase hands-on SQL skills in their portfolio

📚 Learners aiming to strengthen SQL through real-world e-commerce scenarios

💼 Interview Candidates targeting roles in retail, e-commerce, or product analytics

📌 Project Objectives
Simulate key tasks performed by data analysts in e-commerce settings:

✅ Set up and explore a messy real-world inventory dataset

✅ Conduct Exploratory Data Analysis (EDA) to analyze categories, availability, and pricing inconsistencies

✅ Perform Data Cleaning (handle nulls, remove invalid entries, normalize pricing)

✅ Write Business-Driven SQL Queries to extract insights around pricing, revenue, inventory, and stock health

📁 Dataset Overview
The dataset is scraped from Zepto's product listings and mimics a typical inventory system with real-world complexity.

Each row represents a unique SKU (Stock Keeping Unit). Duplicate product names appear with varying sizes, weights, discounts, or categories — just like real catalog data.

🔑 Key Columns:
Column	Description
sku_id	Unique product identifier (synthetic primary key)
name	Product name as listed
category	Category (e.g., Fruits, Snacks, Beverages)
mrp	Maximum Retail Price (in ₹, converted from paise)
discountPercent	Discount applied on MRP
discountedSellingPrice	Final price after discount (in ₹)
availableQuantity	Available inventory
weightInGms	Product weight in grams
outOfStock	Boolean flag for stock status
quantity	Units per package or loose quantity

🔧 Project Workflow
1. 🛠️ Database & Table Setup
sql
Copy
Edit
CREATE TABLE zepto (
  sku_id SERIAL PRIMARY KEY,
  category VARCHAR(120),
  name VARCHAR(150) NOT NULL,
  mrp NUMERIC(8,2),
  discountPercent NUMERIC(5,2),
  availableQuantity INTEGER,
  discountedSellingPrice NUMERIC(8,2),
  weightInGms INTEGER,
  outOfStock BOOLEAN,
  quantity INTEGER
);
2. 📥 Data Import
CSV imported via pgAdmin. If not, use the following:

sql
Copy
Edit
\copy zepto(category,name,mrp,discountPercent,availableQuantity,
  discountedSellingPrice,weightInGms,outOfStock,quantity)
FROM 'data/zepto_v2.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', ENCODING 'UTF8');
Faced UTF-8 encoding errors — resolved by saving the CSV using CSV UTF-8 format.

3. 🔍 Data Exploration (EDA)
Counted total records

Previewed data sample and structure

Checked for nulls across columns

Identified distinct categories

Analyzed in-stock vs out-of-stock products

Detected duplicate product names with multiple SKUs

4. 🧹 Data Cleaning
Removed rows where mrp or discountedSellingPrice was zero

Converted prices from paise to rupees for clarity

5. 📊 Business Insights via SQL
Top 10 best-value products based on discount percentage

High-MRP items that are currently out of stock

Estimated potential revenue per category

Flagged expensive items (MRP > ₹500) with low discounts

Ranked top 5 categories by average discount offered

Calculated price per gram for value-for-money insights

Categorized products by weight range: Low, Medium, Bulk

Measured total inventory weight by category

🧠 Key Skills Demonstrated
SQL (CTEs, Aggregations, Filtering, CASE statements)

Data Cleaning and Transformation

Exploratory Data Analysis (EDA)

Business-Oriented Query Writing

Inventory and Pricing Analysis

