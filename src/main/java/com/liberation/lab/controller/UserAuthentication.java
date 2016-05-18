package com.liberation.lab.controller;

import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.liberation.lab.model.Article;
import com.liberation.lab.model.Person;
import com.liberation.lab.model.User;
import com.liberation.lab.model.UserRole;
import com.liberation.lab.service.ArticleService;
import com.liberation.lab.service.ArticleServiceImpl;
import com.liberation.lab.service.UserRoleService;
import com.liberation.lab.service.UserService;

@Controller
public class UserAuthentication {

	private UserService userService;
	private UserRoleService userRoleService;

	@Autowired(required = true)
	@Qualifier(value = "userService")
	public void setUserService(UserService us) {
		this.userService = us;
	}
	
	@Autowired(required = true)
	@Qualifier(value = "userRoleService")
	public void setUserRoleService(UserRoleService urs) {
		this.userRoleService = urs;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}

	@RequestMapping(value = "/welcome", method = RequestMethod.GET)
	public String welcome(Model model) {
		return "welcome";
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Model model) {
		return "home";
	}
	
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public String accessDenied(Model model) {
		return "403";
	}

	@RequestMapping(value = "/authentication", method = RequestMethod.POST)
	public void authentication(Model model, ServletRequest request, ServletResponse response) throws IOException {
		String username = "";
		String password = "";
		String destination = "";
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession(true);

		if (req.getParameter("username") != null) {
			username = req.getParameter("username");
		}
		if (req.getParameter("password") != null) {
			password = req.getParameter("password");
		}

		if (this.userService.getUserByUsername(username) != null) {
			User u = this.userService.getUserByUsername(username);
			if (u.getPassword().equals(this.getMD5(password))) {
				// SUCCESSFULLY LOGED IN
				session.setAttribute("userId", u.getUserId());
				session.setAttribute("username", u.getUsername());
				session.setAttribute("userFullName", u.getUserFullName());
				session.setAttribute("userAge", u.getUserAge());
				session.setAttribute("userAddress", u.getUserAddress());
				session.setAttribute("userEmail", u.getUserEmail());
				session.setAttribute("userPhoneNumber", u.getUserPhoneNumber());
				session.setAttribute("userProfilePicture", u.getUserProfilePicture());
				
				List<String> userRolesListById = this.userRoleService.listUserRolesById(u.getUserId());
				session.setAttribute("userRoleList", userRolesListById);
				
				
				if(session.getAttribute("currentDemandingServletPath") == null ){
					String referrer = req.getHeader("referer");
					String context = req.getContextPath();
//					referrer = referrer.substring(referrer.indexOf(context));
//					referrer = referrer.replace(context, "");
//					
//					destination = referrer;
					destination = "/";
				}
				else{
					destination = (String) session.getAttribute("currentDemandingServletPath");
				}
			} else {
				// WRONG PASSWORD
				session.setAttribute("loginErrorMessage", "You have entered a wrong password!");
				destination = "/login";
			}
		} else {
			// NO SUCH USERNAME
			session.setAttribute("loginErrorMessage", "Username doesn't exist!");
			destination = "/login";
		}
		res.sendRedirect(req.getContextPath() + destination);
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public void logout(ServletRequest request, ServletResponse response) throws IOException{
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession(true);
		session.removeAttribute("userId");
		session.removeAttribute("username");
		session.removeAttribute("userFullName");
		session.removeAttribute("currentDemandingServletPath");
		session.removeAttribute("currentDemandingURI");
		session.removeAttribute("currentDemandingURL");
		session.removeAttribute("userRoleList");
		/*res.sendRedirect(req.getContextPath() + "/home");*/
		res.sendRedirect(req.getContextPath() + "/");
	}

	public static String getMD5(String input) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] messageDigest = md.digest(input.getBytes());
			BigInteger number = new BigInteger(1, messageDigest);
			String hashtext = number.toString(16);
			// Now we need to zero pad it if you actually want the full 32
			// chars.
			while (hashtext.length() < 32) {
				hashtext = "0" + hashtext;
			}
			return hashtext;
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}
	}

}
