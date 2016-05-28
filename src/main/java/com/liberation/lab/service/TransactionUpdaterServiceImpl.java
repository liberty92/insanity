package com.liberation.lab.service;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.sql.Timestamp;
import java.util.List;

import org.apache.commons.math3.util.Precision;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.transaction.annotation.Transactional;

import com.liberation.lab.controller.BalanceController;
import com.liberation.lab.controller.OrdersController;
import com.liberation.lab.dao.TransactionUpdaterDAO;
import com.liberation.lab.model.Balance;
import com.liberation.lab.model.Orders;
import com.liberation.lab.model.Portfolio;
import com.liberation.lab.model.PriceBoard;
import com.liberation.lab.model.Stock;
import com.liberation.lab.model.TradingFee;
import com.liberation.lab.model.TransactionResult;
import com.liberation.lab.model.TransactionUpdater;

public class TransactionUpdaterServiceImpl implements TransactionUpdaterService {

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

	private BalanceService balanceService;

	@Autowired(required = true)
	@Qualifier(value = "balanceService")
	public void setBalanceService(BalanceService us) {
		this.balanceService = us;
	}

	private TransactionUpdaterDAO balanceDAO;

	public void setTransactionUpdaterDAO(TransactionUpdaterDAO balanceDAO) {
		this.balanceDAO = balanceDAO;
	}

	@Override
	@Transactional
	public void addTransactionUpdater(TransactionUpdater u) {
		this.balanceDAO.addTransactionUpdater(u);
	}

	@Override
	@Transactional
	public void updateTransactionUpdater(TransactionUpdater u) {
		this.balanceDAO.updateTransactionUpdater(u);
	}

	@Override
	@Transactional
	public List<TransactionUpdater> listTransactionUpdaters() {
		return this.balanceDAO.listTransactionUpdaters();
	}

	@Override
	@Transactional
	public TransactionUpdater getTransactionUpdaterById(int id) {
		return this.balanceDAO.getTransactionUpdaterById(id);
	}

	@Override
	@Transactional
	public void removeTransactionUpdater(int id) {
		this.balanceDAO.removeTransactionUpdater(id);
	}

	@Override
	@Transactional
	public void executeTransaction(Orders o) {

		boolean checkingTransaction;
		try {
			checkingTransaction = this.transactionResult(o);

			if (checkingTransaction == true) {
				this.updateBalanceAndPortfolioAfterTransaction(o);
				System.out.println("TRANSACTION HAS BEEN COMPLETED !");
			}
			else
				System.out.println("TRANSACTION HAS BEEN COMPLETED");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public boolean transactionResult(Orders o) throws Exception {

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

/*		if (action.equals("BUY") && orderType.equals("MP")) {
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
		}*/
		
		if (action.equals("BUY")){
			getResult = this.buyLO(order, currentStockPrice);
		}
		if (action.equals("SELL")){
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
					// balance.setBalanceCash(balance.getBalanceCash() +
					// o.getPrice() * o.getQuantity()*1000);
					balance.setBalanceAvailableCash(
							balance.getBalanceAvailableCash() + o.getPrice() * o.getQuantity() * 1000 * o.getMargin());
					// MARGIN INCLUDED
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
					// balance.setBalanceCash(balance.getBalanceCash() +
					// o.getPrice() * result.getMatchQuantity()*1000);
					balance.setBalanceAvailableCash(
							balance.getBalanceAvailableCash() + o.getPrice() * result.getMatchQuantity() * 1000 * o.getMargin());
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
		
		// FOR MP:
		if(order.getOrderType().equals("MP")){
			double ceilPrice = pb.getCeil();
			order.setPrice(ceilPrice);
		}

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
		
		// FOR MP:
		if(order.getOrderType().equals("MP")){
			double floorPrice = pb.getFloor();
			order.setPrice(floorPrice);
		}

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

	public void updateBalanceAndPortfolioAfterTransaction(Orders o) throws Exception {
		Orders order = o;
		Balance balance = this.balanceService.getBalanceById(order.getBalanceId());

		if (order.getAction().equals("BUY")) {
			double buyCash = order.getPrice() * order.getQuantity() * 1000;

			double buyCashToPayNow = buyCash * order.getMargin();
			double marginDebt = Precision.round(buyCash - buyCashToPayNow, 0);

			// TRADING FEE
			double tradingFeeRate = this.tradingFee(buyCash);
			double tradingFee = buyCash * tradingFeeRate;

			order.setOrderTradingFee(tradingFee);
			this.ordersService.updateOrders(order);

			double realPayment = buyCash + tradingFee;
			double realPaymentNow = buyCashToPayNow + tradingFee;

			// SET REAL CASH AND AVAILABLE CASH & TAX AND FEE PAYMENT
			balance.setBalanceCash(balance.getBalanceCash() - realPaymentNow);
			balance.setBalanceAvailableCash(balance.getBalanceAvailableCash() - realPaymentNow);
			/*
			 * balance.setBalanceTotalAssets(balance.getBalanceTotalAssets() -
			 * tradingFee); balance.setBalanceNAV(balance.getBalanceNAV() -
			 * tradingFee);
			 */
			/*this.balanceService.updateBalance(balance);*/

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
										// .round((oldPrice * oldQuantity +
										// order.getPrice() *
										// order.getQuantity())
										.round((oldPrice * oldQuantity + (realPayment / 1000))
												/ (oldQuantity + order.getQuantity()), 3));
						havingPortfolio.get(i).setQuantity(oldQuantity + order.getQuantity());
						havingPortfolio.get(i).setAvailableQuantity(
								havingPortfolio.get(i).getAvailableQuantity() + order.getQuantity());

						havingPortfolio.get(i).setMarginDebt(havingPortfolio.get(i).getMarginDebt() + marginDebt);

						this.portfolioService.updatePortfolio(havingPortfolio.get(i));
						break;
					}
				}
			}

			if (checkStockExisting == false) {
				Portfolio portfolio = new Portfolio();
				portfolio.setBalanceId(balance.getBalanceId());
				portfolio.setStockId(order.getStockId());
				portfolio.setBuyPrice(Precision.round(((realPayment / 1000) / order.getQuantity()), 3));
				portfolio.setQuantity(order.getQuantity());
				portfolio.setAvailableQuantity(order.getQuantity());
				portfolio.setMarginDebt(marginDebt);

				Timestamp createdTime;
				java.util.Date date = new java.util.Date();
				createdTime = new Timestamp(date.getTime());
				portfolio.setBuyDate(createdTime);

				this.portfolioService.addPortfolio(portfolio);
			}
			
			this.balanceService.updateBalance(balance);

		}

		if (order.getAction().equals("SELL")) {
			double sellCash = order.getPrice() * order.getQuantity() * 1000;

			// TRADING FEE
			double tradingFeeRate = this.tradingFee(sellCash);
			double tradingFee = sellCash * tradingFeeRate;

			double taxRate = this.sellingTaxFee();
			double taxFee = sellCash * taxRate;

			double realPayment = sellCash - tradingFee - taxFee;
			double totalQuantityInPortfolio = 0;
			double marginDebt = 0;

			order.setOrderTradingFee(tradingFee);
			order.setOrderSellTax(taxFee);
			this.ordersService.updateOrders(order);

/*			double soldAndTotalRate = order.getQuantity()/totalQuantityInPortfolio;
			double marginToPayNow = soldAndTotalRate*marginDebt;
			double marginFeeRate = this.marginFee();
			double marginFee = marginFeeRate*marginToPayNow;
*/			
			double marginFeeRate = this.marginFee();
			double soldAndTotalRate = 0;
			double marginToPayNow = 0;
			double marginFee = 0;
			
			List<Portfolio> havingPortfolio = this.portfolioService.getPortfolioByBalanceId(balance.getBalanceId());
			for (int i = 0; i < havingPortfolio.size(); i++) {
				if (havingPortfolio.get(i).getStockId() == order.getStockId()) {
					if (havingPortfolio.get(i).getSellPrice() <= 0) {
						// THERE'S ONLY 1 RECORD LIKE THIS
						System.out.println("DETECTED PORTFOLIO !");

						Timestamp createdTime;
						java.util.Date date = new java.util.Date();
						createdTime = new Timestamp(date.getTime());
						
						totalQuantityInPortfolio = havingPortfolio.get(i).getQuantity();
						soldAndTotalRate = order.getQuantity()/totalQuantityInPortfolio;
						marginDebt = havingPortfolio.get(i).getMarginDebt();
						marginToPayNow = soldAndTotalRate*marginDebt;
						
						
						// MARGIN FEE SHOULD BASED ON LENGTH OF LOAN TIME
						Timestamp startDate = havingPortfolio.get(i).getBuyDate();
						long sd = startDate.getTime();
						long nd = createdTime.getTime();
						float marginTime = Precision.round(((nd-sd)/(86400*1000)),0);
						if(marginTime <= 0) marginTime =1;
						
						marginFee = marginFeeRate*marginToPayNow*marginTime;
						System.out.println(marginTime + " days");
						System.out.println(marginFee);

						// CASE 1: SELL ALL:
						if (havingPortfolio.get(i).getQuantity() == order.getQuantity()) {
							// havingPortfolio.get(i).setSellPrice(Precision.round(order.getPrice(),
							// 3));
							havingPortfolio.get(i)
									.setSellPrice(Precision.round(((realPayment / 1000) / order.getQuantity()), 3));
							havingPortfolio.get(i).setMarginDebt(marginToPayNow);
							havingPortfolio.get(i).setSellDate(createdTime);
							havingPortfolio.get(i).setAvailableQuantity(
									havingPortfolio.get(i).getAvailableQuantity() - order.getQuantity());
							this.portfolioService.updatePortfolio(havingPortfolio.get(i));
							break;
						}
						// PARTIAL SELL
						else {
							Portfolio remain = new Portfolio();
							remain.setBalanceId(havingPortfolio.get(i).getBalanceId());
							remain.setStockId(havingPortfolio.get(i).getStockId());
							remain.setBuyPrice(Precision.round(havingPortfolio.get(i).getBuyPrice(), 3));
							remain.setMarginDebt(marginDebt-marginToPayNow);
							remain.setBuyDate(havingPortfolio.get(i).getBuyDate());
							remain.setQuantity(havingPortfolio.get(i).getQuantity() - order.getQuantity());
							remain.setAvailableQuantity(
									havingPortfolio.get(i).getAvailableQuantity() - order.getQuantity());
							this.portfolioService.addPortfolio(remain);

							havingPortfolio.get(i).setMarginDebt(marginToPayNow);
							havingPortfolio.get(i).setQuantity(order.getQuantity());
							havingPortfolio.get(i).setAvailableQuantity(
									havingPortfolio.get(i).getAvailableQuantity() - order.getQuantity());
							// havingPortfolio.get(i).setSellPrice(Precision.round(order.getPrice(),
							// 3));
							havingPortfolio.get(i)
									.setSellPrice(Precision.round(((realPayment / 1000) / order.getQuantity()), 3));
							havingPortfolio.get(i).setSellDate(createdTime);

							this.portfolioService.updatePortfolio(havingPortfolio.get(i));
							break;
						}
						
						
						
					}

				}
			}


			// UPDATE BALANCE VALUE - NO MARGIN YET -- TRYING MARGIN
			balance.setBalanceCash(balance.getBalanceCash() + realPayment - marginToPayNow - marginFee);
			balance.setBalanceAvailableCash(balance.getBalanceAvailableCash() + realPayment - marginToPayNow - marginFee);

			double balancePortfolioValue = this.getBalancePortfolioValue(balance.getBalanceId());
			double marginDebtTotal = this.getBalanceTotalMarginDebt(balance.getBalanceId());

			balance.setBalanceTotalAssets(balance.getBalanceCash() + balancePortfolioValue);
			balance.setBalanceNAV(balance.getBalanceCash() + balancePortfolioValue - marginDebtTotal);

			this.balanceService.updateBalance(balance);

		}
	}

	public double tradingFee(double tv) {
		double tradingValue = tv;
		List<TradingFee> listTradingFee = this.tradingFeeService.listTradingFees();
		for (int i = 1; i < listTradingFee.size(); i++) {
			if (tradingValue > listTradingFee.get(i).getFromValue()
					&& tradingValue <= listTradingFee.get(i).getThroughValue()) {
				return listTradingFee.get(i).getValue() / 100;
			}
		}
		return listTradingFee.get(listTradingFee.size()).getValue() / 100;
	}

	public double sellingTaxFee() {
		TradingFee firstSettingItem = this.tradingFeeService.getTradingFeeById(1);
		return firstSettingItem.getValue() / 100;
	}

	public double marginFee() {
		TradingFee secondSettingItem = this.tradingFeeService.getTradingFeeById(2);
		return secondSettingItem.getValue() /365/100;
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
		this.balanceService.updateBalance(balance);
	}

}
