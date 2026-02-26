-- Check import success
SELECT *
FROM dbo.Hawaii_Tourism_Data

-- Check average visitor LOS per year (Statewide and by indiviudal islands)
SELECT 
Indicator,
AVG(CAST([1999] AS FLOAT)) AS Avg_1999,
AVG(CAST([2000] AS FLOAT)) AS Avg_2000,
AVG(CAST([2001] AS FLOAT)) AS Avg_2001,
AVG(CAST([2002] AS FLOAT)) AS Avg_2002,
AVG(CAST([2003] AS FLOAT)) AS Avg_2003,
AVG(CAST([2004] AS FLOAT)) AS Avg_2004,
AVG(CAST([2005] AS FLOAT)) AS Avg_2005,
AVG(CAST([2006] AS FLOAT)) AS Avg_2006,
AVG(CAST([2007] AS FLOAT)) AS Avg_2007,
AVG(CAST([2008] AS FLOAT)) AS Avg_2008,
AVG(CAST([2009] AS FLOAT)) AS Avg_2009,
AVG(CAST([2010] AS FLOAT)) AS Avg_2010,
AVG(CAST([2011] AS FLOAT)) AS Avg_2011,
AVG(CAST([2012] AS FLOAT)) AS Avg_2012,
AVG(CAST([2013] AS FLOAT)) AS Avg_2013,
AVG(CAST([2014] AS FLOAT)) AS Avg_2014,
AVG(CAST([2015] AS FLOAT)) AS Avg_2015,
AVG(CAST([2016] AS FLOAT)) AS Avg_2016,
AVG(CAST([2017] AS FLOAT)) AS Avg_2017,
AVG(CAST([2018] AS FLOAT)) AS Avg_2018,
AVG(CAST([2019] AS FLOAT)) AS Avg_2019,
AVG(CAST([2020] AS FLOAT)) AS Avg_2020,
AVG(CAST([2021] AS FLOAT)) AS Avg_2021
FROM dbo.Hawaii_Tourism_Data
GROUP BY Indicator

-- First time visitor trip to Hawaii duration
SELECT *
FROM dbo.Hawaii_Tourism_Data
WHERE visitor_type = 'First-Time Visitors'

-- Repeat visitor trip duration to Hawaii
SELECT *
FROM dbo.Hawaii_Tourism_Data
WHERE visitor_type = 'Repeat Visitors'

-- Average visitor trip duration per year ordered by visitor type (First-Time vs Repeat Visitors)
SELECT 
visitor_type,
AVG(CAST([1999] AS FLOAT)) AS Avg_1999,
AVG(CAST([2000] AS FLOAT)) AS Avg_2000,
AVG(CAST([2001] AS FLOAT)) AS Avg_2001,
AVG(CAST([2002] AS FLOAT)) AS Avg_2002,
AVG(CAST([2003] AS FLOAT)) AS Avg_2003,
AVG(CAST([2004] AS FLOAT)) AS Avg_2004,
AVG(CAST([2005] AS FLOAT)) AS Avg_2005,
AVG(CAST([2006] AS FLOAT)) AS Avg_2006,
AVG(CAST([2007] AS FLOAT)) AS Avg_2007,
AVG(CAST([2008] AS FLOAT)) AS Avg_2008,
AVG(CAST([2009] AS FLOAT)) AS Avg_2009,
AVG(CAST([2010] AS FLOAT)) AS Avg_2010,
AVG(CAST([2011] AS FLOAT)) AS Avg_2011,
AVG(CAST([2012] AS FLOAT)) AS Avg_2012,
AVG(CAST([2013] AS FLOAT)) AS Avg_2013,
AVG(CAST([2014] AS FLOAT)) AS Avg_2014,
AVG(CAST([2015] AS FLOAT)) AS Avg_2015,
AVG(CAST([2016] AS FLOAT)) AS Avg_2016,
AVG(CAST([2017] AS FLOAT)) AS Avg_2017,
AVG(CAST([2018] AS FLOAT)) AS Avg_2018,
AVG(CAST([2019] AS FLOAT)) AS Avg_2019,
AVG(CAST([2020] AS FLOAT)) AS Avg_2020,
AVG(CAST([2021] AS FLOAT)) AS Avg_2021
FROM dbo.Hawaii_Tourism_Data
WHERE visitor_type IN ('First-Time Visitors', 'Repeat Visitors')
GROUP BY visitor_type

-- YoY change in LOS from 1999 to 2021 for each visitor type
SELECT
visitor_type,
AVG(CAST([2021] AS FLOAT)) - AVG(CAST([1999] AS FLOAT)) AS YoY_Change
FROM dbo.Hawaii_Tourism_Data
WHERE visitor_type IN ('First-Time Visitors', 'Repeat Visitors')
GROUP BY visitor_type

-- YoY change  in LOS by Island
SELECT 
Indicator,
CAST([2021] AS FLOAT) - CAST([2020] AS FLOAT) AS YoY_Change_2021,
CAST([2020] AS FLOAT) - CAST([2019] AS FLOAT) AS YoY_Change_2020,
CAST([2019] AS FLOAT) - CAST([2018] AS FLOAT) AS YoY_Change_2019
FROM dbo.Hawaii_Tourism_Data
WHERE visitor_type = 'All visitors by air' AND (Indicator = 'LOS Statewide' OR Indicator LIKE 'LOS on %')
ORDER BY Indicator;
