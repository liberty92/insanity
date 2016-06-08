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

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.liberation.lab.model.Balance;
import com.liberation.lab.model.Portfolio;
import com.liberation.lab.model.PriceBoard;
import com.liberation.lab.model.Stock;
import com.liberation.lab.model.Balance;
import com.liberation.lab.service.BalanceService;
import com.liberation.lab.service.PortfolioService;
import com.liberation.lab.service.StockService;
import com.liberation.lab.service.UserService;


@Controller
public class BalanceController {

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

	@RequestMapping(value = { "/user/balance" }, method = RequestMethod.GET)
	public String listBalancesByUser(Model model,HttpServletRequest request, HttpServletResponse response) throws ServletException, Exception {
		model.addAttribute("balance", new Balance());
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession(true);
		
		int userId = 0;
		
		if(session.getAttribute("userId") == null || session.getAttribute("userId").toString().length() <=0){
			req.getRequestDispatcher("/403").forward(req, res);
		}
		else {
			 userId = Integer.parseInt(session.getAttribute("userId").toString());
		}
		
	
		
		List<Balance> listBalance = this.balanceService.getBalanceByUserId(userId);
		for (int i = 0; i < listBalance.size(); i++) {
			updateBalanceValue(listBalance.get(i));
		}
		
		/*for (int i = 0; i < listBalance.size(); i++) {
			int balanceId = listBalance.get(i).getBalanceId();
			List<Portfolio> listPortfolio = this.portfolioService.getPortfolioByBalanceId(balanceId);
			double portfolioValue = 0;
			for (int j = 0; j < listPortfolio.size(); j++) {
				int StockId = listPortfolio.get(j).getStockId();
				Stock s = this.stockService.getStockById(StockId);
				String StockName = s.getStockName();
				String StockExchange = s.getStockExchangeId();
				
				OrdersController oc = new OrdersController();
				PriceBoard pb = oc.getStockPriceByStockname(StockId, StockName, StockExchange);
				double stockCurrentPrice = 0;
				if(pb.getMatchPrice() != 0)
					stockCurrentPrice = pb.getMatchPrice();
				else
					stockCurrentPrice = pb.getPrice();
				
				portfolioValue += listPortfolio.get(j).getQuantity()*stockCurrentPrice*1000;
			}
			listBalance.get(i).setBalanceTotalAssets(listBalance.get(i).getBalanceCash()+ portfolioValue);
			listBalance.get(i).setBalanceNAV(listBalance.get(i).getBalanceTotalAssets());
			this.balanceService.updateBalance(listBalance.get(i));
		}*/
		
		
		model.addAttribute("user", this.userService.getUserById(userId));
		model.addAttribute("listBalances", listBalance);
		return "user/balance";
	}

	@RequestMapping(value = { "/core/balance" }, method = RequestMethod.GET)
	public String listBalances(Model model) {
		model.addAttribute("balance", new Balance());
		model.addAttribute("listBalances", this.balanceService.listBalances());
		model.addAttribute("listUsers", this.userService.listUsers());
		return "core/coreBalance";
	}
	

	@RequestMapping(value = "/user/addBalance", method = RequestMethod.POST)
	public String userAddBalance(Model model, HttpServletRequest request, HttpServletResponse response) {
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
		// ELSE DIE IMMEDIATELY DUE TO FOREIGN KEY CONSTRAINT!!!

		String balanceName = request.getParameter("balanceName");
		double balanceInitialNAV = 0;
		if (request.getParameter("balanceInitialNAV") != null) {
			balanceInitialNAV = Double.parseDouble(request.getParameter("balanceInitialNAV"));
		}
		double balanceCash = balanceInitialNAV;
		 
		double balanceTotalAssets = balanceCash;
		 
		double balanceNAV = balanceCash;
		 
		double balanceMarginRate = 0;
		 
		int balanceState = 1;
		 
		Timestamp balanceCreatedDate;
		java.util.Date date = new java.util.Date();
		balanceCreatedDate = new Timestamp(date.getTime());
		 
 

		Balance b = new Balance();
		b.setUserId(userId);
		b.setBalanceName(balanceName);
		b.setBalanceCreatedDate(balanceCreatedDate);
		b.setBalanceInitialNAV(balanceInitialNAV);
		b.setBalanceCash(balanceCash);
		b.setBalanceAvailableCash(balanceCash);
		b.setBalanceTotalAssets(balanceTotalAssets);
		b.setBalanceNAV(balanceNAV);
		b.setBalanceMarginRate(balanceMarginRate);
		b.setBalanceState(balanceState);
 
		this.balanceService.addBalance(b);
	 
		return "redirect:/user/balance";
	}
	
	@RequestMapping("/user/removeBalance/{balanceId}")
	public String userRemoveBalance(@PathVariable("balanceId") int id,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Balance b = balanceService.getBalanceById(id);
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession(true);
		
		int userId = 0;
		
		if(session.getAttribute("userId") == null || session.getAttribute("userId").toString().length() <=0){
			req.getRequestDispatcher("/403").forward(req, res);
		}
		else {
			 userId = Integer.parseInt(session.getAttribute("userId").toString());
		}
		
		int balanceUserId = b.getUserId();
		
		if(balanceUserId != userId ){
			req.getRequestDispatcher("/403").forward(req, res);
		}
		else{
			b.setBalanceState(0);
			this.balanceService.updateBalance(b);
		}
		return "redirect:/user/balance";
	}

	@RequestMapping(value = "/core/addBalance", method = RequestMethod.POST)
	public String addBalance(Model model, HttpServletRequest request, HttpServletResponse response) {
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
		// ELSE DIE IMMEDIATELY DUE TO FOREIGN KEY CONSTRAINT!!!

		String balanceName = request.getParameter("balanceName");
		double balanceInitialNAV = 0;
		if (request.getParameter("balanceInitialNAV") != null) {
			balanceInitialNAV = Double.parseDouble(request.getParameter("balanceInitialNAV"));
		}
		double balanceCash = 0;
		if (request.getParameter("balanceCash") != null) {
			balanceCash = Double.parseDouble(request.getParameter("balanceCash"));
		}
		double balanceTotalAssets = 0;
		if (request.getParameter("balanceTotalAssets") != null) {
			balanceTotalAssets = Double.parseDouble(request.getParameter("balanceTotalAssets"));
		}
		double balanceNAV = 0;
		if (request.getParameter("balanceNAV") != null) {
			balanceNAV = Double.parseDouble(request.getParameter("balanceNAV"));
		}
		double balanceMarginRate = 0;
		if (request.getParameter("balanceMarginRate") != null) {
			balanceMarginRate = Double.parseDouble(request.getParameter("balanceMarginRate"));
		}
		int balanceState = 1;
		if (request.getParameter("balanceState") != null) {
			balanceState = Integer.parseInt(request.getParameter("balanceState"));
		}
		Timestamp balanceCreatedDate;
		java.util.Date date = new java.util.Date();
		balanceCreatedDate = new Timestamp(date.getTime());
		String balanceCreatedDateParam = request.getParameter("balanceCreatedDate").replaceAll("/", "-");
		if (balanceCreatedDateParam != null) {
			String oldFormat = "dd-MM-yyyy HH:mm:ss";
			String newFormat = "yyyy-MM-dd HH:mm:ss";
			SimpleDateFormat sdf1 = new SimpleDateFormat(oldFormat);
			SimpleDateFormat sdf2 = new SimpleDateFormat(newFormat);
			try {
				Timestamp timestamp = Timestamp.valueOf(sdf2.format(sdf1.parse(balanceCreatedDateParam)));
				balanceCreatedDate = timestamp;
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		int balanceId = 0;
		if (request.getParameter("balanceId") != null && !request.getParameter("balanceId").equals("0")) {
			// UPDATING
			balanceId = Integer.parseInt(request.getParameter("balanceId"));
		} else {
			balanceCash = balanceInitialNAV;
			balanceTotalAssets = balanceInitialNAV;
			balanceNAV = balanceInitialNAV;
			balanceState = 1;
			balanceMarginRate = 0;
		}

		Balance b = new Balance();
		b.setBalanceId(balanceId);
		b.setUserId(userId);
		b.setBalanceName(balanceName);
		b.setBalanceCreatedDate(balanceCreatedDate);
		b.setBalanceInitialNAV(balanceInitialNAV);
		b.setBalanceCash(balanceCash);
		b.setBalanceAvailableCash(balanceCash);
		b.setBalanceTotalAssets(balanceTotalAssets);
		b.setBalanceNAV(balanceNAV);
		b.setBalanceMarginRate(balanceMarginRate);
		b.setBalanceState(balanceState);

		if (balanceId == 0) {
			// new balance, add it
			this.balanceService.addBalance(b);
		} else {
			// existing balance, call update
			this.balanceService.updateBalance(b);
		}
		return "redirect:/core/balance";
	}

	@RequestMapping("/core/removeBalance/{balanceId}")
	public String removeBalance(@PathVariable("balanceId") int id) {

		this.balanceService.removeBalance(id);
		return "redirect:/core/balance";
	}

	@RequestMapping("/core/editBalance/{balanceId}")
	public String editBalance(@PathVariable("balanceId") int id, Model model) {
		model.addAttribute("balance", this.balanceService.getBalanceById(id));
		model.addAttribute("listBalances", this.balanceService.listBalances());
		model.addAttribute("listUsers", this.userService.listUsers());
		return "/core/coreBalance";
	}
	
	@RequestMapping("user/ajaxGetBalanceInfo")
	public void ajaxGetBalanceInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpServletRequest req = (HttpServletRequest) request;
    	HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession(true);
		
		int balanceId = 0;
		if(req.getParameter("balanceId") != null && Integer.parseInt(req.getParameter("balanceId")) >0){
			balanceId = Integer.parseInt(req.getParameter("balanceId"));
			Balance balance = this.balanceService.getBalanceById(balanceId);
			double cash = balance.getBalanceCash();
			// ADD AVAILABLE CASH
			double availableCash = balance.getBalanceAvailableCash();
			NumberFormat formatter = new DecimalFormat("###");
			String result = formatter.format(cash)+"|"+formatter.format(availableCash);
			response.setContentType("text/plain");
	        response.getWriter().write(result);
		}
	}
	
	public double getBalancePortfolioValue(int balanceId) throws Exception{
		
		List<Portfolio> listPortfolio = this.portfolioService.getPortfolioByBalanceId(balanceId);
		double portfolioValue = 0;
		for (int j = 0; j < listPortfolio.size(); j++) {
			if( listPortfolio.get(j).getSellPrice() <= 0){
				int StockId = listPortfolio.get(j).getStockId();
				Stock s = this.stockService.getStockById(StockId);
				String StockName = s.getStockName();
				String StockExchange = s.getStockExchangeId();
				
				OrdersController oc = new OrdersController();
				PriceBoard pb = oc.getStockPriceByStockname(StockId, StockName, StockExchange);
				double stockCurrentPrice = 0;
				if(pb.getMatchPrice() != 0)
					stockCurrentPrice = pb.getMatchPrice();
				else
					stockCurrentPrice = pb.getPrice();
				
				portfolioValue += listPortfolio.get(j).getQuantity()*stockCurrentPrice*1000;
			} 
		}
		return portfolioValue;
		
	}
	public double getBalanceTotalMarginDebt(int balanceId) throws Exception{
		List<Portfolio> listPortfolio = this.portfolioService.getPortfolioByBalanceId(balanceId);
		double marginDebt = 0;
		for (int j = 0; j < listPortfolio.size(); j++) {
			if( listPortfolio.get(j).getSellPrice() <= 0){
				marginDebt += listPortfolio.get(j).getMarginDebt();
			}
		} 
		return marginDebt;
	}
	
	public void updateBalanceValue(Balance b) throws Exception{
		Balance balance = b;
		double cash = balance.getBalanceCash();
		
		double portfolioValue = this.getBalancePortfolioValue(balance.getBalanceId()) ;
		double debt = this.getBalanceTotalMarginDebt(balance.getBalanceId());
		
		balance.setBalanceTotalAssets(cash + portfolioValue);
		balance.setBalanceNAV(cash + portfolioValue - debt);
		
		double marginRate = ((cash + portfolioValue) - debt)/(cash + portfolioValue);
		
		balance.setBalanceMarginRate(marginRate);
		this.balanceService.updateBalance(balance);
	}

	
	/*AJAX SERVICES*/
	@RequestMapping("ajax/ajaxBalanceInfo/{callback}")
	public void ajaxHomepage(HttpServletRequest request, HttpServletResponse response,@PathVariable("callback") String callback) throws Exception {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession(true);
		res.setHeader("Content-Type", "application/json; charset=utf-8");
		
		String result = "";
		JSONObject obj = new JSONObject();
		
		int userId = 0;
		if (req.getParameter("userId") != null ) userId = Integer.parseInt(req.getParameter("userId").toString());
		
		List<Balance> listBalance = this.balanceService.getBalanceByUserId(userId); 
		
		
		for (int i = 0; i < listBalance.size(); i++) {
			JSONObject balanceObject = new JSONObject();
			balanceObject.put("balanceId", listBalance.get(i).getBalanceId());
			balanceObject.put("balanceName", listBalance.get(i).getBalanceName());
			balanceObject.put("balanceCreatedDate", "'"+listBalance.get(i).getBalanceCreatedDate()+"'");
			balanceObject.put("balanceInitialNAV", listBalance.get(i).getBalanceInitialNAV());
			balanceObject.put("balanceCash",listBalance.get(i).getBalanceCash());
			balanceObject.put("balanceAvailableCash", listBalance.get(i).getBalanceAvailableCash());
			balanceObject.put("balanceTotalAssets", listBalance.get(i).getBalanceTotalAssets());
			balanceObject.put("balanceNAV", listBalance.get(i).getBalanceNAV());
			balanceObject.put("balanceMarginRate", listBalance.get(i).getBalanceMarginRate());
			balanceObject.put("balanceState", listBalance.get(i).getBalanceState());
			obj.put("balance"+i,balanceObject);
		}
		
		
		result =  callback +"("+ obj + ");";
		System.out.println(result);
		response.setContentType("text/javascript");
		response.getWriter().write(result);
	}
	
	
	@RequestMapping("ajax/ajaxAddBalance/{callback}")
	public void ajaxAddBalance(HttpServletRequest request, HttpServletResponse response,@PathVariable("callback") String callback) throws Exception {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession(true);
		res.setHeader("Content-Type", "application/json; charset=utf-8");
		
		String result = "";
		JSONObject obj = new JSONObject();
		
		int userId = 0;
		if (req.getParameter("userId") != null ) userId = Integer.parseInt(req.getParameter("userId").toString());
		
		// ELSE DIE IMMEDIATELY DUE TO FOREIGN KEY CONSTRAINT!!!
		
		String balanceName = req.getParameter("balanceName");
		double balanceInitialNAV = 0;
		if (req.getParameter("balanceInitialNAV") != null) {
			balanceInitialNAV = Double.parseDouble(req.getParameter("balanceInitialNAV"));
		}
		double balanceCash = balanceInitialNAV;
		
		double balanceTotalAssets = balanceCash;
		
		double balanceNAV = balanceCash;
		
		double balanceMarginRate = 0;
		
		int balanceState = 1;
		
		Timestamp balanceCreatedDate;
		java.util.Date date = new java.util.Date();
		balanceCreatedDate = new Timestamp(date.getTime());
		
		
		
		Balance b = new Balance();
		b.setUserId(userId);
		b.setBalanceName(balanceName);
		b.setBalanceCreatedDate(balanceCreatedDate);
		b.setBalanceInitialNAV(balanceInitialNAV);
		b.setBalanceCash(balanceCash);
		b.setBalanceAvailableCash(balanceCash);
		b.setBalanceTotalAssets(balanceTotalAssets);
		b.setBalanceNAV(balanceNAV);
		b.setBalanceMarginRate(balanceMarginRate);
		b.setBalanceState(balanceState);
		
		this.balanceService.addBalance(b);
		
		obj.put("addingState","SUCCESS");
		
		result =  callback +"("+ obj + ");";
		System.out.println(result);
		response.setContentType("text/javascript");
		response.getWriter().write(result);
	}
	
	
	@RequestMapping("ajax/ajaxRemoveBalance/{callback}")
	public void ajaxRemoveBalance(HttpServletRequest request, HttpServletResponse response,@PathVariable("callback") String callback) throws Exception {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession(true);
		res.setHeader("Content-Type", "application/json; charset=utf-8");

		String result = "";
		JSONObject obj = new JSONObject();
		
		int userId = 0;
		if (req.getParameter("userId") != null ) userId = Integer.parseInt(req.getParameter("userId").toString());
		int balanceId = 0;
		if (req.getParameter("balanceId") != null ) balanceId = Integer.parseInt(req.getParameter("balanceId").toString());
		Balance b = balanceService.getBalanceById(balanceId);
		
		int balanceUserId = b.getUserId();
		
		if(balanceUserId != userId ){
			obj.put("removeState","ERROR");
		}
		else{
			b.setBalanceState(0);
			this.balanceService.updateBalance(b);
			obj.put("removeState","SUCCESS");
		}

		
		result =  callback +"("+ obj + ");";
		System.out.println(result);
		response.setContentType("text/javascript");
		response.getWriter().write(result);
	}
	
	
	
}


















