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
import java.util.ArrayList;
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
import com.liberation.lab.model.Portfolio;
import com.liberation.lab.service.PortfolioService;
import com.liberation.lab.service.StockService;
import com.liberation.lab.service.UserService;
import com.liberation.lab.service.BalanceService;


@Controller
public class PortfolioController {

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

	@RequestMapping(value = { "/user/portfolio/{portfolioId}" }, method = RequestMethod.GET)
	public String userListPortfolios(@PathVariable("portfolioId") int id, Model model,HttpServletRequest request,HttpServletResponse response) throws ServletException, Exception {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession(true);
		
		int userId = 0;
		if(session.getAttribute("userId") != null){
			userId = Integer.parseInt(session.getAttribute("userId").toString());
		} 
		
		Balance b = this.balanceService.getBalanceById(id);
		int userId2 = b.getUserId();
		
		if(userId != userId2){
			req.getRequestDispatcher("/403").forward(req, res);
		}
		
		this.updateBalanceValue(b);
		
		List<PriceBoard> listPriceBoard = new ArrayList();
		List<Portfolio> listPortfolio = this.portfolioService.getPortfolioByBalanceId(b.getBalanceId());
		OrdersController t = new OrdersController();
		for (int i = 0; i < listPortfolio.size(); i++) {
			int StockId = listPortfolio.get(i).getStockId();
			Stock thisStock = this.stockService.getStockById(StockId);
			String stockName = thisStock.getStockName();
			String stockExchange = thisStock.getStockExchangeId();
			PriceBoard pb = t.getStockPriceByStockname(StockId, stockName, stockExchange);
			listPriceBoard.add(pb);
			
		}
		
		
		model.addAttribute("balance", b); 
		model.addAttribute("listPortfolios", this.portfolioService.getPortfolioByBalanceId(id));
		model.addAttribute("listStocks", this.stockService.listStock());
		model.addAttribute("listPriceBoard", listPriceBoard);
		return "user/portfolio";
	}

	@RequestMapping(value = { "/user/portfolioHistory/{balanceId}" }, method = RequestMethod.GET)
	public String userPortfolioHistory(@PathVariable("balanceId") int id, Model model,HttpServletRequest request,HttpServletResponse response) throws ServletException, Exception {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession(true);
		
		int userId = 0;
		if(session.getAttribute("userId") != null){
			userId = Integer.parseInt(session.getAttribute("userId").toString());
		} 
		Balance b = this.balanceService.getBalanceById(id);
		if(userId  == 0 || userId != b.getUserId()){
			req.getRequestDispatcher("/403").forward(req, res);
		}
		
		List<Portfolio> listPortfolioReturn = new ArrayList();
		List<Portfolio> listPortfolio = this.portfolioService.getPortfolioHistoryByBalanceId(b.getBalanceId());
		OrdersController t = new OrdersController();
		for (int i = 0; i < listPortfolio.size(); i++) {
			if(listPortfolio.get(i).getSellPrice() > 0){
				listPortfolioReturn.add(listPortfolio.get(i));
			}
		}
		
		
		model.addAttribute("balance", b); 
		model.addAttribute("listPortfolios", listPortfolioReturn);
		model.addAttribute("listStocks", this.stockService.listStock());
		return "user/portfolioHistory";
	}

	@RequestMapping(value = { "/core/portfolio" }, method = RequestMethod.GET)
	public String listPortfolios(Model model) {
		model.addAttribute("portfolio", new Portfolio());
		model.addAttribute("listPortfolios", this.portfolioService.listPortfolios());
		model.addAttribute("listBalances", this.balanceService.listBalances());
		model.addAttribute("listStocks", this.stockService.listStock());
		model.addAttribute("listUsers", this.userService.listUsers());
		return "core/corePortfolio";
	}

	@RequestMapping(value = "/core/addPortfolio", method = RequestMethod.POST)
	public String addPortfolio(Model model, HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int portfolioId = 0;
		if (request.getParameter("portfolioId") != null) {
			portfolioId = Integer.parseInt(request.getParameter("portfolioId"));
		}

		int balanceId = 0;
		if (request.getParameter("balanceId") != null) {
			balanceId = Integer.parseInt(request.getParameter("balanceId"));
		}

		int stockId = 0;
		if (request.getParameter("stockId") != null) {
			stockId = Integer.parseInt(request.getParameter("stockId"));
		}

		double buyPrice = 0;
		if (request.getParameter("buyPrice") != null) {
			buyPrice = Double.parseDouble(request.getParameter("buyPrice"));
		}
		double sellPrice = 0;
		if (request.getParameter("sellPrice") != null) {
			sellPrice = Double.parseDouble(request.getParameter("sellPrice"));
		}
		double quantity = 0;
		if (request.getParameter("quantity") != null) {
			quantity = Double.parseDouble(request.getParameter("quantity"));
		}
		
		Timestamp buyDate;
		java.util.Date date = new java.util.Date();
		buyDate = new Timestamp(date.getTime());
		String buyDateParam = request.getParameter("buyDate").replaceAll("/", "-");
		if (buyDateParam != null) {
			String oldFormat = "dd-MM-yyyy HH:mm:ss";
			String newFormat = "yyyy-MM-dd HH:mm:ss";
			SimpleDateFormat sdf1 = new SimpleDateFormat(oldFormat);
			SimpleDateFormat sdf2 = new SimpleDateFormat(newFormat);
			try {
				Timestamp timestamp = Timestamp.valueOf(sdf2.format(sdf1.parse(buyDateParam)));
				buyDate = timestamp;
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		Timestamp sellDate = null;
		if (sellPrice != 0) {
			java.util.Date date2 = new java.util.Date();
			sellDate = new Timestamp(date2.getTime());
			String sellDateParam = request.getParameter("sellDate").replaceAll("/", "-");
			if (sellDateParam != null) {
				String oldFormat = "dd-MM-yyyy HH:mm:ss";
				String newFormat = "yyyy-MM-dd HH:mm:ss";
				SimpleDateFormat sdf1 = new SimpleDateFormat(oldFormat);
				SimpleDateFormat sdf2 = new SimpleDateFormat(newFormat);
				try {
					Timestamp timestamp = Timestamp.valueOf(sdf2.format(sdf1.parse(sellDateParam)));
					sellDate = timestamp;
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

		Portfolio b = new Portfolio();
		b.setPortfolioId(portfolioId);
		b.setBalanceId(balanceId);
		b.setStockId(stockId);
		b.setBuyDate(buyDate);
		b.setSellDate(sellDate);
		b.setBuyPrice(buyPrice);
		b.setSellPrice(sellPrice);
		b.setQuantity(quantity);
		b.setAvailableQuantity(quantity);

		if (portfolioId == 0) {
			// new portfolio, add it
			this.portfolioService.addPortfolio(b);
		} else {
			// existing portfolio, call update
			this.portfolioService.updatePortfolio(b);
		}
		return "redirect:/core/portfolio";
	}

	@RequestMapping("/core/removePortfolio/{portfolioId}")
	public String removePortfolio(@PathVariable("portfolioId") int id) {

		this.portfolioService.removePortfolio(id);
		return "redirect:/core/portfolio";
	}

	@RequestMapping("/core/editPortfolio/{portfolioId}")
	public String editPortfolio(@PathVariable("portfolioId") int id, Model model) {
		model.addAttribute("portfolio", this.portfolioService.getPortfolioById(id));
		model.addAttribute("listPortfolios", this.portfolioService.listPortfolios());
		model.addAttribute("listBalances", this.balanceService.listBalances());
		model.addAttribute("listStocks", this.stockService.listStock());
		model.addAttribute("listUsers", this.userService.listUsers());
		return "/core/corePortfolio";
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
		balance.setBalanceTotalAssets(cash + this.getBalancePortfolioValue(balance.getBalanceId()));
		balance.setBalanceNAV(cash + this.getBalancePortfolioValue(balance.getBalanceId()) 
			- this.getBalanceTotalMarginDebt(balance.getBalanceId()));
		this.balanceService.updateBalance(balance);
	}
	
	// AJAX SERVICES
	
	@RequestMapping(value = { "ajax/ajaxPortfolioInfo/{callback}" }, method = RequestMethod.GET)
	public void ajaxPortfolio(HttpServletRequest request, HttpServletResponse response,@PathVariable("callback") String callback) throws ServletException, Exception {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession(true);
		res.setHeader("Content-Type", "application/json; charset=utf-8");

		String result = "";
		JSONObject obj = new JSONObject();
		int balanceId =0;
		
		if (req.getParameter("balanceId") != null ) balanceId = Integer.parseInt(req.getParameter("balanceId").toString()); 
		Balance b = this.balanceService.getBalanceById(balanceId);
		this.updateBalanceValue(b);
		
		List<Portfolio> listPortfolio = this.portfolioService.getPortfolioByBalanceId(b.getBalanceId());
		
		OrdersController t = new OrdersController();
		
		for (int i = 0; i < listPortfolio.size(); i++) {
			int StockId = listPortfolio.get(i).getStockId();
			Stock thisStock = this.stockService.getStockById(StockId);
			String stockName = thisStock.getStockName();
			String stockExchange = thisStock.getStockExchangeId();
			double marginRate = thisStock.getStockMarginRate();
			PriceBoard pb = t.getStockPriceByStockname(StockId, stockName, stockExchange);
			double priceNow = pb.getMatchPrice();
			if(priceNow == 0) priceNow = pb.getPrice();
			
			JSONObject portfolioObject = new JSONObject();
			portfolioObject.put("stockId", listPortfolio.get(i).getStockId());
			portfolioObject.put("stockName", stockName);
			portfolioObject.put("buyDate", "'"+listPortfolio.get(i).getBuyDate() + "'");
			portfolioObject.put("buyPrice", listPortfolio.get(i).getBuyPrice());
			portfolioObject.put("quantity", listPortfolio.get(i).getQuantity());
			portfolioObject.put("marginRate", marginRate);
			portfolioObject.put("currentPrice", priceNow);
			portfolioObject.put("availableQuantity", listPortfolio.get(i).getAvailableQuantity());
			portfolioObject.put("marginDebt", listPortfolio.get(i).getMarginDebt());
			obj.put("portfolio"+i,portfolioObject);
		}
		
		result =  callback +"("+ obj + ");";
		System.out.println(result);
		response.setContentType("text/javascript");
		response.getWriter().write(result);
	}
	
	
}
