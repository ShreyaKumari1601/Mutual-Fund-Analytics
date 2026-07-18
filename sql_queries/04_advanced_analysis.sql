/*
==========================================================
Mutual Fund Analytics Project
File : 04_advanced_analysis.sql

Purpose:
Perform advanced SQL analysis using aggregation,
ranking and date functions.
==========================================================
*/

------------------------------------------------------------
-- Business Question:
-- How many schemes were recorded each year?
------------------------------------------------------------

SELECT

YEAR(date) AS Year,
COUNT(*) AS Total_Schemes

FROM mutual_funds

GROUP BY YEAR(date)

ORDER BY Year;

------------------------------------------------------------
-- Business Question:
-- Which AMCs offer the highest average NAV?
------------------------------------------------------------

SELECT

fund_house,
ROUND(AVG(net_asset_value),2) AS Average_NAV

FROM mutual_funds

GROUP BY fund_house

ORDER BY Average_NAV DESC

LIMIT 10;

------------------------------------------------------------
-- Business Question:
-- Which scheme categories have NAV greater than the overall average?
------------------------------------------------------------

SELECT

scheme_category,
ROUND(AVG(net_asset_value),2) AS Average_NAV

FROM mutual_funds

GROUP BY scheme_category

HAVING AVG(net_asset_value) >
(
SELECT AVG(net_asset_value)
FROM mutual_funds
)

ORDER BY Average_NAV DESC;

------------------------------------------------------------
-- Business Question:
-- Top 5 schemes with the highest NAV.
------------------------------------------------------------

SELECT

scheme_name,
fund_house,
scheme_category,
net_asset_value

FROM mutual_funds

ORDER BY net_asset_value DESC

LIMIT 5;

------------------------------------------------------------
-- Business Question:
-- Number of schemes offered by each AMC in each scheme type.
------------------------------------------------------------

SELECT

fund_house,
scheme_type,
COUNT(*) AS Total_Schemes

FROM mutual_funds

GROUP BY fund_house, scheme_type

ORDER BY fund_house, Total_Schemes DESC;