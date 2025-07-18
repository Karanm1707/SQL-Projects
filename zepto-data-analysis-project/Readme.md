# 🛒 **Zepto E-commerce SQL Data Analyst Portfolio Project**

> A complete end-to-end **Data Analyst Portfolio Project** using SQL on real-world e-commerce data scraped from **Zepto** — one of India’s fastest-growing quick-commerce startups.

This project simulates how actual data analysts work in retail/product teams — from raw data setup to deriving meaningful insights using SQL.

---

## 🚀 **Who Is This Project For?**

- 📊 **Aspiring Data Analysts** building a strong SQL portfolio  
- 📚 **Learners** who want to practice SQL hands-on  
- 💼 **Interview candidates** targeting roles in retail, e-commerce, or product analytics  

---

## 📌 **Project Objectives**

Simulate core responsibilities of e-commerce data analysts:

- ✅ **Set up a real-world inventory database**
- ✅ **Perform Exploratory Data Analysis (EDA)**
- ✅ **Clean & transform raw product data**
- ✅ **Write SQL queries to generate business insights**

---

## 📁 **Dataset Overview**

The dataset is sourced from Zepto’s product listings and mirrors a real e-commerce catalog with:

- Multiple SKUs per product (due to variations in size, weight, packaging)
- Inconsistencies in pricing and stock info, mimicking real-world messiness

### 🔑 **Key Columns**

| Column | Description |
|--------|-------------|
| `sku_id` | Unique product identifier (synthetic primary key) |
| `name` | Product name as listed |
| `category` | Product category (e.g., Fruits, Snacks) |
| `mrp` | Maximum Retail Price (₹, converted from paise) |
| `discountPercent` | Discount applied on MRP |
| `discountedSellingPrice` | Final selling price (₹) |
| `availableQuantity` | Units available in inventory |
| `weightInGms` | Weight in grams |
| `outOfStock` | Boolean flag (in stock or not) |
| `quantity` | No. of units per package |

---

## 🔧 **Project Workflow**

### 🛠️ **1. Database & Table Setup**

```sql
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
```

3. __Data Exploration__
Counted total records

Previewed sample data

Checked for nulls

Identified unique product categories

Compared in-stock vs out-of-stock items

Found duplicate product names with different SKUs

🧹 4. __Data Cleaning__
Removed entries with mrp or discountedSellingPrice = 0

Converted pricing columns from paise to rupees

📊 5. Business Insights (SQL Queries)
🔟 Top 10 best-value products based on discount percent

🚫 Out-of-stock high-MRP products

💰 Estimated potential revenue per category

❌ Flagged expensive items (MRP > ₹500) with low discounts

🏆 Top 5 categories with highest average discounts

⚖️ Price per gram to find value-for-money products

📦 Grouped by weight: Low, Medium, Bulk

⚖️ Total inventory weight by category

🧠 __Skills Demonstrated__
SQL (Filtering, Joins, Aggregation, CTEs, Window functions)

EDA (Data exploration and business thinking)

Data Cleaning and Transformation

Business Logic Development

Retail/Product Domain Understanding

