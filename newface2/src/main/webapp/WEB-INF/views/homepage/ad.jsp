<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	/*부모div : 이미지5개가 보여질 너비(140*5)*/
	#parent{width:190px; height:350px; position:relative; background-color:white; overflow:hidden;}
	/*자식div : 이미지 7개가 놓여질 너비(140*7)*/
	#imgslide{width:950px; height:350px; position:absolute; left:0px;}
	#imgslide ul li{list-style:none; position:absolute;}
	#imgslide ul li img{width:190px; height:350px;}
	
	
	/*부모div : 이미지5개가 보여질 너비(140*5)*/
	#parent2{width:190px; height:350px; position:relative; background-color:white; overflow:hidden;}
	/*자식div : 이미지 7개가 놓여질 너비(140*7)*/
	#imgslide2{width:950px; height:350px; position:absolute; left:0px;}
	#imgslide2 ul li{list-style:none; position:absolute;}
	#imgslide2 ul li img{width:190px; height:350px;}
</style>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#imgslide ul li").each(function(n){
			var left=190*n;
			$(this).css("left",left);
		});
		
		setInterval(function(){
			$("#imgslide ul li").each(function(){
			var left=parseInt($(this).css("left"));
			var moveLeft=left-190; //이동할 left값 구하기
			$(this).animate({
				left:moveLeft
			},0,function(){
				 if(moveLeft <= -760){
					 $(this).css("left",190);
				} 
			});
		})
	},3000);
		
		$("#imgslide2 ul li").each(function(n){
			var left=190*n;
			$(this).css("left",left);
		});
		
		setInterval(function(){
			$("#imgslide2 ul li").each(function(){
			var left=parseInt($(this).css("left"));
			var moveLeft=left-190; //이동할 left값 구하기
			$(this).animate({
				left:moveLeft
			},0,function(){
				 if(moveLeft <= -760){
					 $(this).css("left",190);
				} 
			});
		})
	},3000);
		
		
		
		
	});
	
</script>


<div style="width: 220px; height: 800px; right:50px; background-color:rgb(224, 224, 224);position: absolute;"align="center">
		<div id="parent" style="margin-top:20px;">
			<div id="imgslide">
				<ul>
					<c:forEach var="ad_slide" items="${ad_slide }">
					<li><a href="http://${ad_slide.url}">${ad_slide.ad_img }</a></li>
					</c:forEach>
				
				</ul>
			</div>
		</div>
		
		<div id="parent2" style="margin-top:20px;">
			<div id="imgslide2">
				<ul>
				
				<c:forEach var="ad_slide2" items="${ad_slide2 }">
				<li><a href="http://${ad_slide2.url }">${ad_slide2.ad_img }</a></li>
				</c:forEach>
				
				</ul>
			</div>
		</div>
				
		<div style="width:120px; height:20px; margin-top:20px;" >
			<div style="font-size: 14px;">NewFace	ⓒ2017</div>
		</div>
		
</div>




