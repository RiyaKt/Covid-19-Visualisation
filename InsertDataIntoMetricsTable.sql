SELECT * FROM dbo.Metrics;
GO

INSERT INTO dbo.Metrics(MetricName,MetricType,MetricColumn,MinDate,MaxDate,SourceTable)
VALUES
('Airlines Industry','Stock','Airlines','2020-01-01','2020-12-31','dbo.IndustryData'),
('Travel Industry','Stock','Travel','2020-01-01','2020-12-31','dbo.IndustryData'),
('Retail Industry','Stock','Retail','2020-01-01','2020-12-31','dbo.IndustryData'),
('Entertainment Industry','Stock','Entertainment','2020-01-01','2020-12-31','dbo.IndustryData'),
('Food Industry','Stock','Food','2020-01-01','2020-12-31','dbo.IndustryData'),
('Cumulative Confirmed Cases','Stock','TotalCases','2020-01-01','2020-12-31','dbo.CovidData'),
('Cumulative Active Cases','Stock','ActiveCases','2020-01-01','2020-12-31','dbo.CovidData'),
('Cumulative Recovered Cases','Stock','RecoveredCases','2020-01-01','2020-12-31','dbo.CovidData'),
('Cumulative Deaths','Stock','Deaths','2020-01-01','2020-12-31','dbo.CovidData'),
('New Confirmed Cases','Flow','NewTotalCases','2020-01-01','2020-12-31','dbo.CovidData'),
('New Active Cases','Flow','NewActiveCases','2020-01-01','2020-12-31','dbo.CovidData'),
('New Recovered Cases','Flow','NewRecoveredCases','2020-01-01','2020-12-31','dbo.CovidData'),
('New Deaths','Flow','NewDeaths','2020-01-01','2020-12-31','dbo.CovidData')
GO