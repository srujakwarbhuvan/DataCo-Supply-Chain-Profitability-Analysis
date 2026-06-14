USE DataCoSupplyChain;
GO

IF OBJECT_ID('supply_chain_cleaned', 'U') IS NOT NULL 
    DROP TABLE supply_chain_cleaned;

WITH DeduplicatedCTE AS (
    SELECT *,
        ROW_NUMBER() OVER (
            PARTITION BY Order_Id, Product_Name, order_date_DateOrders, Customer_Id
            ORDER BY Order_Item_Id
        ) AS rn
    FROM supply_chain_raw
)
SELECT
    -- Order identifiers
    CAST(Order_Id AS INT)                          AS Order_Id,
    CAST(Order_Item_Id AS INT)                     AS Order_Item_Id,
    CAST(Customer_Id AS INT)                       AS Customer_Id,

    -- Dates converted from string
    CAST(order_date_DateOrders AS DATETIME)        AS Order_Date,
    CAST(shipping_date_DateOrders AS DATETIME)     AS Ship_Date,

    -- Shipping
    Shipping_Mode,
    Delivery_Status,
    CAST(Late_delivery_risk AS INT)                AS Late_Delivery_Risk,
    CAST(Days_for_shipping_real AS INT)            AS Days_Shipped_Actual,
    CAST(Days_for_shipment_scheduled AS INT)       AS Days_Shipped_Scheduled,
    -- Delay variance: positive = late, negative = early
    CAST(Days_for_shipping_real AS INT) - 
    CAST(Days_for_shipment_scheduled AS INT)       AS Shipping_Delay_Variance,

    -- Customer
    Customer_Segment,
    Customer_City,
    Customer_Country,

    -- Geography
    Market,
    Order_Region,
    Order_Country,
    Order_City,
    Order_State,

    -- Product
    CAST(Product_Card_Id AS INT)                   AS Product_Id,
    Product_Name,
    Category_Name,
    Department_Name,
    CAST(Product_Price AS FLOAT)                   AS Product_Price,

    -- Financials
    CAST(Order_Item_Quantity AS INT)               AS Quantity,
    CAST(Sales AS FLOAT)                           AS Gross_Sales,
    CAST(Order_Item_Total AS FLOAT)                AS Net_Sales,
    CAST(Order_Item_Discount AS FLOAT)             AS Discount_Amount,
    CAST(Order_Item_Discount_Rate AS FLOAT)        AS Discount_Rate,
    CAST(Order_Profit_Per_Order AS FLOAT)          AS Profit,
    CAST(Order_Item_Profit_Ratio AS FLOAT)         AS Profit_Margin_Ratio,

    -- Order status
    Order_Status,

    -- Flags
    CASE WHEN Order_Profit_Per_Order < 0 THEN 1 ELSE 0 END  AS Is_Loss_Order,
    CASE WHEN Order_Status = 'SUSPECTED_FRAUD' THEN 1 ELSE 0 END AS Is_Fraud_Suspected

INTO supply_chain_cleaned
FROM DeduplicatedCTE
WHERE rn = 1;

SELECT 
    COUNT(*) AS Cleaned_Row_Count,
    SUM(Is_Loss_Order) AS Loss_Orders,
    SUM(Is_Fraud_Suspected) AS Fraud_Orders
FROM supply_chain_cleaned;

-- Row reduction from deduplication
SELECT 
    (SELECT COUNT(*) FROM supply_chain_raw) AS Raw_Rows,
    (SELECT COUNT(*) FROM supply_chain_cleaned) AS Cleaned_Rows,
    (SELECT COUNT(*) FROM supply_chain_raw) - 
    (SELECT COUNT(*) FROM supply_chain_cleaned) AS Duplicates_Removed;