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
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int companyCategoryId;
	
    
    @Column(name = "companyCategoryName")
	private String companyCategoryName;
	
    @Column(name = "companyCategoryInfo")
	private String companyCategoryInfo;
	
    @Column(name = "description")
	private String description;
	 
    
    
    public int getCompanyCategoryId() {
		return companyCategoryId;
	}

	public void setCompanyCategoryId(int companyCategoryId) {
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setCompanyCategoryInfo(String companyCategoryInfo) {
		this.companyCategoryInfo = companyCategoryInfo;
	}

	@Override
    public String toString(){
        return "companyCategoryId="+companyCategoryId+", companyCategoryName="+companyCategoryName+", companyCategoryId="+companyCategoryId
        		+",description="+description+",companyCategoryInfo="+companyCategoryInfo;
    }
 

}
