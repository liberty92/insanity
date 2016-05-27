package com.liberation.lab.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tradingfee")
public class TradingFee {
	
	@Id
    @Column(name="tradingFeeId")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "tradingFeeName")
	private String name;
	
	@Column(name = "tradingFeeFromValue")
	private double fromValue;
	
	@Column(name = "tradingFeeThroughValue")
	private double throughValue;
    
    @Column(name = "tradingFeeValue")
	private double value;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getFromValue() {
		return fromValue;
	}

	public void setFromValue(double fromValue) {
		this.fromValue = fromValue;
	}

	public double getThroughValue() {
		return throughValue;
	}

	public void setThroughValue(double throughValue) {
		this.throughValue = throughValue;
	}

	public double getValue() {
		return value;
	}

	public void setValue(double value) {
		this.value = value;
	}
    
    

}
