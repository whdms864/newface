<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/minihome/guestbook/guestbook_content.css?ver=6'/>">
	<form method="post" action="<c:url value='/guest/updateok'/>">
		<div class="g_write_b">
			<input type="hidden" value=${requestScope.guest_num } name="guest_num">
			<input type="hidden" value=${sessionScope.loginid } name="id" id="id">
			<input type="hidden" value=${sessionScope.hompy_num } name="hompy_num" id="hompy_num">
			<div class="g_minime">${sessionScope.minime_img }</div>
			<textarea rows="100" cols="60" name="content" class="g_texta">${vo.content }</textarea>
			<select class="secret" name="secret">
				<option value="전체공개">전체공개</option>
				<option value="비밀글">비밀글</option>
			</select>
			<input type="submit" value="확인" class="g_submit" />
		</div>
	</form>
