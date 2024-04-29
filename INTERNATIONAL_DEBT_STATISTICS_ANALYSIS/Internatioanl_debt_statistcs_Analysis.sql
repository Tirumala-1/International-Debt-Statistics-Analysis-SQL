USE debts;

SELECT * 
FROM international_debt_dataset;

SELECT * 
FROM international_debt_dataset
LIMIT 10;

-- 1. FINDING THE NO.OF DISTINCT COUNTRIES
-- extracting the number of unique countries present in the table.
SELECT COUNT(DISTINCT(country_name)) AS Total_countries
FROM international_debt_dataset;

-- 2. FINDING OUT NO.OF DISTINCT DEBT INDICATORS
-- We can see there are a total of 124 countries present on the table.

/* As we saw in the first section, there is a column called indicator_name that briefly specifies the purpose of taking the debt. 
Just beside that column, there is another column called indicator_code which symbolises the category of these debts.

Knowing about these various debt indicators will help us to understand the areas in which a country can possibly be indebted to. */

SELECT DISTINCT(indicator_code) AS distinct_debt_indicators
FROM international_debt_dataset
ORDER BY distinct_debt_indicators;

-- 3.TOTAL AMOUNT OF DEBT OWED BY COUNTRIES
SELECT round(SUM(debt)/1000000, 2)
FROM international_debt_dataset;

-- 4. COUNTRY WITH HIGHEST DEBT
SELECT country_name, ROUND(SUM(debt)/1000000,2) AS total_debt
FROM international_debt_dataset
GROUP BY country_name
ORDER BY 2 DESC
LIMIT 1;

-- 5. AVERAGE AMOUNT OF DEBT ACROSS INDICATORS
SELECT indicator_code as debt_indicator, round(avg(debt)/1000000,2) as average_debt, indicator_name
FROM international_debt_dataset
GROUP BY debt_indicator, indicator_name
ORDER BY average_debt desc
limit 10;  

-- 6. THE MOST COMMON DEBT INDICATOR
SELECT indicator_name, count(indicator_code) AS indicator_count
FROM international_debt_dataset
GROUP BY indicator_code, indicator_name
ORDER BY indicator_count DESC
limit 20;


