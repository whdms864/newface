<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/diary/diary_folder.css'/>"> 
<h2>폴더 생성</h2>
<form method="post" action="<c:url value='/diary/folder_insert'/>">
	이름 <input type="text" name="fname">
	<input type="submit" value="생성">
</form>
<br><hr>
<h2>폴더 이름수정</h2>
<form method="post" action="<c:url value='/diary/folder_update'/>">
	<input type="hidden" name="diary_num" value="${requestScope.diary_num }">
	<select name="diary_folder_num">
	<c:forEach var="vo" items="${requestScope.list }">
		<option value="${vo.diary_folder_num }">${vo.fname}</option>
	</c:forEach>
	</select>
	수정할 이름 <input type="text" name="fname">
	<input type="submit" value="수정">
</form>
<br><hr>
<h2>폴더 삭제</h2>
<form method="post" action="<c:url value='/diary/folder_delete'/>">
	<input type="hidden" name="diary_num" value="${requestScope.diary_num }">
	<select name="diary_folder_num">
	<c:forEach var="vo" items="${requestScope.list }">
		<option value="${vo.diary_folder_num }">${vo.fname}</option>
	</c:forEach>
	</select>
	<input type="submit" value="삭제">
</form>