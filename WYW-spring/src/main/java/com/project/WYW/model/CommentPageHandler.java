package com.project.WYW.model;

public class CommentPageHandler {


    private int totalCnt; // 총 댓글 게시물 갯수
    private int totalPage; // 전체 페이지 갯수
    private int pageSize; // 한 페이지의 크기
    private int naviSize = 10; // 페이지 내비게이션의 크기
    private int page; // 현재 페이지
    private int beginPage; // 내비게이션 첫번째 페이지
    private int endPage; // 내비게이션 마지막 페이지
    private boolean showPrev; //이전 페이지로 이동하는 링크
    private boolean showNext; //다음 페이지로 이동하는 링크

    private  CommentSearchCondition csc;

    public int getTotalCnt() {
        return totalCnt;
    }

    public void setTotalCnt(int totalCnt) {
        this.totalCnt = totalCnt;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getNaviSize() {
        return naviSize;
    }

    public void setNaviSize(int naviSize) {
        this.naviSize = naviSize;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getBeginPage() {
        return beginPage;
    }

    public void setBeginPage(int beginPage) {
        this.beginPage = beginPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public boolean isShowPrev() {
        return showPrev;
    }

    public void setShowPrev(boolean showPrev) {
        this.showPrev = showPrev;
    }

    public boolean isShowNext() {
        return showNext;
    }

    public void setShowNext(boolean showNext) {
        this.showNext = showNext;
    }

    public CommentSearchCondition getCsc() {
        return csc;
    }

    public void setCsc(CommentSearchCondition csc) {
        this.csc = csc;
    }

    public CommentPageHandler(int totalCnt, int page){
        this(totalCnt,page,4);
    }

    public CommentPageHandler(int totalCnt, int page, int pageSize){
        this.totalCnt = totalCnt;
        this.page = page;
        this.pageSize = pageSize;

        totalPage = (int)Math.ceil(totalCnt/(double)pageSize);
        beginPage = (page-1) / naviSize * naviSize + 1;
        endPage = Math.min(beginPage + naviSize-1,totalPage);
        showPrev = beginPage !=1;
        showNext = endPage != totalPage;
//        Math.min(beginPage + naviSize-1,totalPage);

    }

    public CommentPageHandler(int totalCnt, CommentSearchCondition csc){
        this.totalCnt = totalCnt;
        this.csc = csc;

        doPaging(totalCnt,csc);
    }


    public void doPaging(int totalCnt, CommentSearchCondition csc){
        this.totalCnt = totalCnt;


        totalPage =(int)Math.ceil(totalCnt /(double)csc.getCommentPageSize());
        beginPage = (csc.getCommentPage()-1) / naviSize * naviSize +1;
        endPage =Math.min(beginPage + naviSize-1,totalPage);
        showPrev = beginPage !=1;
        showNext = endPage != totalPage;


    }

    void print(){
        System.out.println("page"+page);
        System.out.print(showPrev ? "[PREV]": "");
        for(int i = beginPage; i<=endPage; i++){
            System.out.print(i+" ");
        }
        System.out.println(showNext ? "[NEXT]": "");
    }

    @Override
    public String toString() {
        return "CommentPageHandler{" +
                "totalCnt=" + totalCnt +
                ", totalPage=" + totalPage +
                ", pageSize=" + pageSize +
                ", naviSize=" + naviSize +
                ", page=" + page +
                ", beginPage=" + beginPage +
                ", endPage=" + endPage +
                ", showPrev=" + showPrev +
                ", showNext=" + showNext +
                ", csc=" + csc +
                '}';
    }
}
