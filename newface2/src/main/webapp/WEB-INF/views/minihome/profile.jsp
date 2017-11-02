<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/minihome_profile.css?var=43'/>">
</head>
<body>
<div id="left_back">
<c:forEach var="vo" items="${requestScope.profile_list }">
	<hr>
	<div id="regdate">${vo.regdate }</div>
	<div id="profile">
		<c:choose>
			<c:when test="${vo.save_name==null }">
				<img alt="프로필사진" class="photo" src="<c:url value='/resources/images/minihome/profile.PNG'/>">			
			</c:when>
			<c:otherwise>
				<img alt="프로필사진" class="photo" src="<c:url value='/resources/upload/${vo.save_name }'/>">
			</c:otherwise>
		</c:choose>
	</div>
	<div id="todayis">today is ${vo.todayis }</div>
	<div id="content">
		${vo.content }
	</div>
	<br>
</c:forEach>
</div>
</body>
</html>