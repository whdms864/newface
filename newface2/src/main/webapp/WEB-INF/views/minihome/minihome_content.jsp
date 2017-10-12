<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/minihome_content.css?var=23'/>">
<script type="text/javascript" src='<c:url value="/resources/js/jquery-3.2.1.min.js" />'></script>
<script>
	$(function(){
		$("#btn").click(function(){
			var content=$("#iu_text").val();
			$.getJSON("<c:url value='/minihome/iu_com'/>",{"content":content},function(data){
				$("#iu_text").val("");
				if(data.n>0){
					$("#iu_content").html("");
					iu_content();
				}else{
					alert("일촌상태가 아니거나 오류로 인하여 등록을 못했습니다");
				}
			});
		});
		var iu_content=function(){
			$.getJSON("<c:url value='/minihome/iu_com_list'/>",function(data){
				$(data).each(function(i,com){
					$("#iu_content").append(com.content + " (" + com.name + ")<hr>");
				});
			});
		}
		iu_content();
	});
</script>
<div>
<div id="news_back">
	<div id="news">
		Upload news
		<hr>
	</div>
</div>
<div id="board_back">
	<ul id="board">
		<c:forEach var="nowVo" items="${requestScope.now }">
			<li><a>${nowVo.title }</a></li>	
		</c:forEach>
	</ul>
</div>
<div id="board_cnt">
	<table >
		<tr>
			<td class="cnt">다이어리 ${requestScope.diary_now } / ${requestScope.diary_count }</td>
			<td class="cnt">사진첩 ${requestScope.photo_now } / ${requestScope.photo_count }</td>
		</tr>
		<tr>
			<td class="cnt">방명록 ${requestScope.guest_now } / ${requestScope.guest_count }</td>
		</tr>
	</table>
</div>
<div id="miniroom_back">
	Mini Room
	<hr>
	<div id="miniroom"></div>
</div>
<div id="friends_say_back">
	<div id="friends_say">Friends say</div>
</div>
<div id="iu_com">
	<input type="text" id="iu_text" size="38" name="iu_com" placeholder="일촌과 나누고 싶은 이야기를 남겨보세요">
	&nbsp;&nbsp;<input type="button" value="확인" id="btn">
</div>
<div id="iu_content"></div>
</div>