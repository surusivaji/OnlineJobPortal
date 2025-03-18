package org.siva.onlinejobportal.controller;

import java.util.List;

import org.siva.onlinejobportal.model.Jobs;
import org.siva.onlinejobportal.model.User;
import org.siva.onlinejobportal.service.IJobService;
import org.siva.onlinejobportal.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private IJobService jobService;
	
	@PostMapping("/getUserData")
	public String getUserLogin(@RequestParam("email") String email, @RequestParam("password") String password, HttpSession session) {
		User user = userService.fetchUserByEmailAndPassword(email, password);
		if (user!=null) {
			session.setAttribute("user", user);
			return "redirect:/user/home";
		}
		else {
			session.setAttribute("failMsg", "Invalid credientials");
			return "redirect:/signin";
		}
	}
	
	@GetMapping("/user/home")
	public String userHomePage(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user!=null) {
			return "/User/Home";
		}
		else {
			return "redirect:/signin";
		}
	}
	
	@GetMapping("/user/editProfile")
	public String editProfilePage(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user!=null) {
			return "/User/EditProfile";
		}
		else {
			return "redirect:/signin";
		}
	} 
	
	@PostMapping("/user/updateUserInformation")
	public String updateUserInformation(@ModelAttribute User user,HttpSession session) {
		User oldUser = (User) session.getAttribute("user");
		if (oldUser!=null) {
			user.setRole(oldUser.getRole());
			User save = userService.saveUserInformation(user);
			System.out.println(save);
			if (save!=null) {
				session.setAttribute("user", save);
				session.setAttribute("successMsg", "User information updated successfully...!!!");
				return "redirect:/user/editProfile";
			}
			else {
				session.setAttribute("failMsg", "Something went wrong...!!!");
				return "redirect:/user/editProfile";
			}
		}
		else {
			return "redirect:/signin";
		}
	}
	
	@GetMapping("/user/viewJobs")
	public String getAllJobs(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user!=null) {
			List<Jobs> jobs = jobService.findAllJobs();
			session.setAttribute("jobs", jobs);
			return "/User/ViewJobs";
		}
		else {
			return "redirect:/signin";
		}
	}
	
	@GetMapping("/user/searchJobs")
	public String searchJobs(HttpSession session, @RequestParam("location") String location, @RequestParam("category") String category) {
		User user = (User) session.getAttribute("user");
		if (user!=null) {
			List<Jobs> jobs = jobService.getJobsByLocationAndCategory(location, category);
			session.setAttribute("jobs", jobs);
			return "/User/ViewJobs";
		}
		else {
			return "redirect:/signin";
		}
	}
	
	@GetMapping("/user/viewJob/{id}")
	public String viewJob(HttpSession session, @PathVariable("id") int jobId) {
		User user = (User) session.getAttribute("user");
		if (user!=null) {
			Jobs job = jobService.getJobsById(jobId);
			session.setAttribute("job", job);
			return "/User/ViewJob";
		}
		else {
			return "redirect:/signin";
		}
	}
	
	@GetMapping("/user/logout")
	public String logoutPage(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user!=null) {
			session.removeAttribute("user");
			session.setAttribute("infoMsg", "You have been logged out");
			return "redirect:/signin";
		}
		else {
			return "redirect:/signin";
		}
	}

}
