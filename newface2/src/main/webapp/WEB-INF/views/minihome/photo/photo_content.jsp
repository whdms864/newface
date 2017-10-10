<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/minihome/photo/photo_content.css?ver=5'/>">
<div id="show_type1">
	<a href="">펼쳐보기</a>
</div>
<img src="img/photo_type1.PNG" id="show_type1_img">
<div id="show_type2">
	<a href="">작게보기</a>
</div>
<img src="img/photo_type2.PNG" id="show_type2_img">
<div id="show_type3">
	<a href="">슬라이드</a>
</div>
<img src="img/photo_type3.PNG" id="show_type3_img">
<a href="<c:url value='/photo/write'/>" id="p_upload"><img
	src="<c:url value='/resources/images/minihome/photo_upload.PNG'/>"></a>
<c:forEach var="vo" items="${requestScope.list1 }">
<div class="p_title">
	${vo.title } <input type="button" class="p_scrap_b" value="스크랩">
</div>
<div class="p_content_back">
	<div class="p_writer">작성자</div>
	<div class="p_date">${vo.regdate }</div>
	<div class="p_scrap">스크랩: 0</div>
	<div class="p_content_img">${vo.content }</div>
	<div class="p_comment_tt">댓글</div>
	<input type="text" class="p_comment" value="내용을 입력해 주세요">
	<input type="submit" class="p_submit" value="확인">
</div>
<br><br>
</c:forEach>
