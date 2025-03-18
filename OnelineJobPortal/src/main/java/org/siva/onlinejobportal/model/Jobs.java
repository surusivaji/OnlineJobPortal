package org.siva.onlinejobportal.model;

import java.sql.Date;

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
public class Jobs {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="Id")
	private Integer id;
	
	@Column(name="Title", nullable=false, length=50)
	private String title;
	
	@Column(name="Description", columnDefinition="text", nullable=false)
	private String description;
	
	@Column(name="Category", nullable=false, length=50)
	private String category;
	
	@Column(name="Location", nullable=false, length=50)
	private String location;
	
	@Column(name="Post_Date", nullable=false)
	private Date postDate;

	@Column(name="Status", nullable = false, length=30)
	private String status;

}
