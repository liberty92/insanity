package com.liberation.lab.model;


import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="orders")
public class Orders {
	
	@Id
    @Column(name="orderId")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int orderId;
    
    @Column(name = "balanceId")
	private int balanceId;
    
    @Column(name = "stockId")
	private int stockId; 
	
    @Column(name = "orderType")
	private String orderType;
	
    @Column(name = "action")
	private String action;
	
    @Column(name = "price")
	private double price;
	
    @Column(name = "quantity")
	private double quantity; 
    
    @Column(name = "createdTime")
    private Timestamp createdTime;  
    
    @Column(name = "margin")
    private double margin; 
    
    @Column(name = "orderState")
    private String orderState; 
    
    @Column(name = "orderTradingFee")
    private double orderTradingFee;
    
    @Column(name = "orderSellTax")
    private double orderSellTax;
	 
  
	 
  
 
	public double getMargin() {
		return margin;
	}



	public void setMargin(double margin) {
		this.margin = margin;
	}



	public int getOrderId() {
		return orderId;
	}



	public void setOrderId(int orderId) {
		this.orderId = orderId;
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



	public String getOrderType() {
		return orderType;
	}



	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}



	public String getAction() {
		return action;
	}



	public void setAction(String action) {
		this.action = action;
	}



	public double getPrice() {
		return price;
	}



	public void setPrice(double price) {
		this.price = price;
	}



	public double getQuantity() {
		return quantity;
	}



	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}



	public Timestamp getCreatedTime() {
		return createdTime;
	}



	public void setCreatedTime(Timestamp createdTime) {
		this.createdTime = createdTime;
	}



	public String getOrderState() {
		return orderState;
	}



	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}

	

	public double getOrderTradingFee() {
		return orderTradingFee;
	}



	public void setOrderTradingFee(double orderTradingFee) {
		this.orderTradingFee = orderTradingFee;
	}



	public double getOrderSellTax() {
		return orderSellTax;
	}



	public void setOrderSellTax(double orderSellTax) {
		this.orderSellTax = orderSellTax;
	}



	@Override
    public String toString(){
        return "orderId="+orderId;
    }
 

}
