INSERT INTO IndustryData(RegionID,Date,Food,Entertainment,Retail,Airlines,Travel)
VALUES
(2,'2020-05-15',76.89,1137.35,739.78,367.65,21.59),
(2,'2020-05-18',74.92,1060.35,726.31,341.62,20.55),
(2,'2020-05-19',73.59,1081.55,732.21,343.16,20.17),
(2,'2020-05-20',74.14,1107.65,765.97,340.17,20.23),
(2,'2020-05-21',73.54,1127.15,776.97,364.31,21.02),
(2,'2020-05-22',73.35,1140.15,757.64,364.11,21.73),
(2,'2020-05-26',73.99,1137.65,730.59,352.11,22.84)
GO

SELECT * FROM indger_events;
GO

INSERT INTO indger_events(Column_1,eventname,start_date,end_date,region)
VALUES
(21,'Relaxation on Domestic Flights','2020-05-25','2020-12-31',2),
(22,'Relaxation on Trains','2020-05-12','2020-12-31',2);
GO

SELECT * FROM Events;
GO

INSERT INTO Events(EventName,StartDate,EndDate,RegionID)
VALUES
('Relaxation on Domestic Flights','2020-05-25','2020-12-31',2),
('Relaxation on Trains','2020-05-12','2020-12-31',2);
GO

