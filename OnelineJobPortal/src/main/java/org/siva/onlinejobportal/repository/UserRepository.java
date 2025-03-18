package org.siva.onlinejobportal.repository;

import org.siva.onlinejobportal.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Integer> {
	
	User findByEmailAndPassword(String email, String password);
	
	User findByEmailAndMobileNumber(String email, String mobileNumber);

}
