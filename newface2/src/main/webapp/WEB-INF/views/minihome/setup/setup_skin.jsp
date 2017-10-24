<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/setup/setup_skin.css?ver=32'/>"> 
<script type="text/javascript" src='<c:url value="/resources/js/jquery-3.2.1.min.js" />'></script>
<script>
	$(function(){
		var num=$("#num").val();
		if(num==""){
			$("select[name='item_num']").val("-1").prop("selected",true);	
		}else{
			$("select[name='item_num']").val(num).prop("selected",true);		
		}
		$("#skin_list").change(function(){
			var item_num=$("#skin_list").find(":selected").val();
			$.getJSON("<c:url value='/setup/item_img'/>",{"item_num":item_num},function(data){
				$(".back_img").html("<span class='back_img'>" + data.item_img + "</span>");
			});
		});
	});
</script>
<input type="hidden" id="num" value="${requestScope.item_num }">
<div id="setup_skin_back">
	<h3 id="first">미니홈피 스킨설정</h3>
	<hr>
	<div class="skin_back">
	<form method="post" action="<c:url value='/setup/skin_update'/>">
	<select id="skin_list" name="item_num">
		<option class="choice" value="-1">기본</option>
	<c:forEach var="vo" items="${requestScope.list }">
		<option class="choice" value="${vo.item_num }">${vo.name }</option>
	</c:forEach>
	</select>
	<input type="submit" value="적용">
	</form>
		<div class="back_img">
		<c:choose>
			<c:when test="${sessionScope.item_img==null }">
				<img alt="기본스킨" src="<c:url value='/resources/skin/cyworldSkin01.jpg'/>">
			</c:when>
			<c:otherwise>
				${sessionScope.item_img }
			</c:otherwise>
		</c:choose> 
		</div>
	</div>
	<hr>
</div>