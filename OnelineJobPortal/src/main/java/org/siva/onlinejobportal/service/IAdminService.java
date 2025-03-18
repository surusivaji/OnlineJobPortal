package org.siva.onlinejobportal.service;

import org.siva.onlinejobportal.model.Admin;

public interface IAdminService {
	
	Admin saveAdminInformation(Admin admin);
	
	Admin getAdminByEmailAndPassword(String email, String password);

}
