ALTER TABLE ind_demo_state
ADD RegionID int;
GO

SELECT * FROM ind_demo_state;

UPDATE ind_demo_state
SET ind_demo_state.RegionID = Regions_Hierarchy.RegionID
FROM ind_demo_state
INNER JOIN Regions_Hierarchy ON
ind_demo_state.state = Regions_Hierarchy.RegionName
GO

INSERT INTO dbo.AttributesData(AttributeID,RegionID,Value)
SELECT 1,RegionID,totalpopulation FROM dbo.ind_demo_state;
GO

INSERT INTO dbo.AttributesData(AttributeID,RegionID,Value)
SELECT 2,RegionID,percent_female FROM dbo.ind_demo_state;
GO

INSERT INTO dbo.AttributesData(AttributeID,RegionID,Value)
SELECT 3,RegionID,percent_male FROM dbo.ind_demo_state;
GO

INSERT INTO dbo.AttributesData(AttributeID,RegionID,Value)
SELECT 4,RegionID,percent_children FROM dbo.ind_demo_state;
GO

INSERT INTO dbo.AttributesData(AttributeID,RegionID,Value)
SELECT 5,RegionID,percent_adults FROM dbo.ind_demo_state;
GO

INSERT INTO dbo.AttributesData(AttributeID,RegionID,Value)
SELECT 6,RegionID,percent_oldage FROM dbo.ind_demo_state;
GO

SELECT * FROM AttributesData;
GO

ALTER TABLE ger_demo_state
ADD RegionID int;
GO

SELECT * FROM ger_demo_state;

UPDATE ger_demo_state
SET ger_demo_state.RegionID = Regions_Hierarchy.RegionID
FROM ger_demo_state
INNER JOIN Regions_Hierarchy ON
ger_demo_state.state = Regions_Hierarchy.RegionName
GO

INSERT INTO dbo.AttributesData(AttributeID,RegionID,Value)
SELECT 1,RegionID,population FROM dbo.ger_demo_state;
GO

INSERT INTO dbo.AttributesData(AttributeID,RegionID,Value)
SELECT 2,RegionID,percent_female FROM dbo.ger_demo_state;
GO

INSERT INTO dbo.AttributesData(AttributeID,RegionID,Value)
SELECT 3,RegionID,percent_male FROM dbo.ger_demo_state;
GO

INSERT INTO dbo.AttributesData(AttributeID,RegionID,Value)
SELECT 4,RegionID,percent_children FROM dbo.ger_demo_state;
GO

INSERT INTO dbo.AttributesData(AttributeID,RegionID,Value)
SELECT 5,RegionID,percent_adults FROM dbo.ger_demo_state;
GO

INSERT INTO dbo.AttributesData(AttributeID,RegionID,Value)
SELECT 6,RegionID,percent_oldage FROM dbo.ger_demo_state;
GO

SELECT * FROM AttributesData;
GO

ALTER TABLE dbo.Events
ALTER COLUMN EventName NVARCHAR(100);
GO

SELECT * FROM indger_events;
GO

INSERT INTO dbo.Events(EventName,StartDate,EndDate,RegionID)
SELECT eventname,start_date,end_date,region FROM indger_events;
GO

SELECT * FROM dbo.Events;
GO
