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
	<form action="<c:url value=''/>" method="post">
		<table>
			
			<tr>
				<td>타입	</td>
				<td>
					<select name="type" style="width:500px;height:25px;">
						<option value="1">광고1</option>
						<option value="2">광고2</option>
					</select>
				</td>
			</tr>
			<tr>
				<td style="margin:0; padding:0;" colspan="2">
					<textarea name="ad_img" id="smarteditor" rows="1" cols="100" style="width:100%;">${vo.item_img }</textarea>
				</td>
			</tr>
			<tr>
				<td>url</td>
				<td><input type="text" name="url"></td>
			</tr>
			
		</table>
	<div style="position:absolute;top:600px;width: 100%;">
			<div style="background-color: rgba(224, 224, 224, 0.78);width: 100%; height:1px;"></div>
			<input type="submit" value="등록" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
			border-radius: 4px; background-color: rgb(52, 152, 219);width:120px; height:40px;margin-top:12px;" > 
	</div>
	</form>
</div>