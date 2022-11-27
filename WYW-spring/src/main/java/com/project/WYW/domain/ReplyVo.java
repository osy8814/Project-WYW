package com.project.WYW.domain;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class ReplyVo {

    private int replyId;

    private int productId;

    private String userId;

    @JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
    private Date createdAt;

    private String content;

    private double rating;

    public int getReplyId() {
        return replyId;
    }

    public void setReplyId(int replyId) {
        this.replyId = replyId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    @Override
    public String toString() {
        return "ReplyVo{" +
                "replyId=" + replyId +
                ", productId=" + productId +
                ", userId='" + userId + '\'' +
                ", createdAt=" + createdAt +
                ", content='" + content + '\'' +
                ", rating=" + rating +
                '}';
    }
}
