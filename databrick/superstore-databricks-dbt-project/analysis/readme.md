# 🧭 Superstore Analytics Project — Business Questions

This document outlines key **business-driven analytical questions** designed for the Superstore dataset.
They represent the transition from **Data Engineering (ETL + modeling)** to **Data Analytics (insight generation)**.

---

## 1️⃣ Sales Performance Analysis

**Goal:** Understand overall sales and profit trends.

1. How have total sales and profit changed month-over-month?
2. Which region contributes the most to profit growth?
3. What are the top 10 customers by lifetime sales and profit?
4. How does sales performance differ by segment (Consumer, Corporate, Home Office)?

---

## 2️⃣ Discount and Profitability Analysis

**Goal:** Measure the relationship between discounts and profits.

6. What is the relationship between discount rate and profit margin?
7. Which categories lose the most profit due to discounts?
8. Are discounts more effective for some regions or segments?

---

## 3️⃣ Product & Category Insights

**Goal:** Identify high and low-performing products.

9. Which product categories and sub-categories drive the highest profit?
10. Which products have negative profit margins?
11. Which products have high sales but low profit margins?
12. Which sub-categories are growing fastest month-over-month?

---

## 4️⃣ Customer Behavior & Retention

**Goal:** Understand customer loyalty and purchasing behavior.

13. How many new customers did we gain per month?
14. How many customers made repeat purchases?
15. What is the average time between purchases for each segment?
16. Which cities or states have the most high-value customers?

---

## 5️⃣ Regional & Shipping Analysis

**Goal:** Evaluate performance by region and delivery efficiency.

17. How does sales and profit vary by region and state?
18. Which shipping modes are most profitable per order?
19. Are there seasonal trends in specific regions?

---

## 6️⃣ Profitability Metrics for Executives

**Goal:** Provide high-level KPIs for management.

20. What is total revenue, total profit, and profit margin YTD vs LYTD?
21. What’s the cumulative sales growth since the start of the year?
22. What are the top 3 regions, categories, and customers driving 80% of profit?
23. How much of profit volatility is explained by discounts?

---

## 7️⃣ Analytical Themes for Dashboards

| Dashboard                  | Focus                              | Key Tables               |
| -------------------------- | ---------------------------------- | ------------------------ |
| **Sales Overview**         | Growth, performance, top customers | fact_sales, dim_customer |
| **Discount Effectiveness** | Profit impact of discounting       | fact_sales, dim_product  |
| **Product Insights**       | Category performance               | fact_sales, dim_product  |
| **Customer Analytics**     | Segmentation and retention         | fact_sales, dim_customer |
| **Regional Overview**      | Geography-based performance        | fact_sales, dim_customer |
| **Executive Summary**      | Core KPIs and trends               | All gold layer tables    |

---

## 8️⃣ Advanced / Optional Questions

24. How many customers moved from low-value → high-value segments?
25. Which product categories have the highest variance in profit per order?
26. Build an RFM (Recency, Frequency, Monetary) customer score model.
27. Predict next month’s sales using linear regression.
28. Which sub-category’s sales growth correlates most with total profit growth?

---

### 💡 Tip for Presentation

For each question:

* **Write one SQL query**
* **Show one visualization**
* **Explain one insight**

That’s the exact pattern analysts use in real projects and interviews.
