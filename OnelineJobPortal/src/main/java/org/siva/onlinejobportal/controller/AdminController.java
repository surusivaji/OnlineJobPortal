package org.siva.onlinejobportal.controller;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import org.siva.onlinejobportal.model.Admin;
import org.siva.onlinejobportal.model.Jobs;
import org.siva.onlinejobportal.service.IAdminService;
import org.siva.onlinejobportal.service.IJobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {
	
	@Autowired
	private IAdminService adminService;
	
	@Autowired
	private IJobService jobService;
	
	@PostMapping("/getAdminInformation")
	public String getAdminInformation(HttpSession session, @RequestParam("email") String email, @RequestParam("password") String password) {
		Admin admin = adminService.getAdminByEmailAndPassword(email, password);
		if (admin!=null) {
			session.setAttribute("admin", admin);
			return "redirect:/admin/home";
		}
		else {
			session.setAttribute("failMsg", "Invalid credientials...!!!");
			return "redirect:/adminLogin";
		}
	}
	
	@GetMapping("/admin/home")
	public String adminHomePage(HttpSession session) {
		Admin admin = (Admin) session.getAttribute("admin");
		if (admin!=null) {
			return "/Admin/Home";
		}
		else {
			return "redirect:/adminLogin";
		}
	}
	
	@GetMapping("/admin/postJobs")
	public String postJobs(HttpSession session) {
		Admin admin = (Admin) session.getAttribute("admin");
		if (admin!=null) {
			return "/Admin/PostJobs";
		}
		else {
			return "redirect:/adminLogin";
		}
	}
	
	@PostMapping("/admin/savePost")
	public String savePost(@ModelAttribute Jobs jobs, HttpSession session) {
		jobs.setPostDate(Date.valueOf(LocalDate.now()));
		Jobs saveJob = jobService.saveJob(jobs);
		System.out.println(saveJob);
		if (saveJob!=null) {
			session.setAttribute("successMsg", "Job Added Successfully...!!!");
		}
		else {
			session.setAttribute("failMsg", "Something went wrong...!!!");
		}
		return "redirect:/admin/postJobs";
	}
	
	@GetMapping("/admin/viewJobs")
	public String viewJobsPage(HttpSession session) {
		Admin admin = (Admin) session.getAttribute("admin");
		if (admin!=null) {
			List<Jobs> jobs = jobService.findAllJobs();
			session.setAttribute("jobs", jobs);
			return "/Admin/ViewJobs";
		}
		else {
			return "redirect:/adminLogin";
		}
	}
	
	@GetMapping("/admin/editJob/{Id}")
	public String editJobPage(HttpSession session, @PathVariable("Id") int id) {
		Admin admin = (Admin) session.getAttribute("admin");
		if (admin!=null) {
			Jobs jobs = jobService.getJobsById(id);
			if (jobs!=null) {
				session.setAttribute("jobs", jobs);
				return "/Admin/EditJob";
			}
			else {
				session.setAttribute("warningMsg", "This id is not present...!!!");
				return "redirect:/admin/viewJobs";
			}
		}
		else {
			return "redirect:/adminLogin";
		}
	}
	
	@PostMapping("/admin/updateJob")
	public String updatePostInformation(@ModelAttribute Jobs jobs, HttpSession session) {
		Admin admin = (Admin) session.getAttribute("admin");
		if (admin!=null) {
			jobs.setPostDate(Date.valueOf(LocalDate.now()));
			Jobs saveJob = jobService.saveJob(jobs);
			if (saveJob!=null) {
				session.setAttribute("successMsg", "Job information updated successfully...!!!");
			}
			else {
				session.setAttribute("failMsg", "Something went wrong...!!!");
			}
			return "redirect:/admin/viewJobs";
		} else {
			return "redirect:/adminLogin";
		}
	}
	
	@GetMapping("/admin/profile")
	public String profilePage(HttpSession session) {
		Admin admin = (Admin) session.getAttribute("admin");
		if (admin!=null) {
			return "/Admin/EditAdmin";
		}
		else {
			return "redirect:/adminLogin";
		}
	}
	
	@PostMapping("/admin/updateAdminInformation")
	public String updateAdminInformation(@ModelAttribute Admin admin, HttpSession session) {
		System.out.println(admin);
		Admin updateInfo = (Admin) session.getAttribute("admin");
		if (updateInfo!=null) {
			admin.setRole("admin");
			Admin saveAdminInformation = adminService.saveAdminInformation(admin);
			System.out.println(saveAdminInformation);
			if (saveAdminInformation!=null) {
				session.setAttribute("admin", saveAdminInformation);
				session.setAttribute("successMsg", "Admin information updated successfully...!!!");
				return "redirect:/admin/profile";
			}
			else {
				session.setAttribute("failMsg", "Something went wrong...!!!");
				return "redirect:/admin/profile";
			}
		} 
		else {
			return "redirect:/adminLogin";
		}
	}
	
	@GetMapping("/admin/deleteJob/{Id}")
	public String deleteJobPage(HttpSession session, @PathVariable("Id") int id) {
		Admin admin = (Admin) session.getAttribute("admin");
		if (admin!=null) {
			Jobs job = jobService.getJobsById(id);
			if (job!=null) {
				Boolean deleteJob = jobService.deleteJob(job);
				if (deleteJob) {
					return "redirect:/admin/viewJobs";
				}
				else {
					session.setAttribute("failMsg", "Something went wrong...!!!");
					return "redirect:/admin/viewJobs";
				}
			}
			else {
				session.setAttribute("warningMsg", "Job is not present...!!!");
				return "redirect:/admin/viewJobs";
			}
		}
		else {
			return "redirect:/adminLogin";
		}
	}
	
	@GetMapping("/admin/logout") 
	public String logoutPage(HttpSession session) {
		Admin admin = (Admin) session.getAttribute("admin");
		if (admin!=null) {
			session.removeAttribute("admin");
			session.setAttribute("infoMsg", "Admin Logout");
			return "redirect:/adminLogin";
		}
		else {
			return "redirect:/adminLogin";
		}
	}
	

}
