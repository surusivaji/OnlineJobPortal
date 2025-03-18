package org.siva.onlinejobportal.service;

import org.siva.onlinejobportal.model.Admin;
import org.siva.onlinejobportal.repository.AdminRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IAdminServiceImpl implements IAdminService {
	
	@Autowired
	private AdminRepository adminRepository; 
	
	@Override
	public Admin saveAdminInformation(Admin admin) {
		try {
			Admin save = adminRepository.save(admin);
			return save;
		} catch (Exception e) {
			e.getStackTrace();
			return null;
		}
	}
	
	@Override
	public Admin getAdminByEmailAndPassword(String email, String password) {
		try {
			Admin admin = adminRepository.findByEmailAndPassword(email, password);
			return admin;
		} catch (Exception e) {
			return null;
		}
	}

}
