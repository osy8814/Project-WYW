package com.project.WYW.domain;

import com.project.WYW.model.AttachImageVO;

import java.util.Date;
import java.util.List;
import java.util.Objects;

public class ProductsVo {

    private Integer id;
    private String userId;
    private String name;
    private String description;
    private String cate_code;
    private double ratingAvg;
    private int price;
    private int stock;
    private int cumulative_sales;
    private Date created_at;

    private List<AttachImageVO> imageVOList;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCate_code() {
        return cate_code;
    }

    public void setCate_code(String cate_code) {
        this.cate_code = cate_code;
    }

    public double getRatingAvg() {
        return ratingAvg;
    }

    public void setRatingAvg(double ratingAvg) {
        this.ratingAvg = ratingAvg;
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

    public int getCumulative_sales() {
        return cumulative_sales;
    }

    public void setCumulative_sales(int cumulative_sales) {
        this.cumulative_sales = cumulative_sales;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public List<AttachImageVO> getImageVOList() {
        return imageVOList;
    }

    public void setImageVOList(List<AttachImageVO> imageVOList) {
        this.imageVOList = imageVOList;
    }

    public ProductsVo(){}

    public ProductsVo(String userId, String name, String description, String cate_code, int price, int stock) {
        this.userId = userId;
        this.name = name;
        this.description = description;
        this.cate_code = cate_code;
        this.price = price;
        this.stock = stock;
    }

    public ProductsVo(String userId, String name, String description, String cate_code, double ratingAvg, int price, int stock, int cumulative_sales) {
        this.userId = userId;
        this.name = name;
        this.description = description;
        this.cate_code = cate_code;
        this.ratingAvg = ratingAvg;
        this.price = price;
        this.stock = stock;
        this.cumulative_sales = cumulative_sales;
    }


    public ProductsVo(Integer id, String userId, String name, String description, String cate_code, double ratingAvg, int price, int stock, int cumulative_sales, Date created_at) {
        this.id = id;
        this.userId = userId;
        this.name = name;
        this.description = description;
        this.cate_code = cate_code;
        this.ratingAvg = ratingAvg;
        this.price = price;
        this.stock = stock;
        this.cumulative_sales = cumulative_sales;
        this.created_at = created_at;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ProductsVo that = (ProductsVo) o;
        return price == that.price && Objects.equals(userId, that.userId) && Objects.equals(name, that.name) && Objects.equals(description, that.description) && Objects.equals(cate_code, that.cate_code) && Objects.equals(ratingAvg, that.ratingAvg);
    }

    @Override
    public int hashCode() {
        return Objects.hash(userId, name, description, cate_code, ratingAvg, price);
    }

    @Override
    public String toString() {
        return "ProductsVo{" +
                "id=" + id +
                ", user_id='" + userId + '\'' +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", cate_code='" + cate_code + '\'' +
                ", ratingAvg='" + ratingAvg + '\'' +
                ", price=" + price +
                ", stock=" + stock +
                ", cumulative_sales=" + cumulative_sales +
                ", created_at=" + created_at +
                ", imageVOList=" + imageVOList +
                '}';
    }
}
