CREATE TABLE dbo.Events(
EventID int IDENTITY(1,1) PRIMARY KEY,
EventName NVARCHAR(100),
StartDate date,
EndDate date,
RegionID int FOREIGN KEY REFERENCES dbo.Regions_Hierarchy(RegionID));
GO

CREATE TABLE dbo.Metrics(
MetricID int IDENTITY(1,1) PRIMARY KEY,
MetricName NVARCHAR(100),
MetricType NVARCHAR(50),
MetricColumn NVARCHAR(50),
MinDate date,
MaxDate date,
SourceTable NVARCHAR(50));
GO

SELECT * FROM dbo.Events;
GO

SELECT * FROM dbo.Metrics;
GO