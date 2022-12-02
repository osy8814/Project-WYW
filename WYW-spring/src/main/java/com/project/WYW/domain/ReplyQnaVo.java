package com.project.WYW.domain;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class ReplyQnaVo {

    private int qnaId;

    private int productId;

    private String userId;

    @JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
    private Date createdAt;

    private String content;

    private boolean isAnswered;

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

    @Override
    public String toString() {
        return "ReplyQnaVo{" +
                "qnaId=" + qnaId +
                ", productId=" + productId +
                ", userId='" + userId + '\'' +
                ", createdAt=" + createdAt +
                ", content='" + content + '\'' +
                ", isAnswered=" + isAnswered +
                '}';
    }
}
