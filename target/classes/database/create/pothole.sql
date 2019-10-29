CREATE TABLE PotholeSummary_T ( 
     PotholeID          bigint NOT NULL IDENTITY(1, 1), 
     MinLatitude        decimal(10, 8), 
     MaxLatitude        decimal(10, 8), 
     MinLongitude       decimal(11, 8), 
     MaxLongitude       decimal(11, 8), 
     AvgPotholeDepth    float, 
     VehiclesCrossed    bigint, 
     TotalDepthRecorded float, 
     LatestTimestamp    datetime, 
     RoadID             bigint CHECK(RoadID &gt; 0), 
     CONSTRAINT PotholeSummary_PK PRIMARY KEY (PotholeID), 
     CONSTRAINT Road_FK FOREIGN KEY (RoadID) REFERENCES Road_T(RoadID))