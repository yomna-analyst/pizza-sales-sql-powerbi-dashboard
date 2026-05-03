USE database_pizza_sales;


SELECT * 
FROM [pizza_sales sql 1];

SELECT SUM(quantity) as 'Total quantity 'FROM [pizza_sales sql 1];
SELECT COUNT(distinct pizza_name) as 'Pizza Name' FROM [pizza_sales sql 1];

SELECT SUM(unit_price) as 'total unite price' FROM [pizza_sales sql 1];
SELECT TOP 10 * FROM [pizza_sales sql 1];
SELECT SUM (quantity) as 'Total quantity for medium
'FROM [pizza_sales sql 1] WHERE pizza_size='M';

SELECT SUM(quantity) as 'total quantity for large' FROM [pizza_sales sql 1] WHERE pizza_size='L';

SELECT SUM (quantity) as 'totalquantity for classic' FROM [pizza_sales sql 1] WHERE pizza_category='classic';

SELECT Top 2 pizza_category, sum(quantity) FROM [pizza_sales sql 1]GROUP BY pizza_category ORDER BY sum(quantity) desc;

SELECT pizza_name ,sum(unit_price) FROM [pizza_sales sql 1] GROUP BY pizza_name;
SELECT SUM(quantity)FROM [pizza_sales sql 1] WHERE Pizza_size IN ('M','L');
SELECT SUM(quantity)FROM [pizza_sales sql 1] WHERE Pizza_size NOT IN ('M','L');

SELECT quantity * unit_price as total_price FROM [pizza_sales sql 1];
SELECT SUM (quantity * unit_price) as total_price FROM [pizza_sales sql 1];

--wordfile
--total sales
SELECT SUM (quantity * unit_price) as total_price FROM [pizza_sales sql 1];
--AVg by order
SELECT sum(total_price)/count (distinct order_id) as average_order_value
FROM [pizza_sales sql 1];

--total pizza sold
CREATE VIEW  total_pizza_sold as
SELECT SUM(quantity) as total_pizza_sold FROM [pizza_sales sql 1];

SELECT* FROM total_pizza_sold;


--Total Orders
CREATE VIEW  total_orders as
select count(distinct order_id) as total_orders FROM[pizza_sales sql 1];

SELECT* FROM total_orders ;

--Average Pizzas Per Order
CREATE VIEW  Avg_pizza_perorder as


SELECT 
    CAST(SUM(quantity) * 1.0 / COUNT(DISTINCT order_id) AS DECIMAL(10,2)) 
    AS avg_pizzas_per_order
FROM [pizza_sales sql 1];
SELECT* FROM Avg_pizza_perorder ;

-- Daily Trend for Total Orders
CREATE VIEW DAILY_TREND_VIEW
AS
SELECT DATENAME(DW,order_date) AS day_name,
COUNT(distinct order_id)  AS Total_orders
FROM [pizza_sales sql 1]
--WHERE order_date IS NOT NULL
GROUP BY DATENAME(DW,order_date);

SELECT* FROM DAILY_TREND_VIEW ;






   -- SELECT TOP 10 * FROM [pizza_sales sql 1];



--total sales

ALTER TABLE [pizza_sales sql 1]
ADD total_sales FLOAT;
GO

UPDATE [pizza_sales sql 1]
SET total_sales = quantity * unit_price;

SELECT *
FROM [pizza_sales sql 1];

--tax
ALTER TABLE [pizza_sales sql 1]
ADD tax FLOAT;
GO

UPDATE [pizza_sales sql 1]
SET tax = total_price * 0.05;

SELECT * 
FROM [pizza_sales sql 1];

--final price
ALTER TABLE [pizza_sales sql 1]
ADD final_price float;
GO
UPDATE [pizza_sales sql 1]
SET final_price = total_price + tax;

SELECT * 
FROM [pizza_sales sql 1];

SELECT DATENAME(dw,order_date) as Day_name,
round (SUM(total_sales),0) as total_sales ,
COUNT (distinct order_id)as total_orders
FROM [pizza_sales sql 1] GROUP BY DATENAME(dw,order_date);

