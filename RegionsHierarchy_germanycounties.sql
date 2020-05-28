SELECT * FROM dbo.Regions_Hierarchy;
GO

INSERT INTO Regions_Hierarchy(RegionName)
SELECT DISTINCT county FROM dbo.ger_case_final;
GO

UPDATE Regions_Hierarchy
SET RegionLevel = 'County'
WHERE RegionID BETWEEN 209 and 620;
GO

CREATE TABLE #ger_map(
state VARCHAR(50) NULL,
county VARCHAR(50) NULL,
RegionID int NULL)
GO

INSERT INTO #ger_map(county,state)
SELECT DISTINCT county,state FROM dbo.ger_case_final;
GO

SELECT * FROM #ger_map;
GO

UPDATE #ger_map
SET #ger_map.RegionID = Regions_Hierarchy.RegionID
FROM #ger_map
INNER JOIN Regions_Hierarchy ON
#ger_map.state = Regions_Hierarchy.RegionName
GO

UPDATE Regions_Hierarchy
SET Regions_Hierarchy.SuperRegionID = #ger_map.RegionID
FROM Regions_Hierarchy
INNER JOIN #ger_map ON
#ger_map.county = Regions_Hierarchy.RegionName
GO