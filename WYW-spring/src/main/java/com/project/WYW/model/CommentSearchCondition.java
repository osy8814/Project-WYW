package com.project.WYW.model;

import org.springframework.web.util.UriComponentsBuilder;

import static java.lang.Math.max;
import static java.lang.Math.min;
import static java.util.Objects.requireNonNullElse;

public class CommentSearchCondition {
    private Integer commentPage = 1;
    private Integer commentPageSize = DEFAULT_PAGE_SIZE;
    private String  option = "";
    private String  keyword = "";
//    private Integer  offset;

    public static final int MIN_PAGE_SIZE = 5;
    public static final int DEFAULT_PAGE_SIZE = 5; // 제한을 500개
    public static final int MAX_PAGE_SIZE = 50;

    public CommentSearchCondition(){}

    public CommentSearchCondition(Integer page, Integer pageSize) {
        this(page, pageSize, "", "");
    }

    public CommentSearchCondition(Integer commentPage, Integer commentPageSize, String option, String keyword) {
        this.commentPage = commentPage;
        this.commentPageSize = commentPageSize;
        this.option = option;
        this.keyword = keyword;
    }



    public String getQueryString() {
        return getQueryString(commentPage);
    }

    public String getQueryString(Integer commentPage) {
        // ?page=10&pageSize=10&option=A&keyword=title
        return UriComponentsBuilder.newInstance()
                .queryParam("commentPage",     commentPage)
                .queryParam("commentPageSize", commentPageSize)
                .queryParam("option",   option)
                .queryParam("keyword",  keyword)
                .build().toString();
    }
    public Integer getCommentPage() {
        return commentPage;
    }

    public void setCommentPage(Integer commentPage) {
        this.commentPage = commentPage;
    }

    public Integer getCommentPageSize() {
        return commentPageSize;
    }

    public void setCommentPageSize(Integer commentPageSize) {
        this.commentPageSize = requireNonNullElse(commentPageSize, DEFAULT_PAGE_SIZE);

        // MIN_PAGE_SIZE <= pageSize <= MAX_PAGE_SIZE
        this.commentPageSize = max(MIN_PAGE_SIZE, min(this.commentPageSize, MAX_PAGE_SIZE));
    }

    public String getOption() {
        return option;
    }

    public void setOption(String option) {
        this.option = option;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public Integer getOffset() {
        return (commentPage-1)*commentPageSize;
    }

    @Override
    public String toString() {
        return "SearchCondition{" +
                "commentPage=" + commentPage +
                ",commentPageSize=" + commentPageSize +
                ", option='" + option + '\'' +
                ", keyword='" + keyword + '\'' +
                '}';
    }
}