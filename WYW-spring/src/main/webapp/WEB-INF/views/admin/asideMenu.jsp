<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>


<!-- 네비영역 -->
<div class="admin_navi_wrap">
    <ul>
        <li>
            <a href="<c:url value="/admin/productsReg"/>" class="admin_list_01"><i
                    class="far fa-clipboard"></i>
                상품 등록</a>
        </li>
        <li>
            <a href="<c:url value="/admin/productslist"/>" class="admin_list_02"><i
                    class="fas fa-list"></i>상품 목록</a>
        </li>
        <lI>
            <a href="<c:url value="/admin/category"/>" class="admin_list_03"><i
                    class="fas fa-bezier-curve"></i>카테고리 등록</a>
        </lI>
        <lI>
            <a href="<c:url value="/admin/categoryManage"/>" class="admin_list_04"><i
                    class="fas fa-scroll"></i>카테고리 관리</a>
        </lI>
        <lI>
            <a href="<c:url value="/admin/orderlist"/>" class="admin_list_05"><i
                    class="fas fa-truck"></i>배송 관리</a>
        </lI>
        <lI>
            <a href="<c:url value="/admin/membermanagement"/>" class="admin_list_06"><i class="fas fa-users-cog"></i>회원 관리</a>
        </lI>
    </ul>

</div>
