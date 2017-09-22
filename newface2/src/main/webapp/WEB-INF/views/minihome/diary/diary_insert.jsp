<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/diary/diary_folder.css'/>"> 
<form method="post"  action="<c:url value='/diary/insert'/>">
	제목 <input type="text" name="title"><br>
	내용 <textarea rows="5" cols="30" name="content"></textarea><br>
	공개설정 
	<select name="type">
		<option value="전체공개">전체공개</option>
		<option value="1촌공개">1촌공개</option>
		<option value="비공개">비공개</option>
	</select><br>
	<input type="submit" value="작성">
</form>
