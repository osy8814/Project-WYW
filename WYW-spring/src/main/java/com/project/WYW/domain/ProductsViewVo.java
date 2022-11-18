package com.project.WYW.domain;

import java.util.Date;
import java.util.Objects;

public class ProductsViewVo {

    private Integer id;
    private String user_id;
    private String name;
    private String description;
    private String cate_code;
    private String thumbnail;
    private int price;
    private int stock;
    private int cumulative_sales;
    private Date created_at;

    private String cate_name;
    private String cate_code_ref;

    public String getCate_name() {
        return cate_name;
    }

    public void setCate_name(String cate_name) {
        this.cate_name = cate_name;
    }

    public String getCate_code_ref() {
        return cate_code_ref;
    }

    public void setCate_code_ref(String cate_code_ref) {
        this.cate_code_ref = cate_code_ref;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
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

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
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


    public ProductsViewVo(){}
    public ProductsViewVo(String user_id, String name, String description, String cate_code, String thumbnail, int price, int stock, int cumulative_sales) {
        this.user_id = user_id;
        this.name = name;
        this.description = description;
        this.cate_code = cate_code;
        this.thumbnail = thumbnail;
        this.price = price;
        this.stock = stock;
        this.cumulative_sales = cumulative_sales;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ProductsViewVo that = (ProductsViewVo) o;
        return price == that.price && Objects.equals(user_id, that.user_id) && Objects.equals(name, that.name) && Objects.equals(description, that.description) && Objects.equals(cate_code, that.cate_code) && Objects.equals(thumbnail, that.thumbnail);
    }

    @Override
    public int hashCode() {
        return Objects.hash(user_id, name, description, cate_code, thumbnail, price);
    }

    @Override
    public String toString() {
        return "ProductsViewVo{" +
                "id=" + id +
                ", user_id='" + user_id + '\'' +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", cate_code='" + cate_code + '\'' +
                ", thumbnail='" + thumbnail + '\'' +
                ", price=" + price +
                ", stock=" + stock +
                ", cumulative_sales=" + cumulative_sales +
                ", created_at=" + created_at +
                ", cate_name='" + cate_name + '\'' +
                ", cate_code_ref='" + cate_code_ref + '\'' +
                '}';
    }
}
