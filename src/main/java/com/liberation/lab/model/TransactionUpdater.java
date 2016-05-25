package com.liberation.lab.model;


import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="transactionupdater")
public class TransactionUpdater {
	
	@Id
    @Column(name="updateId")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
    
    @Column(name = "updateState")
	private int state;
	 
    @Column(name = "updateTime")
	private Timestamp time;
 
	  

	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public int getState() {
		return state;
	}



	public void setState(int state) {
		this.state = state;
	}



	public Timestamp getTime() {
		return time;
	}



	public void setTime(Timestamp time) {
		this.time = time;
	}



	@Override
    public String toString(){
        return "id="+id+", balanceName="+state+", balanceCreatedDate="+time;
    }
 

}
