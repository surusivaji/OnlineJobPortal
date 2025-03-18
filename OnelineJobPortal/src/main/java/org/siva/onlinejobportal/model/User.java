package org.siva.onlinejobportal.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Entity
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="Id")
	private Integer id;
	
	@Column(name="Name", nullable=false, length=50)
	private String fullName;
	
	@Column(name="Email", nullable=false, unique=true, length=50)
	private String email;
	
	@Column(name="Mobile_Number", nullable=false, unique=true, length=10)
	private String mobileNumber;
	
	@Column(name="Password", nullable=false, length=40)
	private String password;
	
	@Column(name="Qualification", nullable=false, length=40)
	private String qualification;
	
	@Column(name="Role", nullable=false, length=30)
	private String role;

}
