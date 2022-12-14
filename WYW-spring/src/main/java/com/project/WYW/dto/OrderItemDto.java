package com.project.WYW.dto;

import com.project.WYW.model.AttachImageVO;

import java.util.List;

public class OrderItemDto {
    /* order_item 기본키 */
    private int orderItemId;
    /* 주문 번호 */
    private String orderId;

    /* 상품 번호 */
    private int productId;

    private String productName;
    /* 주문 수량 */

    private int productCount;

    /* 상품 한 개 가격 */
    private int price;

    private List<AttachImageVO> imageVOList;
    /* 상품 한개 구매 시 획득 포인트 */
    private int savePoint;

    /* DB테이블 존재 하지 않는 데이터 */

    /* 총 가격(가격 * 주문 수량) */
    private int totalPrice;

    /* 총 획득 포인트(상품 한개 구매 시 획득 포인트 * 수량) */
    private int totalSavePoint;

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getProductCount() {
        return productCount;
    }

    public void setProductCount(int productCount) {
        this.productCount = productCount;
    }

    public int getOrderItemId() {
        return orderItemId;
    }

    public void setOrderItemId(int orderItemId) {
        this.orderItemId = orderItemId;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getSavePoint() {
        return savePoint;
    }

    public void setSavePoint(int savePoint) {
        this.savePoint = savePoint;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getTotalSavePoint() {
        return totalSavePoint;
    }

    public void setTotalSavePoint(int totalSavePoint) {
        this.totalSavePoint = totalSavePoint;
    }

    public List<AttachImageVO> getImageVOList() {
        return imageVOList;
    }

    public void setImageVOList(List<AttachImageVO> imageVOList) {
        this.imageVOList = imageVOList;
    }

    public void initSaleTotal() {
        this.totalPrice = this.price*this.productCount;
        this.totalSavePoint =this.savePoint * this.productCount;
    }

    @Override
    public String toString() {
        return "OrderItemDto{" +
                "orderItemId=" + orderItemId +
                ", orderId='" + orderId + '\'' +
                ", productId=" + productId +
                ", productName='" + productName + '\'' +
                ", productCount=" + productCount +
                ", price=" + price +
                ", imageVOList=" + imageVOList +
                ", savePoint=" + savePoint +
                ", totalPrice=" + totalPrice +
                ", totalSavePoint=" + totalSavePoint +
                '}';
    }
}
