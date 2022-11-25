package com.project.WYW.dto;

import java.util.List;

public class OrderPageDto {

    private List<OrderPageItemDto> orders;
    public List<OrderPageItemDto> getOrders() {
        return orders;
    }

    public void setOrders(List<OrderPageItemDto> orders) {
        this.orders = orders;
    }

    @Override
    public String toString() {
        return "OrderPageDto{" +
                "orders=" + orders +
                '}';
    }
}

