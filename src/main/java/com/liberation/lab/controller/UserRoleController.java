package com.liberation.lab.controller;

import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.liberation.lab.model.UserRole;
import com.liberation.lab.service.UserRoleService;

@Controller
public class UserRoleController {

    private UserRoleService userRoleService;
    
    @Autowired(required=true)
    @Qualifier(value="userRoleService")
    public void setUserRoleService(UserRoleService us){
        this.userRoleService = us;
    }
     
    @RequestMapping(value = {"/core/userRole"}, method = RequestMethod.GET)
    public String listUserRoles(Model model) {
        model.addAttribute("userRole", new UserRole());
        model.addAttribute("listUserRoles", this.userRoleService.listUserRoles());
        return "core/coreUserRole";
    }
     
    @RequestMapping(value= "/core/addUserRole", method = RequestMethod.POST)
    public String addUserRole(Model model, HttpServletRequest request, HttpServletResponse response){
    	try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	int userRoleId = 0;
    	if(request.getParameter("userRoleId") != null){
    		userRoleId = Integer.parseInt(request.getParameter("userRoleId"));
    	}
    	
    	int userId = 0;
    	if(request.getParameter("userId") != null){
    		userId = Integer.parseInt(request.getParameter("userId"));
    	}
    	
    	String userRole = request.getParameter("userRole");
    	
        UserRole u = new UserRole();
        u.setUserRoleId(userRoleId);
        u.setUserId(userId);
        u.setUserRole(userRole);
    	
        if(u.getUserRoleId() == 0){
            //new userRole, add it
            this.userRoleService.addUserRole(u);
        }else{
            //existing userRole, call update
            this.userRoleService.updateUserRole(u);
        }
         
        return "redirect:/core/userRole";
         
    }
    
     
    @RequestMapping("/core/removeUserRole/{userRoleId}")
    public String removeUserRole(@PathVariable("userRoleId") int id){
         
        this.userRoleService.removeUserRole(id);
        return "redirect:/core/userRole";
    }
    
    @RequestMapping("/core/editUserRole/{userRoleId}")
    public String editUserRole(@PathVariable("userRoleId") int id, Model model){
        model.addAttribute("userRole", this.userRoleService.getUserRoleById(id));
        model.addAttribute("listUserRoles", this.userRoleService.listUserRoles());
        return "/core/coreUserRole";
    }
     
}
