create database Zepto_Sales_analysis;
use Zepto_Sales_analysis;

select * from zepto_data
limit 20;

rename table zepto_v2 to zepto_data;

-- data exploration

-- count the rows

select count(*) from zepto_data;

-- null values

select * from zepto_data
where name is null or
mrp is null or
discountpercent is null or
availableQuantity is null or
discountedSellingPrice is null or
weightingms is null or
outofStock is null or
quantity is null;

-- different product categories

select distinct category from zepto_data
order by category;

-- product in stock and out of stock

select outofstock, count(outofstock) from zepto_data
group by outofstock;

-- product names present multiple times

select name, count(name) as 'Num of SKU'
from zepto_data
group by name
having count(name) > 1
order by 2 desc;

-- data cleaning

-- products with price 0

select category, name from zepto_data
where mrp = 0;

SET SQL_SAFE_UPDATES = 0;

delete from zepto_data
where mrp = 0;

-- convert paise to rupees

update zepto_data
set mrp = mrp/100,
discountedsellingprice = discountedsellingprice/100;

-- business question

-- Find top 10 best-value products based on discount percentage

select distinct name, mrp, discountpercent from zepto_data
order by discountpercent desc
limit 10;

-- Find high-MRP products that are currently out of stock

select distinct name, mrp from zepto_data
where outofstock = 'TRUE'
order by mrp desc;

-- Find potential revenue for each product category

select category,
sum(discountedsellingprice * availablequantity) as revenue
from zepto_data
group by category
order by revenue;

-- Filter expensive products (MRP > ₹500) with minimal discount (<8)

select distinct name,mrp,discountpercent
from zepto_data
where mrp > 500 and discountpercent < 8
order by mrp desc, discountpercent desc;

-- Identify top 5 categories offering highest average discount percentage

select category,
round(avg(discountpercent),2) as avg_discount
from zepto_data
group by category
order by avg_discount desc
limit 5;

-- Find the price per gram for products above 100 g and sort by best value

select category, name, weightingms, discountedsellingprice,
round(discountedsellingprice/weightInGms,2) as pricePerGram
from zepto_data
where weightInGms >= 100
order by pricePergram;

-- group the products into categories like low, medium, bulk

select distinct name, weightingms,
case when weightingms < 1000 then 'Low'
when weightingms < 5000 then 'Medium'
else 'Bulk' end as weight_category
from zepto_data;

-- What is the total inventory weight per category

select category, sum((weightingms*availablequantity)/100) as sum_weightKG
from zepto_data
group by category
order by sum_weightKG;
