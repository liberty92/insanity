package com.liberation.lab.model;

public class TransactionResult {
	private boolean result;
	private double matchedPrice;
	private double matchQuantity;
	
	public boolean isResult() {
		return result;
	}
	public void setResult(boolean result) {
		this.result = result;
	}
	public double getMatchedPrice() {
		return matchedPrice;
	}
	public void setMatchedPrice(double matchedPrice) {
		this.matchedPrice = matchedPrice;
	}
	public double getMatchQuantity() {
		return matchQuantity;
	}
	public void setMatchQuantity(double matchQuantity) {
		this.matchQuantity = matchQuantity;
	}
	
	
}
