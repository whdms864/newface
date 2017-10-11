<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/minihome_content.css?var=233'/>">
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
	<form method="post" action="">
		<input type="text" id="iu_text" size="35" name="iu_com"
			value="일촌과 나누고 싶은 이야기를 남겨보세요">&nbsp;&nbsp;<input type="button"
			value="확인">
	</form>
</div>
<div id="iu_content">
	일촌평1
	<hr>
	일촌평2
	<hr>
	일촌평3
	<hr>
</div>
</div>