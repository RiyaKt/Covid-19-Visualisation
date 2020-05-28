INSERT INTO dbo.IndustryData(Date,RegionID,Airlines)
SELECT date,2,calc_index FROM dbo.ind_airlines_final;
GO

UPDATE IndustryData
SET IndustryData.Food = ind_food_final.calc_index
FROM IndustryData
INNER JOIN ind_food_final ON
IndustryData.Date = ind_food_final.date
WHERE RegionID = 2;
GO

UPDATE IndustryData
SET IndustryData.Travel = ind_travel_final.calc_index
FROM IndustryData
INNER JOIN ind_travel_final ON
IndustryData.Date = ind_travel_final.date
WHERE RegionID = 2;
GO

UPDATE IndustryData
SET IndustryData.Retail = ind_retail_final.calc_index
FROM IndustryData
INNER JOIN ind_retail_final ON
IndustryData.Date = ind_retail_final.date
WHERE RegionID = 2;
GO

UPDATE IndustryData
SET IndustryData.Entertainment = ind_entertainment.price
FROM IndustryData
INNER JOIN dbo.ind_entertainment ON
IndustryData.Date = dbo.ind_entertainment.date
WHERE RegionID = 2;
GO

SELECT * FROM IndustryData;
GO

INSERT INTO dbo.IndustryData(Date,RegionID,Airlines,Travel,Retail,Entertainment,Food)
SELECT date,1,airline,travel,retail,entertainment,food FROM dbo.ger_industry;
GO