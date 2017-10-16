<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/setup/setup_left.css?var=2'/>">
<div id="setup_title">
	MANAGER
</div>

<div id="minihome_set">
	<hr>
	미니홈피 관리
</div>
<div id="minihome_set_menu">
	<a href="<c:url value='/setup/basic'/>" class="setup_menu">기본 설정</a><br>
	<a href="<c:url value='/setup/profile'/>" class="setup_menu">프로필 설정</a><br>
	<a href="<c:url value='/setup/iu'/>" class="setup_menu">일촌관리</a><br>
</div>
<div id="item_set">
	<hr>
	아이템 관리
</div>
<div id="item_set_menu">
	<a href="<c:url value='/setup/skin'/>" class="setup_menu">홈피스킨 설정</a><br>
	<a href="<c:url value='/setup/miniroom'/>" class="setup_menu">미니룸 설정</a><br>
	<a href="<c:url value='/setup/minime?id=${requestScope.id }'/>" class="setup_menu">미니미 설정</a><br>
	<a href="<c:url value='/setup/bgm'/>" class="setup_menu">음악 설정</a><br>
</div>
