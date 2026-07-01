# 📈 Mutual Fund NAV Analytics & Retention Dashboard

An end-to-end **data analyst project**: cleaning and analyzing mutual fund NAV data across multiple schemes and categories, computing fund performance metrics (returns, volatility, drawdown), and delivering an interactive Power BI dashboard for investment decision-making.

Built as part of a Data Analyst Internship at **Bluestock Fintech**.

---

## 🎯 Project Goals

- Clean and validate raw daily NAV data across 24 mutual fund schemes in 7 categories.
- Compute standard fund analytics: **CAGR, annualized volatility, max drawdown, Sharpe ratio**.
- Identify which fund categories offer the best risk-adjusted returns.
- Deliver an interactive Power BI dashboard for stakeholders comparing performance across AMCs.

---

## 🗂️ Repository Structure

```
mutual-fund-analytics/
├── data/
│   ├── raw/                        # Raw NAV data
│   │   └── mutual_fund_nav.csv
│   └── processed/                  # Cleaned data + SQLite warehouse
│       ├── mutual_fund_nav_clean.csv
│       └── mutual_fund_warehouse.db
├── etl/
│   ├── extract.py                  # EXTRACT: generates/pulls raw NAV data
│   ├── transform_clean.py          # TRANSFORM: cleans, handles missing/duplicate/outlier data
│   └── load.py                     # LOAD: loads into SQLite warehouse
├── sql/
│   └── queries.sql                 # Analytical SQL queries (8 business questions)
├── analysis/
│   └── eda_analysis.py             # EDA + performance metrics (CAGR, volatility, drawdown, Sharpe)
├── visuals/
│   ├── generate_charts.py          # Generates all charts
│   └── output/                     # 10 generated PNG charts
├── powerbi/
│   ├── nav_facts.csv               # Dashboard-ready fact table
│   ├── scheme_performance.csv      # Per-scheme metrics
│   ├── category_performance.csv    # Per-category rollups
│   ├── monthly_nav_trend.csv       # Monthly NAV trend data
│   └── POWERBI_SETUP.md            # Step-by-step dashboard build guide
├── reports/
│   ├── Fund_Analysis_Report.md     # Full written analytics report
│   └── summary_stats.json          # Machine-readable summary
├── requirements.txt
├── run_pipeline.py                 # Runs the entire pipeline end-to-end
├── LICENSE
└── README.md
```

---

## 🔄 Pipeline Overview

| Stage | Script | Description |
|---|---|---|
| **Extract** | `etl/extract.py` | Generates the raw daily NAV dataset (24 schemes × 7 categories × 6 AMCs, 2019–2025) |
| **Transform / Clean** | `etl/transform_clean.py` | Fixes missing values, removes duplicates, corrects outlier NAV prints, standardizes categories |
| **Load** | `etl/load.py` | Loads cleaned data into a local SQLite warehouse (`mutual_fund_warehouse.db`) |
| **Analyze** | `analysis/eda_analysis.py` | Computes CAGR, volatility, max drawdown, Sharpe ratio per scheme and category |
| **Visualize** | `visuals/generate_charts.py` | Generates 10 charts (risk/return, drawdown, AUM share, correlation, trends) |
| **Dashboard** | `powerbi/` | Clean CSVs + setup guide for an interactive Power BI dashboard |
| **Report** | `reports/Fund_Analysis_Report.md` | Executive summary + recommendations |

---

## 🚀 Quickstart

```bash
# 1. Clone the repo
git clone https://github.com/<your-username>/mutual-fund-analytics.git
cd mutual-fund-analytics

# 2. Install dependencies
pip install -r requirements.txt

# 3. Run the full pipeline (ETL -> EDA -> charts)
python run_pipeline.py
```

Or run each stage individually:

```bash
python etl/extract.py
python etl/transform_clean.py
python etl/load.py
python analysis/eda_analysis.py
python visuals/generate_charts.py
```

Query the warehouse directly with SQL:
```bash
sqlite3 data/processed/mutual_fund_warehouse.db < sql/queries.sql
```

Build the Power BI dashboard: see [`powerbi/POWERBI_SETUP.md`](powerbi/POWERBI_SETUP.md).

---

## 📈 Key Insights

- **43,848 cleaned daily NAV records** across 24 schemes, 7 categories, 6 AMCs (2019–2025).
- **Mid Cap funds delivered the highest average CAGR at 29.8%**, with Small Cap close behind at 23.3%.
- **Debt funds were the most stable** — 2.6% average volatility, -2.2% average max drawdown.
- **Small Cap funds carried the highest risk** — 27.3% average volatility, -37.6% average max drawdown.
- **Total AUM analyzed: ₹1,88,241.56 Cr**, with Debt (₹36,111 Cr) and Small Cap (₹42,823 Cr) holding the largest shares.
- Best performing scheme: **Emerging Opportunities Fund** (Mid Cap) at 36.4% CAGR / 778% total return.

📄 Full write-up: [`reports/Fund_Analysis_Report.md`](reports/Fund_Analysis_Report.md)

---

## 📊 Sample Visualizations

| Risk vs Return by Scheme | Avg CAGR by Category |
|---|---|
| ![risk_return](visuals/output/03_risk_vs_return_scatter.png) | ![cagr](visuals/output/01_avg_cagr_by_category.png) |

| Max Drawdown by Category | Category Return Correlation |
|---|---|
| ![drawdown](visuals/output/04_max_drawdown_by_category.png) | ![corr](visuals/output/10_category_correlation_heatmap.png) |

*(See `visuals/output/` for all 10 charts.)*

---

## 🛠️ Tech Stack

- **Python**: pandas, numpy — ETL & data wrangling
- **SQLite / SQL**: lightweight analytical data warehouse, 8 business-question queries
- **matplotlib / seaborn**: data visualization
- **Power BI**: interactive dashboard for stakeholder reporting
- **Markdown / JSON**: reporting outputs

---

## 📌 Business Recommendations

1. Segment fund recommendations by investor risk profile (Debt/Hybrid conservative → Small Cap aggressive).
2. Review underperforming schemes (e.g. lowest-CAGR Large Cap funds) against category peers.
3. Promote Index funds for their risk-adjusted efficiency (mid-tier returns, contained volatility).
4. Monitor AUM concentration in higher-drawdown categories like Small Cap.
5. Refresh the pipeline and Power BI dashboard monthly as new NAV data is published.

---

## 📄 License

This project is licensed under the MIT License — see [LICENSE](LICENSE).

## 📝 Data Note

This project uses a synthetically generated NAV dataset with realistic market statistics (volatility, drift, and risk profiles calibrated to real Indian mutual fund categories), since raw AMFI/AMC NAV history isn't freely redistributable. The full ETL → analysis → visualization pipeline is genuine and reproducible — point `etl/extract.py` at real NAV history from [AMFI](https://www.amfiindia.com/nav-history-download) and the rest of the pipeline runs unchanged.
