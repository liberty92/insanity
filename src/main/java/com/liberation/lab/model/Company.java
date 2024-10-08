package com.liberation.lab.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="company")
public class Company {
	
	@Id
    @Column(name="companyId")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int companyId;
    
    @Column(name = "companyName")
	private String companyName;
	
    @Column(name = "companyCategoryName")
	private String companyCategoryName;
	
    @Column(name = "companyBOD")
	private String companyBOD;
	
    @Column(name = "companyContact")
	private String companyContact;
	
    @Column(name = "companyInfo")
	private String companyInfo;
	
    @Column(name = "companyState")
	private int companyState;
	
  
	 
	public int getCompanyId() {
		return companyId;
	}
	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanyCategoryName() {
		return companyCategoryName;
	}
	public void setCompanyCategoryName(String companyCategoryName) {
		this.companyCategoryName = companyCategoryName;
	}
	public String getCompanyBOD() {
		return companyBOD;
	}
	public void setCompanyBOD(String companyBOD) {
		this.companyBOD = companyBOD;
	}
	public String getCompanyContact() {
		return companyContact;
	}
	public void setCompanyContact(String companyContact) {
		this.companyContact = companyContact;
	}
	public String getCompanyInfo() {
		return companyInfo;
	}
	public void setCompanyInfo(String companyInfo) {
		this.companyInfo = companyInfo;
	}
	public int getCompanyState() {
		return companyState;
	}
	public void setCompanyState(int companyState) {
		this.companyState = companyState;
	}
 
 
    @Override
    public String toString(){
        return "companyId="+companyId+", companyName="+companyName+", companyCategoryName="+companyCategoryName
        		+",companyBOD="+companyBOD+", companyInfo="+companyInfo+", companyState="
        		+companyState;
    }
 

}
