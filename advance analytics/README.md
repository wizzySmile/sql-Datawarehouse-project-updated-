# Advanced Customer Analytics (Python)

This directory contains the **Python-based advanced analytics layer** of the project.  
It builds on the curated **Gold layer** from the SQL data warehouse and complements the Tableau dashboards by providing **deeper exploratory and customer-level analysis**.

While Tableau is used for high-level business monitoring and KPIs, Python is used here to **analyze customer behavior, engagement, and long-term value**.

---

## Purpose

The purpose of this analysis is to move beyond descriptive reporting and gain a deeper understanding of **customer behavior and value** by:

- Segmenting customers based on engagement patterns
- Estimating long-term customer value
- Identifying churn risk using behavioral signals
- Prioritizing customers based on revenue impact

---

## Data Source

- Data used in this analysis comes from the **Gold layer** of the SQL Server data warehouse.
- The dataset represents cleaned, modeled, and business-ready transactional data.
- No raw data processing is performed in this layer.

---

## Key Analyses Performed

### 1. Customer Segmentation
- *Customer Segment*: New, Regular, VIP (business-defined)
- *Engagement Level*:  
  - Champions  
  - Loyal Customers  
  - Needs Attention  
  - At Risk (High Value)  
  - Churn Risk  

Engagement level is derived using **RFM (Recency, Frequency, Monetary) analysis** and serves as the primary behavioral segmentation.

---

### 2. RFM Analysis
- Recency, Frequency, and Monetary metrics were calculated for each customer.
- Customers were scored and grouped into engagement levels based on behavioral patterns.

---

### 3. Customer Lifetime Value (CLV)
- CLV was estimated using historical purchasing behavior.
- The analysis highlights which engagement levels contribute the most long-term value.

---

### 4. Churn & Retention Analysis
- Churn was inferred using **engagement and recency patterns**, as no explicit churn label was available.
- Increasing recency was used as a proxy for declining engagement and churn risk.

---

### 5. Revenue & Customer Value Prioritization
- Engagement level and CLV were combined to identify:
  - High-value customers to protect
  - Customers at risk of revenue loss
  - Low-value customers to deprioritize

---

## Key Outputs

- RFM scoring tables
- Engagement-level segmentation
- CLV-by-segment analysis
- Churn and retention insights
- Customer Value & Engagement Action Matrix
- Visualizations supporting each analysis

All notebooks and generated visuals are documented below.

---


## Repository Structure (Advanced Analytics)


| Path | Description |
|------|------------|
| `advance analytics/customer_behaviour_analytics.ipynb`| Jupyter notebooks for RFM, CLV, churn & value analysis |
| `advance analytics/README.md` | Documentation for advanced analytics |



---

## How This Fits Into the Overall Project

- **SQL Server** → Data engineering, modeling, and data quality
- **Tableau** → High-level dashboards and KPI monitoring
- **Python (this folder)** → Deep exploratory analysis and customer behavior insights

Together, these layers provide an end-to-end analytics workflow from raw data to strategic recommendations.

---

## Notes & Limitations

- Churn is inferred using behavioral signals rather than explicit churn labels.
- CLV is estimated using historical data and may change as customer behavior evolves.
- Findings are specific to the available dataset and time period.

---

## Next Steps

Potential extensions of this analysis include:
- Incorporating marketing or campaign data
- Adding predictive churn models
- Automating periodic customer segmentation updates
