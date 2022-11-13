package com.project.WYW.domain;

import java.util.Date;
import java.util.Objects;

public class UsersDto {


    private String user_id;
    private String name;
    private String password;

    private String email;

    private String mobile;
    private String mobile1;

    private String mobile2;

    private String mobile3;

    private String address;


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
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }

    public UsersDto() {}

    public UsersDto(String user_id, String name, String password, String email, String mobile1, String mobile2, String mobile3) {

        this.user_id = user_id;
        this.name = name;
        this.password = password;
        this.email = email;
        this.mobile1 = mobile1;
        this.mobile2 = mobile2;
        this.mobile3 = mobile3;

    }

    @Override
    public String toString() {
        return "UsersDto{" +
                "user_id='" + user_id + '\'' +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", mobile='" + mobile + '\'' +
                ", address='" + address + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UsersDto usersDto = (UsersDto) o;
        return Objects.equals(user_id, usersDto.user_id) && Objects.equals(name, usersDto.name) && Objects.equals(password, usersDto.password) && Objects.equals(email, usersDto.email) && Objects.equals(mobile, usersDto.mobile) && Objects.equals(address, usersDto.address);
    }

    @Override
    public int hashCode() {
        return Objects.hash(user_id, name, password, email, mobile, address);
    }
}
