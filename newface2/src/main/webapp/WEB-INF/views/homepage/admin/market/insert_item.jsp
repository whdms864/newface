<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/smarteditor/js/HuskyEZCreator.js"/>" charset="utf-8"></script>
	<script type="text/javascript" charset="utf-8" src="<c:url value="/resources/js/writeForm.js"/>"></script>
	<link rel="stylesheet" href="<c:url value="/resources/css/homepage/admin_common.css?ver=12"/>"/>
	<script type="text/javascript" charset="utf-8">
		sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
	</script>
<div align="center">
	<form action="<c:url value='/market/admin/item/insert'/>" method="post" id="frm">
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" id="title" placeholder="제목"></td>
			</tr>
			<tr>
				<td style="margin:0; padding:0;width:100%; height:500px;" colspan="2">
					<textarea name="content" id="smarteditor" rows="10" cols="100">
					</textarea>
				</td>
			</tr>
		</table>
	</form>
</div>