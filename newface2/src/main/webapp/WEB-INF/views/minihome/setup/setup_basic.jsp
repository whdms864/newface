<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/setup/setup_menu.css?var=1'/>"> 
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
<script>
	$(function(){
		var diary=$("#diary1").val();
		var photo=$("#photo1").val();
		var guest=$("#guest1").val();
		var jukebox=$("#jukebox1").val();
		if(diary==1) $("input[name=diary]").prop("checked",true);
		if(photo==1) $("input[name=photo]").prop("checked",true);
		if(guest==1) $("input[name=guest]").prop("checked",true); 
		if(jukebox==1) $("input[name=jukebox]").prop("checked",true); 
	});
</script>
<input type="hidden" id="diary1" value="${requestScope.vo.diary }">
<input type="hidden" id="photo1" value="${requestScope.vo.photo }">
<input type="hidden" id="guest1" value="${requestScope.vo.guest }">
<input type="hidden" id="jukebox1" value="${requestScope.vo.jukebox }">
<div id="menu">
	<h3 id="first">메뉴 설정</h3>
	<hr>
	<div class="menu_back">
	<form method="post" action="<c:url value='/setup/menu'/>">
	<input type="checkbox" name="diary" value="1"> 다이어리<br>
	<input type="checkbox" name="photo" value="1"> 사진첩<br>
	<input type="checkbox" name="guest" value="1"> 방명록<br>
	<input type="checkbox" name="jukebox" value="1"> 쥬크박스<br>
	<input type="submit" value="설정">
	</form>
	</div>
	<hr>
	<h3>홈피명설정</h3>
	<hr>
	<div class="menu_back">
	<form method="post" action="<c:url value='/setup/hname'/>">
	<input type="text" name="hname" value="${requestScope.hname }"> 
	<input type="submit" value="변경">
	</form>
	</div>
	<hr>
</div>