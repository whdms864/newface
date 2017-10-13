<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/setup/setup_left.css'/>">
<div id="setup_title">
	MANAGER
</div>

<div id="minihome_set">
	<hr>
	미니홈피 관리
</div>
<div id="minihome_set_menu">
	<a href="<c:url value='/setup/basic'/>">기본 설정</a><br>
	<a href="<c:url value='/setup/profile'/>">프로필 설정</a><br>
	<a href="<c:url value='/setup/iu'/>">일촌관리</a><br>
</div>
<div id="item_set">
	<hr>
	아이템 관리
</div>
<div id="item_set_menu">
	<a href="<c:url value='/setup/skin'/>">홈피스킨 설정</a><br>
	<a href="<c:url value='/setup/miniroom'/>"">미니룸 설정</a><br>
	<a href="">미니미 설정</a><br>
	<a href="<c:url value='/setup/bgm'/>">음악 설정</a><br>
</div>
