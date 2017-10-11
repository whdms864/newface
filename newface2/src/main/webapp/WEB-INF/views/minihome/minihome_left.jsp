<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/minihome_left.css?var=2'/>">
<div id="left_back">
	<div id="profile">
		<c:choose>
			<c:when test="${requestScope.vo.save_name==null }">
				<img alt="프로필사진" class="photo" src="<c:url value='/resources/images/minihome/profile.PNG'/>">			
			</c:when>
			<c:otherwise>
				<img alt="프로필사진" class="photo" src="<c:url value='/resources/upload/${requestScope.vo.save_name }'/>">
			</c:otherwise>
		</c:choose>
	</div>
	<div id="todayis">today is ${requestScope.vo.todayis }</div>
	<div id="content">
		${requestScope.vo.content }
	</div>
	<div id="edit">
		<a href="">edit</a> 
		<a href="">history</a>
	</div>
	<div id="member">
		<div id="name">${requestScope.member.name }</div>
		<div id="email">${requestScope.member.email }</div>
	</div>
	<div id="iu">
		<select style="width: 150px; height: 30px;">
			<option>파도타기</option>
			<option>일촌1</option>
			<option>일촌2</option>
		</select>
	</div>
</div>