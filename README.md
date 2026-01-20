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

![Data Architecture](docs/data-warehouse-overview.png)

1. *Bronze Layer*: Stores raw data as-is from the source systems. Data is ingested from CSV files into the SQL Server database.
2. *Silver Layer*: Includes data cleansing, standardization, and normalization processes to prepare data for analysis.
3. *Gold Layer*: Houses business-ready data modeled into a star schema required for reporting and analytics.

---

## 📂 Repository Structure

| Path | Description |
|------|------------|
| `datasets/` | Raw datasets used for the project (ERP and CRM data) |
| `docs/` | Project documentation and architecture details |
| `docs/etl.drawio` | ETL techniques and workflows |
| `docs/data_architecture.drawio` | Overall system architecture |
| `docs/data_catalog.md` | Dataset catalog and metadata |
| `docs/data_flow.drawio` | Data flow diagrams |
| `docs/data_models.drawio` | Star schema data models |
| `scripts/` | SQL scripts for ETL and transformations |
| `scripts/bronze/` | Extracting and loading raw data |
| `scripts/silver/` | Cleaning and transforming data |
| `scripts/gold/` | Creating analytical models |
| `analytics/` | Python-based advanced analytics |
| `analytics/notebooks/` | Jupyter notebooks (RFM, CLV, churn analysis) |
| `analytics/images/` | Generated visualizations |
| `analytics/README.md` | Analytics documentation |
| `tests/` | Test scripts and data quality checks |
| `README.md` | Project overview and instructions |
| `LICENSE` | License information for the repository |
| `.gitignore` | Files and directories ignored by Git |
| `requirements.txt` | Project dependencies |


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
