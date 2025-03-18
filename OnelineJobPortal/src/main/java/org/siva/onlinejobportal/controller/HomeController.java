package org.siva.onlinejobportal.controller;

import org.siva.onlinejobportal.model.User;
import org.siva.onlinejobportal.repository.UserRepository;
import org.siva.onlinejobportal.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	
	@Autowired
	private IUserService userService;
	
	@GetMapping("/")
	public String indexPage() {
		return "Index";
	}
	
	@GetMapping("/signup")
	public String singupPage() {
		return "Register";
	}
	
	@GetMapping("/signin")
	public String siginPage() {
		return "Login";
	}
	
	@GetMapping("/adminLogin")
	public String adminLoginPage() {
		return "AdminLogin";
	}
	
	@PostMapping("/saveUserInformation")
	public String saveUserInformation(@ModelAttribute User user, HttpSession session) {
		user.setRole("admin");
		User save = userService.saveUserInformation(user);
		System.out.println(save);
		if (save!=null) {
			session.setAttribute("successMsg", "User information saved");
			return "redirect:/signup";
		}
		else {
			session.setAttribute("failMsg", "Something went wrong");
			return "redirect:/signup";
		}
	}
	
	@GetMapping("/forgotPassword")
	public String forgotPassword() {
		return "ForgotPassword";
	}
	
	@PostMapping("/next")
	public String checkEmailAndMobileNumber(HttpSession session, @RequestParam("email") String email, @RequestParam("mobileNumber") String mobileNumber) {
		User user = userService.fetchUserByEmailAndMobileNumber(email, mobileNumber);
		if (user!=null) {
			session.setAttribute("tempUser", user);
			return "redirect:/changePassword";
		}
		else {
			session.setAttribute("failMsg", "Invalid email and mobile number...!!!");
			return "redirect:/forgotPassword";
		}
	}
	
	@GetMapping("/changePassword")
	public String changePasswordPage(HttpSession session) {
		User user = (User) session.getAttribute("tempUser");
		if (user!=null) {
			return "ChangePassword";
		}
		else {
			return "redirect:/signin";
		}
	}
	
	@PostMapping("/updatePassword")
	public String updatePassword(HttpSession session, @RequestParam("password") String password, @RequestParam("cpassword") String cpassword) {
		User user = (User) session.getAttribute("tempUser");
		if (user!=null) {
			if (password.equals(cpassword)) {
				user.setPassword(password);
				User savePassword = userService.saveUserInformation(user);
				if (savePassword!=null) {
					session.setAttribute("infoMsg", "Password updated successfully...!!!");
				}
				else {
					session.setAttribute("failMsg", "Something went wrong...!!!");
				}
				session.removeAttribute("tempUser");
				return "redirect:/signin";
			}
			else {
				session.setAttribute("failMsg", "Passwords does not match...!!!");
				return "redirect:/changePassword";
			}
		}
		else {
			return "redirect:/signin";
		}
	}

}
