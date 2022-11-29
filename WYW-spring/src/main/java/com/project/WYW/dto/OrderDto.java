package com.project.WYW.dto;

import java.util.Date;
import java.util.List;

public class OrderDto {
    /* 주문 번호 */
    private String orderId;

    /* 배송 받는이 */
    private String receiver;

    /* 주문 회원 아이디 */
    private String userId;

    /* 우편번호 */
    private String address1;

    /* 회원 주소 */
    private String address2;

    /* 회원 상세주소 */
    private String address3;

    /* 회원 연락처 */
    private String mobile;

    /* 주문 상태 */
    private String orderState;

    /* 주문 상품 */
    private List<OrderItemDto> orders;

    /* 배송비 */
    private int deliveryCost;

    /* 사용 포인트 */
    private int usePoint;

    /* 주문 날짜 */
    private Date orderDate;

    /* DB테이블 존재 하지 않는 데이터 */

    /* 판매가(모든 상품 비용) */
    private int orderSalePrice;

    /* 적립 포인트 */
    private int orderSavePoint;

    /* 최종 판매 비용 */
    private int orderFinalSalePrice;

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getAddress1() {
        return address1;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public String getAddress3() {
        return address3;
    }

    public void setAddress3(String address3) {
        this.address3 = address3;
    }

    public String getOrderState() {
        return orderState;
    }

    public void setOrderState(String orderState) {
        this.orderState = orderState;
    }

    public List<OrderItemDto> getOrders() {
        return orders;
    }

    public void setOrders(List<OrderItemDto> orders) {
        this.orders = orders;
    }

    public int getDeliveryCost() {
        return deliveryCost;
    }

    public void setDeliveryCost(int deliveryCost) {
        this.deliveryCost = deliveryCost;
    }

    public int getUsePoint() {
        return usePoint;
    }

    public void setUsePoint(int usePoint) {
        this.usePoint = usePoint;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public int getOrderSalePrice() {
        return orderSalePrice;
    }

    public void setOrderSalePrice(int orderSalePrice) {
        this.orderSalePrice = orderSalePrice;
    }

    public int getOrderSavePoint() {
        return orderSavePoint;
    }

    public void setOrderSavePoint(int orderSavePoint) {
        this.orderSavePoint = orderSavePoint;
    }

    public int getOrderFinalSalePrice() {
        return orderFinalSalePrice;
    }

    public void setOrderFinalSalePrice(int orderFinalSalePrice) {
        this.orderFinalSalePrice = orderFinalSalePrice;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public void getOrderPriceInfo() {
        /* 상품 비용 & 적립포인트 */
        for (OrderItemDto order : orders) {
            orderSalePrice += order.getTotalPrice();
            orderSavePoint += order.getTotalSavePoint();
        }
        /* 배송비용 */
        if (orderSalePrice >= 100000) {
            deliveryCost = 0;
        } else {
            deliveryCost = 3000;
        }
        /* 최종 비용(상품 비용 + 배송비 - 사용 포인트) */
        orderFinalSalePrice = orderSalePrice + deliveryCost - usePoint;
    }

    @Override
    public String toString() {
        return "OrderDto{" +
                "orderId='" + orderId + '\'' +
                ", receiver='" + receiver + '\'' +
                ", userId='" + userId + '\'' +
                ", address1='" + address1 + '\'' +
                ", address2='" + address2 + '\'' +
                ", address3='" + address3 + '\'' +
                ", mobile='" + mobile + '\'' +
                ", orderState='" + orderState + '\'' +
                ", orders=" + orders +
                ", deliveryCost=" + deliveryCost +
                ", usePoint=" + usePoint +
                ", orderDate=" + orderDate +
                ", orderSalePrice=" + orderSalePrice +
                ", orderSavePoint=" + orderSavePoint +
                ", orderFinalSalePrice=" + orderFinalSalePrice +
                '}'+"\n";
    }
}
