<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<div id="test">
	<h3>메뉴설정</h3>
	<form method="post" action="<c:url value='/setup/menu'/>">
	<input type="checkbox" name="diary" value="1"> 다이어리<br>
	<input type="checkbox" name="photo" value="1"> 사진첩<br>
	<input type="checkbox" name="guest" value="1"> 방명록<br>
	<input type="submit" value="설정">
	</form>
</div>