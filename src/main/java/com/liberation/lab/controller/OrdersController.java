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

import com.liberation.lab.model.Orders;
import com.liberation.lab.model.Stock;
import com.liberation.lab.model.TransactionResult;
import com.liberation.lab.model.Orders;
import com.liberation.lab.service.OrdersService;
import com.liberation.lab.service.StockService;
import com.liberation.lab.service.UserService;
import com.liberation.lab.service.BalanceService;

import antlr.collections.List;

@Controller
public class OrdersController {

	private UserService userService;

	@Autowired(required = true)
	@Qualifier(value = "userService")
	public void setUserService(UserService us) {
		this.userService = us;
	}

	private BalanceService balanceService;

	@Autowired(required = true)
	@Qualifier(value = "balanceService")
	public void setBalanceService(BalanceService us) {
		this.balanceService = us;
	}

	private StockService stockService;
	
	@Autowired(required = true)
	@Qualifier(value = "stockService")
	public void setStockService(StockService us) {
		this.stockService = us;
	}
  
  

	private OrdersService ordersService;

	@Autowired(required = true)
	@Qualifier(value = "ordersService")
	public void setOrdersService(OrdersService us) {
		this.ordersService = us;
	}
 
  
	@RequestMapping(value = { "/core/orders" }, method = RequestMethod.GET)
	public String listOrders(Model model) {
		model.addAttribute("order", new Orders());
		model.addAttribute("listOrders", this.ordersService.listOrders());
		model.addAttribute("listBalances", this.balanceService.listBalances());
		model.addAttribute("listStocks", this.stockService.listStock());
		model.addAttribute("listUsers", this.userService.listUsers());
		return "core/coreOrders";
	}
 
	@RequestMapping(value = "/core/addOrder", method = RequestMethod.POST)
	public String addOrders(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int orderId = 0;
		if (request.getParameter("orderId") != null) {
			orderId = Integer.parseInt(request.getParameter("orderId"));
		}
		
		int balanceId = 0;
		if (request.getParameter("balanceId") != null) {
			balanceId = Integer.parseInt(request.getParameter("balanceId"));
		}
		
		int stockId = 0;
		if (request.getParameter("stockId") != null) {
			stockId = Integer.parseInt(request.getParameter("stockId"));
		}
		
		String action = request.getParameter("action");
		String orderType = request.getParameter("orderType");
		String orderState = request.getParameter("orderState");

		Stock s = stockService.getStockById(stockId); 
		
		// FIXED CODE, MARGIN'S NOT ENABLED YET
		double margin = 0;
		
		double price = 0;
		if (request.getParameter("price") != null) {
			price = Double.parseDouble(request.getParameter("price"));
		}
		
		double quantity = 0;
		if (request.getParameter("quantity") != null) {
			quantity = Double.parseDouble(request.getParameter("quantity"));
		}
		
		Timestamp createdTime;
		java.util.Date date= new java.util.Date();
		createdTime = new Timestamp(date.getTime());
		String createdTimeParam = request.getParameter("createdTime").replaceAll("/", "-");
		if(createdTimeParam != null){
			String oldFormat = "dd-MM-yyyy HH:mm:ss";
			String newFormat = "yyyy-MM-dd HH:mm:ss";
			SimpleDateFormat sdf1 = new SimpleDateFormat(oldFormat);
			SimpleDateFormat sdf2 = new SimpleDateFormat(newFormat);
			try {
				Timestamp timestamp = Timestamp.valueOf(sdf2.format(sdf1.parse(createdTimeParam)));
				createdTime = timestamp;
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
 

		Orders b = new Orders();
		b.setOrderId(orderId);
		b.setBalanceId(balanceId);
		b.setStockId(stockId);
		b.setCreatedTime(createdTime);
		b.setPrice(price);
		b.setQuantity(quantity);
		b.setAction(action);
		b.setOrderType(orderType);
		b.setMargin(margin);
		b.setOrderState(orderState);
		
		
		
		// TRANSACTION STARTS
		Transaction t = new Transaction();
		TransactionResult tr = t.transaction(b,s);
		
		if(tr.isResult() == false){
			b.setOrderState("WAITING");
		}
		else{
			// MATCHED ALL
			if(tr.getMatchQuantity() == b.getQuantity()){
				b.setPrice(tr.getMatchedPrice());
				b.setOrderState("SUCCEEDED");
				
				//UPDATE BALANCE - ADD OR MINUS CASH
				
			}
			// PARTIAL MATCHED
			else{
				double remainQuantity = b.getQuantity() - tr.getMatchQuantity();
				b.setPrice(tr.getMatchedPrice());
				b.setQuantity(tr.getMatchQuantity());
				b.setOrderState("SUCCEEDED");
				
				
				//UPDATE BALANCE - ADD OR MINUS CASH
				
				//CREATE ORDER FOR THE REMAINED QUANTITY
				Orders remain = new Orders();
				remain.setBalanceId(b.getBalanceId());
				remain.setStockId(b.getStockId());
				remain.setCreatedTime(b.getCreatedTime());
				remain.setPrice(b.getPrice());
				remain.setQuantity(remainQuantity);
				remain.setAction(b.getAction());
				remain.setOrderType(b.getOrderType());
				remain.setMargin(b.getMargin());
				remain.setOrderState("WAITING");
				this.ordersService.addOrders(remain);
			}
		}
		
		

		if (orderId == 0) {
			// new orders, add it
			this.ordersService.addOrders(b);
		} else {
			// existing orders, call update
			// ORDER IS CAN NOT BE UPDATED!
			// this.ordersService.updateOrders(b);
		}
		return "redirect:/core/orders";
	}

	@RequestMapping("/core/removeOrder/{orderId}")
	public String removeOrders(@PathVariable("orderId") int id) {

		this.ordersService.removeOrders(id);
		return "redirect:/core/orders";
	}

	@RequestMapping("/core/editOrder/{orderId}")
	public String editOrders(@PathVariable("orderId") int id, Model model) {
		model.addAttribute("order", this.ordersService.getOrdersById(id));
		model.addAttribute("listOrders", this.ordersService.listOrders());
		model.addAttribute("listBalances", this.balanceService.listBalances());
		model.addAttribute("listStocks", this.stockService.listStock());
		model.addAttribute("listUsers", this.userService.listUsers());
		return "/core/coreOrders";
	}

 

}
