<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/setup/setup_menu.css?var=1'/>"> 
<div id="menu">
	<h3 id="first">메뉴 설정</h3>
	<hr>
	<div class="menu_back">
	<form method="post" action="<c:url value='/setup/menu'/>">
	<input type="checkbox" name="diary" value="1"> 다이어리<br>
	<input type="checkbox" name="photo" value="1"> 사진첩<br>
	<input type="checkbox" name="guest" value="1"> 방명록<br>
	<input type="submit" value="설정">
	</form>
	</div>
	<hr>
	<h3>홈피명설정</h3>
	<hr>
	<div class="menu_back">
	<form method="post" action="<c:url value='/setup/hname'/>">
	<input type="text" name="hname"> 
	<input type="submit" value="변경">
	</form>
	</div>
	<hr>
</div>