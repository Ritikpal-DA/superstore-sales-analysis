--Overall Business Performance — Total Sales and Profit
SELECT SUM(sales) AS Total_Sales, SUM(profit) AS Total_Profit
FROM orders;

--Regional Sales Performance — Which Region Generates Most Revenue
SELECT region, SUM(sales) AS Total_Sales
FROM orders
GROUP BY region
ORDER BY SUM(sales) DESC;

--Category Profitability Analysis — Most Profitable Product Category
SELECT category, SUM(profit) AS Total_Profit
FROM orders
GROUP BY category
ORDER BY SUM(profit) DESC;

--Top 5 High Value Customers by Total Sales
select customer_name,SUM(sales) as Total_Sales
from orders
group by customer_name
order by SUM(sales) DESC
limit 5;

--Discount Analysis — Which Sub-Category Offers Highest Average Discount
select sub_category,AVG(discount) as Highest_Average_discount
from orders
group by sub_category
order by AVG(discount) DESC;

--Order Volume by State — Which State Has Most Orders
select state,COUNT(order_id) as Order_Count
from orders 
group by state
order by COUNT(order_id) DESC;

--Customer Segment Performance — Sales and Profit by Segment
select segment,SUM(sales) as Total_sales,Sum(profit) as Total_Profit
from orders
group by segment
order by SUM(sales) DESC;

--Yearly Sales Trend — Which Year Had Highest Revenue
SELECT EXTRACT(YEAR FROM order_date) AS Year,
       SUM(sales) AS Total_Sales
FROM orders
GROUP BY EXTRACT(YEAR FROM order_date)
ORDER BY Total_Sales DESC;

--Loss Detection — Top 10 Loss Making Orders
SELECT order_id, profit
FROM orders
WHERE profit < 0
ORDER BY profit ASC
LIMIT 10;

--Regional Profitability — Which Region Has Highest Average Profit Per Order
SELECT region, AVG(profit) AS Avg_Profit_Per_Order
FROM orders
GROUP BY region
ORDER BY AVG(profit) DESC
LIMIT 1;
