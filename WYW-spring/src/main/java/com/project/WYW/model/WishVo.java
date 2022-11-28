package com.project.WYW.model;

import java.util.List;

public class WishVo {

    private int id;

    private String user_id;

    private int product_id;

    //products

    private String name;

    private int price;

    private int stock;

    // 추가
    private List<AttachImageVO> imageVOList;

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

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public List<AttachImageVO> getImageVOList() {
        return imageVOList;
    }

    public void setImageVOList(List<AttachImageVO> imageVOList) {
        this.imageVOList = imageVOList;
    }

    @Override
    public String toString() {
        return "WishVo{" +
                "id=" + id +
                ", user_id='" + user_id + '\'' +
                ", product_id=" + product_id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", stock=" + stock +
                ", imageVOList=" + imageVOList +
                '}';
    }
}
