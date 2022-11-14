package com.project.WYW.domain;

import java.util.Date;
import java.util.Objects;

public class Users {

    UsersVo usersDto = new UsersVo();
    private int id;
    private String user_id;

    private String name;
    private String password;

    private String email;

    private String mobile;

    private String address;
    private Date created_at;
    private boolean is_admin;

    public int getId() {
        return id;
    }
    public String getUser_id() { return usersDto.getUser_id();}
    public String getName() {
        return usersDto.getName();
    }
    public String getPassword() {
        return usersDto.getPassword();
    }
    public String getEmail() {
        return usersDto.getEmail();
    }

    public String getMobile() {
        if(usersDto.getMobile1()==""||usersDto.getMobile2()==""||usersDto.getMobile3()=="") {
            mobile="";
        }else {
            mobile=usersDto.getMobile1()+"-"+usersDto.getMobile2()+"-"+usersDto.getMobile3();
        }
        return mobile;
    }

    public String getAddress() {
        return address;
    }
    public Date getCreated_at() {
        return created_at;
    }
    public boolean isIs_admin() {
        return is_admin;
    }

    public Users() {}

    public Users(int id, String user_id, String name, String password, String email, String mobile, String address,
                 Date created_at, boolean is_admin) {

        this.id = id;
        this.user_id = user_id;
        this.name = name;
        this.password = password;
        this.email = email;
        this.mobile = mobile;
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
        Users other = (Users) obj;
        return Objects.equals(address, other.address) && Objects.equals(email, other.email)
                && is_admin == other.is_admin && Objects.equals(mobile, other.mobile)
                && Objects.equals(name, other.name) && Objects.equals(password, other.password)
                && Objects.equals(user_id, other.user_id);
    }
    @Override
    public String toString() {
        return "Users [id=" + id + ", user_id=" + user_id + ", name=" + name + ", password=" + password + ", email="
                + email + ", mobile=" + mobile + ", address=" + address + ", created_at=" + created_at + ", is_admin="
                + is_admin + "]";
    }



}
