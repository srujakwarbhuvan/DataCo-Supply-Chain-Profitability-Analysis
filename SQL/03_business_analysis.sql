USE DataCoSupplyChain;
GO


-- ANALYSIS 1: PROFIT LEAKAGE BY DISCOUNT BAND
SELECT
    CASE 
        WHEN Discount_Rate = 0 THEN '0% - No Discount'
        WHEN Discount_Rate <= 0.05 THEN '1-5%'
        WHEN Discount_Rate <= 0.10 THEN '6-10%'
        WHEN Discount_Rate <= 0.15 THEN '11-15%'
        WHEN Discount_Rate <= 0.20 THEN '16-20%'
        ELSE '21-25%'
    END AS Discount_Band,
    COUNT(*) AS Order_Count,
    ROUND(AVG(Profit), 2) AS Avg_Profit,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(AVG(Profit_Margin_Ratio) * 100, 2) AS Avg_Margin_Pct,
    SUM(Is_Loss_Order) AS Loss_Orders,
    ROUND(SUM(Is_Loss_Order) * 100.0 / COUNT(*), 2) AS Loss_Order_Pct
FROM supply_chain_cleaned
GROUP BY
    CASE 
        WHEN Discount_Rate = 0 THEN '0% - No Discount'
        WHEN Discount_Rate <= 0.05 THEN '1-5%'
        WHEN Discount_Rate <= 0.10 THEN '6-10%'
        WHEN Discount_Rate <= 0.15 THEN '11-15%'
        WHEN Discount_Rate <= 0.20 THEN '16-20%'
        ELSE '21-25%'
    END
ORDER BY MIN(Discount_Rate);

SELECT
    Shipping_Mode,
    COUNT(*) AS Order_Count,
    ROUND(AVG(Profit), 2) AS Avg_Profit,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(AVG(Profit_Margin_Ratio) * 100, 2) AS Avg_Margin_Pct,
    SUM(Is_Loss_Order) AS Loss_Orders,
    ROUND(SUM(Is_Loss_Order) * 100.0 / COUNT(*), 2) AS Loss_Order_Pct,
    ROUND(AVG(CAST(Shipping_Delay_Variance AS FLOAT)), 2) AS Avg_Delay_Variance,
    ROUND(AVG(CAST(Days_Shipped_Actual AS FLOAT)), 2) AS Avg_Days_To_Ship
FROM supply_chain_cleaned
GROUP BY Shipping_Mode
ORDER BY Total_Profit DESC;

SELECT
    Category_Name,
    Department_Name,
    COUNT(*) AS Order_Count,
    ROUND(SUM(Gross_Sales), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(AVG(Profit_Margin_Ratio) * 100, 2) AS Avg_Margin_Pct,
    SUM(Is_Loss_Order) AS Loss_Orders,
    ROUND(SUM(Is_Loss_Order) * 100.0 / COUNT(*), 2) AS Loss_Order_Pct,
    ROUND(AVG(Discount_Rate) * 100, 2) AS Avg_Discount_Pct
FROM supply_chain_cleaned
GROUP BY Category_Name, Department_Name
ORDER BY Total_Profit ASC;


SELECT
    Market,
    Order_Region,
    COUNT(*) AS Order_Count,
    ROUND(SUM(Gross_Sales), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(AVG(Profit_Margin_Ratio) * 100, 2) AS Avg_Margin_Pct,
    SUM(Is_Loss_Order) AS Loss_Orders,
    ROUND(SUM(Is_Loss_Order) * 100.0 / COUNT(*), 2) AS Loss_Order_Pct
FROM supply_chain_cleaned
GROUP BY Market, Order_Region
ORDER BY Total_Profit DESC;


SELECT
    Customer_Segment,
    COUNT(DISTINCT Customer_Id) AS Unique_Customers,
    COUNT(*) AS Total_Orders,
    ROUND(SUM(Gross_Sales), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(AVG(Profit_Margin_Ratio) * 100, 2) AS Avg_Margin_Pct,
    SUM(Is_Loss_Order) AS Loss_Orders,
    ROUND(SUM(Is_Loss_Order) * 100.0 / COUNT(*), 2) AS Loss_Order_Pct,
    ROUND(AVG(Discount_Rate) * 100, 2) AS Avg_Discount_Pct
FROM supply_chain_cleaned
GROUP BY Customer_Segment
ORDER BY Total_Profit DESC;


SELECT
    Is_Fraud_Suspected,
    COUNT(*) AS Order_Count,
    ROUND(SUM(Gross_Sales), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(AVG(Profit_Margin_Ratio) * 100, 2) AS Avg_Margin_Pct
FROM supply_chain_cleaned
GROUP BY Is_Fraud_Suspected
ORDER BY Is_Fraud_Suspected;


SELECT
    YEAR(CAST(Order_Date AS DATETIME)) AS Order_Year,
    MONTH(CAST(Order_Date AS DATETIME)) AS Order_Month,
    COUNT(*) AS Order_Count,
    ROUND(SUM(Gross_Sales), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    SUM(Is_Loss_Order) AS Loss_Orders
FROM supply_chain_cleaned
GROUP BY 
    YEAR(CAST(Order_Date AS DATETIME)), 
    MONTH(CAST(Order_Date AS DATETIME))
ORDER BY Order_Year, Order_Month;