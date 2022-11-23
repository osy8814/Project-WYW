package com.project.WYW.model;

public class Pagehandler {

    private int pageNum;
    private int amount;
    private int skip;
    private String type;
    private String keyword;
    private String order;

    private String category;
    public Pagehandler(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
        this.skip = (pageNum -1) * amount;
    }

    public Pagehandler(){
        this(1,10);
    }
    public String[] getTypeArr() {
        return type == null? new String[] {}:type.split("");
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
        this.skip = (pageNum-1) * this.amount;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
        this.skip = (this.pageNum-1) * this.amount;
    }

    public int getSkip() {
        return skip;
    }

    public void setSkip(int skip) {
        this.skip = skip;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Pagehandler{" +
                "pageNum=" + pageNum +
                ", amount=" + amount +
                ", skip=" + skip +
                ", type='" + type + '\'' +
                ", keyword='" + keyword + '\'' +
                ", order='" + order + '\'' +
                ", category='" + category + '\'' +
                '}';
    }
}
