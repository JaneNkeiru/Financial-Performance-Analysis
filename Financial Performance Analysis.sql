-- Creating Tables 
CREATE TABLE product_data (
product_id VARCHAR(15) PRIMARY KEY, -- Creating The product Tables
product TEXT,
category TEXT,
cost_price VARCHAR(10),
sals_price VARCHAR(10),
brand VARCHAR (15),
description TEXT,
image_url TEXT
);

CREATE TABLE product_sales (  -- Creating The product Tables
dte DATE,
customer_type TEXT,
country TEXT,
product_id TEXT,
discount_band TEXT,
units_sold INTEGER
);

-- Meging and Transforming the Datasets
DROP TABLE IF EXISTS sales_data_transformed;
CREATE TEMP TABLE sales_data_transformed AS -- Creating a Temp Table to keep our transformed data
SELECT 
  dte AS date, 
  EXTRACT('YEAR' FROM dte) AS year, -- Extracting the year
  TRIM(INITCAP(to_char(dte, 'month'))) AS month, -- Extracting Month from the date column
  customer_type, country, ps.product_id, LOWER(discount_band) AS discount_band,
  units_sold, product AS product_name, category,
  -- Removing the $ sign from the cost and sales price column and converting to appropraite data type
  TRIM(cost_price, '$')::INTEGER AS cost_price, 
  TRIM(sals_price, '$') AS sales_price,
  brand, description, image_url,
  TRIM(sals_price, '$')::NUMERIC * units_sold AS revenue,
  TRIM(cost_price, '$')::INTEGER * units_sold AS cost,
  (TRIM(sals_price, '$')::NUMERIC * units_sold) - (TRIM(cost_price, '$')::INTEGER * units_sold) 
  		AS profit
FROM product_sales AS ps
INNER JOIN product_data AS pd -- Joining our sales and product datasets
ON ps.product_id = pd.product_id;

DROP TABLE IF EXISTS product_sales_cleaned; -- Removing Complete Duplicate values
CREATE TEMP TABLE product_sales_cleaned AS 
SELECT *
FROM sales_data_transformed
GROUP BY date, year, month, customer_type, country,
		 product_id, discount_band, units_sold, product_name,
		 category, cost_price, sales_price, brand, description, image_url,
		 revenue, cost, profit, profit;

-- Distribution of Products
SELECT product_name, COUNT(*)
FROM product_sales_cleaned
GROUP BY product_name
   
SELECT *
FROM product_sales_cleaned

SELECT year, ROUND((SUM(profit)/SUM(revenue)) *100, 2) AS avg_profit_margin-- Trend of profit_margin
FROM product_sales_cleaned
GROUP BY year;

/* Analysis of revenue, profit, cost and profit margin by country */
SELECT  
	country, 
	SUM(revenue) AS total_revenue,
	SUM(profit) AS total_profit,
	SUM(cost) AS total_cost,
	ROUND((SUM(profit)/SUM(revenue)) *100, 2) AS avg_profit_margin
FROM product_sales_cleaned
GROUP BY country
ORDER BY total_revenue DESC;

/* Analysis of revenue and profit by year and country */
SELECT  
	year,
	country,  
	SUM(revenue) AS total_revenue,
	SUM(profit) AS total_profit,
	SUM(cost) AS total_cost,
	ROUND((SUM(profit)/SUM(revenue)) * 100,2) AS profit_margin,
	SUM(units_sold) AS total_quantity_sold
FROM product_sales_cleaned
GROUP BY ROLLUP (year, country)
ORDER BY country;


/* Analysis of revenue and profit by year and product */
SELECT  
	year,
	customer_type,  
	SUM(revenue) AS total_revenue,
	SUM(profit) AS total_profit,
	SUM(cost) AS total_cost,
	ROUND((SUM(profit)/SUM(revenue)) * 100,2) AS profit_margin,
	SUM(units_sold) AS total_quantity_sold
FROM product_sales_cleaned
GROUP BY ROLLUP (year, customer_type)
ORDER BY customer_type;


