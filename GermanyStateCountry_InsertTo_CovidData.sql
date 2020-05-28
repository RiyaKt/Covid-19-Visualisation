INSERT INTO CovidData(RegionID,Date,TotalCases,ActiveCases,RecoveredCases,Deaths,NewTotalCases,NewActiveCases,NewRecoveredCases,NewDeaths)
SELECT 1,Date,cum_total,cum_active,cum_recovered,cum_deaths,new_total,new_active,new_recovered,new_deaths FROM ger_country_case;
GO

SELECT * FROM CovidData
WHERE RegionID = 1;
GO

CREATE TABLE #gertemp(
date DATE,
state VARCHAR(50),
RegionID int,
cum_total int,
cum_recovered int,
cum_deaths int,
cum_active int,
new_total int,
new_recovered int,
new_deaths int,
new_active int
);
GO

INSERT INTO #gertemp(state,date,cum_total,cum_recovered,cum_deaths,cum_active,new_total,new_recovered,new_deaths,new_active)
SELECT state,date,cum_total,cum_recovered,cum_deaths,cum_active,new_total,new_recovered,new_deaths,new_active FROM ger_covid_state;
GO

UPDATE #gertemp
SET #gertemp.RegionID = Regions_Hierarchy.RegionID
FROM #gertemp
INNER JOIN Regions_Hierarchy
ON #gertemp.state = Regions_Hierarchy.RegionName


INSERT INTO CovidData(RegionID,Date,TotalCases,RecoveredCases,Deaths,ActiveCases,NewTotalCases,NewRecoveredCases,NewDeaths,NewActiveCases)
SELECT RegionID,date,cum_total,cum_recovered,cum_deaths,cum_active,new_total,new_recovered,new_deaths,new_active FROM #gertemp;
GO

SELECT * FROM CovidData
WHERE RegionID BETWEEN 6 AND 21;
GO