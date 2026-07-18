/*
==========================================================
Mutual Fund Analytics Project
File : 01_database_setup.sql

Purpose:
Creates the database and table structure required for
loading the cleaned mutual fund dataset.
==========================================================
*/

-- Create database
CREATE DATABASE IF NOT EXISTS mutual_fund_analytics;

-- Use database
USE mutual_fund_analytics;

-- Create table
CREATE TABLE mutual_funds (

    scheme_code INT,
    scheme_name VARCHAR(255),
    fund_house VARCHAR(255),
    scheme_type VARCHAR(150),
    scheme_category VARCHAR(255),
    net_asset_value DECIMAL(12,4),
    date DATE

);

-- Verify table creation
SHOW TABLES;

DESCRIBE mutual_funds;

-- Verify imported records
SELECT COUNT(*) AS Total_Rows
FROM mutual_funds;

-- Preview imported data
SELECT *
FROM mutual_funds
LIMIT 10;