<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div style="margin-left: 30px;margin-top: 10px;">
		<label style="font-weight:bold;font-size:25px;">마켓관리</label>
	</div>
	<ul>
	    <li><a href="<c:url value='/market/admin/item/list'/>"style="margin-left:0px;">상품목록</a></li>
	    <li><a href="<c:url value='/market/admin/item/insert'/>">상품등록</a></li>
	    <li><a href="<c:url value='/market/admin/cate/list'/>">카테고리관리</a></li>
	</ul>
