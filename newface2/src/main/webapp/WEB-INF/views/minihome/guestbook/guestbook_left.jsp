<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/minihome_left.css'/>">
<div id="left_back">
	<div id="profile">
		<img alt="프로필사진" src="<c:url value='/resources/images/minihome/profile.PNG'/>">
	</div>
	<div id="todayis">today is 기쁨</div>
	<div id="content">
		<p>자기소개가 없습니다</p>
	</div>
	<div id="edit">
		<a href="">edit</a> 
		<a href="">history</a>
	</div>
	<div id="member">
		<div id="name">홍길동</div>
		<div id="gender">♂♀</div>
		<div id="email">song@daum.net</div>
	</div>
	<div id="iu">
		<select style="width: 150px; height: 30px;">
			<option>파도타기</option>
			<option>일촌1</option>
			<option>일촌2</option>
		</select>
	</div>
</div>