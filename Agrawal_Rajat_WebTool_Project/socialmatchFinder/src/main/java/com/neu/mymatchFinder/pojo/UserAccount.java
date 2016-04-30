package com.neu.mymatchFinder.pojo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "UserAccount")
@PrimaryKeyJoinColumn(name="UserID")
public class UserAccount extends Userstable{

	@Column(name = "username")
	private String username;

	@Column(name = "password")
	private String password;

	
	@Column(name = "registerDate")
	private Date registerDate;
	
	@Column(name = "roletype")
	private String role;
	
	
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
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
	
	@Temporal(TemporalType.DATE)
	public Date getRegisterDate() {
		return registerDate;
	}	

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}
	
	

}
