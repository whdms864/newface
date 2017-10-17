<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/setup/setup_minime.css?var=14'/>"> 
<script type="text/javascript" src='<c:url value="/resources/js/jquery-3.2.1.min.js" />'></script>
<script>
	$(function(){
		$("#minime_list").change(function(){
			var item_num=$("#minime_list").find(":selected").val();
			$.getJSON("<c:url value='/setup/item_img'/>",{"item_num":item_num},function(data){
				$("#back_img").html(data.item_img);
			});
		});
	});
</script>
<div id="setup_miniroom_back">
	<h3 id="title">미니미</h3> 
	<form method="post" action="<c:url value='/setup/minime_update'/>">
	<input type="hidden" name="id" value="${requestScope.id }">
	<select id="minime_list" name="item_num">
		<c:forEach var="vo" items="${requestScope.list }">
		<option value="${vo.item_num }">${vo.name }</option>
		</c:forEach>
	</select>
	<input type="submit" value="적용">
	</form>
	<div id="back_img">${requestScope.minime_img }</div>
</div>