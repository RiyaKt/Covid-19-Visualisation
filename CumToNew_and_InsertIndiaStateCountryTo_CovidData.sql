ALTER TABLE ind_state_case_final ALTER COLUMN cum_total int
ALTER TABLE ind_state_case_final ALTER COLUMN cum_recovered int
ALTER TABLE ind_state_case_final ALTER COLUMN cum_deaths int

ALTER TABLE ind_state_case_final ADD cum_active AS(cum_total-cum_deaths-cum_recovered);
GO

SELECT * FROM ind_state_case_final;
GO

CREATE TABLE #lag(
state VARCHAR(50) NULL,
date DATE NULL,
RegionID int NULL,
cum_active int,
cum_total int,
cum_deaths int,
cum_recovered int,
cum_activelag int,
cum_totallag int,
cum_deathslag int,
cum_recoveredlag int);
GO

INSERT INTO #lag(state,date,cum_active,cum_activelag,cum_total,cum_totallag,cum_deaths,cum_deathslag,cum_recovered,cum_recoveredlag)
SELECT 
	state,
	date,
	cum_active,
	LAG(cum_active,1) OVER (
		PARTITION BY state
		ORDER BY date
	) cum_activelag,
	cum_total,
	LAG(cum_total,1) OVER (
		PARTITION BY state
		ORDER BY date
	) cum_totallag,
	cum_deaths,
	LAG(cum_deaths,1) OVER (
		PARTITION BY state
		ORDER BY date
	) cum_deathslag,
	cum_recovered,
	LAG(cum_recovered,1) OVER (
		PARTITION BY state
		ORDER BY date
	) cum_recoveredlag
FROM 
	ind_state_case_final;
GO

UPDATE #lag SET cum_activelag = 0
WHERE cum_activelag IS NULL;
GO

UPDATE #lag SET cum_totallag = 0
WHERE cum_totallag IS NULL;
GO

UPDATE #lag SET cum_deathslag = 0
WHERE cum_deathslag IS NULL;
GO

UPDATE #lag SET cum_recoveredlag = 0
WHERE cum_recoveredlag IS NULL;
GO

ALTER TABLE #lag ADD new_active AS (cum_active-cum_activelag);
GO

ALTER TABLE #lag ADD new_total AS (cum_total-cum_totallag);
GO

ALTER TABLE #lag ADD new_deaths AS (cum_deaths-cum_deathslag);
GO

ALTER TABLE #lag ADD new_recovered AS (cum_recovered-cum_recoveredlag);
GO

SELECT * FROM #lag;
GO

DROP TABLE #lag;
GO

UPDATE #lag
SET #lag.RegionID = Regions_Hierarchy.RegionID
FROM #lag
INNER JOIN Regions_Hierarchy
ON #lag.state = Regions_Hierarchy.RegionName

INSERT INTO CovidData(RegionID,Date,TotalCases,RecoveredCases,Deaths,ActiveCases,NewTotalCases,NewRecoveredCases,NewDeaths,NewActiveCases)
SELECT RegionID,date,cum_total,cum_recovered,cum_deaths,cum_active,new_total,new_recovered,new_deaths,new_active FROM #lag;
GO

SELECT * FROM dbo.CovidData;
GO

INSERT INTO CovidData(RegionID,Date,TotalCases,RecoveredCases,Deaths,ActiveCases,NewTotalCases,NewRecoveredCases,NewDeaths,NewActiveCases)
SELECT 2,date,SUM(cum_total),SUM(cum_recovered),SUM(cum_deaths),SUM(cum_active),SUM(new_total),SUM(new_recovered),SUM(new_deaths),SUM(new_active) 
FROM #lag
GROUP BY(date);
GO

SELECT * FROM Regions_Hierarchy
WHERE RegionName='Daman and Diu';
GO

SELECT * FROM Regions_Hierarchy
WHERE RegionName='Lakshadweep';
GO

INSERT INTO CovidData(RegionID,Date,TotalCases,RecoveredCases,Deaths,ActiveCases,NewTotalCases,NewRecoveredCases,NewDeaths,NewActiveCases)
VALUES
(55,'2020-05-26',0,0,0,0,0,0,0,0),
(56,'2020-05-26',0,0,0,0,0,0,0,0);
GO

SELECT * FROM CovidData
WHERE RegionID = 56;
GO

SELECT * FROM CovidData
WHERE RegionID = 55;
GO