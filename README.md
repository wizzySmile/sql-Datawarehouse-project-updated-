# Data Warehouse and Analytics Project

Welcome to the Data Warehouse and Analytics Project repository!
This portfolio project showcases a robust data warehousing and analytics solution, demonstrating industry best practices in data engineering and analytics. The project encompasses the entire data warehousing lifecycle, from designing and building a data warehouse to generating actionable business insights.

---
## Table of Contents
- [Project Overview](#-project-overview)
- [Tools Used](#tools-used)
- [Project Requirements](#project-requirements)
- [Project Goal](#project-goal)
- [BI: Analytics & Reporting](#bi-analytics--reporting)
- [Tableau Dashboard Overview](https://public.tableau.com/app/profile/wisdom.mpamugo/viz/salesbaraaproject/customersummary)
- [Data Architecture](#data-architecture)
- [Repository Structure](#-repository-structure)
- [Key Insights](#key-insights)
- [Recommendations](#recommendations)
- [Limitations](#limitations)
- [About](#about)
- [Contact](#contact)
---

## 📖 Project Overview

This project involves:

1. *Data Architecture*: Designing a modern data warehouse using Medallion Architecture (*Bronze*, *Silver*, and *Gold* layers).
2. *ETL Pipelines*: Extracting, transforming, and loading data from source systems into the warehouse.
3. *Data Modeling*: Developing fact and dimension tables optimized for analytical queries.
4. *Analytics & Reporting*: Creating SQL-based reports and Tableau dashboards for actionable insights.
5. *Advanced Analytics*: Performing customer analytics using Python, including *RFM segmentation*, *Customer Lifetime Value (CLV)*, *churn & retention analysis*, and *revenue prioritization* with insights, recommendations, and visuals.

---

## Tools Used
- SQL Server
- Tableau
- Python
- Draw.io

---

## Project Requirements

### Building the Data Warehouse (Data Engineering)

#### Project Goal
Build a SQL Server–based data warehouse to support analytical reporting. Leverage Tableau to provide high-level business overviews and KPI monitoring and apply Python-based advanced analytics to explore customer behaviour in depth, enabling data-driven insights, customer segmentation, and informed strategic decision-making.

#### Specifications
- *Data Sources*: Import data from two source systems (ERP and CRM) provided as CSV files.
- *Data Quality*: Cleanse and resolve data quality issues prior to analysis.
- *Integration*: Combine both sources into a single, user-friendly data model designed for analytical queries.
- *Scope*: Focus on the latest dataset only; historization of data is not required.
- *Documentation*: Provide clear documentation of the data model to support both business stakeholders and analytics teams.

---

### BI: Analytics & Reporting

#### Objective
Develop SQL-based analytics and Tableau dashboards to deliver detailed insights into:
- *Customer Behavior*
- *Product Performance*
- *Sales Trends*

🛢️ *SQL Query*

SQL is used to generate clean, reliable analytical datasets from the data warehouse, while *Tableau* is used to build interactive dashboards and KPI reports that provide high-level business visibility.

📊 *Tableau Dashboard*  
- View the interactive Tableau dashboards here: [Tableau Dashboard Link](https://public.tableau.com/app/profile/wisdom.mpamugo/viz/salesbaraaproject/customersummary)

These insights empower stakeholders with key business metrics, enabling *data-driven strategic decision-making*.

---

### Advanced Analytics (Python)

#### Objective
Extend dashboard-level insights with advanced exploratory data analysis using Python to uncover deeper customer behavior patterns and business opportunities.

#### Key Analyses
- *RFM Segmentation* (Recency, Frequency, Monetary)
- *Customer Lifetime Value (CLV)*
- *Churn & Retention Analysis*
- *Revenue & Customer Value Prioritization*
- *Customer Value & Engagement Action Matrix*
- *Business insights, recommendations, and visual storytelling*

---

## Data Architecture

The data architecture for this project follows Medallion Architecture (*Bronze*, *Silver*, and *Gold* layers):

![Data Architecture](docs/data%20warehouse%20overview/01_data_architecture.drawio.png)

1. *Bronze Layer*: Stores raw data as-is from the source systems. Data is ingested from CSV files into the SQL Server database.
2. *Silver Layer*: Includes data cleansing, standardization, and normalization processes to prepare data for analysis.
3. *Gold Layer*: Houses business-ready data modeled into a star schema required for reporting and analytics.

---

## 📂 Repository Structure

## 📂 Repository Structure

| Path | Description |
|------|------------|
| `dataset/` | Source data used for the project |
| `dataset/source_crm/` | CRM source system data (CSV files) |
| `dataset/source_erp/` | ERP source system data (CSV files) |
| `scripts/` | SQL scripts for data warehouse creation and transformations |
| `scripts/01_create schemas (bronze,silver,gold)/` | SQL scripts to create Bronze, Silver, and Gold schemas |
| `scripts/02_bronze/` | SQL scripts for loading raw data into the Bronze layer |
| `scripts/03_data cleaning/` | SQL scripts for transforming data from Bronze to Silver |
| `scripts/04_silver/` | SQL scripts for Silver-layer tables, procedures, and quality checks |
| `scripts/05_gold/` | SQL scripts for Gold-layer views, analytics, and quality checks |
| `scripts/06_reports/` | SQL scripts for analytical and business reports |
| `advance analytics/` | Python-based advanced customer analytics |
| `advance analytics/README.md` | Documentation for advanced analytics |
| `advance analytics/customer_behaviour_analytics.ipynb` | Jupyter notebook for RFM, CLV, churn & value analysis |
| `docs/` | Project documentation and diagrams |
| `docs/data warehouse overview/` | Data warehouse design and documentation |
| `docs/data warehouse overview/01_data_architecture.drawio.png` | Data architecture diagram |
| `docs/data warehouse overview/02_DataFlow.drawio.png` | Data flow diagram |
| `docs/data warehouse overview/03_integration_model.drawio.png` | Integration model diagram |
| `docs/data warehouse overview/04_DataModel.drawio.png` | Star schema data model |
| `docs/data warehouse overview/05_data_catalog.md` | Data catalog and metadata |
| `docs/tableau dashboard/tableau dashboard link.md` | Tableau dashboard link |
| `doc/python charts/` | Visualizations generated from Python analysis |
| `doc/python charts/01_avg_recency_by_engage_level.png` | Average recency by engagement level |
| `doc/python charts/02_avg_clv_by_engage_level.png` | Average CLV by engagement level |
| `doc/python charts/03_cust_value_engage_overview.png` | Customer value & engagement overview |
| `doc/python charts/04_avg_cust_lifetime_value_by_engage_level.png` | Average customer lifetime value |
| `doc/python charts/05_cust_dist_by_engage_level.png` | Customer distribution by engagement level |
| `doc/python charts/06_total_revenue_by_engage_level.png` | Total revenue by engagement level |
| `README.md` | Main project overview and documentation |


---
## Key Insights

- Customer engagement level is the strongest indicator of long-term customer value. Highly engaged customers (*Champions* and *Loyal Customers*) consistently generate higher lifetime value, regardless of whether they are New, Regular, or VIP customers.

- A small group of highly engaged customers drives a disproportionate share of long-term revenue, while the majority of customers fall into lower engagement levels.

- The most critical risk to future revenue comes from *At Risk (High Value)* customers — customers with strong historical value but declining engagement — rather than customers who have already churned.

---

## Recommendations

- Prioritize retention strategies based on **engagement level**, not customer status alone, with a strong focus on *Champions* and *At Risk (High Value)* customers.

- Implement targeted win-back campaigns for high-value customers showing declining engagement to prevent future revenue loss.

- Use scalable and automated engagement strategies for customers in the *Needs Attention* group to improve retention efficiently.

- Deprioritize retention spending on *Churn Risk* customers and reallocate resources toward higher-impact engagement segments.

---

## Limitations

- Engagement level was used as a behavioral proxy for churn in the absence of an explicit churn label.

- The analysis relies solely on transactional data and does not include marketing interactions, pricing changes, or customer support data that could provide deeper insights.

- Customer Lifetime Value estimates were based on historical transactions and may not reflect future behavioral changes.

---

## About
Hello! I'm Wisdom Chinemere Mpamugo, also known as Wisdom Analytics.  
As a Data Analyst, I help organizations make data-driven decisions by building scalable data solutions and translating data into actionable insights.

--

## Contact
Let's stay in touch! Feel free to connect with me on this platform:
- LinkedIn: [https://www.linkedin.com/in/wisdom-mpamugo-98b5151b2?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app]
  
- Twitter: [https://x.com/WisdomAnalyst01]
