//package com.project.WYW.domain;
//
//import java.util.Date;
//import java.util.Objects;
//
//public class Users {
//
//    UsersVo usersVo = new UsersVo();
//    private int id;
//    private String userName;
//
//    private String name;
//    private String password;
//
//    private String email;
//
//    private String mobile;
//
//    private String address;
//    private Date createdAt;
//    private boolean isAdmin;
//
//    public int getId() {
//        return id;
//    }
//    public String getUserName() { return usersVo.getUserId();}
//    public String getName() {
//        return usersVo.getName();
//    }
//    public String getPassword() {
//        return usersVo.getPassword();
//    }
//    public String getEmail() {
//        return usersVo.getEmail();
//    }
//
//    public String getMobile() {
//        if(usersVo.getMobile1()==""||usersVo.getMobile2()==""||usersVo.getMobile3()=="") {
//            mobile="";
//        }else {
//            mobile=usersVo.getMobile1()+"-"+usersVo.getMobile2()+"-"+usersVo.getMobile3();
//        }
//        return mobile;
//    }
//
//    public String getAddress() {
//        return address;
//    }
//    public Date getCreatedAt() {
//        return createdAt;
//    }
//    public boolean isIs_admin() {
//        return isAdmin;
//    }
//
//    public Users() {}
//
//    public Users(int id, String userId, String name, String password, String email, String mobile, String address,
//                 Date createdAt, boolean isAdmin) {
//
//        this.id = id;
//        this.userName = userId;
//        this.name = name;
//        this.password = password;
//        this.email = email;
//        this.mobile = mobile;
//        this.address = address;
//        this.createdAt = createdAt;
//        this.isAdmin = isAdmin;
//    }
//
//
//
//
//
//}
