<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<title>홈 (1 of 4)</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/minihome.css'/>">
</head>
<body>
<div id="webView">
	<div id="skin_back">
		<div id="skin"></div>
	</div>
	<div id="profile_skin_back">
		<div id="profile_skin">
			<tiles:insertAttribute name="left"/>		
		</div>		
	</div>
	<div id="main_skin_back">
		<div id="main_skin">
			<tiles:insertAttribute name="content"/>
		</div>
	</div>

	<div id="today_back">
		today
		<div id="today">1234</div>
	</div>
	<div id="total">total 1234</div>
	<div id="hname_back">
		<div id="hname">
			미니홈피 <a id="hname_edit" href="">edit</a>
		</div>
	</div>
	
	<div id="setup">
		<div class="menu">
			<a href="<c:url value='/minihome'/>">홈</a>
		</div>
	</div>
	<div id="diary">
		<div class="menu">
			<a href="<c:url value='/diary/folder_all_list'/>">다이어리</a>
		</div>
	</div>
	<div id="photo">
		<div class="menu">
			<a href="<c:url value='/photo'/>">사진첩</a>
		</div>
	</div>
	<div id="guestbook">
		<div class="menu">
			<a href="<c:url value='/guestbook'/>">방명록</a>
		</div>
	</div>
	<div id="set">
		<div class="menu">
			<a href="<c:url value='/setup'/>">설정</a>
		</div>
	</div>		
</div>
</body>
</html>