<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/diary/diary_folder.css'/>"> 
<script type="text/javascript" src='<c:url value="/resources/js/jquery-3.2.1.min.js" />'></script>
<script>
	$(function(){
		var str=$("#select").val();
		$("#type").val(str).prop("selected",true);
	});
</script>
	<input type="hidden" id="select" value="${requestScope.vo.type }">
<form method="post"  action="<c:url value='/diary/update'/>">
	<input type="hidden" name="diary_num" value="${requestScope.vo.diary_num }">
	제목 <input type="text" name="title" value="${requestScope.vo.title }"><br>
	내용 <textarea rows="5" cols="30" name="content">${requestScope.vo.content }</textarea><br>
	공개설정 
	<select name="type" id="type">
		<option value="전체공개">전체공개</option>
		<option value="1촌공개">1촌공개</option>
		<option value="비공개">비공개</option>
	</select><br>
	<input type="submit" value="수정">
</form>
