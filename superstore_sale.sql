use assignment;
select * from superstore_sales;

-- What is the total sales amount for the entire period?
SELECT SUM(Sales) AS Total_Sales FROM superstore_sales;

-- How much revenue was generated in each region ?
SELECT Region, SUM(Sales) AS Total_Sales FROM superstore_sales GROUP BY Region;

-- What are the total sales per product category?
SELECT Category, Round(SUM(Sales),2) AS Total_Sales FROM superstore_sales GROUP BY Category;

-- Which products generated the highest sales?
SELECT Product_Name, SUM(Sales) AS Total_Sales 
FROM superstore_sales 
GROUP BY Product_Name 
ORDER BY Total_Sales DESC
LIMIT 10;

-- What is the total sales per customer?
SELECT Customer_ID, Round(SUM(Sales),2) AS Total_Sales FROM superstore_sales GROUP BY Customer_ID;

-- Who are the top 10 customers based on total sales?
SELECT Customer_ID, Round(SUM(Sales),2) AS Total_Sales 
FROM superstore_sales
GROUP BY Customer_ID 
ORDER BY Total_Sales DESC
LIMIT 10;

--  How do different order priorities (e.g., high, medium, low) affect total sales?
SELECT Order_ID, SUM(Sales) AS Total_Sales FROM superstore_sales GROUP BY Order_ID;

-- What were the total sales for each month?
SELECT YEAR(Order_Date) AS Year, MONTH(Order_Date) AS Month, Round(SUM(Sales),2) AS Total_Sales 
FROM superstore_sales 
GROUP BY YEAR(Order_Date), MONTH(Order_Date);

-- How have sales changed year over year?
SELECT YEAR(Order_Date) AS Year, Round(SUM(Sales),2) AS Total_Sales 
FROM superstore_sales
GROUP BY YEAR(Order_Date);

-- Are there any noticeable sales peaks during certain months or seasons?
SELECT MONTH(Order_Date) AS Month, Round(SUM(Sales),2) AS Total_Sales 
FROM superstore_sales 
GROUP BY MONTH(Order_Date);

-- What is the total sales for each product?
SELECT Product_Name, SUM(Sales) AS Total_Sales 
FROM superstore_sales 
GROUP BY Product_Name;

--  Can you segment customers by their total sales and identify high-value customers?
SELECT Customer_ID, SUM(Sales) AS Total_Sales 
FROM superstore_sales 
GROUP BY Customer_ID 
HAVING Total_Sales > 1000; 

-- Which states or regions have the highest sales?
SELECT State, SUM(Sales) AS Total_Sales 
FROM superstore_sales
GROUP BY State
ORDER BY Total_Sales DESC;

-- What is the sales by region and product category?
SELECT Region, Category, SUM(Sales) AS Total_Profit 
FROM superstore_sales 
GROUP BY Region, Category;

-- Which are the top 5 regions with the highest total sales?
SELECT Region, Round(SUM(Sales),2) AS Total_Sales 
FROM superstore_sales 
GROUP BY Region
ORDER BY Total_Sales DESC
LIMIT 5;

-- Are there any sales transactions with unusually high or low values?
SELECT * FROM superstore_sales WHERE Sales > 1000;

