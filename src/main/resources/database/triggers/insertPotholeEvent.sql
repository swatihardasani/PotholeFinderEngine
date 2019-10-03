

DROP TRIGGER IF EXISTS `potholeEventTrigger`;


delimiter #
CREATE TRIGGER `potholeEventTrigger`
    AFTER INSERT ON `db_example`.`pothole_event`
    FOR EACH ROW
BEGIN


    SET @pLat = new.latitude;
    SET @pLong = new.longitude;
    SET @pDepth = new.depth;
    SET @userId = new.user_id;
    SET @pTimestamp = current_time();
    SET @MinLatitude = 99999.00;
    SET @MaxLatitude = -99999.0;
    SET @MinLongitude = 99999.0;
    SET @MaxLongitude = -99999.0;
    SET @PotholeId = null;
    SET @VehicleCrossed = null;
    SET @LatestTimestamp = null;
    SET @TotalDepthRecorded = null;

    SET @isNewPothole = true;

    SELECT
        new.latitude,
        new.longitude,
        new.depth,
        new.user_id,
        new.id,
        b.MinLatitude,
        b.MaxLatitude,
        b.MinLongitude,
        b.MaxLongitude,
        b.PotholeID,
        b.VehiclesCrossed,
        b.LatestTimestamp,
        b.TotalDepthRecorded

    INTO @pLat, @pLong, @pDepth, @userId, @pId, @MinLatitude, @MaxLatitude, @MinLongitude, @MaxLongitude, @PotholeId, @VehiclesCrossed, @LatestTimestamp, @TotalDepthRecorded

    FROM  PotholeSummary_T b

    WHERE (1609.34 * 2 * 3961 * asin(sqrt(power((sin(radians((b.MinLatitude - new.latitude) / 2))), 2) + cos(radians(new.latitude)) * cos(radians(b.MinLatitude)) * power((sin(radians((b.MinLongitude - new.longitude) / 2))),2))) < 10.0
        OR 1609.34 * 2 * 3961 * asin(sqrt(power((sin(radians((b.MaxLatitude - new.latitude) / 2))), 2) + cos(radians(new.latitude)) * cos(radians(b.MaxLatitude)) * power((sin(radians((b.MinLongitude - new.longitude) / 2))),2))) < 10.0
        OR 1609.34 * 2 * 3961 * asin(sqrt(power((sin(radians((b.MinLatitude - new.latitude) / 2))), 2) + cos(radians(new.latitude)) * cos(radians(b.MinLatitude)) * power((sin(radians((b.MaxLongitude - new.longitude) / 2))),2))) < 10.0
        OR 1609.34 * 2 * 3961 * asin(sqrt(power((sin(radians((b.MaxLatitude - new.latitude) / 2))), 2) + cos(radians(new.latitude)) * cos(radians(b.MaxLatitude)) * power((sin(radians((b.MaxLongitude - new.longitude) / 2))),2))) < 10.0 )

    LIMIT 1;

    IF @pLat < @MinLatitude THEN
        SET @MinLatitude = @pLat;
        SET @isNewPothole = false;
    END IF;

    IF @pLat > @MaxLatitude THEN
        SET @MaxLatitude = @pLat;
        SET @isNewPothole = false;
    END IF;

    IF @pLong < @MinLongitude THEN
        SET @MinLongitude = @pLong;
        SET @isNewPothole = false;
    END IF;

    IF @pLong > @MaxLongitude THEN
        SET @MaxLongitude = @pLong;
        SET @isNewPothole = false;
    END IF;

    IF TIMESTAMPDIFF(SECOND, new.Timestamp, @LatestTimestamp)  > 0
    THEN SET @LatestTimestamp = new.Timestamp;
    END IF;

    IF @isNewPothole = true
    THEN
        INSERT INTO `db_example`.`PotholeSummary_T`
        (`MinLatitude`,
         `MaxLatitude`,
         `MinLongitude`,
         `MaxLongitude`,
         `AvgPotholeDepth`,
         `VehiclesCrossed`,
         `TotalDepthRecorded`,
         `LatestTimestamp`,
         `RoadID`)
        VALUES
        (@pLat,
         @pLat,
         @pLong,
         @pLong ,
         @pDepth,
         1,
         @pDepth,
         @LatestTimestamp,
         null);
    ELSE
        UPDATE
            PotholeSummary_T
        SET
            MaxLongitude = @MaxLongitude,
            MinLongitude = @MinLongitude,
            MaxLatitude = @MaxLatitude,
            MinLatitude = @MinLatitude,
            LatestTimestamp = @LatestTimestamp,
            AvgPotholeDepth = (@TotalDepthRecorded + @pDepth) / (@VehicleCrossed + 1),
            TotalDepthRecorded = @TotalDepthRecorded + @pDepth,
            VehiclesCrossed = @VehiclesCrossed + 1
        WHERE
                PotholeID = @PotholeID;
    END IF;


END#

delimiter ;

