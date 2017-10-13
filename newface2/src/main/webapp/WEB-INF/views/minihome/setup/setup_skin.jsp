<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/setup/setup_skin.css?ver=35'/>"> 
<script type="text/javascript" src='<c:url value="/resources/js/jquery-3.2.1.min.js" />'></script>
<script>
	$(function(){
		$("#skin_list").change(function(){
			var item_num=$("#skin_list").find(":selected").val();
			$.getJSON("<c:url value='/setup/item_img'/>",{"item_num":item_num},function(data){
				$(".back_img").html("<span class='back_img'>" + data.item_img + "</span>");
			});
		});
		$("#btn").click(function(){
			var item_num=$("#skin_list").find(":selected").val();
			$.getJSON("<c:url value='/setup/skin_update'/>",{"item_num":item_num},function(data){
				if(data.n>0){
					alert("스킨 변경이 완료되었습니다");
					$("#webView").css("background-image",data.item_img);
				}else{
					alert("오류로 인하여 스킨 변경을 하지 못했습니다");
				}
			});
		});
	});
</script>
<div id="setup_iu_back">
	<h3 id="first">미니룸</h3>
	<hr>
	<div class="iu_back">
	<select id="skin_list">
	<c:forEach var="vo" items="${requestScope.list }">
		<option class="choice" value="${vo.item_num }">${vo.name }</option>
	</c:forEach>
	</select>
	<input type="button" id="btn" value="적용">
		<div class="back_img" style=""></div>
	</div>
	<hr>
</div>