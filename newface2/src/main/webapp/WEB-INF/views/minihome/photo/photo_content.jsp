<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/photo_content.css'/>">
<div id="show_type1"><a href="">펼쳐보기</a></div>
		<img src="img/photo_type1.PNG" id="show_type1_img">
		<div id="show_type2"><a href="">작게보기</a></div>
		<img src="img/photo_type2.PNG" id="show_type2_img">
		<div id="show_type3"><a href="">슬라이드</a></div>
		<img src="img/photo_type3.PNG" id="show_type3_img">
		<a href="<c:url value='/pwrite'/>"id="p_upload"><img src="<c:url value='/resources/images/minihome/photo_upload.PNG'/>"></a>
		<div id="p_title">제목
		<input type="button" id="p_scrap_b" value="스크랩">
		</div>
		<div id="p_content_back">
			<div id="p_writer">작성자</div>
			<div id="p_date">2017.09.11</div>
			<div id="p_scrap">스크랩: 0</div>
			<div id="p_content_img">이미지 들어갈부분</div>
			<div id="p_content_text">사진설명</div>
			<div id="p_comment_tt">댓글</div>
			<input type="text" id="p_comment" value="내용을 입력해 주세요">
			<input type="submit" id="p_submit" value="확인">
		</div>