<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div style="margin-left: 30px;margin-top: 10px;">
		<label style="font-weight:bold;font-size:25px;">공지사항</label>
	</div>
	<ul>
	    <li><a href="<c:url value='/noti/list'/>"style="margin-left:0px;">목록</a></li>
	    <li><a href="<c:url value='/notiadmin_insert'/>">작성</a></li>
	</ul>
