package org.siva.onlinejobportal.service;

import java.util.List;
import java.util.Optional;

import org.siva.onlinejobportal.model.Jobs;
import org.siva.onlinejobportal.repository.JobsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IJobServiceImpl implements IJobService {
	
	@Autowired
	private JobsRepository jobsRepository;

	@Override
	public Jobs saveJob(Jobs job) {
		try {
			Jobs save = jobsRepository.save(job);
			return save;
		} catch (Exception e) {
			return null;
		}
	}
	
	@Override
	public List<Jobs> findAllJobs() {
		try {
			List<Jobs> jobs = jobsRepository.findAll();
			return jobs;
		} catch (Exception e) {
			return null;
		}
	}
	
	@Override
	public Jobs getJobsById(int id) {
		try {
			Optional<Jobs> optional = jobsRepository.findById(id);
			return optional.get();
		} catch (Exception e) {
			return null;
		}
	}
	
	@Override
	public Boolean deleteJob(Jobs job) {
		try {
			jobsRepository.delete(job);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	@Override
	public List<Jobs> getJobsByLocationAndCategory(String location, String category) {
		try {
			List<Jobs> jobs = jobsRepository.findByLocationAndCategory(location, category);
			return jobs;
		} catch (Exception e) {
			return null;
		}
	} 

}
