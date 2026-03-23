Sales & Revenue Analysis — Superstore Dataset
A full-stack data analysis project built on 4 years of retail sales data (2014–2017). The project follows a real-world analyst workflow: data exploration and business queries in SQL, exploratory analysis and visualization in Python, and an interactive dashboard in Power BI.
Tools: MS SQL Server · Python (Pandas, Matplotlib, Seaborn) · Power BI · Jupyter Notebook

Problem Statement:

Retail businesses generate large volumes of transactional data but often lack visibility into which regions, categories, and customer segments are actually driving profitability — and which are destroying it through excessive discounting. This project analyzes ~9,800 orders across 4 regions to answer those questions and surface actionable insights.


SQL Analysis (MS SQL Server):

Wrote business-focused queries covering aggregations, filtering, CTEs, and window functions:
QueryTechnique UsedProfit by RegionGROUP BY, SUM, ORDER BYTop 5 loss-making productsWHERE, TOP N, ORDER BYMonth-over-month revenue growthCTE + LAG window functionAverage order value by segmentAVG, GROUP BYRunning total of sales over timeCTE + SUM OVER window functionDiscount-to-profit ratio by categoryROUND, NULLIF, DIVIDE

Key Findings:


Regional Performance:


West region leads in both sales and profit
South region consistently underperforms across all metrics


Category Profitability:


Technology generates the highest profit despite mid-range sales volume
Furniture has the worst profitability — high discounts relative to margins
Office Supplies sits in the middle on both metrics

Discounting Problem:


Strong negative correlation between discount rate and profit
Orders with discounts above 40% frequently result in net losses
Furniture category shows the worst discount-to-profit ratio (avg discount 17%, lowest profit)

Sales Trends:


Consistent year-over-year growth from 2014 to 2017
Recurring Q4 sales spikes every year — likely driven by year-end purchasing cycles
Seasonal dips at the start of each year (Q1)

Customer Segments:


Consumer segment drives the highest sales volume (~50% of total)
Corporate segment has a higher average order value than Consumer


Python EDA:

Performed exploratory analysis in Jupyter Notebook using Pandas, Matplotlib, and Seaborn:

Monthly sales trend (2014–2017) — time series line chart
Profit by category — bar chart
Sales by region — comparative bar chart
Discount vs Profit scatter plot — reveals negative correlation with loss threshold
Sales by customer segment — bar chart


Power BI Dashboard:

Built an interactive single-page dashboard with:

KPI Cards — Total Sales ($2.30M), Total Profit ($286K), Profit Margin (12.47%)
Sales by Region — horizontal bar chart
Profit by Category — horizontal bar chart
Monthly Sales Trend — area line chart (2014–2017)
Sales by Segment — horizontal bar chart
Slicers — Filter by Year (2014–2017) and Region (Central/East/South/West)

All visuals are cross-filtered — selecting a year or region dynamically updates every chart on the page.

Dataset:
Source: Superstore Sales Dataset — Kaggle
Size: 9,800 rows · 21 columns
Period: January 2014 – December 2017
