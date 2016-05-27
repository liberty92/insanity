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

import com.liberation.lab.model.TradingFee;
import com.liberation.lab.service.TradingFeeService;

import antlr.collections.List;

@Controller
public class TradingFeeController {

	private TradingFeeService tradingFeeService;

	@Autowired(required = true)
	@Qualifier(value = "tradingFeeService")
	public void setTradingFeeService(TradingFeeService us) {
		this.tradingFeeService = us;
	}
 

 

	@RequestMapping(value = { "/core/tradingFee" }, method = RequestMethod.GET)
	public String listTradingFees(Model model) {
		model.addAttribute("tradingFee", new TradingFee());
		model.addAttribute("listTradingFees", this.tradingFeeService.listTradingFees());
		return "core/coreTradingFee";
	}

	@RequestMapping(value = "/core/addTradingFee", method = RequestMethod.POST)
	public String addTradingFee(Model model, HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int id = 0;
		if (request.getParameter("id") != null) {
			id = Integer.parseInt(request.getParameter("id"));
		}

		String name = request.getParameter("name");
		double fromValue = 0;
		if (request.getParameter("fromValue") != null) {
			fromValue = Double.parseDouble(request.getParameter("fromValue"));
		}
		double throughValue = 0;
		if (request.getParameter("throughValue") != null) {
			throughValue = Double.parseDouble(request.getParameter("throughValue"));
		}
		double value = 0;
		if (request.getParameter("value") != null) {
			value = Double.parseDouble(request.getParameter("value"));
		}
		 

		TradingFee u = new TradingFee();
		u.setId(id);
		u.setName(name);
		u.setFromValue(fromValue);
		u.setThroughValue(throughValue);
		u.setValue(value);

		if (id == 0) {
			// new tradingFee, add it
			this.tradingFeeService.addTradingFee(u);
		} else {
			// existing tradingFee, call update
			this.tradingFeeService.updateTradingFee(u);
		}
		return "redirect:/core/tradingFee";
	}

	
	@RequestMapping("/core/removeTradingFee/{id}")
	public String removeTradingFee(@PathVariable("id") int id) {
		this.tradingFeeService.removeTradingFee(id);
		return "redirect:/core/tradingFee";
	}

	@RequestMapping("/core/editTradingFee/{id}")
	public String editTradingFee(@PathVariable("id") int id, Model model) {
		model.addAttribute("tradingFee", this.tradingFeeService.getTradingFeeById(id));
		model.addAttribute("listTradingFees", this.tradingFeeService.listTradingFees());
		return "/core/coreTradingFee";
	}
 
}
