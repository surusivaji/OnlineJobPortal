package org.siva.onlinejobportal.service;

import org.siva.onlinejobportal.model.User;

public interface IUserService {
	
	User saveUserInformation(User user);
	
	User fetchUserByEmailAndPassword(String email, String password);
	
	User fetchUserByEmailAndMobileNumber(String email, String mobileNumber);

}
