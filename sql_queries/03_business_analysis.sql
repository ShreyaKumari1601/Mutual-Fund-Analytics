/*
==========================================================
Mutual Fund Analytics Project
File : 03_business_analysis.sql

Purpose:
Answer key business questions related to mutual funds.
==========================================================
*/

------------------------------------------------------------
-- Business Question:
-- Which AMCs have the highest number of mutual fund schemes?
------------------------------------------------------------

SELECT

fund_house,
COUNT(*) AS Total_Schemes

FROM mutual_funds

GROUP BY fund_house

ORDER BY Total_Schemes DESC;

------------------------------------------------------------
-- Business Question:
-- Which scheme categories have the highest number of schemes?
------------------------------------------------------------

SELECT

scheme_category,
COUNT(*) AS Total_Schemes

FROM mutual_funds

GROUP BY scheme_category

ORDER BY Total_Schemes DESC;

------------------------------------------------------------
-- Business Question:
-- Which scheme types are most common?
------------------------------------------------------------

SELECT

scheme_type,
COUNT(*) AS Total_Schemes

FROM mutual_funds

GROUP BY scheme_type

ORDER BY Total_Schemes DESC;

------------------------------------------------------------
-- Business Question:
-- Which schemes have the highest NAV?
------------------------------------------------------------

SELECT

scheme_name,
fund_house,
net_asset_value

FROM mutual_funds

ORDER BY net_asset_value DESC

LIMIT 10;

------------------------------------------------------------
-- Business Question:
-- What is the average NAV for each fund house?
------------------------------------------------------------

SELECT

fund_house,
ROUND(AVG(net_asset_value),2) AS Average_NAV

FROM mutual_funds

GROUP BY fund_house

ORDER BY Average_NAV DESC;

------------------------------------------------------------
-- Business Question:
-- Which scheme categories have the highest average NAV?
------------------------------------------------------------

SELECT

scheme_category,
ROUND(AVG(net_asset_value),2) AS Average_NAV

FROM mutual_funds

GROUP BY scheme_category

ORDER BY Average_NAV DESC;