/*
==========================================================
Mutual Fund Analytics Project
File : 02_data_validation.sql

Purpose:
Validate imported data before performing business analysis.
==========================================================
*/

-- Business Question:
-- How many records exist in the dataset?

SELECT COUNT(*) AS Total_Records
FROM mutual_funds;

------------------------------------------------------------

-- Business Question:
-- Are there any duplicate schemes?

SELECT
scheme_code,
COUNT(*) AS Duplicate_Count
FROM mutual_funds
GROUP BY scheme_code
HAVING COUNT(*) > 1;

------------------------------------------------------------

-- Business Question:
-- Are there any NULL values?

SELECT

SUM(scheme_code IS NULL) AS Missing_Scheme_Code,
SUM(scheme_name IS NULL) AS Missing_Scheme_Name,
SUM(fund_house IS NULL) AS Missing_Fund_House,
SUM(scheme_type IS NULL) AS Missing_Scheme_Type,
SUM(scheme_category IS NULL) AS Missing_Category,
SUM(net_asset_value IS NULL) AS Missing_NAV,
SUM(date IS NULL) AS Missing_Date

FROM mutual_funds;

------------------------------------------------------------

-- Business Question:
-- What is the available date range?

SELECT

MIN(date) AS Start_Date,
MAX(date) AS End_Date

FROM mutual_funds;

------------------------------------------------------------

-- Business Question:
-- Verify table structure.

DESCRIBE mutual_funds;