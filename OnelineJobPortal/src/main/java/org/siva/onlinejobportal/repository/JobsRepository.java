package org.siva.onlinejobportal.repository;

import java.util.List;

import org.siva.onlinejobportal.model.Jobs;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JobsRepository extends JpaRepository<Jobs, Integer> {
	
	List<Jobs> findByLocationAndCategory(String location, String category);
	

}
