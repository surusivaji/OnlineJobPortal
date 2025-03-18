package org.siva.onlinejobportal.service;

import java.util.List;

import org.siva.onlinejobportal.model.Jobs;

public interface IJobService {
	
	Jobs saveJob(Jobs job);
	
	List<Jobs> findAllJobs();
	
	Jobs getJobsById(int id);
	
	Boolean deleteJob(Jobs job);
	
	List<Jobs> getJobsByLocationAndCategory(String location, String category);

}
