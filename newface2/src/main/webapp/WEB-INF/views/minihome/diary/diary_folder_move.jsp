<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/diary/diary_folder.css'/>"> 
<h2>${requestScope.fname } 폴더이동</h2>
<form method="post" action="<c:url value='/diary/folder_move'/>">
	<input type="hidden" name="diary_num" value="${requestScope.diary_num }">
	<select name="diary_folder_num">
	<c:forEach var="vo" items="${requestScope.list }">
		<option value="${vo.diary_folder_num }">${vo.fname}</option>
	</c:forEach>
	</select>
	<input type="submit" value="생성">
</form>
