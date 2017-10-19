<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/minihome_iu_com.css?var=12'/>">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="left_back">
<span id="triangle">▶</span><span id="name">${requestScope.name }</span>님의 일촌평 히스토리
<c:forEach var="vo" items="${requestScope.list }">
	<hr>
	<div class="regdate">${vo.regdate }</div>
	<div class="content">${vo.content }</div>
	<br>
</c:forEach>
</div>
</body>
</html>