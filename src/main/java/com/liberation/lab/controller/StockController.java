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

import com.liberation.lab.model.Stock;
import com.liberation.lab.service.CompanyService;
import com.liberation.lab.service.StockService;

import antlr.collections.List;

@Controller
public class StockController {

	private StockService stockService;

	@Autowired(required = true)
	@Qualifier(value = "stockService")
	public void setStockService(StockService us) {
		this.stockService = us;
	}

	private CompanyService companyService;

	@Autowired(required = true)
	@Qualifier(value = "companyService")
	public void setCompanyService(CompanyService us) {
		this.companyService = us;
	}
 
	@RequestMapping(value = { "/core/stock" }, method = RequestMethod.GET)
	public String listStock(Model model) {
		model.addAttribute("stock", new Stock());
		model.addAttribute("listStock", this.stockService.listStock());
		model.addAttribute("listCompany", this.companyService.listCompany());
		return "core/coreStock";
	}

	@RequestMapping(value = "/core/addStock", method = RequestMethod.POST)
	public String addStock(Model model, HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int stockId = 0;
		if (request.getParameter("stockId") != null) {
			stockId = Integer.parseInt(request.getParameter("stockId"));
		}
		int companyId = 0;
		if (request.getParameter("stockId") != null) {
			companyId = Integer.parseInt(request.getParameter("companyId"));
		}
		String stockExchangeId = request.getParameter("stockExchangeId");
		String stockName = request.getParameter("stockName");
		
		double stockQuantity = 0;
		if (request.getParameter("stockQuantity") != null) {
			stockQuantity = Double.parseDouble(request.getParameter("stockQuantity"));
		}
		
		double stockCapitalization = 0;
		if (request.getParameter("stockCapitalization") != null) {
			stockCapitalization = Double.parseDouble(request.getParameter("stockCapitalization"));
		}

		
		double stockPE = 0;
		if (request.getParameter("stockPE") != null) {
			stockPE = Double.parseDouble(request.getParameter("stockPE"));
		}

		
		double stockPP = 0;
		if (request.getParameter("stockPP") != null) {
			stockPP = Double.parseDouble(request.getParameter("stockPP"));
		}

		
		double stockEPS = 0;
		if (request.getParameter("stockEPS") != null) {
			stockEPS = Double.parseDouble(request.getParameter("stockEPS"));
		}

		
		double stockROE = 0;
		if (request.getParameter("stockROE") != null) {
			stockROE = Double.parseDouble(request.getParameter("stockROE"));
		}

		
		double stockROA = 0;
		if (request.getParameter("stockROA") != null) {
			stockROA = Double.parseDouble(request.getParameter("stockROA"));
		}

		
		double stockBeta = 0;
		if (request.getParameter("stockBeta") != null) {
			stockBeta = Double.parseDouble(request.getParameter("stockBeta"));
		}

		
		double stockMarginRate = 0;
		if (request.getParameter("stockMarginRate") != null) {
			stockMarginRate = Double.parseDouble(request.getParameter("stockMarginRate"));
		}

		
		double stockPrice = 0;
		if (request.getParameter("stockPrice") != null) {
			stockPrice = Double.parseDouble(request.getParameter("stockPrice"));
		} 
		
		int stockState = 1;
		if (request.getParameter("stockState") != null) {
			stockState = Integer.parseInt(request.getParameter("stockState"));
		}
		
		 

		Stock u = new Stock();
		u.setStockId(stockId);
		u.setCompanyId(companyId);
		u.setStockExchangeId(stockExchangeId);
		u.setStockName(stockName);
		u.setStockQuantity(stockQuantity);
		u.setStockCapitalization(stockCapitalization);
		u.setStockPE(stockPE);
		u.setStockPP(stockPP);
		u.setStockEPS(stockEPS);
		u.setStockROE(stockROE);
		u.setStockROA(stockROA);
		u.setStockBeta(stockBeta);
		u.setStockMarginRate(stockMarginRate);
		u.setStockPrice(stockPrice);
		u.setStockState(stockState);

		if (stockId == 0) {
			// new stock, add it
			this.stockService.addStock(u);
		} else {
			// existing stock, call update
			this.stockService.updateStock(u);
		}

		return "redirect:/core/stock";

	}

	@RequestMapping("/core/removeStock/{stockId}")
	public String removeStock(@PathVariable("stockId") int id) {
		this.stockService.removeStock(id);
		return "redirect:/core/stock";
	}

	@RequestMapping("/core/editStock/{stockId}")
	public String editStock(@PathVariable("stockId") int id, Model model) {
		model.addAttribute("stock", this.stockService.getStockById(id));
		model.addAttribute("listStock", this.stockService.listStock());
		model.addAttribute("listCompany", this.companyService.listCompany());
		return "/core/coreStock";
	}

}
