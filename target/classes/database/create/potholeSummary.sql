CREATE TABLE PotholeSummary_T (
     PotholeID          bigint NOT NULL AUTO_INCREMENT,
     MinLatitude        decimal(10, 8),
     MaxLatitude        decimal(10, 8),
     MinLongitude       decimal(11, 8),
     MaxLongitude       decimal(11, 8),
     AvgPotholeDepth    float,
     VehiclesCrossed    bigint,
     TotalDepthRecorded float,
     LatestTimestamp    datetime,
     RoadID             bigint CHECK(RoadID > 0),
     CONSTRAINT PotholeSummary_PK PRIMARY KEY (PotholeID));