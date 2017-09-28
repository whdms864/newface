<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/smarteditor/js/HuskyEZCreator.js"/>" charset="utf-8"></script>
	<script type="text/javascript" charset="utf-8" src="<c:url value="/resources/js/writeForm.js"/>"></script>
	<link rel="stylesheet" href="<c:url value="/resources/css/common.css"/>"/>
	<script type="text/javascript" charset="utf-8">
		sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
	</script>
<form action="<c:url value='/diary/insert'/>" method="post" id="frm">
<input type="hidden" name="diary_folder_num" value="${requestScope.diary_folder_num }">
	<table>
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" id="title" placeholder="제목"></td>
		</tr>
		<tr>
			<td style="margin:0; padding:0;" colspan="2"><textarea name="content" id="smarteditor" rows="10" cols="100" style="width:100%; height:412px;"></textarea></td>
		</tr>
	</table>
	<select name="type" style="height: 20px; ">
		<option value="전체공개">전체공개</option>
		<option value="1촌공개">1촌공개</option>
		<option value="비공개">비공개</option>
	</select>
	<input id="addBtn" type="submit" value="전송">
</form>
