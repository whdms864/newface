<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/photo/photo_left.css?ver=5'/>">
<div id="photo_title">
	PHOTO ALBUM
</div>
<div id="photo_folder">
	<hr>
	<div class="blank"></div>
	<img alt="폴더사진" src="<c:url value='/resources/images/minihome/folder.PNG'/>">
	<a href="<c:url value='/photo/list'/>">전체보기</a>
	<c:forEach var="vo" items="${requestScope.list }">
	<div class="blank"></div>
	<img alt="폴더사진" src="<c:url value='/resources/images/minihome/folder.PNG'/>">
	<a href="<c:url value='/photo/list?photo_folder_num=${vo.photo_folder_num }'/>">${vo.fname }</a>
	</c:forEach>
	<div id="photo_set">
		<a href="<c:url value='/photo/folder'/>">폴더 설정하기</a>
	</div>
</div>
