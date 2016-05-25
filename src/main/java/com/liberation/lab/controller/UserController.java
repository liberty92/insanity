package com.liberation.lab.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.liberation.lab.model.User;
import com.liberation.lab.model.UserRole;
import com.liberation.lab.service.UserRoleService;
import com.liberation.lab.service.UserService;

import antlr.collections.List;

@Controller
public class UserController {

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

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register() {
		return "register";
	}

	@RequestMapping(value = "/registerAuthentication", method = RequestMethod.POST)
	public String registerAuthentication(Model model, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String userFullName = request.getParameter("userFullName");
		String userEmail = request.getParameter("userEmail");

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession(true);
		
		User u = new User();
		u.setUsername(username);
		u.setPassword(this.getMD5(password));
		u.setUserFullName(userFullName);
		u.setUserEmail(userEmail);
		try{
		this.userService.addUser(u);
		User newUser = userService.getUserByUsername(username);
		UserRole ur = new UserRole();
		ur.setUserId(newUser.getUserId());
		ur.setUserRole("CUSTOMER");
		this.userRoleService.addUserRole(ur);
		session.setAttribute("welcomeMessage", "Welcome to INSANITY, "+userFullName+" ! Please login to continue!");
		}
		catch(Exception e){
			session.setAttribute("registerErrorMessager", "This username is unavailable, please choose another one!");
			return "redirect:/register";
		}
		return "redirect:/login";
	}

	@RequestMapping(value = "/user/Info", method = RequestMethod.GET)
	public String userInfo(Model model, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession(true);
		int userId = -1;
		if (session.getAttribute("userId") != null) {
			userId = Integer.parseInt(session.getAttribute("userId").toString());
		} else {
			req.getRequestDispatcher("/403").forward(req, res);
		}
		model.addAttribute("user", this.userService.getUserById(userId));
		return "user/userInfo";
	}

	@RequestMapping(value = "/user/updatePassword", method = RequestMethod.POST)
	public String userUpdatePassword(Model model, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession(true);
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int userId = -1;
		if (session.getAttribute("userId") != null) {
			userId = Integer.parseInt(session.getAttribute("userId").toString());
		} else {
			req.getRequestDispatcher("/403").forward(req, res);
		}

		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");
		String password3 = request.getParameter("password3");

		User u = this.userService.getUserById(userId);

		if (this.getMD5(password).equals(u.getPassword()) && password2.equals(password3)) {
			u.setPassword(this.getMD5(password2));
			this.userService.updateUser(u);
			session.setAttribute("updateMessage", "Your password has been successfully updated!");
		} else {
			session.setAttribute("updateError", "Some error occured ! Please check your information again1");
		}
		return "redirect:/user/Info";
	}

	@RequestMapping(value = "/user/updateInfo", method = RequestMethod.POST)
	public String userUpdateUserInfo(Model model, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession(true);
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int userId = -1;
		if (session.getAttribute("userId") != null) {
			userId = Integer.parseInt(session.getAttribute("userId").toString());
		} else {
			req.getRequestDispatcher("/403").forward(req, res);
		}

		String userFullName = request.getParameter("userFullName");
		int userAge = 0;

		if (request.getParameter("userAge") != null) {
			userAge = Integer.parseInt(request.getParameter("userAge"));
		}
		String userEmail = request.getParameter("userEmail");
		String userPhoneNumber = request.getParameter("userPhoneNumber");
		String userAddress = request.getParameter("userAddress");
		String userProfilePicture = request.getParameter("userProfilePicture");

		User u = this.userService.getUserById(userId);
		u.setUserFullName(userFullName);
		u.setUserAge(userAge);
		u.setUserEmail(userEmail);
		u.setUserPhoneNumber(userPhoneNumber);
		u.setUserAddress(userAddress);
		u.setUserProfilePicture(userProfilePicture);
		this.userService.updateUser(u);

		session.setAttribute("userFullName", userFullName);
		session.setAttribute("userAge", userAge);
		session.setAttribute("userAddress", userAddress);
		session.setAttribute("userEmail", userEmail);
		session.setAttribute("userPhoneNumber", userPhoneNumber);
		session.setAttribute("userProfilePicture", userProfilePicture);

		session.setAttribute("updateMessage", "Your information has been successfully updated!");
		return "redirect:/user/Info";
	}

	@RequestMapping(value = { "/core/user" }, method = RequestMethod.GET)
	public String listUsers(Model model) {
		model.addAttribute("user", new User());
		model.addAttribute("listUsers", this.userService.listUsers());
		model.addAttribute("listUserRoles", this.userRoleService.listUserRoles());
		return "core/coreUser";
	}

	@RequestMapping(value = "/core/addUser", method = RequestMethod.POST)
	public String addUser(Model model, HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int userId = 0;
		if (request.getParameter("userId") != null) {
			userId = Integer.parseInt(request.getParameter("userId"));
		}

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String userFullName = request.getParameter("userFullName");
		int userAge = 0;

		if (request.getParameter("userAge") != null) {
			userAge = Integer.parseInt(request.getParameter("userAge"));
		}
		String userEmail = request.getParameter("userEmail");
		String userPhoneNumber = request.getParameter("userPhoneNumber");
		String userAddress = request.getParameter("userAddress");
		String userProfilePicture = request.getParameter("userProfilePicture");

		User u = new User();
		u.setUserId(userId);
		u.setUsername(username);
		u.setPassword(this.getMD5(password));
		u.setUserFullName(userFullName);
		u.setUserAge(userAge);
		u.setUserEmail(userEmail);
		u.setUserPhoneNumber(userPhoneNumber);
		u.setUserAddress(userAddress);
		u.setUserProfilePicture(userProfilePicture);

		if (u.getUserId() == 0) {
			// new user, add it
			this.userService.addUser(u);
		} else {
			// existing user, call update
			this.userService.updateUser(u);
		}

		return "redirect:/core/user";

	}

	@RequestMapping("/core/removeUser/{userId}")
	public String removeUser(@PathVariable("userId") int id) {

		this.userRoleService.removeUserRoleByUserId(id);
		this.userService.removeUser(id);
		return "redirect:/core/user";
	}

	@RequestMapping("/core/editUser/{userId}")
	public String editUser(@PathVariable("userId") int id, Model model) {
		model.addAttribute("user", this.userService.getUserById(id));
		model.addAttribute("listUsers", this.userService.listUsers());
		return "/core/coreUser";
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
