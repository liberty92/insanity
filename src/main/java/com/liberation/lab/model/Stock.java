package com.liberation.lab.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="stock")
public class Stock {
	
	@Id
    @Column(name="stockId")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int stockId;
    
    @Column(name = "stockName")
	private String stockName;
	
    @Column(name = "companyId")
	private int companyId;
	
    @Column(name = "stockExchangeId")
	private String stockExchangeId;
	
    @Column(name = "stockQuantity")
	private double stockQuantity;
	
    @Column(name = "stockCapitalization")
	private double stockCapitalization;
	
    @Column(name = "stockPE")
	private double stockPE;
	
    @Column(name = "stockPP")
	private double stockPP;
	
    @Column(name = "stockEPS")
	private double stockEPS;
	
    @Column(name = "stockROE")
	private double stockROE;
	
    @Column(name = "stockROA")
	private double stockROA;
	
    @Column(name = "stockBeta")
	private double stockBeta;
	
    @Column(name = "stockMarginRate")
	private double stockMarginRate;
	
    @Column(name = "stockPrice")
	private double stockPrice;
	
    @Column(name = "stockState")
	private int stockState;
	

    
    public int getStockId() {
		return stockId;
	}

	public void setStockId(int stockId) {
		this.stockId = stockId;
	}

	public String getStockName() {
		return stockName;
	}

	public void setStockName(String stockName) {
		this.stockName = stockName;
	}

	public int getCompanyId() {
		return companyId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public String getStockExchangeId() {
		return stockExchangeId;
	}

	public void setStockExchangeId(String stockExchangeId) {
		this.stockExchangeId = stockExchangeId;
	}

	public double getStockQuantity() {
		return stockQuantity;
	}

	public void setStockQuantity(double stockQuantity) {
		this.stockQuantity = stockQuantity;
	}

	public double getStockCapitalization() {
		return stockCapitalization;
	}

	public void setStockCapitalization(double stockCapitalization) {
		this.stockCapitalization = stockCapitalization;
	}

	public double getStockPE() {
		return stockPE;
	}

	public void setStockPE(double stockPE) {
		this.stockPE = stockPE;
	}

	public double getStockPP() {
		return stockPP;
	}

	public void setStockPP(double stockPP) {
		this.stockPP = stockPP;
	}

	public double getStockEPS() {
		return stockEPS;
	}

	public void setStockEPS(double stockEPS) {
		this.stockEPS = stockEPS;
	}

	public double getStockROE() {
		return stockROE;
	}

	public void setStockROE(double stockROE) {
		this.stockROE = stockROE;
	}

	public double getStockROA() {
		return stockROA;
	}

	public void setStockROA(double stockROA) {
		this.stockROA = stockROA;
	}

	public double getStockBeta() {
		return stockBeta;
	}

	public void setStockBeta(double stockBeta) {
		this.stockBeta = stockBeta;
	}

	public double getStockMarginRate() {
		return stockMarginRate;
	}

	public void setStockMarginRate(double stockMarginRate) {
		this.stockMarginRate = stockMarginRate;
	}

	public double getStockPrice() {
		return stockPrice;
	}

	public void setStockPrice(double stockPrice) {
		this.stockPrice = stockPrice;
	}

	public int getStockState() {
		return stockState;
	}

	public void setStockState(int stockState) {
		this.stockState = stockState;
	}

	@Override
    public String toString(){
        return "stockId="+stockId+", stockName="+stockName;
    }

}
