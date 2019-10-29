package com.pothole.engine.respository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

// This will be AUTO IMPLEMENTED by Spring into a Bean called userRepository
// CRUD refers Create, Read, Update, Delete

public interface
PotholeSummaryRepository extends CrudRepository<PotholeSummary, Integer> {

    //@Query( value="select * FROM pothole_summary WHERE min_latitude = :latitude or max_longitude = :longitude", nativeQuery = true)
    @Query( value="SELECT *\n" +
            "\n" +
            "FROM  pothole_summary b\n" +
            "\n" +
            "WHERE (1609.34 * 2 * 3961 * asin(sqrt(power((sin(radians((b.min_latitude - :latitude) / 2))), 2) + cos(radians(:latitude)) * cos(radians(b.min_latitude)) * power((sin(radians((b.min_longitude - :longitude) / 2))),2))) < :threshold\n" +
            "OR 1609.34 * 2 * 3961 * asin(sqrt(power((sin(radians((b.max_latitude - :latitude) / 2))), 2) + cos(radians(:latitude)) * cos(radians(b.max_latitude)) * power((sin(radians((b.min_longitude - :longitude) / 2))),2))) < :threshold\n" +
            "OR 1609.34 * 2 * 3961 * asin(sqrt(power((sin(radians((b.min_latitude - :latitude) / 2))), 2) + cos(radians(:latitude)) * cos(radians(b.min_latitude)) * power((sin(radians((b.max_longitude - :longitude) / 2))),2))) < :threshold\n" +
            "OR 1609.34 * 2 * 3961 * asin(sqrt(power((sin(radians((b.max_latitude - :latitude) / 2))), 2) + cos(radians(:latitude)) * cos(radians(b.max_latitude)) * power((sin(radians((b.max_longitude - :longitude) / 2))),2))) < :threshold )\n",
            nativeQuery = true)
    List<PotholeSummary> findClosestPothole(@Param("latitude") double latitude,
                                            @Param("longitude") double longitude,
                                            @Param("threshold") double threshold);
}
