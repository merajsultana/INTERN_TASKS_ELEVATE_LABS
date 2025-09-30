-- ==========================================
-- SALES TREND ANALYSIS - ADVANCED VERSION
-- Dataset: online_sales
-- ==========================================

-- 1. Monthly Revenue & Order Volume
SELECT 
    YEAR_ID, 
    MONTH_ID, 
    SUM(SALES) AS total_revenue,
    COUNT(DISTINCT ORDERNUMBER) AS order_volume
FROM online_sales
GROUP BY YEAR_ID, MONTH_ID
ORDER BY YEAR_ID, MONTH_ID;

-- 2. Top 3 Months by Revenue
SELECT 
    YEAR_ID, 
    MONTH_ID, 
    SUM(SALES) AS total_revenue
FROM online_sales
GROUP BY YEAR_ID, MONTH_ID
ORDER BY total_revenue DESC
LIMIT 3;

-- 3. Compare Monthly Trends by Year
SELECT 
    YEAR_ID, 
    MONTH_ID, 
    SUM(SALES) AS total_revenue
FROM online_sales
GROUP BY YEAR_ID, MONTH_ID
ORDER BY YEAR_ID, MONTH_ID;

-- 4. Monthly Average Order Value (AOV)
SELECT 
    YEAR_ID, 
    MONTH_ID, 
    ROUND(SUM(SALES) / COUNT(DISTINCT ORDERNUMBER), 2) AS avg_order_value
FROM online_sales
GROUP BY YEAR_ID, MONTH_ID
ORDER BY YEAR_ID, MONTH_ID;

-- 5. Top 5 Revenue-Generating Months with Cumulative Share
WITH monthly_sales AS (
    SELECT 
        YEAR_ID, 
        MONTH_ID, 
        SUM(SALES) AS total_revenue
    FROM online_sales
    GROUP BY YEAR_ID, MONTH_ID
)
SELECT 
    YEAR_ID, 
    MONTH_ID, 
    total_revenue,
    ROUND(SUM(total_revenue) OVER (ORDER BY total_revenue DESC) /
          SUM(total_revenue) OVER () * 100, 2) AS cumulative_share_percent
FROM monthly_sales
ORDER BY total_revenue DESC
LIMIT 5;

-- 6. Monthly Average Order Value & Rank
SELECT 
    YEAR_ID, 
    MONTH_ID, 
    ROUND(SUM(SALES) / COUNT(DISTINCT ORDERNUMBER), 2) AS avg_order_value,
    RANK() OVER (ORDER BY SUM(SALES) / COUNT(DISTINCT ORDERNUMBER) DESC) AS value_rank
FROM online_sales
GROUP BY YEAR_ID, MONTH_ID;

-- 7. Product Line Monthly Revenue Trend
SELECT 
    PRODUCTLINE, 
    YEAR_ID, 
    MONTH_ID, 
    SUM(SALES) AS total_revenue
FROM online_sales
GROUP BY PRODUCTLINE, YEAR_ID, MONTH_ID
ORDER BY PRODUCTLINE, YEAR_ID, MONTH_ID;

-- 8. Seasonality Analysis - Avg Revenue per Month Across Years
SELECT 
    MONTH_ID, 
    ROUND(AVG(total_revenue), 2) AS avg_monthly_revenue
FROM (
    SELECT 
        YEAR_ID, 
        MONTH_ID, 
        SUM(SALES) AS total_revenue
    FROM online_sales
    GROUP BY YEAR_ID, MONTH_ID
) AS monthly_data
GROUP BY MONTH_ID
ORDER BY MONTH_ID;
