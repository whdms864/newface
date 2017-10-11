<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/setup/setup_profile.css?var=23'/>"> 
<div id="setup_profile_back">
	<h3 id="first">프로필 사진설정</h3>
	<hr>
	<div class="profile_back">
	<form method="post" action="<c:url value='/setup/profile_photo'/>" enctype="multipart/form-data">
		이름 <input type="file" name="file1">
		<input type="submit" value="변경">
	</form>
	</div>
	<hr>
	<h3>프로필 자기소개 설정</h3>
	<hr>
	<div class="profile_back">
	<%@ page session="false" %>
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/smarteditor/js/HuskyEZCreator.js"/>" charset="utf-8"></script>
	<script type="text/javascript" charset="utf-8" src="<c:url value="/resources/js/writeForm2.js"/>"></script>
	<script type="text/javascript" charset="utf-8">
		sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
	</script>
<form action="<c:url value='/setup/profile_content'/>" method="post" id="frm">
	<table>
		<tr>
			<td style="margin:0; padding:0;" colspan="2"><textarea name="content" id="smarteditor" rows="10" cols="100" style="width:100%; height:360px;"></textarea></td>
		</tr>
		<tr>
			<td><input id="addBtn" type="submit" value="등록"></td>
		</tr>
	</table>	
</form>
	</div>
	<hr>
	<h3>프로필 기분상태 설정</h3>
	<hr>
	<div class="profile_back">
	<form method="post" action="<c:url value='/setup/profile_todayis'/>">
		<span id="todayis" style="font-size: 16px; font-weight: bold;">기분상태</span> 
		<input type="radio" name="todayis" value="좋음" checked="checked">좋음 
		<input type="radio" name="todayis" value="보통">보통 
		<input type="radio" name="todayis" value="나쁨">나쁨 
		<input  type="submit" value="등록">
		<input type="submit" value="삭제">
	</form>
	</div>
	<hr>
</div>