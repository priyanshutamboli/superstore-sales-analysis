CREATE DATABASE superstore_analysis;
USE superstore_analysis

--Table overview
SELECT * FROM train

--Row count
SELECT COUNT(*) FROM train

--Null values
SELECT 
    SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS null_sales,
    SUM(CASE WHEN Region IS NULL THEN 1 ELSE 0 END) AS null_region,
    SUM(CASE WHEN Category IS NULL THEN 1 ELSE 0 END) AS null_category
FROM train;

--Table information 
SELECT COLUMN_NAME, DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'train';

--Data types
SELECT COLUMN_NAME, DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'train';

--Distinct values in categorical values
SELECT DISTINCT Region FROM train;
SELECT DISTINCT Category FROM train;
SELECT DISTINCT Segment FROM train;

/*1. Which region generates the most profit? */
SELECT 
    Region,
    SUM(Profit) AS total_profit
FROM train
GROUP BY Region

/* 2.What are the top 5 loss-making products */
SELECT TOP 5
    Product_Name,
    ROUND(SUM(Profit),2) AS loss
FROM train
WHERE Profit<0
GROUP BY Product_Name
ORDER BY loss

/* 3.Month-over-Month revenue growth.*/
WITH monthly_sales AS (
    SELECT 
        DATEPART(YEAR, [Order_Date]) AS order_year,
        DATEPART(MONTH, [Order_Date]) AS order_month,
        ROUND(SUM(Sales), 2) AS total_revenue
    FROM train
    GROUP BY 
        DATEPART(YEAR, [Order_Date]), 
        DATEPART(MONTH, [Order_Date])
)
SELECT 
    order_year,
    order_month,
    total_revenue,
    LAG(total_revenue, 1) OVER (ORDER BY order_year, order_month) AS prev_month_revenue,
    ROUND(total_revenue - LAG(total_revenue, 1) OVER (ORDER BY order_year, order_month), 2) AS mom_growth
FROM monthly_sales
ORDER BY order_year, order_month;

/* 4. Which customer segment has the highest average order value */
SELECT 
    Segment,
    AVG(Sales) AS avg_order_value
FROM train
GROUP BY Segment
ORDER BY avg_order_value DESC

/* 5. What's the running total of sales over time? */
WITH monthly_sales AS (
    SELECT 
        DATEPART(YEAR, [Order_Date]) AS order_year,
        DATEPART(MONTH, [Order_Date]) AS order_month,
        ROUND(SUM(Sales), 2) AS total_revenue
    FROM train
    GROUP BY 
        DATEPART(YEAR, [Order_Date]), 
        DATEPART(MONTH, [Order_Date])
)
SELECT 
    order_year,
    order_month,
    total_revenue,
    ROUND(SUM(total_revenue) OVER (ORDER BY order_year, order_month), 2) AS running_total
FROM monthly_sales
ORDER BY order_year, order_month;

/* 6. Which category has the worst discount-to-profit ratio? */
SELECT
    Category,
    ROUND(AVG(Discount), 2) AS avg_discount,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(AVG(Discount) / NULLIF(SUM(Profit), 0), 8) AS discount_to_profit_ratio
FROM train 
GROUP BY Category
ORDER BY discount_to_profit_ratio DESC;