<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/diary/diary_left.css?var=232'/>">
<script type="text/javascript" src='<c:url value="/resources/js/jquery-3.2.1.min.js" />'></script>
<script>
	$(function(){
		$.getJSON("<c:url value='/folder_list'/>",function(data){
			$(data).each(function(i,folder){
				var div="<img alt='폴더사진' src='<c:url value='/resources/images/minihome/folder.PNG'/>'> ";
				var fname="<a href='<c:url value='/diary/list?diary_folder_num=" + folder.diary_folder_num + "'/>'>" + folder.fname + "</a><br>";
				$("#diary_folder").append(div + fname);
			});
		});
	});
</script>
<div id="diary_title">
	DIARY
</div>
<div id="calender">
	<hr>
	<a href="<c:url value='/diary/folder_all_list'/>">전체보기</a>
</div>
<div id="diary_folder_title">
	<hr>
	다이어리
</div>
<div id="diary_folder"></div>
<div id="diary_folder_set">
	<a href="<c:url value='/diary/folder'/>">폴더 관리하기</a>
</div>
