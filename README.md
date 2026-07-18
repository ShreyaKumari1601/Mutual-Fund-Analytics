📊 Mutual Fund Analytics | End-to-End Data Analytics Project

An end-to-end **Data Analytics Project** that demonstrates the complete analytics lifecycle—from understanding raw data to building an interactive Power BI dashboard. This project uses an **Indian Mutual Funds dataset** to uncover business insights through **Python, SQL, MySQL, and Power BI**.

The project focuses on transforming raw financial data into meaningful business insights using industry-standard data analytics practices.

📌 Project Overview

The objective of this project is to analyze mutual fund schemes across different fund houses, categories, and scheme types to answer key business questions such as:

* Which fund houses offer the highest number of schemes?
* Which schemes have the highest and lowest Net Asset Value (NAV)?
* How are schemes distributed across categories?
* What are the average NAV values across different fund houses and categories?
* What business insights can help investors understand the mutual fund landscape?

The project follows a structured analytics workflow similar to real-world data analytics projects.

 
🛠 Project Workflow

Raw Dataset
      │
      ▼
Data Understanding
      │
      ▼
ETL & Data Cleaning
      │
      ▼
Exploratory Data Analysis (EDA)
      │
      ▼
Feature Engineering
      │
      ▼
SQL Business Analysis
      │
      ▼
Advanced SQL Analysis
      │
      ▼
Power BI Dashboard


## 📂 Project Structure

```text
Mutual-Fund-Analytics/
│
├── data_raw/
│   └── mutual_funds_data.csv
│
├── data_cleaned/
│   └── cleaned_mutual_funds_data.csv
│
├── notebooks/
│   ├── 01_Data_Understanding.ipynb
│   ├── 02_ETL_and_Data_Cleaning.ipynb
│   ├── 03_Exploratory_Data_Analysis.ipynb
│   └── 04_Feature_Engineering.ipynb
│
├── sql_queries/
│   ├── 01_database_setup.sql
│   ├── 02_data_validation.sql
│   ├── 03_business_analysis.sql
│   └── 04_advanced_analysis.sql
│
├── Power BI/
│   ├── Mutual_Fund_Analytics.pbix
│   └── Mutual_Fund_Analytics_Dashboard.png
│
└── README.md
```


 📚 Technologies Used

* Python
* Pandas
* NumPy
* Jupyter Notebook
* MySQL
* SQL
* Power BI Desktop
* DAX
* Git
* GitHub

 📈 Data Analysis Pipeline

 1️⃣ Data Understanding

* Explored the dataset structure
* Identified column names and data types
* Checked for missing values
* Understood business meaning of each attribute
* Performed initial quality assessment

 2️⃣ ETL & Data Cleaning

Performed:

* Missing value handling
* Duplicate removal
* Data type conversion
* Column standardization
* Data consistency checks
* Clean dataset generation

 3️⃣ Exploratory Data Analysis (EDA)

Performed detailed exploratory analysis including:

* Distribution of NAV
* Fund House analysis
* Scheme Category analysis
* Scheme Type analysis
* Summary statistics
* Outlier detection
* Data visualization

 4️⃣ Feature Engineering

Created additional analytical features such as:

* Year extraction
* Derived business metrics
* Aggregated analytical columns
* Data prepared for SQL and Power BI

5️⃣ SQL Business Analysis

Business questions answered using SQL:

* Total number of schemes
* Total fund houses
* Total scheme categories
* Average NAV
* Maximum NAV
* Minimum NAV
* Top Fund Houses by number of schemes
* Top Schemes by NAV
* Bottom Schemes by NAV
* Category-wise analysis
* Scheme type analysis

6️⃣ Advanced SQL Analysis

Advanced analytical queries including:

* Ranking functions
* Window functions
* Aggregate analysis
* Top-N and Bottom-N analysis
* Business summary reports
* Performance comparisons


📊 Power BI Dashboard

The final dashboard was designed to provide a complete business overview of the mutual fund dataset.

 Dashboard Highlights

 KPI Cards

* Total Schemes
* Total Fund Houses
* Total Categories
* Average NAV
* Highest NAV
* Lowest NAV


Visualizations

* NAV Distribution
* Scheme Category Distribution
* Scheme Type Distribution
* Top 10 Fund Houses by Number of Schemes
* Top 10 Schemes by NAV
* Bottom 10 Schemes by NAV
* Average NAV by Fund House
* Average NAV by Scheme Category
* Detailed Scheme Table

Interactive Features

* Fund House Slicer
* Scheme Category Slicer
* Scheme Type Slicer
* Year Slicer
* Cross-filtering
* Interactive KPI updates

📸 Dashboard Preview

![Mutual Fund Analytics Dashboard]("C:\Users\shrey\OneDrive\Desktop\Mutual Fund Analytics\Mutual_Fund_Analytics_Dashboard.png")


📊 Key Business Insights

* Identified the fund houses managing the highest number of mutual fund schemes.
* Ranked schemes based on Net Asset Value (NAV).
* Compared average NAV across fund houses and scheme categories.
* Analyzed the distribution of schemes by category and scheme type.
* Built an interactive dashboard to support business decision-making.


🎯 Skills Demonstrated

* Data Cleaning
* Data Transformation
* Exploratory Data Analysis
* Feature Engineering
* SQL Query Writing
* Advanced SQL
* Business Intelligence
* Power BI Dashboard Development
* DAX Measures
* Data Visualization
* Business Analytics
* Git & GitHub

🚀 How to Run the Project

1. Clone the repository:

git clone https://github.com/your-username/mutual-fund-analytics.git

2. Open the Jupyter notebooks to review the data preparation and analysis.

3. Execute the SQL scripts in MySQL Workbench.

4. Open the `.pbix` file in Power BI Desktop to explore the interactive dashboard.


📌 Future Improvements

* Integrate live AMFI mutual fund data using APIs.
* Add historical NAV trend analysis.
* Implement forecasting using Power BI.
* Build investor-focused performance metrics.
* Publish the dashboard to Power BI Service for online access.


👩‍💻 Author

Shreya Kumari

⭐ If you like this project, don't forget to star the repository!
