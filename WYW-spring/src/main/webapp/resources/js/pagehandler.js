let moveForm = $('#moveForm');

/* 페이지 이동 버튼 */
$(".pageMarker_btn a").on("click", function(e) {

    e.preventDefault();

    moveForm.find("input[name='pageNum']").val($(this).attr("href"));

    moveForm.submit();
});

let searchForm = $('#searchForm');

$("#searchForm button").on("click", function(e){

    e.preventDefault();

    /* 검색 키워드 유효성 검사 */
    if(!searchForm.find("input[name='keyword']").val()){
        alert("키워드를 입력하십시오");
        return false;
    }

    searchForm.find("input[name='pageNum']").val("1");

    searchForm.submit();

});

let topSearchForm = $('#searchForm');

$("#searchForm button").on("click", function(e){

    e.preventDefault();

    /* 검색 키워드 유효성 검사 */
    if(!topSearchForm.find("input[name='keyword']").val()){
        alert("키워드를 입력하십시오");
        return false;
    }

    topSearchForm.find("input[name='pageNum']").val("1");

    topSearchForm.submit();

});