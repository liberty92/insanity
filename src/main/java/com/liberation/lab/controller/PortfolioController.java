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

}
