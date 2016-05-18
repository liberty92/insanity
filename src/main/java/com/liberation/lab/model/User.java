package com.liberation.lab.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user")
public class User {
	
	@Id
    @Column(name="userId")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int userId;
    
    @Column(name = "username")
	private String username;
	
    @Column(name = "password")
	private String password;
	
    @Column(name = "userFullName")
	private String userFullName;
	
    @Column(name = "userAge")
	private int userAge;
	
    @Column(name = "userPhoneNumber")
	private String userPhoneNumber;
	
    @Column(name = "userEmail")
	private String userEmail;
	
    @Column(name = "userAddress")
	private String userAddress;
	
    @Column(name = "userProfilePicture")
	private String userProfilePicture;
	
	public String getUserProfilePicture() {
		return userProfilePicture;
	}
	public void setUserProfilePicture(String userProfilePicture) {
		this.userProfilePicture = userProfilePicture;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserFullName() {
		return userFullName;
	}
	public void setUserFullName(String userFullName) {
		this.userFullName = userFullName;
	}
	public int getUserAge() {
		return userAge;
	}
	public void setUserAge(int userAge) {
		this.userAge = userAge;
	}
	public String getUserPhoneNumber() {
		return userPhoneNumber;
	}
	public void setUserPhoneNumber(String userPhoneNumber) {
		this.userPhoneNumber = userPhoneNumber;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
 
    @Override
    public String toString(){
        return "userId="+userId+", username="+username+", password="+password
        		+",userFullName="+userFullName+", userPhoneNumber="+userPhoneNumber+", userEmail="
        		+userEmail+", userAddress="+userAddress;
    }
 

}
