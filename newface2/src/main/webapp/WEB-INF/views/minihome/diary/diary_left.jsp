<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/diary_left.css'/>">
<div id="diary_title">
	DIARY
</div>
<div id="calender">
	<hr>
	<a href="">월간달력</a>
</div>
<div id="diary_folder_title">
	<hr>
	다이어리
</div>
<div id="diary_folder">
	<div id="blank"></div>
	<img alt="폴더사진" src="<c:url value='/resources/images/minihome/folder.PNG'/>">
	<a href="<c:url value='/diary/folder?fname=폴더1'/>">폴더1</a>
</div>
<div id="diary_folder_set">
	<a href="diary_folder_set">폴더 관리하기</a>
</div>
