package org.siva.onlinejobportal.service;

import org.siva.onlinejobportal.model.User;
import org.siva.onlinejobportal.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IUserServiceImpl implements IUserService {
	
	@Autowired
	private UserRepository userRepository;

	@Override
	public User saveUserInformation(User user) {
		try {
			User save = userRepository.save(user);
			return save;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public User fetchUserByEmailAndPassword(String email, String password) {
		try {
			User user = userRepository.findByEmailAndPassword(email, password);
			return user;
		} catch (Exception e) {
			return null;
		}
	}
	
	@Override
	public User fetchUserByEmailAndMobileNumber(String email, String mobileNumber) {
		try {
			User user = userRepository.findByEmailAndMobileNumber(email, mobileNumber);
			return user;
		} catch (Exception e) {
			return null;
		}
	}

}
