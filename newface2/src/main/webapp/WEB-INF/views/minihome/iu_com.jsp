<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/minihome_profile.css?var=23'/>"> --%>
</head>
<body>
<div id="left_back">
<c:forEach var="vo" items="${requestScope.list }">
	<hr>
	<div class="regdate">${vo.regdate }</div>
	<div class="content">${vo.content }</div>
	<br>
</c:forEach>
</div>
</body>
</html>