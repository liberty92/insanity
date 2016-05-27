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

import com.liberation.lab.model.SystemConfig;
import com.liberation.lab.service.SystemConfigService;

import antlr.collections.List;

@Controller
public class SystemConfigController {

	private SystemConfigService systemConfigService;

	@Autowired(required = true)
	@Qualifier(value = "systemConfigService")
	public void setSystemConfigService(SystemConfigService us) {
		this.systemConfigService = us;
	}
 

 

	@RequestMapping(value = { "/core/systemConfig" }, method = RequestMethod.GET)
	public String listSystemConfigs(Model model) {
		model.addAttribute("systemConfig", new SystemConfig());
		model.addAttribute("listSystemConfigs", this.systemConfigService.listSystemConfigs());
		return "core/coreSystemConfig";
	}

	@RequestMapping(value = "/core/addSystemConfig", method = RequestMethod.POST)
	public String addSystemConfig(Model model, HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession(true);
		
		int configId = 1;
		if (request.getParameter("configId") != null) {
			configId = Integer.parseInt(request.getParameter("configId"));
		}

		String slide1 = request.getParameter("slide1");
		String slide2 = request.getParameter("slide2");
		String slide3 = request.getParameter("slide3");
		String slide4 = request.getParameter("slide4");
		String slideText1 = request.getParameter("slideText1");
		String slideText2 = request.getParameter("slideText2");
		String slideText3 = request.getParameter("slideText3");
		String slideText4 = request.getParameter("slideText4");
		String banner = request.getParameter("banner");
		String logo = request.getParameter("logo");
		String footerBanner = request.getParameter("footerBanner");
		String video = request.getParameter("video");
		String fanpage = request.getParameter("fanpage");
		String contact = request.getParameter("contact");
		 

		SystemConfig u = new SystemConfig();
		u.setConfigId(configId);
		u.setSlide1(slide1);
		u.setSlide2(slide2);
		u.setSlide3(slide3);
		u.setSlide4(slide4);
		u.setSlideText1(slideText1);
		u.setSlideText2(slideText2);
		u.setSlideText3(slideText3);
		u.setSlideText4(slideText4);
		u.setBanner(banner);
		u.setLogo(logo);
		u.setFooterBanner(footerBanner);
		u.setVideo(video);
		u.setFanpage(fanpage);
		u.setContact(contact);
		
		session.setAttribute("slide1", slide1);
		session.setAttribute("slide2", slide2);
		session.setAttribute("slide3", slide3);
		session.setAttribute("slide4", slide4);
		session.setAttribute("slideText1", slideText1);
		session.setAttribute("slideText2", slideText2);
		session.setAttribute("slideText3", slideText3);
		session.setAttribute("slideText4", slideText4);
		session.setAttribute("banner", banner);
		session.setAttribute("logo", logo);
		session.setAttribute("footerBanner", footerBanner);
		session.setAttribute("video", video);
		session.setAttribute("fanpage", fanpage);
		session.setAttribute("contact", contact);
 

		if (configId == 0) {
			// new systemConfig, add it
			this.systemConfigService.addSystemConfig(u);
		} else {
			// existing systemConfig, call update
			this.systemConfigService.updateSystemConfig(u);
		}
		return "redirect:/core/systemConfig";
	}

	
	@RequestMapping("/core/removeSystemConfig/{id}")
	public String removeSystemConfig(@PathVariable("id") int id) {
		this.systemConfigService.removeSystemConfig(id);
		return "redirect:/core/systemConfig";
	}

	@RequestMapping("/core/editSystemConfig/{id}")
	public String editSystemConfig(@PathVariable("id") int id, Model model) {
		model.addAttribute("systemConfig", this.systemConfigService.getSystemConfigById(id));
		model.addAttribute("listSystemConfigs", this.systemConfigService.listSystemConfigs());
		return "/core/coreSystemConfig";
	}
 
}
