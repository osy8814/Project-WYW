package com.project.WYW.dto;

import com.project.WYW.model.AttachImageVO;

import java.util.List;

public class OrderPageItemDto {

    /* 뷰로부터 전달받을 값 */
    private int productId;
    private int productCount;

    /* DB로부터 꺼내올 값 */
    private String name;
    private int price;

    private List<AttachImageVO> imageVOList;
    /* 만들어 낼 값 */
    private int totalPrice;

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getProductCount() {
        return productCount;
    }

    public void setProductCount(int productCount) {
        this.productCount = productCount;
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

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public void initSaleTotal() {
        this.totalPrice = this.price * this.productCount;

    }

    public List<AttachImageVO> getImageVOList() {
        return imageVOList;
    }

    public void setImageVOList(List<AttachImageVO> imageVOList) {
        this.imageVOList = imageVOList;
    }

    public OrderPageItemDto() {
    }
    public OrderPageItemDto(int productId, int productCount) {
        this.productId = productId;
        this.productCount = productCount;
    }

    public OrderPageItemDto(int productId, int productCount, String name, int price, List<AttachImageVO> imageVOList, int totalPrice) {
        this.productId = productId;
        this.productCount = productCount;
        this.name = name;
        this.price = price;
        this.imageVOList = imageVOList;
        this.totalPrice = totalPrice;
    }

    @Override
    public String toString() {
        return "OrderPageItemDto{" +
                "productId=" + productId +
                ", productCount=" + productCount +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", imageVOList=" + imageVOList +
                ", totalPrice=" + totalPrice +
                '}';
    }
}
