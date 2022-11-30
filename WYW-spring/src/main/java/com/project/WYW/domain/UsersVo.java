package com.project.WYW.domain;

import java.util.Date;
import java.util.Objects;

public class UsersVo {


    private String userId;
    private String name;
    private String password;
    private String email;
    private String mobile;
    private String mobile1;
    private String mobile2;
    private String mobile3;
    private String address;
    private String APIPostcode;
    private String APIAddress;
    private String APIExtraAddress;
    private String APIDetailAddress;
    private Date createdAt;
    private boolean isAdmin;
    private int point;
    private boolean isActive;

    public boolean isAdmin() {
        return isAdmin;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
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

    public String getAPIPostcode() {
        return APIPostcode;
    }

    public void setAPIPostcode(String APIPostcode) {
        this.APIPostcode = APIPostcode;
    }

    public String getAPIAddress() {
        return APIAddress;
    }

    public void setAPIAddress(String APIAddress) {
        this.APIAddress = APIAddress;
    }

    public String getAPIExtraAddress() {
        return APIExtraAddress;
    }

    public void setAPIExtraAddress(String APIExtraAddress) {
        this.APIExtraAddress = APIExtraAddress;
    }

    public String getAPIDetailAddress() {
        return APIDetailAddress;
    }

    public void setAPIDetailAddress(String APIDetailAddress) {
        this.APIDetailAddress = APIDetailAddress;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public boolean getIsAdmin() {
        return isAdmin;
    }

    public void setAdmin(boolean admin) {
        isAdmin = admin;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }


    public String getMobile() {
        if (mobile1 == "" || mobile2 == "" || mobile3 == "") {
            mobile = "";
        } else {
            mobile = mobile1 + "-" + mobile2 + "-" + mobile3;
        }
        return mobile;
    }

    public String getAddress() {

        if (APIPostcode == "" || APIAddress == "" || APIDetailAddress == "") {
            address = "";
        } else {
            address = APIPostcode + ", " + APIAddress + ", " + APIExtraAddress + ", " + APIDetailAddress;
        }
        return address;
    }

    public UsersVo() {
    }

    public UsersVo(String userId, String name, String password, String email, String mobile1, String mobile2, String mobile3) {
        this.userId = userId;
        this.name = name;
        this.password = password;
        this.email = email;
        this.mobile1 = mobile1;
        this.mobile2 = mobile2;
        this.mobile3 = mobile3;

    }

    public UsersVo(String userId, String name, String password, String email, String mobile, String mobile1, String mobile2, String mobile3, String address, String APIPostcode, String APIAddress, String APIExtraAddress, String APIDetailAddress, Date createdAt, boolean isAdmin, int point, boolean isActive) {
        this.userId = userId;
        this.name = name;
        this.password = password;
        this.email = email;
        this.mobile = mobile;
        this.mobile1 = mobile1;
        this.mobile2 = mobile2;
        this.mobile3 = mobile3;
        this.address = address;
        this.APIPostcode = APIPostcode;
        this.APIAddress = APIAddress;
        this.APIExtraAddress = APIExtraAddress;
        this.APIDetailAddress = APIDetailAddress;
        this.createdAt = createdAt;
        this.isAdmin = isAdmin;
        this.point = point;
        this.isActive = isActive;
    }

    @Override
    public String toString() {
        return "UsersVo{" +
                "userId='" + userId + '\'' +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", mobile='" + mobile + '\'' +
                ", address='" + address + '\'' +
                ", point=" + point +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UsersVo usersVo = (UsersVo) o;
        return isAdmin == usersVo.isAdmin && Objects.equals(userId, usersVo.userId) && Objects.equals(name, usersVo.name) && Objects.equals(email, usersVo.email) && Objects.equals(mobile, usersVo.mobile) && Objects.equals(address, usersVo.address);
    }

    @Override
    public int hashCode() {
        return Objects.hash(userId, name, email, mobile, address, isAdmin);
    }
}
