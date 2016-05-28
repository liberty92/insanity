package com.liberation.lab.controller;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URL;
import java.net.URLConnection;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.math3.util.Precision;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.liberation.lab.model.User;
import com.liberation.lab.model.Balance;
import com.liberation.lab.model.Orders;
import com.liberation.lab.model.Portfolio;
import com.liberation.lab.model.PriceBoard;
import com.liberation.lab.model.Stock;
import com.liberation.lab.model.TradingFee;
import com.liberation.lab.model.TransactionResult;
import com.liberation.lab.model.Orders;
import com.liberation.lab.service.OrdersService;
import com.liberation.lab.service.PortfolioService;
import com.liberation.lab.service.StockService;
import com.liberation.lab.service.TradingFeeService;
import com.liberation.lab.service.TransactionUpdaterService;
import com.liberation.lab.service.UserService;
import com.liberation.lab.service.BalanceService;

import java.util.List;
@Configuration
@EnableAsync
@EnableScheduling
@Controller
@Component("orderController")
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

	private PortfolioService portfolioService;

	@Autowired(required = true)
	@Qualifier(value = "portfolioService")
	public void setPortfolioService(PortfolioService us) {
		this.portfolioService = us;
	}

	private TradingFeeService tradingFeeService;

	@Autowired(required = true)
	@Qualifier(value = "tradingFeeService")
	public void setTradingFeeService(TradingFeeService us) {
		this.tradingFeeService = us;
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

	@RequestMapping(value = { "/user/trading" }, method = RequestMethod.GET)
	public String userTrading(Model model, HttpServletRequest request, HttpServletResponse response) {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession(true);

		int userId = 0;
		if (session.getAttribute("userId") != null) {
			userId = Integer.parseInt(session.getAttribute("userId").toString());
		}
		User u = this.userService.getUserById(userId);

		List<Balance> listBalance = this.balanceService.getBalanceByUserId(userId);
		List<Orders> listOrders = new ArrayList();
		for (int i = 0; i < listBalance.size(); i++) {
			int balanceId = listBalance.get(i).getBalanceId();
			List<Orders> thisBalanceOrders = this.ordersService.getOrdersByBalanceIdToday(balanceId);
			for (int j = 0; j < thisBalanceOrders.size(); j++) {
				listOrders.add(thisBalanceOrders.get(j));
			}
		}

		model.addAttribute("user", u);
		model.addAttribute("order", new Orders());
		model.addAttribute("listOrders", listOrders);
		model.addAttribute("listStocks", this.stockService.listStock());
		model.addAttribute("listUsers", this.userService.listUsers());
		model.addAttribute("listBalances", this.balanceService.getBalanceByUserId(userId));
		return "user/trading";
	}

	@RequestMapping(value = { "/user/tradingHistory" }, method = RequestMethod.GET)
	public String userTradingHistory(Model model, HttpServletRequest request, HttpServletResponse response) {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession(true);

		int userId = 0;
		if (session.getAttribute("userId") != null) {
			userId = Integer.parseInt(session.getAttribute("userId").toString());
		}
		User u = this.userService.getUserById(userId);

		List<Balance> listBalance = this.balanceService.getBalanceByUserId(userId);
		List<Orders> listOrders = new ArrayList();
		for (int i = 0; i < listBalance.size(); i++) {
			int balanceId = listBalance.get(i).getBalanceId();
			List<Orders> thisBalanceOrders = this.ordersService.getOrdersByBalanceId(balanceId);
			for (int j = 0; j < thisBalanceOrders.size(); j++) {
				listOrders.add(thisBalanceOrders.get(j));
			}
		}

		model.addAttribute("user", u);
		model.addAttribute("order", new Orders());
		model.addAttribute("listOrders", listOrders);
		model.addAttribute("listStocks", this.stockService.listStock());
		model.addAttribute("listUsers", this.userService.listUsers());
		model.addAttribute("listBalances", this.balanceService.getBalanceByUserId(userId));
		return "user/tradingHistory";
	}

	@RequestMapping(value = { "/user/tradingAndTaxFee" }, method = RequestMethod.GET)
	public String userTradingAndTaxFee(Model model, HttpServletRequest request, HttpServletResponse response) {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession(true);

		int userId = 0;
		if (session.getAttribute("userId") != null) {
			userId = Integer.parseInt(session.getAttribute("userId").toString());
		}
		User u = this.userService.getUserById(userId);

		List<Balance> listBalance = this.balanceService.getBalanceByUserId(userId);
		List<Orders> listOrders = new ArrayList();
		for (int i = 0; i < listBalance.size(); i++) {
			int balanceId = listBalance.get(i).getBalanceId();
			List<Orders> thisBalanceOrders = this.ordersService.getOrdersByBalanceId(balanceId);
			for (int j = 0; j < thisBalanceOrders.size(); j++) {
				if(thisBalanceOrders.get(j).getOrderState().equals("SUCCEEDED"))
					listOrders.add(thisBalanceOrders.get(j));
			}
		}

		model.addAttribute("user", u);
		model.addAttribute("order", new Orders());
		model.addAttribute("listOrders", listOrders);
		model.addAttribute("listStocks", this.stockService.listStock());
		model.addAttribute("listUsers", this.userService.listUsers());
		model.addAttribute("listBalances", this.balanceService.getBalanceByUserId(userId));
		return "user/tradingTaxAndFee";
	}
	
	@RequestMapping(value = { "/user/marginStats" }, method = RequestMethod.GET)
	public String userMarginStats(Model model, HttpServletRequest request, HttpServletResponse response) {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession(true);
		
		TradingFee secondSettingItem = this.tradingFeeService.getTradingFeeById(2);
		double marginRate = secondSettingItem.getValue();
		
		
		
		int userId = 0;
		if (session.getAttribute("userId") != null) {
			userId = Integer.parseInt(session.getAttribute("userId").toString());
		}
		User u = this.userService.getUserById(userId);
		List<Stock> marginDebtList = new ArrayList();

		Timestamp createdTime;
		java.util.Date date = new java.util.Date();
		createdTime = new Timestamp(date.getTime());
		
		List<Balance> listBalance = this.balanceService.getBalanceByUserId(userId);
		List<Portfolio> listPortfolio = new ArrayList();
		for (int i = 0; i < listBalance.size(); i++) {
			int balanceId = listBalance.get(i).getBalanceId();
			List<Portfolio> thisBalancePortfolio = this.portfolioService.getPortfolioByBalanceId(balanceId);
			for (int j = 0; j < thisBalancePortfolio.size(); j++) {
				if(thisBalancePortfolio.get(j).getMarginDebt() != 0 && thisBalancePortfolio.get(j).getSellPrice() <= 0){
					listPortfolio.add(thisBalancePortfolio.get(j));
					double marginDebt = thisBalancePortfolio.get(j).getMarginDebt();
					Stock s = new Stock();
					s.setStockId(thisBalancePortfolio.get(j).getStockId());
					
					
					
					Timestamp startDate = thisBalancePortfolio.get(j).getBuyDate();
					long sd = startDate.getTime();
					long nd = createdTime.getTime();
					float marginTime = Precision.round(((nd-sd)/(86400*1000)),0);
					if(marginTime <= 0) marginTime =1;
					
					double marginFee = marginRate*marginDebt*marginTime/365/100;
					// YEAH, TEMPORARY STORE MARGIN DATA IN STOCK OBJECT. I HAVE NO CHOICE :/
					s.setStockPP(marginFee);
					marginDebtList.add(s);
				}
			}
		}
		
		

		model.addAttribute("marginRate", marginRate);
		model.addAttribute("user", u);
		model.addAttribute("listPortfolios", listPortfolio);
		model.addAttribute("listStocks", this.stockService.listStock());
		model.addAttribute("marginDebtList", marginDebtList);
		model.addAttribute("listBalances", this.balanceService.getBalanceByUserId(userId));
		return "user/marginStats";
	}
	
	@RequestMapping(value = { "/user/marginStatsHistory" }, method = RequestMethod.GET)
	public String userMarginStatsHistory(Model model, HttpServletRequest request, HttpServletResponse response) {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession(true);
		
		TradingFee secondSettingItem = this.tradingFeeService.getTradingFeeById(2);
		double marginRate = secondSettingItem.getValue();
		
		
		
		int userId = 0;
		if (session.getAttribute("userId") != null) {
			userId = Integer.parseInt(session.getAttribute("userId").toString());
		}
		User u = this.userService.getUserById(userId);
		List<Stock> marginDebtList = new ArrayList();
 
		
		List<Balance> listBalance = this.balanceService.getBalanceByUserId(userId);
		List<Portfolio> listPortfolio = new ArrayList();
		for (int i = 0; i < listBalance.size(); i++) {
			int balanceId = listBalance.get(i).getBalanceId();
			List<Portfolio> thisBalancePortfolio = this.portfolioService.getPortfolioHistoryByBalanceId(balanceId);
			for (int j = 0; j < thisBalancePortfolio.size(); j++) {
				if(thisBalancePortfolio.get(j).getMarginDebt() != 0 && thisBalancePortfolio.get(j).getSellPrice() > 0){
					listPortfolio.add(thisBalancePortfolio.get(j));
					double marginDebt = thisBalancePortfolio.get(j).getMarginDebt();
					Stock s = new Stock();
					s.setStockId(thisBalancePortfolio.get(j).getStockId());
					
					
					
					Timestamp startDate = thisBalancePortfolio.get(j).getBuyDate();
					Timestamp endDate = thisBalancePortfolio.get(j).getSellDate();
					long sd = startDate.getTime();
					long nd = endDate.getTime();
					float marginTime = Precision.round(((nd-sd)/(86400*1000)),0);
					if(marginTime <= 0) marginTime =1;
					
					double marginFee = marginRate*marginDebt*marginTime/365/100;
					// YEAH, TEMPORARY STORE MARGIN DATA IN STOCK OBJECT. I HAVE NO CHOICE :/
					s.setStockPP(marginFee);
					marginDebtList.add(s);
				}
			}
		}
		
		

		model.addAttribute("marginRate", marginRate);
		model.addAttribute("user", u);
		model.addAttribute("listPortfolios", listPortfolio);
		model.addAttribute("listStocks", this.stockService.listStock());
		model.addAttribute("marginDebtList", marginDebtList);
		model.addAttribute("listBalances", this.balanceService.getBalanceByUserId(userId));
		return "user/marginStatsHistory";
	}

	@RequestMapping(value = "/user/addOrder", method = RequestMethod.POST)
	public String userAddOrders(Model model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 1. GET ORDER INFO
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
		String orderState = "WAITING";
		Stock s = stockService.getStockById(stockId);
		// FIXED CODE, MARGIN'S NOT ENABLED YET
		double margin = 1;
		if (request.getParameter("marginState").toString().equals("YES")) {
			margin = s.getStockMarginRate();
		}
		double price = 0;
		if (request.getParameter("price") != null) {
			price = Double.parseDouble(request.getParameter("price"));
		}
		double quantity = 0;
		if (request.getParameter("quantity") != null) {
			quantity = Double.parseDouble(request.getParameter("quantity"));
		}
		Timestamp createdTime;
		java.util.Date date = new java.util.Date();
		createdTime = new Timestamp(date.getTime());

		Orders o = new Orders();
		o.setBalanceId(balanceId);
		o.setStockId(stockId);
		o.setCreatedTime(createdTime);
		o.setPrice(price);
		o.setQuantity(quantity);
		o.setAction(action);
		o.setOrderType(orderType);
		o.setMargin(margin);
		o.setOrderState("WAITING");

		Balance b = this.balanceService.getBalanceById(balanceId);

		// 2. ORDER VALIDATION:
		boolean validation = this.orderValidation(o);
		if (validation == false) {
			model.addAttribute("validationError",
					"This balance doesn't have enough the quantity of required Cash/Stock!");
			return "redirect:/user/trading";
		} else {
			this.ordersService.addOrders(o);
		}
		
		// 3. TRANSACTION
		this.transactionUpdaterService.executeTransaction(o);
		
		

		// 3. TRANSACTION AND UPDATE BALANCE
/*		boolean checkingTransaction = this.transaction(o);
		if (checkingTransaction == true) {
			this.updateBalanceAndPortfolioAfterTransaction(o);
		}*/
		return "redirect:/user/trading";
	}

	@RequestMapping("/user/removeOrder/{orderId}")
	public String userCancelOrders(@PathVariable("orderId") int id) {
		Orders o = this.ordersService.getOrdersById(id);
		this.cancelOrder(o);
		return "redirect:/user/trading";
	}
	
	@RequestMapping(value = { "/core/updateAllTransaction" }, method = RequestMethod.GET)
	public String updateAllTransaction(Model model) throws Exception {
		this.checkTransactionAllWaitingOrders();
		return "redirect:/core/orders";
	}
	
	@RequestMapping(value = { "/update/updateAllTransaction" }, method = RequestMethod.GET)
	public String updateAllTransactionFromTimer(Model model) throws Exception {
		this.checkTransactionAllWaitingOrders();
		return "redirect:/core/orders";
	}
	
	@RequestMapping(value = { "/core/timeoutCancelAllTransaction" }, method = RequestMethod.GET)
	public String timeoutCancelAllTransaction(Model model) throws Exception {
		this.timeoutCancelAllWaitingOrders();
		return "redirect:/core/orders";
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

		// 1. GET ORDER INFO
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
		double margin = 1;
		if (request.getParameter("marginState").toString().equals("YES")) {
			margin = this.stockService.getStockById(stockId).getStockMarginRate();
		}

		double price = 0;
		if (request.getParameter("price") != null) {
			price = Double.parseDouble(request.getParameter("price"));
		}

		double quantity = 0;
		if (request.getParameter("quantity") != null) {
			quantity = Double.parseDouble(request.getParameter("quantity"));
		}

		Timestamp createdTime;
		java.util.Date date = new java.util.Date();
		createdTime = new Timestamp(date.getTime());

		if (request.getParameter("createdTime") != null) {
			String createdTimeParam = request.getParameter("createdTime").replaceAll("/", "-");
			if (createdTimeParam != null) {
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
		}

		Orders o = new Orders();
		o.setOrderId(orderId);
		o.setBalanceId(balanceId);
		o.setStockId(stockId);
		o.setCreatedTime(createdTime);
		o.setPrice(price);
		o.setQuantity(quantity);
		o.setAction(action);
		o.setOrderType(orderType);
		o.setMargin(margin);
		o.setOrderState(orderState);
		
		if (orderId != 0) { 
			// existing orders, call update
			// ORDER IS CAN NOT BE UPDATED! THIS'S GONNA MESS UP WITH ACCOUNT SYSTEM
			// OKEY I'LL ALLOW THIS, BUT EXCEPT : PRICE, QUANTITY AND STOCK ID
			 this.ordersService.updateOrders(o);
			 return "redirect:/core/orders";
		}
		else{
			this.ordersService.addOrders(o);
		}

		/*Balance b = this.balanceService.getBalanceById(balanceId);

		// 2. ORDER VALIDATION:
		boolean validation = this.orderValidation(o);
		if (validation == false) {
			model.addAttribute("validationError",
					"This balance doesn't have enough the quantity of required Cash/Stock!");
			return "redirect:/user/trading";
		} else {
			this.ordersService.addOrders(o);
		}

		// 3. TRANSACTION AND UPDATE BALANCE
		boolean checkingTransaction = this.transaction(o);
		if (checkingTransaction == true) {
			this.updateBalanceAndPortfolioAfterTransaction(o);
		}*/

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
	
	public double tradingFee(double tv){
		double tradingValue = tv;
		List<TradingFee> listTradingFee = this.tradingFeeService.listTradingFees();
		for (int i = 1; i < listTradingFee.size(); i++) {
			if(tradingValue > listTradingFee.get(i).getFromValue() && tradingValue <= listTradingFee.get(i).getThroughValue()){
				return listTradingFee.get(i).getValue()/100;
			}
		}
		return listTradingFee.get(listTradingFee.size()).getValue()/100;
	}
	
	public double sellingTaxFee(){
		TradingFee firstSettingItem = this.tradingFeeService.getTradingFeeById(1);
		return firstSettingItem.getValue()/100;
	}

	@Scheduled(cron="0 0 0 * * *", zone="Asia/Ho_Chi_Minh")
	public void timeoutCancelAllWaitingOrders() {
		System.out.println(new java.util.Date()+ " TIMEOUT CANCELLING ALL TRANSACTION");
		List<Orders> listOrders = this.ordersService.listOrders();
		for (int i = 0; i < listOrders.size(); i++) {
			if (listOrders.get(i).getOrderState().equals("WAITING")) {
				this.timeoutCancelOrder(listOrders.get(i));
				System.out.println(new java.util.Date()+" - CANCELLED ORDER "+ listOrders.get(i).getOrderId());
			}
		}
	}

	public void checkTransactionAllWaitingOrders() throws Exception {
		System.out.println(new java.util.Date()+ " UPDATING ALL TRANSACTION");
		List<Orders> listOrders = this.ordersService.listOrders();
		for (int i = 0; i < listOrders.size(); i++) {
			if (listOrders.get(i).getOrderState().equals("WAITING")) {
				System.out.println(new java.util.Date()+ " - ORDER "+ listOrders.get(i).getOrderId()+" IS BEING PROCESSED");
				
				this.transactionUpdaterService.executeTransaction(listOrders.get(i));
			}
		}
	}

	public boolean orderValidation(Orders o) {
		Orders order = o;
		Balance balance = this.balanceService.getBalanceById(order.getBalanceId());
		if (order.getAction().equals("BUY")) {
			double marginRate = o.getMargin();

			// IF MARGIN = DEFAULT (1) THEN NO CHANGE -- IF USING -> MARGIN RATE < 0 --> REDUCE REQUIRED CASD
			double requiredCash = (order.getPrice() * order.getQuantity() * 1000)*marginRate;
			
			
			
//			double havingCash = balance.getBalanceCash();
//			double havingCash = balance.getBalanceAvailableCash();
			if (balance.getBalanceAvailableCash() >= requiredCash && balance.getBalanceCash() >= requiredCash) {
				// TEMPORARY REDUCE CASH
//				balance.setBalanceCash(balance.getBalanceCash() - order.getPrice() * order.getQuantity() * 1000);
				balance.setBalanceAvailableCash(balance.getBalanceAvailableCash() - requiredCash); // MARGIN INCLUDED
				this.balanceService.updateBalance(balance);
				return true;
			}
		}

		if (order.getAction().equals("SELL")) {
			double requiredStock = order.getQuantity();
			int stockId = order.getStockId();
			int balanceId = balance.getBalanceId();
			double havingStock = 0;
			List<Portfolio> havingPortfolio = this.portfolioService.getPortfolioByBalanceId(balanceId);
			for (int i = 0; i < havingPortfolio.size(); i++) {
				if (havingPortfolio.get(i).getStockId() == stockId) {
					// THERE CAN BE ONLY 1 RESULT LIKE THAT
					if (havingPortfolio.get(i).getSellPrice() <= 0) {
						//havingStock = havingPortfolio.get(i).getQuantity();
						havingStock = havingPortfolio.get(i).getAvailableQuantity();
						if (havingStock >= requiredStock) {
							// TEMPORARY REDUCE STOCK QUANTITY
							havingPortfolio.get(i).setAvailableQuantity(havingStock - order.getQuantity());
							this.portfolioService.updatePortfolio(havingPortfolio.get(i));
							return true;
						}
					}
				}
			}
		}

		return false;
	}

	public void cancelOrder(Orders o) {
		Orders order = o;
		Balance balance = this.balanceService.getBalanceById(order.getBalanceId());
		if (order.getAction().equals("BUY")) {
			// RESTORE CASH
			balance.setBalanceAvailableCash(balance.getBalanceAvailableCash() + order.getPrice() * order.getQuantity() * 1000);
			this.balanceService.updateBalance(balance);
		}

		if (order.getAction().equals("SELL")) {
			List<Portfolio> havingPortfolio = this.portfolioService.getPortfolioByBalanceId(balance.getBalanceId());
			for (int i = 0; i < havingPortfolio.size(); i++) {
				if (havingPortfolio.get(i).getStockId() == order.getStockId()) {
					// THERE CAN BE ONLY 1 RESULT LIKE THAT
					if (havingPortfolio.get(i).getSellPrice() <= 0) {
						double havingStock = havingPortfolio.get(i).getAvailableQuantity();
						// RESTORE STOCK QUANTITY
						havingPortfolio.get(i).setAvailableQuantity(havingStock + order.getQuantity());
						this.portfolioService.updatePortfolio(havingPortfolio.get(i));
					}
				}
			}
		}
		order.setOrderState("CANCELLED");
		this.ordersService.updateOrders(order);
		return;
	}
	
	public void timeoutCancelOrder(Orders o) {
		Orders order = o;
		Balance balance = this.balanceService.getBalanceById(order.getBalanceId());
		if (order.getAction().equals("BUY")) {
			// RESTORE CASH
			balance.setBalanceAvailableCash(balance.getBalanceAvailableCash() + order.getPrice() * order.getQuantity() * 1000);
			this.balanceService.updateBalance(balance);
		}

		if (order.getAction().equals("SELL")) {
			List<Portfolio> havingPortfolio = this.portfolioService.getPortfolioByBalanceId(balance.getBalanceId());
			for (int i = 0; i < havingPortfolio.size(); i++) {
				if (havingPortfolio.get(i).getStockId() == order.getStockId()) {
					// THERE CAN BE ONLY 1 RESULT LIKE THAT
					if (havingPortfolio.get(i).getSellPrice() <= 0) {
						double havingStock = havingPortfolio.get(i).getAvailableQuantity();
						// RESTORE STOCK QUANTITY
						havingPortfolio.get(i).setAvailableQuantity(havingStock + order.getQuantity());
						this.portfolioService.updatePortfolio(havingPortfolio.get(i));
					}
				}
			}
		}
		order.setOrderState("UNSUCCESSED");
		this.ordersService.updateOrders(order);
		return;
	}

	public void updateBalanceAndPortfolioAfterTransaction(Orders o) {
		Orders order = o;
		Balance balance = this.balanceService.getBalanceById(order.getBalanceId());

		if (order.getAction().equals("BUY")) {
			double buyCash = order.getPrice() * order.getQuantity() * 1000;
			
			// TRADING FEE
			double tradingFeeRate = this.tradingFee(buyCash);
			double tradingFee = buyCash*tradingFeeRate;
			
			order.setOrderTradingFee(tradingFee);
			this.ordersService.updateOrders(order);
			
			double realPayment = buyCash + tradingFee;
			
			// SET REAL CASH AND AVAILABLE CASH & TAX AND FEE PAYMENT
			balance.setBalanceCash(balance.getBalanceCash() - realPayment);
			balance.setBalanceAvailableCash(balance.getBalanceAvailableCash()  - realPayment);
			balance.setBalanceTotalAssets(balance.getBalanceTotalAssets() - realPayment);
			balance.setBalanceNAV(balance.getBalanceNAV() - realPayment);
			this.balanceService.updateBalance(balance);

			List<Portfolio> havingPortfolio = this.portfolioService.getPortfolioByBalanceId(balance.getBalanceId());
			boolean checkStockExisting = false;
			for (int i = 0; i < havingPortfolio.size(); i++) {
				if (havingPortfolio.get(i).getStockId() == order.getStockId()) {
					if (havingPortfolio.get(i).getSellPrice() <= 0) {
						checkStockExisting = true;

						double oldPrice = havingPortfolio.get(i).getBuyPrice();
						double oldQuantity = havingPortfolio.get(i).getQuantity();

						havingPortfolio.get(i)
								.setBuyPrice(Precision
										//.round((oldPrice * oldQuantity + order.getPrice() * order.getQuantity())
										.round((oldPrice * oldQuantity + (realPayment/1000))
												/ (oldQuantity + order.getQuantity()), 3));
						havingPortfolio.get(i).setQuantity(oldQuantity + order.getQuantity());
						havingPortfolio.get(i).setAvailableQuantity(havingPortfolio.get(i).getAvailableQuantity() + order.getQuantity());

						this.portfolioService.updatePortfolio(havingPortfolio.get(i));
						break;
					}
				}
			}

			if (checkStockExisting == false) {
				Portfolio portfolio = new Portfolio();
				portfolio.setBalanceId(balance.getBalanceId());
				portfolio.setStockId(order.getStockId());
				portfolio.setBuyPrice(Precision.round(((realPayment/1000) / order.getQuantity()), 3));
				portfolio.setQuantity(order.getQuantity());
				portfolio.setAvailableQuantity(order.getQuantity());

				Timestamp createdTime;
				java.util.Date date = new java.util.Date();
				createdTime = new Timestamp(date.getTime());
				portfolio.setBuyDate(createdTime);

				this.portfolioService.addPortfolio(portfolio);
			}

		}

		if (order.getAction().equals("SELL")) {
			double sellCash = order.getPrice() * order.getQuantity() * 1000;
			
			// TRADING FEE
			double tradingFeeRate = this.tradingFee(sellCash);
			double tradingFee = sellCash*tradingFeeRate;
			
			double taxRate = this.sellingTaxFee();
			double taxFee = sellCash*taxRate;
			
			double realPayment = sellCash - tradingFee - taxFee;
			
			order.setOrderTradingFee(tradingFee);
			order.setOrderSellTax(taxFee);
			this.ordersService.updateOrders(order);
			
			balance.setBalanceCash(balance.getBalanceCash() + realPayment);
			balance.setBalanceAvailableCash(balance.getBalanceAvailableCash() + realPayment);
			balance.setBalanceTotalAssets(balance.getBalanceTotalAssets() + realPayment);
			balance.setBalanceNAV(balance.getBalanceNAV() + realPayment);
			this.balanceService.updateBalance(balance);

			List<Portfolio> havingPortfolio = this.portfolioService.getPortfolioByBalanceId(balance.getBalanceId());
			for (int i = 0; i < havingPortfolio.size(); i++) {
				if (havingPortfolio.get(i).getStockId() == order.getStockId()) {
					if (havingPortfolio.get(i).getSellPrice() <= 0) {
						// THERE'S ONLY 1 RECORD LIKE THIS

						System.out.println("DETECTED PORTFOLIO !");

						Timestamp createdTime;
						java.util.Date date = new java.util.Date();
						createdTime = new Timestamp(date.getTime());

						// CASE 1: SELL ALL:
						if (havingPortfolio.get(i).getQuantity() == order.getQuantity()) {
							// havingPortfolio.get(i).setSellPrice(Precision.round(order.getPrice(), 3));
							havingPortfolio.get(i).setSellPrice(Precision.round(((realPayment/1000)/ order.getQuantity()), 3));
							havingPortfolio.get(i).setSellDate(createdTime);
							havingPortfolio.get(i).setAvailableQuantity(havingPortfolio.get(i).getAvailableQuantity() - order.getQuantity());
							this.portfolioService.updatePortfolio(havingPortfolio.get(i));
							break;
						}
						// PARTIAL SELL
						else {
							Portfolio remain = new Portfolio();
							remain.setBalanceId(havingPortfolio.get(i).getBalanceId());
							remain.setStockId(havingPortfolio.get(i).getStockId());
							remain.setBuyPrice(Precision.round(havingPortfolio.get(i).getBuyPrice(), 3));
							remain.setBuyDate(havingPortfolio.get(i).getBuyDate());
							remain.setQuantity(havingPortfolio.get(i).getQuantity() - order.getQuantity());
							remain.setAvailableQuantity(havingPortfolio.get(i).getAvailableQuantity() - order.getQuantity());
							this.portfolioService.addPortfolio(remain);

							havingPortfolio.get(i).setQuantity(order.getQuantity());
							havingPortfolio.get(i).setAvailableQuantity(havingPortfolio.get(i).getAvailableQuantity() - order.getQuantity());
							// havingPortfolio.get(i).setSellPrice(Precision.round(order.getPrice(), 3));
							havingPortfolio.get(i).setSellPrice(Precision.round(((realPayment/1000)/ order.getQuantity()), 3));
							havingPortfolio.get(i).setSellDate(createdTime);

							this.portfolioService.updatePortfolio(havingPortfolio.get(i));
							break;
						}
					}
				}
			}
		}
	}

	public boolean transaction(Orders o) throws Exception {
		// STEP 1 CHECK IF MATCHES
		TransactionResult result = new TransactionResult();
		result.setResult(false);

		Orders order = o;
		int stockId = order.getStockId();
		Stock s = this.stockService.getStockById(stockId);
		String stockName = s.getStockName();
		String stockExhange = s.getStockExchangeId();
		String action = order.getAction();
		String orderType = order.getOrderType();

		PriceBoard currentStockPrice = this.getStockPriceByStockname(stockId, stockName, stockExhange);

		TransactionResult getResult = null;

		Balance balance = this.balanceService.getBalanceById(order.getBalanceId());

		if (action.equals("BUY") && orderType.equals("MP")) {
			getResult = this.buyMP(order, currentStockPrice);
		}
		if (action.equals("SELL") && orderType.equals("MP")) {
			getResult = this.sellMP(order, currentStockPrice);
		}
		if (action.equals("BUY") && orderType.equals("LO")) {
			getResult = this.buyLO(order, currentStockPrice);
		}
		if (action.equals("SELL") && orderType.equals("LO")) {
			getResult = this.sellLO(order, currentStockPrice);
		}

		result.setResult(getResult.isResult());
		result.setMatchedPrice(Precision.round(getResult.getMatchedPrice(), 3));
		result.setMatchQuantity(getResult.getMatchQuantity());

		// ENDED STEP 1

		// STEP 2 - UPDATE RESULT ORDER
		if (result.isResult() == false) {
			// NOTHING CHANGES
			o.setOrderState("WAITING");
			return false;
		} else {
			// MATCHED ALL
			if (result.getMatchQuantity() == o.getQuantity()) {
				if (o.getAction().equals("BUY")) {
//					balance.setBalanceCash(balance.getBalanceCash() + o.getPrice() * o.getQuantity()*1000);
					balance.setBalanceAvailableCash(balance.getBalanceAvailableCash() + o.getPrice() * o.getQuantity()*1000);
					this.balanceService.updateBalance(balance);
				} else {
					List<Portfolio> havingPortfolio = this.portfolioService
							.getPortfolioByBalanceId(balance.getBalanceId());
					for (int i = 0; i < havingPortfolio.size(); i++) {
						if (havingPortfolio.get(i).getStockId() == stockId) {
							// THERE CAN BE ONLY 1 RESULT LIKE THAT
							if (havingPortfolio.get(i).getSellPrice() <= 0) {
								double havingStock = havingPortfolio.get(i).getAvailableQuantity();
								// TEMPORARY REDUCE STOCK QUANTITY
								havingPortfolio.get(i).setAvailableQuantity(havingStock + order.getQuantity());
								this.portfolioService.updatePortfolio(havingPortfolio.get(i));
							}
						}
					}
				}
				o.setPrice(result.getMatchedPrice());
				o.setOrderState("SUCCEEDED");
				this.ordersService.updateOrders(o);

				// UPDATE BALANCE - ADD OR MINUS CASH

			}
			// PARTIAL MATCHED
			else {
				double remainQuantity = o.getQuantity() - result.getMatchQuantity();
				if (o.getAction().equals("BUY")) {
//					balance.setBalanceCash(balance.getBalanceCash() + o.getPrice() * result.getMatchQuantity()*1000);
					balance.setBalanceAvailableCash(balance.getBalanceAvailableCash() + o.getPrice() * result.getMatchQuantity()*1000);
					this.balanceService.updateBalance(balance);
				} else {
					List<Portfolio> havingPortfolio = this.portfolioService
							.getPortfolioByBalanceId(balance.getBalanceId());
					for (int i = 0; i < havingPortfolio.size(); i++) {
						if (havingPortfolio.get(i).getStockId() == stockId) {
							// THERE CAN BE ONLY 1 RESULT LIKE THAT
							if (havingPortfolio.get(i).getSellPrice() <= 0) {
								double havingStock = havingPortfolio.get(i).getAvailableQuantity();
								// TEMPORARY REDUCE STOCK QUANTITY
								havingPortfolio.get(i).setAvailableQuantity(havingStock + result.getMatchQuantity());
								this.portfolioService.updatePortfolio(havingPortfolio.get(i));
							}
						}
					}
				}
				double oldPrice = o.getPrice();
				o.setPrice(result.getMatchedPrice());
				o.setQuantity(result.getMatchQuantity());
				o.setOrderState("SUCCEEDED");
				this.ordersService.updateOrders(o);
				// UPDATE BALANCE - ADD OR MINUS CASH

				// CREATE ORDER FOR THE REMAINED QUANTITY
				Orders remain = new Orders();
				remain.setBalanceId(o.getBalanceId());
				remain.setStockId(o.getStockId());
				remain.setCreatedTime(o.getCreatedTime());
				remain.setPrice(oldPrice);
				remain.setQuantity(remainQuantity);
				remain.setAction(o.getAction());
				remain.setOrderType(o.getOrderType());
				remain.setMargin(o.getMargin());
				remain.setOrderState("WAITING");
				this.ordersService.addOrders(remain);
			}
			return true;
		}
	}

	public TransactionResult buyMP(Orders o, PriceBoard pb) {
		TransactionResult result = new TransactionResult();
		result.setResult(false);
		Orders order = o;
		PriceBoard currentStockPrice = pb;

		if (currentStockPrice.getSell1() == 0) {
			// NOBODY BUY - NOTHING MATCHED
			return result;
		}

		if (order.getQuantity() <= currentStockPrice.getSell1Quantity()) {
			// MATCHED ALL IN PRICE 1- JUST RETURN
			result.setResult(true);
			result.setMatchedPrice(currentStockPrice.getSell1());
			result.setMatchQuantity(order.getQuantity());
			return result;
		} else {
			// COULDN'T MATCH ALL WITH SELL PRICE 1
			double remain1 = (order.getQuantity() - currentStockPrice.getSell1Quantity());
			if (remain1 <= currentStockPrice.getSell2Quantity()) {
				// MATCH ALL THE REMAINED IN SELL PRICE 2
				result.setResult(true);
				result.setMatchedPrice((currentStockPrice.getSell2() * remain1
						+ currentStockPrice.getSell1() * currentStockPrice.getSell1Quantity()) / (order.getQuantity()));
				result.setMatchQuantity(order.getQuantity());
				return result;
			} else {
				// COULDN'T MATCH ALL WITH SELL PRICE 2
				double remain2 = (order.getQuantity() - currentStockPrice.getSell1Quantity()
						- currentStockPrice.getSell2Quantity());
				if (remain2 <= currentStockPrice.getSell3Quantity()) {
					// MATCH ALL THE REMAINED IN SELL PRICE 3
					result.setResult(true);
					result.setMatchedPrice(
							(currentStockPrice.getSell3() * remain2 + currentStockPrice.getSell2() * remain1
									+ currentStockPrice.getSell1() * currentStockPrice.getSell1Quantity())
									/ (order.getQuantity()));
					result.setMatchQuantity(order.getQuantity());
					return result;
				} else {
					// COULDN'T MATCH ALL WITH SELL PRICE 3
					double totalMatch = currentStockPrice.getSell1() + currentStockPrice.getSell2()
							+ currentStockPrice.getSell3();
					result.setResult(true);
					result.setMatchedPrice(
							(currentStockPrice.getSell3() * remain2 + currentStockPrice.getSell2() * remain1
									+ currentStockPrice.getSell1() * currentStockPrice.getSell1Quantity())
									/ (totalMatch));
					result.setMatchQuantity(totalMatch);
					return result;
				}
			}
		}
	}

	public TransactionResult buyLO(Orders o, PriceBoard pb) {
		TransactionResult result = new TransactionResult();
		result.setResult(false);
		Orders order = o;
		PriceBoard currentStockPrice = pb;

		if (currentStockPrice.getSell1() == 0) {
			// NOBODY SELL, VERYSIMPLE
			return result;
		}

		if (order.getPrice() >= currentStockPrice.getSell1()) {
			// SOMETHING MATCHED - REACHED SELL1
			if (order.getQuantity() <= currentStockPrice.getSell1Quantity()) {
				// ALL MATCHED
				result.setResult(true);
				result.setMatchedPrice(currentStockPrice.getSell1());
				result.setMatchQuantity(order.getQuantity());
				return result;
			} else {
				// 2 CASES: SELL 1 PARTIAL MATCHED ONLY OR SELL 1 AND OTHER
				double remain1 = (order.getQuantity() - currentStockPrice.getSell1Quantity());
				if (order.getPrice() >= currentStockPrice.getSell2() && currentStockPrice.getSell2Quantity() > 0) {
					// MATCH IN PRICE 1 AND 2 FOR SURE
					if (remain1 <= currentStockPrice.getSell2Quantity()) {
						// MATCHED ALL IN PRICE 1 AND 2
						result.setResult(true);
						result.setMatchedPrice((currentStockPrice.getSell1() * currentStockPrice.getSell1Quantity()
								+ currentStockPrice.getSell2() * remain1) / order.getQuantity());
						result.setMatchQuantity(order.getQuantity());
						return result;
					} else {
						// 2 CASES: SELL 1 AND 2 PARTIAL MATCHED ONLY OR ALSO
						// REACHED SELL 3
						double remain2 = (order.getQuantity() - currentStockPrice.getSell1Quantity()
								- currentStockPrice.getSell2Quantity());
						if (order.getPrice() >= currentStockPrice.getSell3()
								&& currentStockPrice.getSell3Quantity() > 0) {
							// MATCHED IN ALL 3 PRICES
							if (remain2 <= currentStockPrice.getSell3Quantity()) {
								// MATCHED ALL IN 3 PRICES
								result.setResult(true);
								result.setMatchedPrice(
										(currentStockPrice.getSell1() * currentStockPrice.getSell1Quantity()
												+ currentStockPrice.getSell2() * currentStockPrice.getSell2Quantity()
												+ currentStockPrice.getSell3() * remain2) / order.getQuantity());
								result.setMatchQuantity(order.getQuantity());
								return result;
							} else {
								// MATCHED PARITAL IN 3 PRICES
								result.setResult(true);
								double totalMatch = currentStockPrice.getSell1Quantity()
										+ currentStockPrice.getSell2Quantity() + currentStockPrice.getSell3Quantity();
								result.setMatchedPrice(
										(currentStockPrice.getSell1() * currentStockPrice.getSell1Quantity()
												+ currentStockPrice.getSell2() * currentStockPrice.getSell2Quantity()
												+ currentStockPrice.getSell3() * currentStockPrice.getSell3Quantity())
												/ totalMatch);
								result.setMatchQuantity(totalMatch);
								return result;
							}
						} else {
							// MATCHED PARTIAL IN SELL 1 AND 2 ONLY
							result.setResult(true);
							result.setMatchedPrice((currentStockPrice.getSell1() * currentStockPrice.getSell1Quantity()
									+ currentStockPrice.getSell2() * currentStockPrice.getSell2Quantity())
									/ (currentStockPrice.getSell1Quantity() + currentStockPrice.getSell2Quantity()));
							result.setMatchQuantity(
									currentStockPrice.getSell1Quantity() + currentStockPrice.getSell2Quantity());
							return result;
						}
					}
				} else {
					// SELL 1 PARTIAL MATCHED ONLY
					result.setResult(true);
					result.setMatchedPrice(currentStockPrice.getSell1());
					result.setMatchQuantity(currentStockPrice.getSell1Quantity());
					return result;
				}
			}
		} else {
			// NOTHING MATCHED - COUNDN'T REACHED SELL 1
			return result;
		}
	}

	public TransactionResult sellMP(Orders o, PriceBoard pb) {
		TransactionResult result = new TransactionResult();
		result.setResult(false);
		Orders order = o;
		PriceBoard currentStockPrice = pb;

		if (currentStockPrice.getBuy1() == 0) {
			// NOBODY BUY - NOTHING MATCHED
			return result;
		}

		if (order.getQuantity() <= currentStockPrice.getBuy1Quantity()) {
			// MATCHED ALL IN PRICE 1- JUST RETURN
			result.setResult(true);
			result.setMatchedPrice(currentStockPrice.getBuy1());
			result.setMatchQuantity(order.getQuantity());
			return result;
		} else {
			// COULDN'T MATCH ALL WITH BUY PRICE 1
			double remain1 = (order.getQuantity() - currentStockPrice.getBuy1Quantity());
			if (remain1 <= currentStockPrice.getBuy2Quantity()) {
				// MATCH ALL THE REMAINED IN BUY PRICE 2
				result.setResult(true);
				result.setMatchedPrice((currentStockPrice.getBuy2() * remain1
						+ currentStockPrice.getBuy1() * currentStockPrice.getBuy1Quantity()) / (order.getQuantity()));
				result.setMatchQuantity(order.getQuantity());
				return result;
			} else {
				// COULDN'T MATCH ALL WITH BUY PRICE 2
				double remain2 = (order.getQuantity() - currentStockPrice.getBuy1Quantity()
						- currentStockPrice.getBuy2Quantity());
				if (remain2 <= currentStockPrice.getBuy3Quantity()) {
					// MATCH ALL THE REMAINED IN BUY PRICE 3
					result.setResult(true);
					result.setMatchedPrice(
							(currentStockPrice.getBuy3() * remain2 + currentStockPrice.getBuy2() * remain1
									+ currentStockPrice.getBuy1() * currentStockPrice.getBuy1Quantity())
									/ (order.getQuantity()));
					result.setMatchQuantity(order.getQuantity());
					return result;
				} else {
					// COULDN'T MATCH ALL WITH BUY PRICE 3
					double totalMatch = currentStockPrice.getBuy1() + currentStockPrice.getBuy2()
							+ currentStockPrice.getBuy3();
					result.setResult(true);
					result.setMatchedPrice(
							(currentStockPrice.getBuy3() * remain2 + currentStockPrice.getBuy2() * remain1
									+ currentStockPrice.getBuy1() * currentStockPrice.getBuy1Quantity())
									/ (totalMatch));
					result.setMatchQuantity(totalMatch);
					return result;
				}
			}
		}
	}

	public TransactionResult sellLO(Orders o, PriceBoard pb) {
		TransactionResult result = new TransactionResult();
		result.setResult(false);
		Orders order = o;
		PriceBoard currentStockPrice = pb;

		if (currentStockPrice.getBuy1() == 0) {
			// NOBODY BUY, VERYSIMPLE
			return result;
		}

		if (order.getPrice() <= currentStockPrice.getBuy1()) {
			// SOMETHING MATCHED - REACHED BUY1
			if (order.getQuantity() <= currentStockPrice.getBuy1Quantity()) {
				// ALL MATCHED
				result.setResult(true);
				result.setMatchedPrice(currentStockPrice.getBuy1());
				result.setMatchQuantity(order.getQuantity());
				return result;
			} else {
				// 2 CASES: BUY 1 PARTIAL MATCHED ONLY OR BUY 1 AND OTHER
				double remain1 = (order.getQuantity() - currentStockPrice.getBuy1Quantity());
				if (order.getPrice() <= currentStockPrice.getBuy2() && currentStockPrice.getBuy2Quantity() > 0) {
					// MATCH IN PRICE 1 AND 2 FOR SURE
					if (remain1 <= currentStockPrice.getBuy2Quantity()) {
						// MATCHED ALL IN PRICE 1 AND 2
						result.setResult(true);
						result.setMatchedPrice((currentStockPrice.getBuy1() * currentStockPrice.getBuy1Quantity()
								+ currentStockPrice.getBuy2() * remain1) / order.getQuantity());
						result.setMatchQuantity(order.getQuantity());
						return result;
					} else {
						// 2 CASES: BUY 1 AND 2 PARTIAL MATCHED ONLY OR ALSO
						// REACHED BUY 3
						double remain2 = (order.getQuantity() - currentStockPrice.getBuy1Quantity()
								- currentStockPrice.getBuy2Quantity());
						if (order.getPrice() <= currentStockPrice.getBuy3()
								&& currentStockPrice.getBuy3Quantity() > 0) {
							// MATCHED IN ALL 3 PRICES
							if (remain2 <= currentStockPrice.getBuy3Quantity()) {
								// MATCHED ALL IN 3 PRICES
								result.setResult(true);
								result.setMatchedPrice(
										(currentStockPrice.getBuy1() * currentStockPrice.getBuy1Quantity()
												+ currentStockPrice.getBuy2() * currentStockPrice.getBuy2Quantity()
												+ currentStockPrice.getBuy3() * remain2) / order.getQuantity());
								result.setMatchQuantity(order.getQuantity());
								return result;
							} else {
								// MATCHED PARITAL IN 3 PRICES
								double totalMatch = currentStockPrice.getBuy1Quantity()
										+ currentStockPrice.getBuy2Quantity() + currentStockPrice.getBuy3Quantity();
								result.setResult(true);
								result.setMatchedPrice(
										(currentStockPrice.getBuy1() * currentStockPrice.getBuy1Quantity()
												+ currentStockPrice.getBuy2() * currentStockPrice.getBuy2Quantity()
												+ currentStockPrice.getBuy3() * currentStockPrice.getBuy3Quantity())
												/ totalMatch);
								result.setMatchQuantity(totalMatch);
								return result;
							}
						} else {
							// MATCHED PARTIAL IN BUY 1 AND 2 ONLY
							result.setResult(true);
							result.setMatchedPrice((currentStockPrice.getBuy1() * currentStockPrice.getBuy1Quantity()
									+ currentStockPrice.getBuy2() * currentStockPrice.getBuy2Quantity())
									/ (currentStockPrice.getBuy1Quantity() + currentStockPrice.getBuy2Quantity()));
							result.setMatchQuantity(
									currentStockPrice.getBuy1Quantity() + currentStockPrice.getBuy2Quantity());
							return result;
						}
					}
				} else {
					// BUY 1 PARTIAL MATCHED ONLY
					result.setResult(true);
					result.setMatchedPrice(currentStockPrice.getBuy1());
					result.setMatchQuantity(currentStockPrice.getBuy1Quantity());
					return result;
				}
			}
		} else {
			// NOTHING MATCHED - COUNDN'T REACHED BUY 1
			return result;
		}
	}

	public PriceBoard getStockPriceByStockname(int StockId, String StockName, String StockExchange)
			throws Exception, Exception {
		String urlHSX = "http://banggia.cafef.vn/stockhandler.ashx?center=1";
		String urlHNX = "http://banggia.cafef.vn/stockhandler.ashx?center=2";
		String url = urlHSX;

		int stockId = StockId;
		String stockName = StockName;
		String stockExchange = StockExchange;

		if (stockExchange.equals("HNX")) {
			url = urlHNX;
		}

		PriceBoard currentPriceInfo = new PriceBoard();
		try {
			URL dataURL = new URL(url); // URL to Parse
			URLConnection yc = dataURL.openConnection();
			BufferedReader in = new BufferedReader(new InputStreamReader(yc.getInputStream()));

			JSONParser parser = new JSONParser();

			String inputLine;
			while ((inputLine = in.readLine()) != null) {
				JSONArray a = (JSONArray) parser.parse(inputLine);

				// Loop through each item
				for (Object o : a) {
					JSONObject loadedData = (JSONObject) o;

					String name = (String) loadedData.get("a");
					// System.out.println("Stock name : " + name);

					if (name.equals(stockName)) {

						double price = ((Number) loadedData.get("b")).doubleValue();
						double ceil = ((Number) loadedData.get("c")).doubleValue();
						double floor = ((Number) loadedData.get("d")).doubleValue();
						double buy3 = ((Number) loadedData.get("e")).doubleValue();
						double buy3Quantity = ((Number) loadedData.get("f")).doubleValue() * 100;
						double buy2 = ((Number) loadedData.get("g")).doubleValue();
						double buy2Quantity = ((Number) loadedData.get("h")).doubleValue() * 100;
						double buy1 = ((Number) loadedData.get("i")).doubleValue();
						double buy1Quantity = ((Number) loadedData.get("j")).doubleValue() * 100;
						double match = ((Number) loadedData.get("l")).doubleValue();
						double matchQuantity = ((Number) loadedData.get("m")).doubleValue() * 100;
						double tradedQuantity = ((Number) loadedData.get("n")).doubleValue() * 100;
						double sell1 = ((Number) loadedData.get("o")).doubleValue();
						double sell1Quantity = ((Number) loadedData.get("p")).doubleValue() * 100;
						double sell2 = ((Number) loadedData.get("q")).doubleValue();
						double sell2Quantity = ((Number) loadedData.get("r")).doubleValue() * 100;
						double sell3 = ((Number) loadedData.get("s")).doubleValue();
						double sell3Quantity = ((Number) loadedData.get("t")).doubleValue() * 100;
						double highest = ((Number) loadedData.get("v")).doubleValue();
						double lowest = ((Number) loadedData.get("w")).doubleValue();

						// Store data to PriceBoard object
						currentPriceInfo.setStockId(stockId);

						currentPriceInfo.setPrice(price);
						currentPriceInfo.setCeil(ceil);
						currentPriceInfo.setFloor(floor);
						currentPriceInfo.setTradedQuantity(tradedQuantity);

						currentPriceInfo.setBuy1(buy1);
						currentPriceInfo.setBuy1Quantity(buy1Quantity);
						currentPriceInfo.setBuy2(buy2);
						currentPriceInfo.setBuy2Quantity(buy2Quantity);
						currentPriceInfo.setBuy3(buy3);
						currentPriceInfo.setBuy3Quantity(buy3Quantity);

						currentPriceInfo.setSell1(sell1);
						currentPriceInfo.setSell1Quantity(sell1Quantity);
						currentPriceInfo.setSell2(sell2);
						currentPriceInfo.setSell2Quantity(sell2Quantity);
						currentPriceInfo.setSell3(sell3);
						currentPriceInfo.setSell3Quantity(sell3Quantity);

						currentPriceInfo.setMatchPrice(match);
						currentPriceInfo.setMatchQuantity(matchQuantity);

						currentPriceInfo.setHighest(highest);
						currentPriceInfo.setLowest(lowest);

						break;
					}

				}
			}
			in.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return currentPriceInfo;
	}

	// AJAX SERVICES
	@RequestMapping("user/ajaxGetStockInfo")
	public void ajaxGetBalanceInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession(true);

		
		double quantity = 0;
		double availableQuantity = 0;
		
		int balanceId = 0;
		int stockId = 0;
		if (req.getParameter("stockId") != null && Integer.parseInt(req.getParameter("stockId")) > 0) {
			stockId = Integer.parseInt(req.getParameter("stockId"));
			Stock s = this.stockService.getStockById(stockId);
			String stockName = s.getStockName();
			String stockExchange = s.getStockExchangeId();
			String margin = String.valueOf(s.getStockMarginRate());

			PriceBoard pb = this.getStockPriceByStockname(stockId, stockName, stockExchange);
			
			
			if (req.getParameter("balanceId") != null && Integer.parseInt(req.getParameter("balanceId")) > 0) {
				balanceId = Integer.parseInt(req.getParameter("balanceId"));
				List<Portfolio> havingPortfolio = this.portfolioService.getPortfolioByBalanceId(balanceId);
				for (int i = 0; i < havingPortfolio.size(); i++) {
					if (havingPortfolio.get(i).getStockId() == stockId) {
						// THERE CAN BE ONLY 1 RESULT LIKE THAT
						if (havingPortfolio.get(i).getSellPrice() <= 0) {
							//havingStock = havingPortfolio.get(i).getQuantity();
							quantity = havingPortfolio.get(i).getQuantity();
							availableQuantity = havingPortfolio.get(i).getAvailableQuantity();
							}
						}
					}
				}

			String result = "";
			result = pb.getPrice().toString() + "|" + pb.getCeil().toString() + "|" + pb.getFloor().toString()+
					"|" +String.valueOf(quantity)+"|"+String.valueOf(availableQuantity)+"|"+margin;
			
			System.out.println(result);
			response.setContentType("text/plain");
			response.getWriter().write(result);
		}
	}
	
	public void hehe(){
		System.out.println("hehe");
	}
}
