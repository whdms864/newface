<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="<c:url value='/photo/folder_insert'/>">
	<h2>폴더 생성하기</h2>
	폴더이름 <input type="text" name="fname">
	<input type="submit" value="추가">
</form>
<hr>
<h2>폴더 수정하기</h2>
<form method="post" action="<c:url value='/photo/folder_update'/>">
	폴더이름
	<select name="photo_folder_num">
		<c:forEach var="vo" items="${requestScope.list }">
			<option value="${vo.photo_folder_num }">${vo.fname}</option>
		</c:forEach>
	</select><br>
	수정할 폴더명 <input type="text" name="fname">
	<input type="submit" value="수정">
</form>
<hr>
<h2>폴더 삭제하기</h2>
<form method="post" action="<c:url value='/photo/folder_delete'/>">
	폴더이름
	<select name="photo_folder_num">
		<c:forEach var="vo" items="${requestScope.list }">
			<option value="${vo.photo_folder_num }">${vo.fname }</option>
		</c:forEach>
	</select>
	<input type="submit" value="삭제">
</form>
</body>
</html>