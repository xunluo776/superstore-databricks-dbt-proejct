# Superstore Sales & Profit Analysis  
_A Modern Lakehouse Project using Databricks, dbt & the Superstore Dataset_  

## 🚀 Project Overview  
This project demonstrates a full end-to-end **Data Engineering pipeline** built on the modern **Lakehouse architecture**.  
Using the kaggle Superstore retail dataset, it showcases ingestion, transformation, and analytics — all orchestrated on Databricks with dbt for modular SQL modeling.  

**Key outcomes include:**  
- Month-over-month sales and profit growth tracking  
- Regional contribution to profit over time  
- Segment-level profitability (Consumer, Corporate, Home Office)  
- Discount vs profit-margin analysis for category optimization  

---

##  Technologies 

| Layer | Tool / Framework | Purpose |
|-------|------------------|----------|
| **Ingestion** | Databricks Jobs + Auto Loader + spark | Load raw Superstore data into Bronze tables |
| **Transformation** | dbt Cloud (`dbt-databricks` adapter) | Stage and model data into Silver/Gold layers |
| **Storage** | Delta Lake on Databricks | Reliable data storage |
| **Analytics** | Databricks SQL Views & Visualizations | Derive business insights and reporting tables |
| **Version Control** | GitHub | Manage code, models, and documentation |

This project follows the **Bronze → Silver → Gold** architecture pattern for clean, scalable data modeling.

---

##  Key Analytical Use Cases  

1. **Monthly Growth** – Analyze sales and profit trends across time.  
2. **Regional Contribution** – Identify the top-performing region each month.  
3. **Segment Performance** – Compare revenue and profit share across customer segments.  
4. **Discount vs Profit Margin** – Examine how discount rates affect profitability by category.  

---

##  About this Project

- Implements a **modern DE stack** used in real-world industry workflows (Databricks + dbt + Delta).  
- Follows clean **Medallion architecture** principles for modularity and scalability.  
- Includes **business-oriented KPIs** and data visualization for storytelling.  
- Demonstrates **SQL transformation skills**, **data modeling**, and **version-controlled workflows**.  
- Built for clarity, reproducibility, and recruiter-friendly presentation.  

---

##  How to Run the Project  

1. **Clone the repository**  
   ```bash
   git clone https://github.com/xunluo776/superstore-databricks-dbt-proejct.git
   cd superstore-databricks-dbt-proejct/dbt
   ```

2. **Configure Databricks connection in `profiles.yml`**
   ```yaml
   default:
     target: dev
     outputs:
       dev:
         type: databricks
         catalog: hive_metastore
         schema: dbt_luo_gold
         host: <your-databricks-host>
         http_path: <your-sql-endpoint>
         token: <your-databricks-token>
   ```

3. **Run dbt commands**
   ```bash
   dbt deps
   dbt seed --full-refresh
   dbt run
   dbt test
   ```

4. **Explore in Databricks SQL**  
   Use the created `superstore_analysis` views to build visuals and dashboards.

---

##  Example Insights  

- The **Consumer segment** contributed nearly half of total profit.  
- The **West region** frequently ranked as the top monthly profit driver.  
- Higher discounts correlated with reduced profit margins, especially in Office Supplies.  

---

##  Future Enhancements  
  
- Integrate **GitHub Actions** for automated CI/CD of dbt models.  
- Expand **data quality monitoring** and **documentation** via dbt docs.  
- Build a polished **BI dashboard** (Power BI / Tableau / Databricks SQL) to showcase results.  

---
##  Reference
- datasets: https://www.kaggle.com/datasets/vivek468/superstore-dataset-final/data?select=Sample+-+Superstore.csv
---

## 👤 About Me  

I’m a **cs graduate student** passionate about building scalable, cloud-based pipelines.  
I specialize in **Databricks**, **dbt**, **SQL**, and **Azure Data Lake**, turning raw datasets into curated insights for decision-making.  

If you’re a recruiter or hiring manager, this project reflects my ability to:  
- Design and implement data pipelines  
- Apply modular data modeling principles  
- Automate analytics using modern DE tools  

---

⭐ **Thank you for checking out this project!**  
Feel free to fork the repo, review the dbt models, or connect for collaboration.
