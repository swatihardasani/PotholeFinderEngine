package com.pothole.engine.respository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

// This will be AUTO IMPLEMENTED by Spring into a Bean called userRepository
// CRUD refers Create, Read, Update, Delete

public interface
PotholeEventRepository extends CrudRepository<PotholeEvent, Integer> {

}