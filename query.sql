-- Create the framework for the pga_2010_2018 table
CREATE TABLE pga_2010_2018 (
	ID INT,
	Player_Name VARCHAR(256),
	Year INT,
	Rounds NUMERIC,
	Avg_Score NUMERIC,
	Wins NUMERIC,
	Top_10 NUMERIC,
	Points NUMERIC,
	Fairway_Pct NUMERIC,
	Avg_Drive_Distance NUMERIC,
	GIR_Pct NUMERIC,
	Scrambling_Pct NUMERIC,
	Avg_SG_Putts NUMERIC,
	Avg_SG_OTT NUMERIC,
	Avg_SG_APP NUMERIC,
	Avg_SG_Total NUMERIC,
	Earnings MONEY
);

SELECT * FROM pga_2010_2018;

-- Create the framework for the pga_2019 table
CREATE TABLE pga_2019 (
	ID INT,
	Player_Name VARCHAR(256),
	Year INT,
	Rounds NUMERIC,
	Avg_Score NUMERIC,
	Wins NUMERIC,
	Top_10 NUMERIC,
	Points NUMERIC,
	Fairway_Pct NUMERIC,
	Avg_Drive_Distance NUMERIC,
	GIR_Pct NUMERIC,
	Scrambling_Pct NUMERIC,
	Avg_SG_Putts NUMERIC,
	Avg_SG_OTT NUMERIC,
	Avg_SG_APP NUMERIC,
	Avg_SG_Total NUMERIC,
	Earnings MONEY
);

SELECT * FROM pga_2019;

-- Perform a union on the two tables and order the unioned table by year in descending order
SELECT * 
FROM pga_2010_2018

UNION

SELECT *
FROM pga_2019
ORDER BY year DESC;