package com.project.WYW.model;

public class CartVo {

    private int id;

    private String user_id;

    private int product_id;

    private int product_count;

    //products

    private String name;

    private int price;

    // 추가
    private int salePrice;

    private int totalPrice;


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

    public int getProduct_count() {
        return product_count;
    }

    public void setProduct_count(int product_count) {
        this.product_count = product_count;
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

    public int getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(int salePrice) {
        this.salePrice = salePrice;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public void initSaleTotal() {
        this.totalPrice = this.price*this.product_count;
    }

    public CartVo(){}


    public CartVo(String user_id, int product_id, int product_count) {
        this.user_id = user_id;
        this.product_id = product_id;
        this.product_count = product_count;
    }

    @Override
    public String toString() {
        return "CartVo{" +
                "id=" + id +
                ", user_id='" + user_id + '\'' +
                ", product_id=" + product_id +
                ", product_count=" + product_count +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", salePrice=" + salePrice +
                ", totalPrice=" + totalPrice +
                '}';
    }
}
