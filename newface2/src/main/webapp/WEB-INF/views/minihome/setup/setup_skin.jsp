<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/setup/setup_skin.css?ver=33'/>"> 
<script type="text/javascript" src='<c:url value="/resources/js/jquery-3.2.1.min.js" />'></script>
<div id="test">
	<h3>스킨설정</h3>
	<a id="in_skin">안쪽 스킨</a><br>
	<a id="out_skin">바깥 스킨</a><br>
	<a id="menu_skin">메뉴 스킨</a><br>
	<script>
		$("#in_skin").click(function(){
			$("#webView").css("background-color","pink");
		});
		$("#out_skin").click(function(){
			$("#skin").css("background-color","red");
		});
		$("#menu_skin").click(function(){
			$(".menu").css("background-color","yellow");
		});
	</script>
</div>