package com.liberation.lab.model;


import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="balance")
public class Balance {
	
	@Id
    @Column(name="balanceId")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int balanceId;
    
    @Column(name = "userId")
	private int userId;
	
    @Column(name = "balanceName")
	private String balanceName;
	
    @Column(name = "balanceCreatedDate")
	private Timestamp balanceCreatedDate;
	
    @Column(name = "balanceInitialNAV")
	private double balanceInitialNAV;
	
    @Column(name = "balanceAvailableCash")
	private double balanceAvailableCash;
	
    @Column(name = "balanceCash")
	private double balanceCash;
	
    @Column(name = "balanceTotalAssets")
	private double balanceTotalAssets;
	
    @Column(name = "balanceNAV")
	private double balanceNAV;
	
    @Column(name = "balanceMarginRate")
	private double balanceMarginRate;
	
    @Column(name = "balanceState")
	private int balanceState;
	
	 
 
    public int getBalanceId() {
		return balanceId;
	}



	public void setBalanceId(int balanceId) {
		this.balanceId = balanceId;
	}



	public int getUserId() {
		return userId;
	}



	public void setUserId(int userId) {
		this.userId = userId;
	}



	public String getBalanceName() {
		return balanceName;
	}



	public void setBalanceName(String balanceName) {
		this.balanceName = balanceName;
	}



	public Timestamp getBalanceCreatedDate() {
		return balanceCreatedDate;
	}



	public void setBalanceCreatedDate(Timestamp balanceCreatedDate) {
		this.balanceCreatedDate = balanceCreatedDate;
	}



	public double getBalanceInitialNAV() {
		return balanceInitialNAV;
	}



	public void setBalanceInitialNAV(double balanceInitialNAV) {
		this.balanceInitialNAV = balanceInitialNAV;
	}



	public double getBalanceCash() {
		return balanceCash;
	}



	public void setBalanceCash(double balanceCash) {
		this.balanceCash = balanceCash;
	}

	

	public double getBalanceAvailableCash() {
		return balanceAvailableCash;
	}



	public void setBalanceAvailableCash(double balanceAvailableCash) {
		this.balanceAvailableCash = balanceAvailableCash;
	}



	public double getBalanceTotalAssets() {
		return balanceTotalAssets;
	}



	public void setBalanceTotalAssets(double balanceTotalAssets) {
		this.balanceTotalAssets = balanceTotalAssets;
	}



	public double getBalanceNAV() {
		return balanceNAV;
	}



	public void setBalanceNAV(double balanceNAV) {
		this.balanceNAV = balanceNAV;
	}



	public double getBalanceMarginRate() {
		return balanceMarginRate;
	}



	public void setBalanceMarginRate(double balanceMarginRate) {
		this.balanceMarginRate = balanceMarginRate;
	}



	public int getBalanceState() {
		return balanceState;
	}



	public void setBalanceState(int balanceState) {
		this.balanceState = balanceState;
	}



	@Override
    public String toString(){
        return "balanceId="+balanceId+", balanceName="+balanceName+", balanceCreatedDate="+balanceCreatedDate
        		+",balanceInitialNAV="+balanceInitialNAV+", balanceCash="+balanceCash+", balanceTotalAssets="
        		+balanceTotalAssets+", balanceNAV="+balanceNAV;
    }
 

}
