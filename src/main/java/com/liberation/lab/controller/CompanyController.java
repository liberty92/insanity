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

import com.liberation.lab.model.Company;
import com.liberation.lab.model.CompanyCategory;
import com.liberation.lab.service.CompanyCategoryService;
import com.liberation.lab.service.CompanyService;

import antlr.collections.List;

@Controller
public class CompanyController {

	private CompanyService companyService;

	private CompanyCategoryService companyCategoryService;

	@Autowired(required = true)
	@Qualifier(value = "companyService")
	public void setCompanyService(CompanyService us) {
		this.companyService = us;
	}


	@Autowired(required = true)
	@Qualifier(value = "companyCategoryService")
	public void setCompanyCategoryService(CompanyCategoryService us) {
		this.companyCategoryService = us;
	}

 
 
 
	@RequestMapping(value = { "/core/company" }, method = RequestMethod.GET)
	public String listCompany(Model model) {
		model.addAttribute("company", new Company());
		model.addAttribute("listCompanyCategory", this.companyCategoryService.listCompanyCategory());
		model.addAttribute("listCompany", this.companyService.listCompany());
		return "core/coreCompany";
	}

	@RequestMapping(value = "/core/addCompany", method = RequestMethod.POST)
	public String addCompany(Model model, HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int companyId = 0;
		if (request.getParameter("companyId") != null) {
			companyId = Integer.parseInt(request.getParameter("companyId"));
		}

		String companyName = request.getParameter("companyName");
		String companyCategoryId = request.getParameter("companyCategoryId");
		String companyBOD = request.getParameter("companyBOD");
		String companyContact = request.getParameter("companyContact");
		String companyInfo = request.getParameter("companyInfo");
		
		int companyState = 1;
		if (request.getParameter("companyState") != null) {
			companyState = Integer.parseInt(request.getParameter("companyState"));
		}
		
		 

		Company u = new Company();
		u.setCompanyId(companyId);
		u.setCompanyName(companyName);
		u.setCompanyCategoryId(companyCategoryId);
		u.setCompanyBOD(companyBOD);
		u.setCompanyContact(companyContact);
		u.setCompanyInfo(companyInfo);
		u.setCompanyState(companyState);

		if (u.getCompanyId() == 0) {
			// new company, add it
			this.companyService.addCompany(u);
		} else {
			// existing company, call update
			this.companyService.updateCompany(u);
		}

		return "redirect:/core/company";

	}

	@RequestMapping("/core/removeCompany/{companyId}")
	public String removeCompany(@PathVariable("companyId") int id) {
		this.companyService.removeCompany(id);
		return "redirect:/core/company";
	}

	@RequestMapping("/core/editCompany/{companyId}")
	public String editCompany(@PathVariable("companyId") int id, Model model) {
		model.addAttribute("company", this.companyService.getCompanyById(id));
		model.addAttribute("listCompany", this.companyService.listCompany());
		model.addAttribute("listCompanyCategory", this.companyCategoryService.listCompanyCategory());
		return "/core/coreCompany";
	}
	

	 
	@RequestMapping(value = { "/core/companyCategory" }, method = RequestMethod.GET)
	public String listCompanyCategory(Model model) {
		model.addAttribute("companyCategory", new CompanyCategory());
		model.addAttribute("listCompanyCategory", this.companyCategoryService.listCompanyCategory());
		return "core/coreCompanyCategory";
	}

	@RequestMapping(value = "/core/addCompanyCategory", method = RequestMethod.POST)
	public String addCompanyCategory(Model model, HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 

		String companyCategoryId = request.getParameter("companyCategoryId");
		String companyCategoryName = request.getParameter("companyCategoryName");
		String companyCategoryInfo = request.getParameter("companyCategoryInfo");
		
		 

		CompanyCategory u = new CompanyCategory();
		u.setCompanyCategoryId(companyCategoryId);
		u.setCompanyCategoryName(companyCategoryName); 
		u.setCompanyCategoryInfo(companyCategoryInfo);

		if (companyCategoryId.length() > 0) {
			// new company, add it
			this.companyCategoryService.addCompanyCategory(u);
		} else {
			// existing company, call update
			this.companyCategoryService.updateCompanyCategory(u);
		}

		return "redirect:/core/companyCategory";

	}

	@RequestMapping("/core/removeCompanyCategory/{companyCategoryId}")
	public String removeCompanyCategory(@PathVariable("companyCategoryId") String id) {
		this.companyCategoryService.removeCompanyCategory(id);
		return "redirect:/core/companyCategory";
	}

	@RequestMapping("/core/editCompanyCategory/{companyCategoryId}")
	public String editCompanyCategory(@PathVariable("companyCategoryId") String id, Model model) {
		model.addAttribute("companyCategory", this.companyCategoryService.getCompanyCategoryById(id));
		model.addAttribute("listCompanyCategory", this.companyCategoryService.listCompanyCategory());
		return "/core/coreCompanyCategory";
	}



}
