package com.project.WYW.dto;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class ReplyQnaDto {

    private int qnaId;

    private int productId;

    private String productName;
    private String userId;

    @JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
    private Date createdAt;

    private String content;

    private boolean isAnswered;

    private boolean isDeleted;

    public int getQnaId() {
        return qnaId;
    }

    public void setQnaId(int qnaId) {
        this.qnaId = qnaId;
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

    public boolean isAnswered() {
        return isAnswered;
    }

    public void setAnswered(boolean answered) {
        isAnswered = answered;
    }

    public boolean isDeleted() {
        return isDeleted;
    }

    public void setDeleted(boolean deleted) {
        isDeleted = deleted;
    }

    @Override
    public String toString() {
        return "ReplyQnaDto{" +
                "qnaId=" + qnaId +
                ", productId=" + productId +
                ", productName=" + productName +
                ", userId='" + userId + '\'' +
                ", createdAt=" + createdAt +
                ", content='" + content + '\'' +
                ", isAnswered=" + isAnswered +
                ", isDeleted=" + isDeleted +
                '}';
    }
}
