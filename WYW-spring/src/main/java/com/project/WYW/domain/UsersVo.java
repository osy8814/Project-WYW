package com.project.WYW.domain;

import java.util.Date;
import java.util.Objects;

public class UsersVo {


    private String user_id;
    private String name;
    private String password;

    private String email;

    private String mobile;
    private String mobile1;

    private String mobile2;

    private String mobile3;

    private String address;

    private String API_postcode;
    private String API_address;
    private String API_extraAddress;
    private String API_detailAddress;
    private Date created_at;
    private boolean is_admin;

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

    public String getMobile() {
        if(mobile1==""||mobile2==""||mobile3=="") {
            mobile="";
        }else {
            mobile=mobile1+"-"+mobile2+"-"+mobile3;
        }
        return mobile;
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

        if(API_postcode==""||API_address==""|| API_detailAddress=="") {
            address="";
        }else {
            address=API_postcode+" "+API_address+" "+API_extraAddress+" "+API_detailAddress;
        }
        return address;
    }

    public String getAPI_postcode() {
        return API_postcode;
    }

    public void setAPI_postcode(String API_postcode) {
        this.API_postcode = API_postcode;
    }

    public String getAPI_address() {
        return API_address;
    }

    public void setAPI_address(String API_address) {
        this.API_address = API_address;
    }

    public String getAPI_extraAddress() {
        return API_extraAddress;
    }

    public void setAPI_extraAddress(String API_extraAddress) {
        this.API_extraAddress = API_extraAddress;
    }

    public String getAPI_detailAddress() {
        return API_detailAddress;
    }

    public void setAPI_detailAddress(String API_detailAddress) {
        this.API_detailAddress = API_detailAddress;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public boolean getIs_admin() {
        return is_admin;
    }

    public void setIs_admin(boolean is_admin) {
        this.is_admin = is_admin;
    }

    public UsersVo() {}

    public UsersVo(String user_id, String name, String password, String email, String mobile1, String mobile2, String mobile3) {

        this.user_id = user_id;
        this.name = name;
        this.password = password;
        this.email = email;
        this.mobile1 = mobile1;
        this.mobile2 = mobile2;
        this.mobile3 = mobile3;

    }

    public UsersVo(String user_id, String name, String password, String email, String mobile1, String mobile2, String mobile3, String API_postcode, String API_address, String API_extraAddress, String API_detailAddress) {

        this.user_id = user_id;
        this.name = name;
        this.password = password;
        this.email = email;
        this.mobile1 = mobile1;
        this.mobile2 = mobile2;
        this.mobile3 = mobile3;
        this.API_postcode = API_postcode;
        this.API_address = API_address;
        this.API_extraAddress = API_extraAddress;
        this.API_detailAddress = API_detailAddress;
    }

    @Override
    public String toString() {
        return "UsersVo{" +
                "user_id='" + user_id + '\'' +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", mobile='" + mobile + '\'' +
                ", address='" + address + '\'' +
                ", created_at=" + created_at +
                ", is_admin=" + is_admin +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UsersVo usersDto = (UsersVo) o;
        return Objects.equals(user_id, usersDto.user_id) && Objects.equals(name, usersDto.name) && Objects.equals(password, usersDto.password) && Objects.equals(email, usersDto.email) && Objects.equals(mobile, usersDto.mobile) && Objects.equals(address, usersDto.address);
    }

    @Override
    public int hashCode() {
        return Objects.hash(user_id, name, password, email, mobile, address);
    }
}
