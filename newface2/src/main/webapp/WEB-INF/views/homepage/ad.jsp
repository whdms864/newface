<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	#imgslide ul li img{width:190px; height:350px;}
	/*부모div : 이미지5개가 보여질 너비(140*5)*/
	#parent{width:190px; height:350px; position:relative; background-color:white; overflow:hidden;}
	/*자식div : 이미지 7개가 놓여질 너비(140*7)*/
	#imgslide{width:950px; height:350px; position:absolute; left:0px;}
	#imgslide ul li{float:left; list-style:none;}
	
	
	#imgslide2 ul li img{width:190px; height:350px;}
	/*부모div : 이미지5개가 보여질 너비(140*5)*/
	#parent2{width:190px; height:350px; position:relative; background-color:white; overflow:hidden;}
	/*자식div : 이미지 7개가 놓여질 너비(140*7)*/
	#imgslide2{width:950px; height:350px; position:absolute; left:0px;}
	#imgslide2 ul li{float:left; list-style:none;}
</style>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		setInterval(function(){
			var left=parseInt($("#imgslide").css("left"));
			var moveLeft=left-190; //이동할 left값 구하기
			$("#imgslide").animate({
				left:moveLeft
			},1000,function(){
				 if(moveLeft <= -762){
					 $("#imgslide").css("left",0);
				} 
			});
		},10000);
		
		setInterval(function(){
			var left=parseInt($("#imgslide2").css("left"));
			var moveLeft=left-190; //이동할 left값 구하기
			$("#imgslide2").animate({
				left:moveLeft
			},1000,function(){
				 if(moveLeft <= -762){
					 $("#imgslide2").css("left",0);
				} 
			});
		},10000);
		
		
		
		//1초동안 animate를 사용해서 imgslide위치를 -140px위치로 이동하기
		
	});
	
</script>


<div style="width: 220px; height: 800px; right:50px; background-color:rgb(224, 224, 224);position: absolute;"align="center">
		<div id="parent" style="margin-top:10px;">
			<div id="imgslide">
				<ul>
				
				<c:forEach var="ad_slide" items="${ad_slide }">
				<li><a href="<c:url value='/${ad_slide.url }'/>">${ad_slide.ad_img }</a></li>
				</c:forEach>
				
				</ul>
			</div>
		</div>
		
		<div id="parent2" style="margin-top:20px;">
			<div id="imgslide2">
				<ul>
				
				<c:forEach var="ad_slide2" items="${ad_slide2 }">
				<li><a href="<c:url value='/${ad_slide2.url }'/>">${ad_slide2.ad_img }</a></li>
				</c:forEach>
				
				</ul>
			</div>
		</div>
				
		<div style="width:120px; height:20px; margin-top:20px;" >
			<div style="font-size: 14px;">NewFace	ⓒ2017</div>
		</div>
		
</div>




