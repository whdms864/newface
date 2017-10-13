<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/smarteditor/js/HuskyEZCreator.js"/>" charset="utf-8"></script>
	<script type="text/javascript" charset="utf-8" src="<c:url value="/resources/js/writeForm.js"/>"></script>
	<link rel="stylesheet" href="<c:url value="/resources/css/common.css?var=24"/>"/>
	<script type="text/javascript" charset="utf-8">
		sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
	</script>
	<script>
		$(function(){
			var str=$("#get_diary_folder_num").val();
			console.log(str);
			$("#folder_num").val(str).prop("selected", true);
			
		});
		$(function(){
			var str=$("#get_type").val();
			$("input[value=" + str + "]").attr("checked", true);
		});
	</script>
<input type="hidden" id="get_diary_folder_num" value="${requestScope.vo.diary_folder_num }">
<input type="hidden" id="get_type" value="${requestScope.vo.type }">
<form action="<c:url value='/diary/update'/>" method="post" id="frm">
<input type="hidden" name="diary_num" value="${requestScope.vo.diary_num }">
	<table>
		<tr>
			<td>
				<select name="diary_folder_num" id="folder_num">
				<c:forEach var="vo" items="${requestScope.folder }">
					<option value="${vo.diary_folder_num }">${vo.fname}</option>
				</c:forEach>
				</select>
			</td>
			<td><input type="text" name="title" id="title" placeholder="제목" value="${requestScope.vo.title }"></td>
		</tr>
		<tr>
			<td style="margin:0; padding:0;" colspan="2"><textarea name="content" id="smarteditor" rows="10" cols="100" style="width:100%; height:360px;">${requestScope.vo.content }</textarea></td>
		</tr>
	</table>
	<span id="type" style="font-size: 16px; font-weight: bold;">설정정보</span> 
	<input type="radio" name="type" value="전체공개">전체공개 
	<input type="radio" name="type" value="1촌공개">1촌공개 
	<input type="radio" name="type" value="비공개">비공개 
	<input id="addBtn" type="submit" value="수정">
</form>
