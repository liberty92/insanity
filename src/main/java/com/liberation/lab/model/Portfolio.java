package com.liberation.lab.model;


import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="portfolio")
public class Portfolio {
	
	@Id
    @Column(name="portfolioId")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int portfolioId;
    
    @Column(name = "balanceId")
	private int balanceId;
    
    @Column(name = "stockId")
	private int stockId; 
	
    @Column(name = "buyDate")
	private Timestamp buyDate;
	
    @Column(name = "sellDate")
	private Timestamp sellDate; 
	
    @Column(name = "buyPrice")
	private double buyPrice;
	
    @Column(name = "sellPrice")
	private double sellPrice;
	
    @Column(name = "quantity")
	private double quantity; 
	 
  


	public int getPortfolioId() {
		return portfolioId;
	}




	public void setPortfolioId(int portfolioId) {
		this.portfolioId = portfolioId;
	}




	public int getBalanceId() {
		return balanceId;
	}




	public void setBalanceId(int balanceId) {
		this.balanceId = balanceId;
	}




	public int getStockId() {
		return stockId;
	}




	public void setStockId(int stockId) {
		this.stockId = stockId;
	}




	public Timestamp getBuyDate() {
		return buyDate;
	}




	public void setBuyDate(Timestamp buyDate) {
		this.buyDate = buyDate;
	}




	public Timestamp getSellDate() {
		return sellDate;
	}




	public void setSellDate(Timestamp sellDate) {
		this.sellDate = sellDate;
	}




	public double getBuyPrice() {
		return buyPrice;
	}




	public void setBuyPrice(double buyPrice) {
		this.buyPrice = buyPrice;
	}




	public double getSellPrice() {
		return sellPrice;
	}




	public void setSellPrice(double sellPrice) {
		this.sellPrice = sellPrice;
	}




	public double getQuantity() {
		return quantity;
	}




	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}




	@Override
    public String toString(){
        return "portfolioId="+portfolioId;
    }
 

}
