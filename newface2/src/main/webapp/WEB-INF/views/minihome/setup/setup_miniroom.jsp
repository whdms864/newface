<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/setup/setup_miniroom.css?var=14'/>"> 
<script type="text/javascript" src='<c:url value="/resources/js/jquery-3.2.1.min.js" />'></script>
<script>
	$(function(){
		$.getJSON("<c:url value='/setup/miniroom_decorate'/>",function(data){
			$(data).each(function(i,item){
				$("#item_list").append("<a class='miniroom' style='position: relative;' id='" + item.item_num + "'>" + item.item_img + "</a>");
			});
		});
		$("#wallpaper").change(function(){
			var item_num=$("#wallpaper").find(":selected").val();
			$.getJSON("<c:url value='/setup/item_img'/>",{"item_num":item_num},function(data){
				$("#miniroom").html("<span class='add1' style='position: relative;'>" + data.item_img + "</span>");
			});
		});
		$("#btn").click(function(){
			var item_num=$("#wallpaper").find(":selected").val();
			$.getJSON("<c:url value='/setup/room_posi'/>",{"item_num":item_num},function(data){
				if(data.n>0){
					alert("미니룸 변경이 완료되었습니다");
				}else{
					alert("오류로 인하여 미니룸 변경을 하지 못했습니다");
				}
			});
		});
		$("#item_list").on("click",".miniroom",function(){
			var item_num=$(this).attr("id");
			var item_img=$(this).html();
			$("#miniroom").append("<span draggable='true' ondragstart='drag(event)' class='item' id='" + item_num + "'>" + item_img + "</span>");
		});
		$("#miniroom").on("draggable",".item",function(){
			
		});
		$("#mini").click(function(){
			console.log("dfsdf");
		});
	});
	function allowDrop(ev){
		ev.preventDefault();
	}
	function drag(ev) {
		ev.dataTransfer.setData("text",ev.target.id);
	}
	function drop(ev){
		ev.preventDefault();
		var data=ev.dataTransfer.getData("text");
		ev.target.appendChild(document.getElementById(data));
	}
</script>
<div id="11"><input type="button" value="2222" id="mini"></div>
<div id="setup_miniroom_back">
	<h3 id="first">미니룸</h3>
	<hr>
	<div class="miniroom_back" ondrop="drop(event)" ondragover="allowDrop(event)">
	<select id="wallpaper">
	<c:forEach var="vo" items="${requestScope.wallpaper }">
		<option class="choice" value="${vo.item_num }">${vo.name }</option>
	</c:forEach>
	</select>
	<input type="button" id="btn" value="적용">
		<div id="miniroom">
			<c:forEach var="miniVo" items="${requestScope.mini }">
				${miniVo.item_img }
			</c:forEach>
		</div>
		<div id="item_list"></div>
	</div>
	<div draggable="true" id="test" style="width: 100px; height: 100px; background-color: red; position: relative;"></div>
	<span style="background-color: green; top:-100px; width: 50px; height:100px; display: block;position: relative;}"></span>
	<div id="div1" style="background-color: gray; width: 200px; height: 200px;" ondrop="drop(event)" ondragover="allowDrop(event)"></div>
	<div id="drag1" draggable="true" ondragstart="drag(event)"style="background-color: yellow; width: 120px; height: 120px;"></div>
	<hr>
</div>