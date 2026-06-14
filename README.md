# **DataCo-Supply-Chain-Profitability-Analysis**
`SQL Server` `Python`  `Power BI` `DAX`

### End-to-end supply chain performance analysis on 180,519 orders across five global markets. Built interactive dashboards to investigate revenue, profitability, delivery delays, fraud risk, and operational bottlenecks, revealing an 18.74% loss-order rate and company-wide late delivery rates exceeding 57%.
---
## Dashboard Preview <img width="1278" height="718" alt="cover " src="https://github.com/user-attachments/assets/fcd60e71-487e-4e96-a397-14c420c849d2" />

## The Problem

A global supply chain business generated $32.62M in revenue across 180K+ orders, yet nearly one-fifth of all orders resulted in losses. This project investigates the drivers of profit leakage, operational inefficiencies, delivery delays, and fraud risk using SQL, Python, and Power BI. The core question driving this project:

> **Where is the business losing money, and what is causing it?**

This breaks into 5 focused sub-questions:

1. How is the business performing overall and where is margin being lost?
2. Which products and departments are consistently unprofitable?
3. How efficient is the delivery process and which shipping modes are failing?
4. Which markets carry the highest operational and fraud risk?
5. What are the biggest levers to recover profitability?

---

## Key Findings

| Metric | Value |
|---|---|
| Total Revenue | $32.62M |
| Total Profit | $3.51M |
| Profit Margin | 10.75% |
| Loss Order Rate | 18.74% |
| Late Delivery Rate | 57.34% |
| Fraud Orders | 3,573 |

- **1 in 5 orders loses money.** 18.74% loss order rate across 160K orders.
- **Late delivery is a company-wide crisis, not a regional one.** Every single market sits between 56-58% late delivery rate.
- **First Class shipping has nearly 100% late delivery rate** -- the most expensive mode with the worst performance.
- **LATAM is the highest risk market** across all three dimensions: late delivery (56.97%), fraud (2.28%), and loss orders (8,446).
- **SOLE E35 Elliptical is the single biggest loss product** at $965.12 leaked profit.
- **Fraud exceeds 2% in every market.** No market is clean.
- **28.79% of orders are stuck** in Processing, Pending, or On Hold states -- unrealized revenue sitting in operational bottlenecks.

---

## Dashboard

### Page 1: Executive Performance Dashboard

**Questions Answered:**
- How is the business performing overall?
- How have revenue and profit changed over time?
- Where is the business losing money?
- Which products contribute most to losses?
- Which product categories generate the most revenue?
- Which departments contribute most to profit?
## Executive Performance Dashboard<img width="1298" height="728" alt="executive overview " src="https://github.com/user-attachments/assets/0b62ba39-7a81-406e-92cd-117e71c528b6" />

**Visuals:**
- KPI Cards: Total Revenue, Total Profit, Loss Order %, Profit Margin %
- Monthly Revenue vs Profit Trend (2015-2018)
- Top 10 Loss-Making Products
- Profit by Department (Treemap)
- Revenue by Category (Column Chart)

---

### Page 2: Operations & Risk Analysis

**Questions Answered:**
- How efficient is the delivery process?
- Which shipping modes experience the most delays?
- What is the current status of orders?
- Where are operational bottlenecks occurring?
- Which markets are operationally risky?
- Where are fraud risks concentrated?
- Which markets generate the highest loss orders?
<img width="1296" height="728" alt="operations   Risk" src="https://github.com/user-attachments/assets/ed4ff899-a62d-45bf-9f85-bd95af8f48bf" />

**Visuals:**
- KPI Cards: Total Orders, Late Delivery %, Avg Shipping Delay, Fraud Orders
- Late Delivery % by Shipping Mode (Bar Chart)
- Order Status Distribution (Donut Chart)
- Market Risk Matrix with RAG indicators (Late Delivery, Fraud %, Loss Orders)

---

### Page 3: Executive Summary & Recommendations

Data-backed findings and 5 actionable recommendations for business stakeholders covering product profitability, discount controls, delivery operations, market risk, and order fulfillment.
<img width="1295" height="729" alt="Summary " src="https://github.com/user-attachments/assets/ca6589b2-b5e2-4cb4-8f79-f9e34a591a31" />

---
## Skills Demonstrated

- Data Cleaning & Transformation
- SQL Analytics
- Exploratory Data Analysis (EDA)
- DAX Measure Development
- KPI Design
- Dashboard Development
- Business Problem Solving
- Executive Reporting
- Supply Chain Analytics

---
## SQL Analysis

Six business analyses run on `supply_chain_cleaned`:

1. Profit leakage by discount band
2. Shipping mode performance (profit, delay variance, loss rate)
3. Category and department profitability
4. Market and regional analysis
5. Customer segment analysis
6. Fraud order impact
7. Monthly revenue and profit trend

---

## Tech Stack

| Layer | Tool |
|---|---|
| Data Storage | SQL Server |
| Data Cleaning | T-SQL (deduplication, type casting, derived columns) |
| EDA | Python (pandas, matplotlib, seaborn) |
| Visualization | Power BI Desktop (DAX, Power Query) |
| Languages | T-SQL, Python, DAX |

---

## DAX Measures Built

- Total Revenue, Total Profit, Profit Margin %
- Loss Orders, Loss Order %, Profit Leaked
- Late Orders, Late Delivery %, On Time Delivery %
- Avg Shipping Delay, Avg Discount Rate %
- Fraud Orders, Fraud Revenue, Fraud Profit, Fraud %

---

## Project Structure

```
DataCo-Supply-Chain/
├── sql/
│   ├── 01_data_validation.sql
│   ├── 02_data_cleaning.sql
│   └── 03_business_analysis.sql
├── notebooks/
│   ├── dataco_ingestion.ipynb
│   └── dataco_eda.ipynb
├── dashboard/
│   └── DataCo_Supply_Chain.pbix
└── README.md
```

---

## Dataset

- **Source:** DataCo Smart Supply Chain Dataset [Kaggle](https://www.kaggle.com/datasets/shashwatwork/dataco-smart-supply-chain-for-big-data-analysis/code) 
- **Records:** 180,519 orders
- **Features:** 53 original columns, reduced to 35 after cleaning
- **Period:** 2015 to 2018
- **Scope:** Global supply chain across 5 markets: Europe, LATAM, USCA, Pacific Asia, Africa

---

## Contact

**Srujak Warbhuvan**

📧 Email: srujakwarbhuvan9@gmail.com 

💼 LinkedIn: [Srujak Warbhuvan](linkedin.com/in/srujak-warbhuvan-abb410285)
