SELECT * FROM ger_case_corr;
GO

CREATE TABLE #gertemp(
date DATE,
county VARCHAR(50),
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

INSERT INTO #gertemp(county,date,cum_total,cum_recovered,cum_deaths,cum_active,new_total,new_recovered,new_deaths,new_active)
SELECT county,date,cum_total,cum_recovered,cum_deaths,cum_active,new_total,new_recovered,new_deaths,new_active FROM ger_case_corr;
GO

UPDATE #gertemp
SET #gertemp.RegionID = Regions_Hierarchy.RegionID
FROM #gertemp
INNER JOIN Regions_Hierarchy
ON #gertemp.county = Regions_Hierarchy.RegionName


INSERT INTO CovidData(RegionID,Date,TotalCases,RecoveredCases,Deaths,ActiveCases,NewTotalCases,NewRecoveredCases,NewDeaths,NewActiveCases)
SELECT RegionID,date,cum_total,cum_recovered,cum_deaths,cum_active,new_total,new_recovered,new_deaths,new_active FROM #gertemp;
GO
SELECT * FROM CovidData
WHERE RegionID BETWEEN 209 AND 620;
GO
