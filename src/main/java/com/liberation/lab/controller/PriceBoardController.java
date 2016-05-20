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

import com.liberation.lab.model.PriceBoard;
import com.liberation.lab.service.StockService;
import com.liberation.lab.service.PriceBoardService;

import antlr.collections.List;

@Controller
public class PriceBoardController {

	private PriceBoardService priceBoardService;

	@Autowired(required = true)
	@Qualifier(value = "priceBoardService")
	public void setPriceBoardService(PriceBoardService us) {
		this.priceBoardService = us;
	}

	private StockService stockService;

	@Autowired(required = true)
	@Qualifier(value = "stockService")
	public void setStockService(StockService us) {
		this.stockService = us;
	}

	@RequestMapping(value = { "/core/priceBoard" }, method = RequestMethod.GET)
	public String listPriceBoard(Model model) {
		model.addAttribute("priceBoard", new PriceBoard());
		model.addAttribute("listPriceBoard", this.priceBoardService.listPriceBoard());
		model.addAttribute("listStock", this.stockService.listStock());
		return "core/corePriceBoard";
	}

	@RequestMapping(value = "/core/addPriceBoard", method = RequestMethod.POST)
	public String addPriceBoard(Model model, HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int priceBoardId = 0;
		if (request.getParameter("priceBoardId") != null
				&& request.getParameter("priceBoardId").toString().length() > 0) {
			priceBoardId = Integer.parseInt(request.getParameter("priceBoardId"));
		}
		int stockId = 0;
		if (request.getParameter("stockId") != null && request.getParameter("stockId").toString().length() > 0) {
			stockId = Integer.parseInt(request.getParameter("stockId"));
		}

		double price = 0;
		if (request.getParameter("price") != null && request.getParameter("price").toString().length() > 0) {
			price = Double.parseDouble(request.getParameter("price"));
		}

		double ceil = 0;
		if (request.getParameter("ceil") != null && request.getParameter("ceil").toString().length() > 0) {
			ceil = Double.parseDouble(request.getParameter("ceil"));
		}

		double floor = 0;
		if (request.getParameter("floor") != null && request.getParameter("floor").toString().length() > 0) {
			floor = Double.parseDouble(request.getParameter("floor"));
		}

		double tradedQuantity = 0;
		if (request.getParameter("tradedQuantity") != null
				&& request.getParameter("tradedQuantity").toString().length() > 0) {
			tradedQuantity = Double.parseDouble(request.getParameter("tradedQuantity"));
		}

		double buy1 = 0;
		if (request.getParameter("buy1") != null && request.getParameter("buy1").toString().length() > 0) {
			buy1 = Double.parseDouble(request.getParameter("buy1"));
		}

		double buy2 = 0;
		if (request.getParameter("buy2") != null && request.getParameter("buy2").toString().length() > 0) {
			buy2 = Double.parseDouble(request.getParameter("buy2"));
		}

		double buy3 = 0;
		if (request.getParameter("buy3") != null && request.getParameter("buy3").toString().length() > 0) {
			buy3 = Double.parseDouble(request.getParameter("buy3"));
		}
		
		double buy1Quantity = 0;
		if (request.getParameter("buy1Quantity") != null && request.getParameter("buy1Quantity").toString().length() >0) {
			buy1Quantity = Double.parseDouble(request.getParameter("buy1Quantity"));
		} 

		
		double buy2Quantity = 0;
		if (request.getParameter("buy2Quantity") != null && request.getParameter("buy2Quantity").toString().length() >0) {
			buy2Quantity = Double.parseDouble(request.getParameter("buy2Quantity"));
		} 

		
		double buy3Quantity = 0;
		if (request.getParameter("buy3Quantity") != null && request.getParameter("buy3Quantity").toString().length() >0) {
			buy3Quantity = Double.parseDouble(request.getParameter("buy3Quantity"));
		}  
		
		
		double matchPrice = 0;
		if (request.getParameter("matchPrice") != null && request.getParameter("matchPrice").toString().length() >0) {
			matchPrice = Double.parseDouble(request.getParameter("matchPrice"));
		}
		
		double matchQuantity = 0;
		if (request.getParameter("matchQuantity") != null && request.getParameter("matchQuantity").toString().length() >0) {
			matchQuantity = Double.parseDouble(request.getParameter("matchQuantity"));
		}  
		
		
		double sell1 = 0;
		if (request.getParameter("sell1") != null && request.getParameter("sell1").toString().length() >0) {
			sell1 = Double.parseDouble(request.getParameter("sell1"));
		}

		
		double sell2 = 0;
		if (request.getParameter("sell2") != null && request.getParameter("sell2").toString().length() >0) {
			sell2 = Double.parseDouble(request.getParameter("sell2"));
		}

		
		double sell3 = 0;
		if (request.getParameter("sell3") != null && request.getParameter("sell3").toString().length() >0) {
			sell3 = Double.parseDouble(request.getParameter("sell3"));
		} 
		
		
		double sell1Quantity = 0;
		if (request.getParameter("sell1Quantity") != null && request.getParameter("sell1Quantity").toString().length() >0) {
			sell1Quantity = Double.parseDouble(request.getParameter("sell1Quantity"));
		} 

		
		double sell2Quantity = 0;
		if (request.getParameter("sell2Quantity") != null && request.getParameter("sell2Quantity").toString().length() >0) {
			sell2Quantity = Double.parseDouble(request.getParameter("sell2Quantity"));
		} 

		
		double sell3Quantity = 0;
		if (request.getParameter("sell3Quantity") != null && request.getParameter("sell3Quantity").toString().length() >0) {
			sell3Quantity = Double.parseDouble(request.getParameter("sell3Quantity"));
		}  
		
		double overbuy = 0;
		if (request.getParameter("overbuy") != null && request.getParameter("overbuy").toString().length() >0) {
			overbuy = Double.parseDouble(request.getParameter("overbuy"));
		}  
		
		double oversold = 0;
		if (request.getParameter("oversold") != null && request.getParameter("oversold").toString().length() >0) {
			oversold = Double.parseDouble(request.getParameter("oversold"));
		}  
		
		double lowest = 0;
		if (request.getParameter("lowest") != null && request.getParameter("lowest").toString().length() >0) {
			lowest = Double.parseDouble(request.getParameter("lowest"));
		}  
		
		double highest = 0;
		if (request.getParameter("highest") != null && request.getParameter("highest").toString().length() >0) {
			highest = Double.parseDouble(request.getParameter("highest"));
		}   
		
		
		

		PriceBoard u = new PriceBoard();
		u.setPriceBoardId(priceBoardId);
		u.setStockId(stockId);
		u.setPrice(price);
		u.setCeil(ceil);
		u.setFloor(floor);
		u.setTradedQuantity(tradedQuantity);
		u.setBuy1(buy1);
		u.setBuy2(buy2);
		u.setBuy3(buy3);
		u.setBuy1Quantity(buy1Quantity);
		u.setBuy2Quantity(buy2Quantity);
		u.setBuy3Quantity(buy3Quantity);
		u.setMatchPrice(matchPrice);
		u.setMatchQuantity(matchQuantity);
		u.setSell1(sell1);
		u.setSell2(sell2);
		u.setSell3(sell3);
		u.setSell1Quantity(sell1Quantity);
		u.setSell2Quantity(sell2Quantity);
		u.setSell3Quantity(sell3Quantity);
		u.setHighest(highest);
		u.setLowest(lowest);
		u.setOversold(oversold);
		u.setOverbuy(overbuy);


		if (priceBoardService.getPriceBoardById(priceBoardId) == null) {
			// new priceBoard, add it
			this.priceBoardService.addPriceBoard(u);
		} else {
			// existing priceBoard, call update
			this.priceBoardService.updatePriceBoard(u);
		}

		return "redirect:/core/priceBoard";

	}

	@RequestMapping("/core/removePriceBoard/{priceBoardId}")
	public String removePriceBoard(@PathVariable("priceBoardId") int id) {
		this.priceBoardService.removePriceBoard(id);
		return "redirect:/core/priceBoard";
	}

	@RequestMapping("/core/editPriceBoard/{priceBoardId}")
	public String editPriceBoard(@PathVariable("priceBoardId") int id, Model model) {
		model.addAttribute("priceBoard", this.priceBoardService.getPriceBoardById(id));
		model.addAttribute("listPriceBoard", this.priceBoardService.listPriceBoard());
		model.addAttribute("listStock", this.stockService.listStock());
		return "/core/corePriceBoard";
	}

}
