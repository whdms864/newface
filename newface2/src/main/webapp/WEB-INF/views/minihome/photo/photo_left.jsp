<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/photo/photo_left.css?ver=44'/>">
<script type="text/javascript" src='<c:url value="/resources/js/jquery-3.2.1.min.js" />'></script>
<div id="photo_title">
	PHOTO ALBUM
</div>
<div id="photo_folder">
	<hr>
	<div class="blank"></div>
	<img alt="폴더사진" src="<c:url value='/resources/images/minihome/folder.PNG'/>">
	<a id="all" href="<c:url value='/photo/list'/>">전체보기</a>	
	<hr>	
	<c:forEach var="vo" items="${requestScope.list }">
	<div class="blank"></div>
	<img alt="폴더사진" src="<c:url value='/resources/images/minihome/folder.PNG'/>">
	<a id="${vo.photo_folder_num }" href="<c:url value='/photo/list?photo_folder_num=${vo.photo_folder_num }'/>">${vo.fname }</a>	
	</c:forEach>
	<div id="photo_set">
		<img alt="환경설정" id="setup_img" src="<c:url value='/resources/images/minihome/setup.jpg'/>"> 
		<a id="folder" href="<c:url value='/photo/folder'/>">폴더 설정하기</a>
	</div>
</div>
<input type="hidden" id="folder_photo" value="${sessionScope.folder_photo }">
<script>
	$(function(){
		var folder_photo=$("#folder_photo").val();
		console.log("folder_photo : " + folder_photo);
		if(folder_photo==all){
			$("#all").css("font-weight","900");
		}else if(folder_photo==folder){
			$("#folder").css("font-weight","900");
		}else{
			$("#" + folder_photo).css("font-weight","900");
		}
	});
</script>

