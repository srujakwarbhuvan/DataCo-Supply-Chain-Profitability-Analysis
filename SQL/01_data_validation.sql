USE DataCoSupplyChain;
GO

SELECT COUNT(*) AS Total_Rows
FROM supply_chain_raw;

SELECT 
    Order_Id,
    Product_Name,
    order_date_DateOrders,
    Customer_Id,
    COUNT(*) AS Occurrence
FROM supply_chain_raw
GROUP BY Order_Id, Product_Name, order_date_DateOrders, Customer_Id
HAVING COUNT(*) > 1
ORDER BY Occurrence DESC;

SELECT
    SUM(CASE WHEN Order_Id IS NULL THEN 1 ELSE 0 END) AS Null_Order_Id,
    SUM(CASE WHEN Product_Name IS NULL THEN 1 ELSE 0 END) AS Null_Product_Name,
    SUM(CASE WHEN Customer_Id IS NULL THEN 1 ELSE 0 END) AS Null_Customer_Id,
    SUM(CASE WHEN Order_Profit_Per_Order IS NULL THEN 1 ELSE 0 END) AS Null_Profit,
    SUM(CASE WHEN Order_Item_Discount_Rate IS NULL THEN 1 ELSE 0 END) AS Null_Discount,
    SUM(CASE WHEN Delivery_Status IS NULL THEN 1 ELSE 0 END) AS Null_Delivery_Status,
    SUM(CASE WHEN Shipping_Mode IS NULL THEN 1 ELSE 0 END) AS Null_Shipping_Mode,
    SUM(CASE WHEN Order_Zipcode IS NULL THEN 1 ELSE 0 END) AS Null_Order_Zipcode,
    SUM(CASE WHEN Customer_Zipcode IS NULL THEN 1 ELSE 0 END) AS Null_Customer_Zipcode
FROM supply_chain_raw;

SELECT DISTINCT Delivery_Status
FROM supply_chain_raw
ORDER BY Delivery_Status;

SELECT DISTINCT Shipping_Mode
FROM supply_chain_raw
ORDER BY Shipping_Mode;

SELECT DISTINCT Customer_Segment
FROM supply_chain_raw
ORDER BY Customer_Segment;

SELECT DISTINCT Order_Status
FROM supply_chain_raw
ORDER BY Order_Status;

SELECT 
    COUNT(*) AS Loss_Order_Count,
    ROUND(SUM(Order_Profit_Per_Order), 2) AS Total_Profit_Leaked,
    ROUND(AVG(Order_Profit_Per_Order), 2) AS Avg_Loss_Per_Order
FROM supply_chain_raw
WHERE Order_Profit_Per_Order < 0;

SELECT 
    MIN(Order_Item_Discount_Rate) AS Min_Discount,
    MAX(Order_Item_Discount_Rate) AS Max_Discount,
    AVG(Order_Item_Discount_Rate) AS Avg_Discount
FROM supply_chain_raw;

SELECT TOP 5
    order_date_DateOrders,
    shipping_date_DateOrders
FROM supply_chain_raw;

SELECT 
    Order_Status,
    COUNT(*) AS Count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS Pct
FROM supply_chain_raw
GROUP BY Order_Status
ORDER BY Count DESC;