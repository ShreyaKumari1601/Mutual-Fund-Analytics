-- =====================================================================
-- Mutual Fund NAV Analytics — Business Questions (SQLite)
-- Run: sqlite3 data/processed/mutual_fund_warehouse.db < sql/queries.sql
-- =====================================================================

-- 1. Latest NAV and 1-year return per scheme
SELECT
    scheme_name,
    category,
    MAX(date) AS latest_date,
    ROUND(nav, 2) AS latest_nav
FROM nav_facts
WHERE date = (SELECT MAX(date) FROM nav_facts)
GROUP BY scheme_name;

-- 2. Average annualized return by category (approx, using mean daily return)
SELECT
    category,
    ROUND(AVG(daily_return) * 252 * 100, 2) AS avg_annualized_return_pct
FROM nav_facts
GROUP BY category
ORDER BY avg_annualized_return_pct DESC;

-- 3. Annualized volatility (risk) by category
SELECT
    category,
    ROUND(
        (
            SELECT AVG((daily_return - sub.avg_ret) * (daily_return - sub.avg_ret))
            FROM nav_facts n2, (SELECT AVG(daily_return) AS avg_ret FROM nav_facts n1 WHERE n1.category = n2.category) sub
            WHERE n2.category = nav_facts.category
        ), 6
    ) AS variance_placeholder
FROM nav_facts
GROUP BY category
LIMIT 0;  -- volatility/drawdown computed in Python (analysis/eda_analysis.py) — SQLite lacks STDDEV natively

-- 4. Top 5 schemes by latest AUM
SELECT scheme_name, category, amc, ROUND(aum_cr, 2) AS aum_cr
FROM nav_facts
WHERE date = (SELECT MAX(date) FROM nav_facts)
ORDER BY aum_cr DESC
LIMIT 5;

-- 5. Number of schemes per AMC
SELECT amc, COUNT(DISTINCT scheme_name) AS num_schemes
FROM scheme_dim
GROUP BY amc
ORDER BY num_schemes DESC;

-- 6. Category-wise total AUM (latest date)
SELECT category, ROUND(SUM(aum_cr), 2) AS total_aum_cr
FROM nav_facts
WHERE date = (SELECT MAX(date) FROM nav_facts)
GROUP BY category
ORDER BY total_aum_cr DESC;

-- 7. Best and worst performing scheme overall (total return since inception)
SELECT
    scheme_name,
    ROUND(
        (
            (SELECT nav FROM nav_facts n2 WHERE n2.scheme_name = n1.scheme_name ORDER BY date DESC LIMIT 1)
            -
            (SELECT nav FROM nav_facts n3 WHERE n3.scheme_name = n1.scheme_name ORDER BY date ASC LIMIT 1)
        ) /
        (SELECT nav FROM nav_facts n3 WHERE n3.scheme_name = n1.scheme_name ORDER BY date ASC LIMIT 1) * 100
    , 2) AS total_return_pct
FROM nav_facts n1
GROUP BY scheme_name
ORDER BY total_return_pct DESC;

-- 8. Monthly average NAV trend for a given scheme (example: Bluechip Growth Fund)
SELECT month, ROUND(AVG(nav), 2) AS avg_nav
FROM nav_facts
WHERE scheme_name = 'Bluechip Growth Fund'
GROUP BY month
ORDER BY month;
