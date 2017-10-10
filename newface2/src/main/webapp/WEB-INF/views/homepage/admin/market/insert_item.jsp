<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/smarteditor/js/HuskyEZCreator.js"/>" charset="utf-8"></script>
	<script type="text/javascript" charset="utf-8" src="<c:url value="/resources/js/writeForm.js"/>"></script>
	<link rel="stylesheet" href="<c:url value="/resources/css/homepage/admin_common.css"/>"/>
	<script type="text/javascript" charset="utf-8">
		sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
	</script>
<div align="center">
	<form action="<c:url value='/market/admin/item/insertok'/>" method="post" id="frm">
		<table>
			<tr>
				<td>상품명</td>
				<td><input type="text" name="name" id="name" placeholder="제목"></td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>
					<select name="category_num" style="width:500px;height:25px;">
					<c:forEach var="vo" items="${list }">
						<option value="${vo.category_num}">${vo.name}</option>
					</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="pay" id="pay" placeholder="가격 숫자로만(ex.싸이 OO개)"></td>
			</tr>
			<tr>
				<td style="margin:0; padding:0;" colspan="2">
					<textarea name="content" id="smarteditor" rows="10" cols="100" style="width:100%; height:400px;"></textarea>
				</td>
			</tr>
		</table>
	<div style="position:absolute;top:600px;width: 98%;">
			<div style="background-color: rgba(224, 224, 224, 0.78);width: 100%; height:1px;"></div>
			<input id="addBtn" type="submit" value="등록" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
			border-radius: 4px; background-color: rgb(52, 152, 219);width:120px; height:40px;margin-top:12px;" > 
	</div>
	</form>
</div>