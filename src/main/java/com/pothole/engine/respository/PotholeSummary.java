package com.pothole.engine.respository;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.sql.Timestamp;

@Entity // This tells Hibernate to make a table out of this class
public class PotholeSummary {

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Integer PotholeID;

    private Double MinLatitude;

    private Double MaxLatitude;

    private Double MinLongitude;

    private Double MaxLongitude;

    private Double AvgPotholeDepth;

    private Integer VehiclesCrossed;

    private Double TotalDepthRecorded;

    private Timestamp LatestTimestamp;

    public Integer getPotholeID() {
        return PotholeID;
    }

    public void setPotholeID(Integer potholeID) {
        PotholeID = potholeID;
    }

    public Double getMinLatitude() {
        return MinLatitude;
    }

    public void setMinLatitude(Double minLatitude) {
        MinLatitude = minLatitude;
    }

    public Double getMaxLatitude() {
        return MaxLatitude;
    }

    public void setMaxLatitude(Double maxLatitude) {
        MaxLatitude = maxLatitude;
    }

    public Double getMinLongitude() {
        return MinLongitude;
    }

    public void setMinLongitude(Double minLongitude) {
        MinLongitude = minLongitude;
    }

    public Double getMaxLongitude() {
        return MaxLongitude;
    }

    public void setMaxLongitude(Double maxLongitude) {
        MaxLongitude = maxLongitude;
    }

    public Double getAvgPotholeDepth() {
        return AvgPotholeDepth;
    }

    public void setAvgPotholeDepth(Double avgPotholeDepth) {
        AvgPotholeDepth = avgPotholeDepth;
    }

    public Integer getVehiclesCrossed() {
        return VehiclesCrossed;
    }

    public void setVehiclesCrossed(Integer vehiclesCrossed) {
        VehiclesCrossed = vehiclesCrossed;
    }

    public Double getTotalDepthRecorded() {
        return TotalDepthRecorded;
    }

    public void setTotalDepthRecorded(Double totalDepthRecorded) {
        TotalDepthRecorded = totalDepthRecorded;
    }

    public Timestamp getLatestTimestamp() {
        return LatestTimestamp;
    }

    public void setLatestTimestamp(Timestamp latestTimestamp) {
        LatestTimestamp = latestTimestamp;
    }
}
