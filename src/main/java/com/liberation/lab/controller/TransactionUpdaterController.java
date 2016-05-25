package com.liberation.lab.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.liberation.lab.model.TransactionUpdater;
import com.liberation.lab.model.Portfolio;
import com.liberation.lab.model.PriceBoard;
import com.liberation.lab.model.Stock;
import com.liberation.lab.model.TransactionUpdater;
import com.liberation.lab.service.TransactionUpdaterService;
import com.liberation.lab.service.BalanceService;
import com.liberation.lab.service.OrdersService;
import com.liberation.lab.service.PortfolioService;
import com.liberation.lab.service.StockService;
import com.liberation.lab.service.UserService;


@Controller
public class TransactionUpdaterController implements Runnable{

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
	
	private OrdersService ordersService;

	@Autowired(required = true)
	@Qualifier(value = "ordersService")
	public void setOrdersService(OrdersService us) {
		this.ordersService = us;
	}

	private TransactionUpdaterService transactionUpdaterService;

	@Autowired(required = true)
	@Qualifier(value = "transactionUpdaterService")
	public void setTransactionUpdaterService(TransactionUpdaterService us) {
		this.transactionUpdaterService = us;
	}

	private PortfolioService portfolioService;

	@Autowired(required = true)
	@Qualifier(value = "portfolioService")
	public void setPortfolioService(PortfolioService us) {
		this.portfolioService = us;
	}

	private StockService stockService;

	@Autowired(required = true)
	@Qualifier(value = "stockService")
	public void setStockService(StockService us) {
		this.stockService = us;
	}
 

	@RequestMapping(value = { "/core/transactionUpdater" }, method = RequestMethod.GET)
	public String listTransactionUpdaters(Model model) {
		model.addAttribute("transactionUpdater", new TransactionUpdater());
		model.addAttribute("listTransactionUpdaters", this.transactionUpdaterService.listTransactionUpdaters());
		model.addAttribute("listUsers", this.userService.listUsers());
		return "core/coreTransactionUpdater";
	}
	
 
	@RequestMapping(value = "/core/addTransactionUpdater", method = RequestMethod.POST)
	public String addTransactionUpdater(Model model, HttpServletRequest request, HttpServletResponse response) {
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
		
		int state = 0;
		if (request.getParameter("state") != null) {
			state = Integer.parseInt(request.getParameter("state"));
		}
 
		Timestamp transactionUpdaterCreatedDate;
		java.util.Date date = new java.util.Date();
		transactionUpdaterCreatedDate = new Timestamp(date.getTime());
 

	 

		TransactionUpdater b = new TransactionUpdater();
		b.setId(id);
		b.setTime(transactionUpdaterCreatedDate); 
		b.setState(state);

		if (id == 0) {
			// new transactionUpdater, add it
			this.transactionUpdaterService.addTransactionUpdater(b);
		} else {
			// existing transactionUpdater, call update
			this.transactionUpdaterService.updateTransactionUpdater(b);
		}
		return "redirect:/core/transactionUpdater";
	}

	@RequestMapping("/core/removeTransactionUpdater/{transactionUpdaterId}")
	public String removeTransactionUpdater(@PathVariable("transactionUpdaterId") int id) {

		this.transactionUpdaterService.removeTransactionUpdater(id);
		return "redirect:/core/transactionUpdater";
	}

	@RequestMapping("/core/editTransactionUpdater/{transactionUpdaterId}")
	public String editTransactionUpdater(@PathVariable("transactionUpdaterId") int id, Model model) {
		model.addAttribute("transactionUpdater", this.transactionUpdaterService.getTransactionUpdaterById(id));
		model.addAttribute("listTransactionUpdaters", this.transactionUpdaterService.listTransactionUpdaters());
		model.addAttribute("listUsers", this.userService.listUsers());
		return "/core/coreTransactionUpdater";
	}


	@Override
	public void run() {
		System.out.println("UPDATING !");
		/*OrdersController oc = new OrdersController();
		try {
			oc.checkTransactionAllWaitingOrders();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
		// TODO Auto-generated method stub
		
	}
	 

}
