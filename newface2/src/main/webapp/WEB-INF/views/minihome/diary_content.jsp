<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/diary_content.css'/>">
<script type="text/javascript" src='<c:url value="/resources/js/jquery-3.2.1.min.js" />'></script>
<script>
	$(function(){
		$.getJSON("<c:url value='/now'/>",function(data){
			$(".y").html(data.y);
			$(".m").html(data.m);
			$(".week").html(data.week);
			$("#dd").html("");				
			for(var i=1;i<=data.lastday;i++){
				$("#dd").append(i + "  ");				
			}
		});
		$("#before").click(function(){
			var year=$("#y").html();
			var month=$("#m").html();
			$.getJSON("<c:url value='/before'/>",{"year":year,"month":month},function(data){
				$(".y").html(data.y);
				$(".m").html(data.m);
				$(".week").html(data.week);
				$("#dd").html("");				
				for(var i=1;i<=data.lastday;i++){
					$("#dd").append(i + "  ");				
				}
			});
		});
		$("#after").click(function(){
			var year=$("#y").html();
			var month=$("#m").html();
			$.getJSON("<c:url value='/after'/>",{"year":year,"month":month},function(data){
				$(".y").html(data.y);
				$(".m").html(data.m);
				$(".week").html(data.week);
				$("#dd").html("");				
				for(var i=1;i<=data.lastday;i++){
					$("#dd").append(i + "  ");				
				}
			});
		});
	});	
</script>
<div id="calendar_back">
	<div id="calendar_title">
		<div id="mmdd"><span class="y" id="y"></span>.<span class="m" id="m"></span></div>
		<div id="week"><span class="week"></span></div>	
	</div>
	<div id="calendar">
		<input type="button" value="◀" class="move" id="before">
		<span class="y"></span>.<span class="m"></span>
		<input type="button" value="▶" class="move" id="after">
		<span id="dd">		
			${i}		
		</span>
	</div>
	<div id="diary_content_back">
		<div id="diary_content">
			<div id="regdate">
				2009.11.21 토 04:18			
			</div>			
			<br>싸이월드 50억 개이득!!!!<br>	
			<br><hr>
				공개설정 : 전체공개
			<hr>
			<div id="menu">
				수정ㅣ이동ㅣ삭제
			</div><br>	
			&nbsp; 댓글 <input type="text" name="content" size="45" id="content"> 
			<input type="submit" value="확인" style="height: 20px;vertical-align: middle;"><br>
		</div>
	</div>
</div>