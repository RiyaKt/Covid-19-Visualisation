CREATE TABLE DBO.Regions_Hierarchy
(RegionID int IDENTITY(1,1) PRIMARY KEY,
RegionName VARCHAR(50) NULL,
RegionLevel VARCHAR(50) NULL,
SuperRegionID int NULL);

INSERT 
Regions_Hierarchy (RegionName,RegionLevel,SuperRegionID)
VALUES 
('Germany','Country',0),
('India','Country',0),
('Italy','Country',0),
('Singapore','Country',0),
('USA','Country',0);
GO

SELECT * FROM dbo.Regions_Hierarchy;
GO

INSERT INTO Regions_Hierarchy(RegionName)
SELECT DISTINCT state FROM dbo.ger_case_final;
GO

UPDATE Regions_Hierarchy
SET RegionLevel = 'State'
WHERE RegionID BETWEEN 6 and 21;
GO

UPDATE Regions_Hierarchy
SET SuperRegionID = 1
WHERE RegionID BETWEEN 6 and 21;
GO

INSERT INTO Regions_Hierarchy(RegionName)
SELECT DISTINCT state FROM dbo.ind_state_case_final;
GO

INSERT INTO Regions_Hierarchy(RegionName)
VALUES ('Sikkim'),
('Daman and Diu'),
('Lakshadweep');
GO

UPDATE Regions_Hierarchy
SET RegionLevel = 'State'
WHERE RegionID BETWEEN 22 and 56;
GO

UPDATE Regions_Hierarchy
SET SuperRegionID = 2
WHERE RegionID BETWEEN 22 and 56;
GO

ALTER TABLE dbo.Regions_Hierarchy
ADD CONSTRAINT uq_RegionsHierarchy UNIQUE(RegionName,SuperRegionID);
GO