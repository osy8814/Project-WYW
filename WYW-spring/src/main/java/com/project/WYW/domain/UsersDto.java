package com.project.WYW.domain;

import java.util.Date;
import java.util.Objects;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class UsersDto {

	private int id;


	private String user_id;

	private String name;
	private String password;

	private String email;

	private String mobile;

	private String mobile1;

	private String mobile2;

	private String mobile3;
	
	private String address;
	private Date created_at;
	private boolean is_admin;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
		
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@NotNull
	public String getMobile() {
		if(mobile1==""||mobile2==""||mobile3=="") {
			mobile="";
		}else {
			mobile=mobile1+"-"+mobile2+"-"+mobile3;
		}
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
		
	public String getMobile1() {
		return mobile1;
	}
	public void setMobile1(String mobile1) {
		this.mobile1 = mobile1;
	}
	public String getMobile2() {
		return mobile2;
	}
	public void setMobile2(String mobile2) {
		this.mobile2 = mobile2;
	}
	public String getMobile3() {
		return mobile3;
	}
	public void setMobile3(String mobile3) {
		this.mobile3 = mobile3;
	}
	
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public boolean isIs_admin() {
		return is_admin;
	}
	public void setIs_admin(boolean is_admin) {
		this.is_admin = is_admin;
	}
	
	public UsersDto() {}
	
	public UsersDto(String user_id, String name, String password, String email,String mobile1, String mobile2, String mobile3) {
				
		this.user_id = user_id;
		this.name = name;
		this.password = password;
		this.email = email;
		this.mobile1 = mobile1;
		this.mobile2 = mobile2;
		this.mobile3 = mobile3;

	}
	
	public UsersDto(int id, String user_id, String name, String password, String email, String mobile1, String mobile2, String mobile3, String address,
			Date created_at, boolean is_admin) {
		
		this.id = id;
		this.user_id = user_id;
		this.name = name;
		this.password = password;
		this.email = email;
		this.mobile1 = mobile1;
		this.mobile2 = mobile2;
		this.mobile3 = mobile3;
		this.address = address;
		this.created_at = created_at;
		this.is_admin = is_admin;
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(address, email, is_admin, mobile, name, password, user_id);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		UsersDto other = (UsersDto) obj;
		return Objects.equals(address, other.address) && Objects.equals(email, other.email)
				&& is_admin == other.is_admin && Objects.equals(mobile, other.mobile)
				&& Objects.equals(name, other.name) && Objects.equals(password, other.password)
				&& Objects.equals(user_id, other.user_id);
	}
	@Override
	public String toString() {
		return "UsersDto [id=" + id + ", user_id=" + user_id + ", name=" + name + ", password=" + password + ", email="
				+ email + ", mobile=" + mobile + ", address=" + address + ", created_at=" + created_at + ", is_admin="
				+ is_admin + "]";
	}
	
	
	
}
