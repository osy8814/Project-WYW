package com.project.WYW.dto;

public class UpdateRatingDto {

    private int productId;

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public double getRatingAvg() {
        return ratingAvg;
    }

    public void setRatingAvg(double ratingAvg) {
        this.ratingAvg = ratingAvg;
    }

    private double ratingAvg;

    @Override
    public String toString() {
        return "UpdateRatingDto{" +
                "productId=" + productId +
                ", ratingAvg=" + ratingAvg +
                '}';
    }
}
