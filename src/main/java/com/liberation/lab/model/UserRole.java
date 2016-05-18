package com.liberation.lab.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="userrole")
public class UserRole {
	
	@Id
    @Column(name="userRoleId")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int userRoleId;
    
    @Column(name = "userId")
	private int userId;
	
    @Column(name = "userRole")
	private String userRole;
	
   
	public int getUserRoleId() {
		return userRoleId;
	}
	public void setUserRoleId(int userRoleId) {
		this.userRoleId = userRoleId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserRole() {
		return userRole;
	}
	public void setUserRole(String userRole) {
		this.userRole = userRole;
	} 
 
    @Override
    public String toString(){
        return "userRoleId="+userRoleId+", userId="+userId+", userRole="+userRole;
    }
 

}
