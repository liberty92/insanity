package com.liberation.lab.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="companycategory")
public class CompanyCategory {
	
	@Id
    @Column(name="companyCategoryId")
	private String companyCategoryId;
	
    
    @Column(name = "companyCategoryName")
	private String companyCategoryName;
	
    @Column(name = "companyCategoryInfo")
	private String companyCategoryInfo;
	 
    
 
 
    public String getCompanyCategoryId() {
		return companyCategoryId;
	}




	public void setCompanyCategoryId(String companyCategoryId) {
		this.companyCategoryId = companyCategoryId;
	}




	public String getCompanyCategoryName() {
		return companyCategoryName;
	}




	public void setCompanyCategoryName(String companyCategoryName) {
		this.companyCategoryName = companyCategoryName;
	}




	public String getCompanyCategoryInfo() {
		return companyCategoryInfo;
	}




	public void setCompanyCategoryInfo(String companyCategoryInfo) {
		this.companyCategoryInfo = companyCategoryInfo;
	}




	@Override
    public String toString(){
        return "companyCategoryId="+companyCategoryId+", companyCategoryName="+companyCategoryName+", companyCategoryId="+companyCategoryId
        		+",companyCategoryInfo="+companyCategoryInfo;
    }
 

}
