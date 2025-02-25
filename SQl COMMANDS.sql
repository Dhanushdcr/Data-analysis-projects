create database pizza_db;
use pizza_db;
select * from pizza_sales;
select sum(total_price) as Total_Revenue from pizza_sales;
select sum(total_price)/count(distinct order_id) as Avg_Order_value from pizza_sales;
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales;
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales;
SELECT 
    DAYNAME(order_date) AS Order_day,
    COUNT(DISTINCT order_id) AS Total_orders
FROM 
    pizza_sales
GROUP BY 
    DAYOFWEEK(order_date),
    DAYNAME(order_date)
ORDER BY 
    DAYOFWEEK(order_date);
select monthname(order_date) as Order_month,count(DISTINCT order_id) as Total_orders from pizza_sales
group by MONTHNAME(order_date) order by Total_orders desc;

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category;
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size order by PCT desc;

select pizza_name,sum(total_price) as Total_Revenue from pizza_sales
group by pizza_name
order by Total_Revenue desc Limit 5;

select pizza_name,sum(total_price) as Total_Revenue from pizza_sales
group by pizza_name
order by Total_Revenue asc Limit 5;

select pizza_name,sum(quantity) as Total_quantity from pizza_sales
group by pizza_name
order by Total_quantity desc Limit 5;

select pizza_name,sum(quantity) as Total_quantity from pizza_sales
group by pizza_name
order by Total_quantity asc Limit 5;

select pizza_name,count(distinct order_id) as Total_Orders from pizza_sales
group by pizza_name
order by Total_Orders  desc Limit 5;

select pizza_name,count(distinct order_id) as Total_Orders from pizza_sales
group by pizza_name
order by Total_Orders  asc Limit 5;