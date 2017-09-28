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
	<script>
		$(function(){
			var str=$("#select").val();
			$("#type").val(str).prop("selected",true);
		});
	</script>
<input type="hidden" id="select" value="${requestScope.vo.type }">
<form action="<c:url value='/diary/update'/>" method="post" id="frm">
<input type="hidden" name="diary_num" value="${requestScope.vo.diary_num }">
	<table>
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" id="title" placeholder="제목" value="${requestScope.vo.title }"></td>
		</tr>
		<tr>
			<td style="margin:0; padding:0;" colspan="2"><textarea name="content" id="smarteditor" rows="10" cols="100" style="width:100%; height:302px;">${requestScope.vo.content }</textarea></td>
		</tr>
	</table>
	<select name="type" id="type">
		<option value="전체공개">전체공개</option>
		<option value="1촌공개">1촌공개</option>
		<option value="비공개">비공개</option>
	</select>
	<input id="addBtn" type="submit" value="전송">
</form>
