package com.project.WYW.dto;

public class OrderItemDto {
    /* 주문 번호 */
    private String orderId;

    /* 상품 번호 */
    private int productId;

    /* 주문 수량 */
    private int productCount;

    /* vam_orderItem 기본키 */
    private int orderItemId;

    /* 상품 한 개 가격 */
    private int price;

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

    public void initSaleTotal() {
        this.totalPrice = this.price*this.productCount;
        this.totalSavePoint =this.savePoint * this.productCount;
    }

    @Override
    public String toString() {
        return "OrderItemDto{" +
                "orderId='" + orderId + '\'' +
                ", productId=" + productId +
                ", productCount=" + productCount +
                ", orderItemId=" + orderItemId +
                ", price=" + price +
                ", savePoint=" + savePoint +
                ", totalPrice=" + totalPrice +
                ", totalSavePoint=" + totalSavePoint +
                '}';
    }
}
