package org.siva.onlinejobportal.repository;

import org.siva.onlinejobportal.model.Admin;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AdminRepository extends JpaRepository<Admin, Integer> {
	
	Admin findByEmailAndPassword(String email, String password);

}
