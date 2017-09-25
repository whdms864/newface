<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/diary/diary_folder.css'/>"> 
<h2>폴더이동</h2>
<form method="post" action="<c:url value='/diary/folder_insert'/>">
	이름 <input type="text" name="fname">
	<input type="submit" value="생성">
</form>
