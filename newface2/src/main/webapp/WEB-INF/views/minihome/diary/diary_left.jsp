<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/diary/diary_left.css?var=223'/>">
<script type="text/javascript" src='<c:url value="/resources/js/jquery-3.2.1.min.js" />'></script>
<input type="hidden" id="diary_folder_num" value="${sessionScope.diary_folder_num }">
<script>
	$(function(){
		$.getJSON("<c:url value='/folder_list'/>",function(data){
			$(data).each(function(i,folder){
				var div="<img alt='폴더사진' src='<c:url value='/resources/images/minihome/folder.PNG'/>'> ";
				var fname=null;
				var diary_folder_num=$("#diary_folder_num").val();
				if(diary_folder_num==folder.diary_folder_num){
					fname="<a href='<c:url value='/diary/list?diary_folder_num=" + folder.diary_folder_num + "'/>' class='folder' id='"+folder.diary_folder_num+"' style='color: red' >" + folder.fname + "</a><br>";
				}else{
					fname="<a href='<c:url value='/diary/list?diary_folder_num=" + folder.diary_folder_num + "'/>' class='folder' id='"+folder.diary_folder_num+"'>" + folder.fname + "</a><br>";					
				}
				$("#diary_folder").append(div + fname);
			});
		});
	});
</script>
<div id="diary_title">
	DIARY ${diary_folder_num } 
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