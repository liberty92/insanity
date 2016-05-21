package com.liberation.lab.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.Charset;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.liberation.lab.model.Orders;
import com.liberation.lab.model.PriceBoard;
import com.liberation.lab.model.Stock;
import com.liberation.lab.model.TransactionResult;
import com.liberation.lab.service.StockService;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

@Controller
public class Transaction {
	
	private StockService stockService;

	@Autowired(required = true)
	@Qualifier(value = "stockService")
	public void setStockService(StockService us) {
		this.stockService = us;
	}
	
	
	public TransactionResult transaction(Orders o,Stock ss) throws Exception{
		TransactionResult result = new TransactionResult();
		result.setResult(false);

		Orders order = o;
		int stockId = order.getStockId();
		Stock s = ss;
		String stockName = s.getStockName();
		String stockExhange = s.getStockExchangeId();
		String action = order.getAction();
		String orderType = order.getOrderType();
		
		PriceBoard currentStockPrice = this.getStockPriceByStockname(stockId, stockName, stockExhange);
		
		if(action.equals("BUY") && orderType.equals("MP")){
			TransactionResult getResult = this.buyMP(order, currentStockPrice);
			result.setResult(getResult.isResult());
			result.setMatchedPrice(getResult.getMatchedPrice());
			result.setMatchQuantity(getResult.getMatchQuantity());
		}
		if(action.equals("SELL") && orderType.equals("MP")){
			TransactionResult getResult = this.sellMP(order, currentStockPrice);
			result.setResult(getResult.isResult());
			result.setMatchedPrice(getResult.getMatchedPrice());
			result.setMatchQuantity(getResult.getMatchQuantity());
		}
		if(action.equals("BUY") && orderType.equals("LO")){
			TransactionResult getResult = this.buyLO(order, currentStockPrice);
			result.setResult(getResult.isResult());
			result.setMatchedPrice(getResult.getMatchedPrice());
			result.setMatchQuantity(getResult.getMatchQuantity());
		}
		if(action.equals("SELL") && orderType.equals("LO")){
			TransactionResult getResult = this.sellLO(order, currentStockPrice);
			result.setResult(getResult.isResult());
			result.setMatchedPrice(getResult.getMatchedPrice());
			result.setMatchQuantity(getResult.getMatchQuantity());
		}
		
		return result;
	}
	
	public TransactionResult buyMP(Orders o, PriceBoard pb){
		TransactionResult result = new TransactionResult();
		result.setResult(false);
		Orders order = o;
		PriceBoard currentStockPrice =pb;
		
		if(currentStockPrice.getSell1() == 0){
			// NOBODY BUY - NOTHING MATCHED
			return result;
		}
		
		if(order.getQuantity() <= currentStockPrice.getSell1Quantity()){
			// MATCHED ALL IN PRICE 1- JUST RETURN
			result.setResult(true);
			result.setMatchedPrice(currentStockPrice.getSell1());
			result.setMatchQuantity(order.getQuantity());
			return result;
		}
		else{
			// COULDN'T MATCH ALL WITH SELL PRICE 1
			double remain1 = (order.getQuantity()- currentStockPrice.getSell1Quantity());
			if(remain1 <= currentStockPrice.getSell2Quantity()){
				// MATCH ALL THE REMAINED IN SELL PRICE 2
				result.setResult(true);
				result.setMatchedPrice((currentStockPrice.getSell2()*remain1 + currentStockPrice.getSell1()*currentStockPrice.getSell1Quantity())/(order.getQuantity()));
				result.setMatchQuantity(order.getQuantity());
				return result;
			}
			else{
				// COULDN'T MATCH ALL WITH SELL PRICE 2
				double remain2 = (order.getQuantity()- currentStockPrice.getSell1Quantity() - currentStockPrice.getSell2Quantity());
				if(remain2 <= currentStockPrice.getSell3Quantity() ){
					// MATCH ALL THE REMAINED IN SELL PRICE 3
					result.setResult(true);
					result.setMatchedPrice((currentStockPrice.getSell3()*remain2 + currentStockPrice.getSell2()*remain1 + currentStockPrice.getSell1()*currentStockPrice.getSell1Quantity())/(order.getQuantity()));
					result.setMatchQuantity(order.getQuantity());
					return result;
				}
				else{
					// COULDN'T MATCH ALL WITH SELL PRICE 3
					double totalMatch = currentStockPrice.getSell1() + currentStockPrice.getSell2() + currentStockPrice.getSell3();
					result.setResult(true);
					result.setMatchedPrice((currentStockPrice.getSell3()*remain2 + currentStockPrice.getSell2()*remain1 + currentStockPrice.getSell1()*currentStockPrice.getSell1Quantity())/(totalMatch));
					result.setMatchQuantity(totalMatch);
					return result; 
				}
			}
		}
	}
	
	public TransactionResult buyLO(Orders o, PriceBoard pb){
		TransactionResult result = new TransactionResult();
		result.setResult(false);
		Orders order = o;
		PriceBoard currentStockPrice = pb;
		
		if(currentStockPrice.getSell1() == 0){
			// NOBODY SELL, VERYSIMPLE
			return result;
		}
		
		if(order.getPrice() >= currentStockPrice.getSell1()){
			// SOMETHING MATCHED - REACHED SELL1
			if(order.getQuantity() <= currentStockPrice.getSell1Quantity()){
				// ALL MATCHED
				result.setResult(true);
				result.setMatchedPrice(currentStockPrice.getSell1());
				result.setMatchQuantity(order.getQuantity());
				return result;
			}
			else{
				// 2 CASES: SELL 1 PARTIAL MATCHED ONLY    OR    SELL 1 AND OTHER
				double remain1 = (order.getQuantity()- currentStockPrice.getSell1Quantity());
				if(order.getPrice() >= currentStockPrice.getSell2() && currentStockPrice.getSell2Quantity()>0){
					// MATCH IN PRICE 1 AND 2 FOR SURE
					if(remain1 <= currentStockPrice.getSell2Quantity()){
						// MATCHED ALL IN PRICE 1 AND 2
						result.setResult(true);
						result.setMatchedPrice((currentStockPrice.getSell1()*currentStockPrice.getSell1Quantity() +currentStockPrice.getSell2()*remain1 )/ order.getQuantity() );
						result.setMatchQuantity(order.getQuantity());
						return result;
					}
					else{
						// 2 CASES: SELL 1 AND 2 PARTIAL MATCHED ONLY    OR    ALSO REACHED SELL 3
						double remain2 = (order.getQuantity()- currentStockPrice.getSell1Quantity()- currentStockPrice.getSell2Quantity()  );
						if(order.getPrice() >= currentStockPrice.getSell3() && currentStockPrice.getSell3Quantity()>0){
							// MATCHED IN ALL 3 PRICES
							if(remain2 <= currentStockPrice.getSell3Quantity()){
								// MATCHED ALL IN 3 PRICES
								result.setResult(true);
								result.setMatchedPrice((currentStockPrice.getSell1()*currentStockPrice.getSell1Quantity() +currentStockPrice.getSell2()*currentStockPrice.getSell2Quantity() +currentStockPrice.getSell3()*remain2)/ order.getQuantity() );
								result.setMatchQuantity(order.getQuantity());
								return result;
							}
							else{
								//MATCHED PARITAL IN 3 PRICES
								result.setResult(true);
								double totalMatch = currentStockPrice.getSell1Quantity() + currentStockPrice.getSell2Quantity() + currentStockPrice.getSell3Quantity();
								result.setMatchedPrice((currentStockPrice.getSell1()*currentStockPrice.getSell1Quantity() +currentStockPrice.getSell2()*currentStockPrice.getSell2Quantity() +currentStockPrice.getSell3()*currentStockPrice.getSell3Quantity())/totalMatch );
								result.setMatchQuantity(totalMatch);
								return result;
							}
						}
						else{
							// MATCHED PARTIAL IN SELL 1 AND 2 ONLY
							result.setResult(true);
							result.setMatchedPrice((currentStockPrice.getSell1()*currentStockPrice.getSell1Quantity() +currentStockPrice.getSell2()*currentStockPrice.getSell2Quantity() )/ (currentStockPrice.getSell1Quantity() + currentStockPrice.getSell2Quantity()) );
							result.setMatchQuantity(currentStockPrice.getSell1Quantity() + currentStockPrice.getSell2Quantity());
							return result;
						}
					}
				}
				else{
					// SELL 1 PARTIAL MATCHED ONLY 
					result.setResult(true);
					result.setMatchedPrice(currentStockPrice.getSell1());
					result.setMatchQuantity(currentStockPrice.getSell1Quantity());
					return result;
				}
			}
		}
		else{
			// NOTHING MATCHED - COUNDN'T REACHED SELL 1
			return result;
		}
	}
	
	public TransactionResult sellMP(Orders o, PriceBoard pb){
		TransactionResult result = new TransactionResult();
		result.setResult(false);
		Orders order = o;
		PriceBoard currentStockPrice =pb;
		
		if(currentStockPrice.getBuy1() == 0){
			// NOBODY BUY - NOTHING MATCHED
			return result;
		}
		
		if(order.getQuantity() <= currentStockPrice.getBuy1Quantity()){
			// MATCHED ALL IN PRICE 1- JUST RETURN
			result.setResult(true);
			result.setMatchedPrice(currentStockPrice.getBuy1());
			result.setMatchQuantity(order.getQuantity());
			return result;
		}
		else{
			// COULDN'T MATCH ALL WITH BUY PRICE 1
			double remain1 = (order.getQuantity()- currentStockPrice.getBuy1Quantity());
			if(remain1 <= currentStockPrice.getBuy2Quantity()){
				// MATCH ALL THE REMAINED IN BUY PRICE 2
				result.setResult(true);
				result.setMatchedPrice((currentStockPrice.getBuy2()*remain1 + currentStockPrice.getBuy1()*currentStockPrice.getBuy1Quantity())/(order.getQuantity()));
				result.setMatchQuantity(order.getQuantity());
				return result;
			}
			else{
				// COULDN'T MATCH ALL WITH BUY PRICE 2
				double remain2 = (order.getQuantity()- currentStockPrice.getBuy1Quantity() - currentStockPrice.getBuy2Quantity());
				if(remain2 <= currentStockPrice.getBuy3Quantity() ){
					// MATCH ALL THE REMAINED IN BUY PRICE 3
					result.setResult(true);
					result.setMatchedPrice((currentStockPrice.getBuy3()*remain2 + currentStockPrice.getBuy2()*remain1 + currentStockPrice.getBuy1()*currentStockPrice.getBuy1Quantity())/(order.getQuantity()));
					result.setMatchQuantity(order.getQuantity());
					return result;
				}
				else{
					// COULDN'T MATCH ALL WITH BUY PRICE 3
					double totalMatch = currentStockPrice.getBuy1() + currentStockPrice.getBuy2() + currentStockPrice.getBuy3();
					result.setResult(true);
					result.setMatchedPrice((currentStockPrice.getBuy3()*remain2 + currentStockPrice.getBuy2()*remain1 + currentStockPrice.getBuy1()*currentStockPrice.getBuy1Quantity())/(totalMatch));
					result.setMatchQuantity(totalMatch);
					return result; 
				}
			}
		}
	}
	
	public TransactionResult sellLO(Orders o, PriceBoard pb){
		TransactionResult result = new TransactionResult();
		result.setResult(false);
		Orders order = o;
		PriceBoard currentStockPrice =pb;
		
		if(currentStockPrice.getBuy1() == 0){
			// NOBODY BUY, VERYSIMPLE
			return result;
		}
		
		if(order.getPrice() <= currentStockPrice.getBuy1()){
			// SOMETHING MATCHED - REACHED BUY1
			if(order.getQuantity() <= currentStockPrice.getBuy1Quantity()){
				// ALL MATCHED
				result.setResult(true);
				result.setMatchedPrice(currentStockPrice.getBuy1());
				result.setMatchQuantity(order.getQuantity());
				return result;
			}
			else{
				// 2 CASES: BUY 1 PARTIAL MATCHED ONLY    OR    BUY 1 AND OTHER
				double remain1 = (order.getQuantity()- currentStockPrice.getBuy1Quantity());
				if(order.getPrice() <= currentStockPrice.getBuy2() && currentStockPrice.getBuy2Quantity()>0){
					// MATCH IN PRICE 1 AND 2 FOR SURE
					if(remain1 <= currentStockPrice.getBuy2Quantity()){
						// MATCHED ALL IN PRICE 1 AND 2
						result.setResult(true);
						result.setMatchedPrice((currentStockPrice.getBuy1()*currentStockPrice.getBuy1Quantity() +currentStockPrice.getBuy2()*remain1 )/ order.getQuantity() );
						result.setMatchQuantity(order.getQuantity());
						return result;
					}
					else{
						// 2 CASES: BUY 1 AND 2 PARTIAL MATCHED ONLY    OR    ALSO REACHED BUY 3
						double remain2 = (order.getQuantity()- currentStockPrice.getBuy1Quantity()- currentStockPrice.getBuy2Quantity()  );
						if(order.getPrice() <= currentStockPrice.getBuy3() && currentStockPrice.getBuy3Quantity()>0){
							// MATCHED IN ALL 3 PRICES
							if(remain2 <= currentStockPrice.getBuy3Quantity()){
								// MATCHED ALL IN 3 PRICES
								result.setResult(true);
								result.setMatchedPrice((currentStockPrice.getBuy1()*currentStockPrice.getBuy1Quantity() +currentStockPrice.getBuy2()*currentStockPrice.getBuy2Quantity() +currentStockPrice.getBuy3()*remain2)/ order.getQuantity() );
								result.setMatchQuantity(order.getQuantity());
								return result;
							}
							else{
								//MATCHED PARITAL IN 3 PRICES
								double totalMatch = currentStockPrice.getBuy1Quantity() + currentStockPrice.getBuy2Quantity() + currentStockPrice.getBuy3Quantity();
								result.setResult(true);
								result.setMatchedPrice((currentStockPrice.getBuy1()*currentStockPrice.getBuy1Quantity() +currentStockPrice.getBuy2()*currentStockPrice.getBuy2Quantity() +currentStockPrice.getBuy3()*currentStockPrice.getBuy3Quantity())/totalMatch );
								result.setMatchQuantity(totalMatch);
								return result;
							}
						}
						else{
							// MATCHED PARTIAL IN BUY 1 AND 2 ONLY
							result.setResult(true);
							result.setMatchedPrice((currentStockPrice.getBuy1()*currentStockPrice.getBuy1Quantity() +currentStockPrice.getBuy2()*currentStockPrice.getBuy2Quantity() )/ (currentStockPrice.getBuy1Quantity() + currentStockPrice.getBuy2Quantity()) );
							result.setMatchQuantity(currentStockPrice.getBuy1Quantity() + currentStockPrice.getBuy2Quantity());
							return result;
						}
					}
				}
				else{
					// BUY 1 PARTIAL MATCHED ONLY 
					result.setResult(true);
					result.setMatchedPrice(currentStockPrice.getBuy1());
					result.setMatchQuantity(currentStockPrice.getBuy1Quantity());
					return result;
				}
			}
		}
		else{
			// NOTHING MATCHED - COUNDN'T REACHED BUY 1
			return result;
		}
	}

//	@RequestMapping(value = { "/price" }, method = RequestMethod.GET)
	public PriceBoard getStockPriceByStockname(int StockId, String StockName,
			String StockExchange) throws Exception, Exception {
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
			URL dataURL = new URL(urlHSX); // URL to Parse
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
//					System.out.println("Stock name : " + name);

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
		} catch (ParseException e) {
			e.printStackTrace();
		}

		return currentPriceInfo;
	}
	

	public String test(Model model, HttpServletRequest request) throws Exception, Exception {
		String url = "http://202.160.124.68/priceservice/secinfo/snapshot/q=floorCode:10";
		String roughContent = "";
		String stockName = "FLC";

		if (request.getParameter("s") != null) {
			stockName = request.getParameter("s");
		}

		InputStream in = new URL(url).openStream();
		try {
			// System.out.println( IOUtils.toString( in ) );
			roughContent = IOUtils.toString(in, "UTF-8");

			int count = 0;
			int index = roughContent.indexOf("|", roughContent.indexOf(stockName));
			while (index >= 0 && count < 40) {
				count++;
				// System.out.println(index);
				index = roughContent.indexOf("|", index + 1);
			}
			String priceContent = roughContent.substring(roughContent.indexOf(stockName), index);
			System.out.println(priceContent);
			String[] array = priceContent.split("\\|", -1);

			for (int i = 0; i < array.length; i++) {
				System.out.println(i + ": " + array[i]);
			}

		} finally {
			IOUtils.closeQuietly(in);
		}
		model.addAttribute("roughContent", roughContent);
		return "core/coreTransaction";
	}

	public void jsonParse() {
		try {
			URL oracle = new URL("http://carlofontanos.com/api/tutorials.php?data=all"); // URL
																							// to
																							// Parse
			URLConnection yc = oracle.openConnection();
			BufferedReader in = new BufferedReader(new InputStreamReader(yc.getInputStream()));

			JSONParser parser = new JSONParser();

			String inputLine;
			while ((inputLine = in.readLine()) != null) {
				JSONArray a = (JSONArray) parser.parse(inputLine);

				// Loop through each item
				for (Object o : a) {
					JSONObject tutorials = (JSONObject) o;

					Long id = (Long) tutorials.get("ID");
					System.out.println("Post ID : " + id);

					String title = (String) tutorials.get("post_title");
					System.out.println("Post Title : " + title);

					System.out.println("\n");
				}
			}
			in.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	public PriceBoard getStockPriceByStockname2(int StockId, String StockName, String StockExchange)
			throws Exception, Exception {
		String urlHSX = "http://202.160.124.68/priceservice/secinfo/snapshot/q=floorCode:10";
		String url = "";
		String roughContent = "";
		int stockId = StockId;
		String stockName = StockName;
		String stockExchange = StockExchange;

		PriceBoard currentPriceInfo = new PriceBoard();

		if (stockExchange.equals("HSX")) {
			url = urlHSX;
		}

		InputStream in = new URL(url).openStream();
		try {
			// System.out.println( IOUtils.toString( in ) );
			roughContent = IOUtils.toString(in, "UTF-8");

			int count = 0;
			int index = roughContent.indexOf("|", roughContent.indexOf(stockName));
			while (index >= 0 && count < 40) {
				count++;
				// System.out.println(index);
				index = roughContent.indexOf("|", index + 1);
			}
			String priceContent = roughContent.substring(roughContent.indexOf(stockName), index);
			System.out.println(priceContent);
			String[] array = priceContent.split("\\|", -1);

			// for (int i = 0; i < array.length; i++) {
			// System.out.println(i+": "+array[i]);
			// }

			currentPriceInfo.setStockId(stockId);

			currentPriceInfo.setPrice(Double.parseDouble(array[5]));
			currentPriceInfo.setCeil(Double.parseDouble(array[12]));
			currentPriceInfo.setFloor(Double.parseDouble(array[13]));

			currentPriceInfo.setBuy1(Double.parseDouble(array[20]));
			currentPriceInfo.setBuy1Quantity(Double.parseDouble(array[21]));
			currentPriceInfo.setBuy2(Double.parseDouble(array[22]));
			currentPriceInfo.setBuy2Quantity(Double.parseDouble(array[23]));
			currentPriceInfo.setBuy3(Double.parseDouble(array[24]));
			currentPriceInfo.setBuy3Quantity(Double.parseDouble(array[25]));

			currentPriceInfo.setSell1(Double.parseDouble(array[26]));
			currentPriceInfo.setSell1Quantity(Double.parseDouble(array[27]));
			currentPriceInfo.setSell2(Double.parseDouble(array[28]));
			currentPriceInfo.setSell2Quantity(Double.parseDouble(array[29]));
			currentPriceInfo.setSell3(Double.parseDouble(array[30]));
			currentPriceInfo.setSell3Quantity(Double.parseDouble(array[31]));

			currentPriceInfo.setMatchPrice(Double.parseDouble(array[10]));
			currentPriceInfo.setMatchQuantity(Double.parseDouble(array[11]));

			currentPriceInfo.setHighest(Double.parseDouble(array[12]));
			currentPriceInfo.setLowest(Double.parseDouble(array[12]));

		} finally {
			IOUtils.closeQuietly(in);
		}
		return currentPriceInfo;
	}
}
