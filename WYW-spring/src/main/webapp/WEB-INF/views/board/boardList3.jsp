<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<c:set var="loginId" value="${sessionScope.loggedInUser.userId}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Xanh+Mono&display=swap');
 /* 전체 레이아웃 */
/*-----------------------------------------------*/
.main-page__all{
  width: 1300px;
  height: 700px;
  margin: auto;
  display: flex;
  flex-direction: column;
}
.main-page__top{
  width: 1300px;
  height: 500px;
  border-bottom: 0.8px solid rgb(228, 225, 225);
  
}
.main-page__mid{
  width: 1300px;
  height: 100px;
  display: flex;
  align-items: center;
}
.main-page__Bottom{
  width: 1300px;
  height: 100px;
  display: flex;
}


/* top  */
/* ----------------------------------------------- */
table{
    border-collapse: collapse;
}
th, tr{
    height: 40px;
}
.title_top{
  width: 1300px;
  height: 40px;
  color: rgb(148, 144, 144);
  font-size: 20px;
 font-family: 'Xanh Mono', monospace;
}
.title_mid{
  width: 1280.4px;
  height: 50px;
  padding-left:20px ;
  display: flex;
  align-items: center;
  font-size: 15px;
 
}
#nav_No, #nav_No_Value{
  width: 100px;
  padding-top:10px;
  text-align: center;
  border-bottom: 0.8px solid rgb(228, 225, 225);
}
#nav_SUBJECT, #nav_SUBJECT_Value{
  width: 1000px;
  border-bottom: 0.8px solid rgb(228, 225, 225);
}
    a{
        color:#6f6f6f ;
    }

#nav_WRITER, #nav_WRITER_Value{
  width: 100px;
  text-align: center;
  border-bottom: 0.8px solid rgb(228, 225, 225);
}
#nav_DATE, #nav_DATE_Value{
  width: 100px;;
  text-align: center;
  border-bottom: 0.8px solid rgb(228, 225, 225);
}
#nav_VIEWS, #nav_VIEWS_Value{
  width: 100px;
  text-align: center;
  border-bottom: 0.8px solid rgb(228, 225, 225);
}

/* mid */
/* ----------------------------------------------- */
.button{
width: 1300px;
height: 35px ;
display: flex;
justify-content: center;
}
#btn_left{
  height: 35px;
  width: 35px;
  border:0.1px solid rgba(158, 156, 156, 0.479);
  background: url(${pageContext.request.contextPath}/img/btn_left.png) no-repeat center/cover ;
  background-size: cover;
  background-position: center;
}
#btn_mid{
  height: 35px;
  width: 35px;
  border:1px solid rgba(158, 156, 156, 0.479);
  font-size: 20px;
  font-weight: bold;
  color:gray ;
  display: flex;
  justify-content: center;
  align-items: center;
  
}
#btn_right{
  height: 35px;
  width: 35px;
  border:1px solid rgba(158, 156, 156, 0.479);
  background: url(${pageContext.request.contextPath}/img/btn_right.png) no-repeat center/cover ;
}

/* bottom */
/*-----------------------------------------------*/
.Search_word{
  margin-top: 15px;
  width: 70px;
  height: 20px;
  font-size: 13px;
}
.main-page__Bottom_box{
  width: 420px;
  height: 50px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

#search_input{
  height: 25px;
  border:1px solid rgba(158, 156, 156, 0.479);
  
}
select{
  width: 75px;
  height: 25px;
  border:1px solid rgba(158, 156, 156, 0.479);
}

button{
  padding-bottom: 4px;
  width: 77px;
  height:25px ;
  background-color: rgba(68, 64, 64, 0.644);
  color: white;
  border: none;
  border-radius: 2px;

}


    </style>
</head>
<body>
<jsp:include page="../index_top.jsp"/>




<script>
    let msg = "${msg}";
    if(msg=="LIST_ERR")  alert("게시물 목록을 가져오는데 실패했습니다. 다시 시도해 주세요.");
    if(msg=="READ_ERR")  alert("삭제되었거나 없는 게시물입니다.");
    if(msg=="DEL_ERR")   alert("삭제되었거나 없는 게시물입니다.");
    if(msg=="DEL_OK")    alert("성공적으로 삭제되었습니다.");
    if(msg=="WRT_OK")    alert("성공적으로 등록되었습니다.");
    if(msg=="MOD_OK")    alert("성공적으로 수정되었습니다.");
</script>



  <div>
    <div class="main-page__all">
		<div class="main-page__top">
         <table>
            <thead>
          	 <tr class="title_top">
                <th id="nav_No">No</th>
                <th id="nav_SUBJECT">NOTICE</th>
                <th id="nav_WRITER">WRITER</th>
                <th id="nav_DATE">DATE</th>
                <th id="nav_VIEWS">VIEWS</th>
          	  </tr>
            </thead>
       			<c:forEach var="NoticeDto" items="${list1}">
           <tbody>
                <tr>
                    <td id="nav_No_Value">${NoticeDto.bno}</td>
                    <td id="nav_SUBJECT_Value"><a href="<c:url value="/board3/read3${ph.sc.queryString}&bno=${NoticeDto.bno}"/>"><c:out value="${NoticeDto.title}${NoticeDto.comment_cnt==0 ? '':[NoticeDto.comment_cnt]}"/></a></td>
                    <td id="nav_WRITER_Value">${NoticeDto.writer}</td>
                    <c:choose>
                        <c:when test="${NoticeDto.reg_date.time >= startOfToday}">
                            <td class="regdate" id="nav_DATE_Value"><fmt:formatDate value="${NoticeDto.reg_date}" pattern="HH:mm" type="time"/></td>
                        </c:when>
                        <c:otherwise>
                            <td class="regdate" id="nav_DATE_Value"><fmt:formatDate value="${NoticeDto.reg_date}" pattern="yyyy-MM-dd" type="date"/></td>
                        </c:otherwise>
                    </c:choose>
                    <td id="nav_VIEWS_Value">${NoticeDto.view_cnt}</td>
                </tr>
           </tbody>
           		</c:forEach>
        </table>
        </div>
        
        
        <br>
        <div class="main-page__mid">
            <div class="button">
                <c:if test="${totalCnt==null || totalCnt==0}">
                    <div> 게시물이 없습니다. </div>
                </c:if>
                <c:if test="${totalCnt!=null && totalCnt!=0}">
                    <c:if test="${ph.showPrev}">
                        <a id="btn_left" href="<c:url value="/board3/list3${ph.sc.getQueryString(ph.beginPage-1)}"/>"></a>
                    </c:if>
                    <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                        <a id="btn_mid" ${i==ph.sc.page? "paging-active" : ""}" href="<c:url value="/board3/list3${ph.sc.getQueryString(i)}"/>">${i}</a>
                    </c:forEach>
                    <c:if test="${ph.showNext}">
                        <a id="btn_right" href="<c:url value="/board3/list3${ph.sc.getQueryString(ph.endPage+1)}"/>"></a>
                    </c:if>
                </c:if>
            </div>
        </div>
    
    
         <div class="main-page__Bottom">
          <div class="Search_word">
          	<label>검색어</label>
      	  </div>
      	   <div class="main-page__Bottom_box">  
            <form action="<c:url value="/board3/list3"/>" class="search-form" method="get">
                <select class="search-option" name="option">
                    <option value="A" ${ph.sc.option=='A' || ph.sc.option=='' ? "selected" : ""}>제목+내용</option>
                    <option value="T" ${ph.sc.option=='T' ? "selected" : ""}>제목만</option>
                    <option value="W" ${ph.sc.option=='W' ? "selected" : ""}>작성자</option>
                </select>
                <input id="search_input" type="text" name="keyword" class="search-input" type="text" value="${ph.sc.keyword}" placeholder="검색어를 입력해주세요">
                <button type="submit" class="search-button" value="찾기">찾기</button> 
            </form>
            <button id="writeBtn" class="btn-write" onclick="location.href='<c:url value="/board3/write3"/>'">글쓰기</button>
       	 </div>
        </div>  
    </div>
</div>


<script>
    let loginId = "${loginId}";
    if(loginId=="admin"){
        $(".btn-write").show();
    } else{
        $(".btn-write").hide();
    }
</script>



<jsp:include page="../index_bottom.jsp"/>

</body>
</html>