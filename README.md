# OVERVIEW
This project provides an analysis of financial performance using data to evaluate key metrics such as Revenue, Cost of Goods Sold, Gross Profit, and Gross Profit Margin. It reviews year-over-year (YoY) performance, revenue trend and geographical performance (by country). The goal was to identify profitability changes, growth pattern and recommend strategies to improve overall business performance. It offers actionable insights for finance and management decision making. 

## Objectives Of The Project
•	Track revenue and profitability trends
•	Comparative analysis of key performance metrics (year-over-year)
•	Identify high and low performing regions
•	To evaluate the operational efficiency of the company
•	Compare profit margin to company profit margin benchmark

## The Dataset
The data used in this analysis comprised of three separate datasets (product data, sales data and cost data). The product data contained the cost price and the sales price. The sales data contained the date, country, units sold and some other information. While the cost data contained the price and the Cost of goods sold. The three datasets were merged to get a single dataset usd for the analysis.  The combined dataset contain 1044 rows. 


## Key Metrics Analyzed
•	Revenue: Total income generated
•	Cost of Goods Sold
•	Gross Profit: Earnings after deducting the COGS
•	Gross Profit Margin
•	Year-Over-Year Growth rate: Percentage change compared to previous year’s metrics
•	Revenue by Country (Geographical analysis)
•	Revenue Trend: Analysis of revenue growth overtime.

## Methodology 
•	SQL: For Exploration, cleaning, transformation and aggregation
•	Power Bi: Data modelling, interactive visualization, and dashboard design
•	Expected Gross Profit Margin: I researched and got information about the estimated gross profit margin for each Key product in the dataset, and applied weighted averages to calculate the expected gross profit margin for a retailer dealing in the products. This provides insights into operational efficiency and profitability potential.

## Key Insights
•	The company consistently achieved a Gross Profit Margin (31.82% in 2022 and 31. 47%) above the expected margin (30.8%) in both years of operation. However, there is a slight drop (-0.3%) in profit margin in 2023 compared to 2022. This drop was as a result of cost growing at a faster rate than revenue and profit. There was a 9%, 7.96%, and 9.73% increase in revenue, profit and cost respectively.
•	Canada is the top performing country maintaining the rate of revenue and profit growth above the rate of cost growth, which pushed up its profit margin by 1.33% compared to previous year.
•	Though reducing Cost of Goods by -10.84%, Germany experienced a sharp decrease in revenue and profit -10% and -8.15% respectively. This decrease was because of a reduction in sales by 10.8%    compared to 2022 sales.
•	Similar to Germany’s situation is Mexico. It recorded a slight decrease in revenue and profit, however contrary to Germany, cost slightly increased. This suggests operational inefficiency.
•	France and USA showed red flags. Revenue growth was strong in both. However, cost grew at a faster rate. This suggests inefficient cost control.

## Recommendations
•	Audit cost structure in France, Mexico and United States of America. Identify what is diving cost increase (logistics, labour or supplier pricing)
•	Study what Canada management is doing right, and use this as a benchmark for practice across other branches.
•	Focus on cost optimization, margin protection to ensure sustainable profitable growth
