<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<div id="test">
	<h3>홈피명설정</h3>
	<form method="post" action="<c:url value='/setup/hname'/>">
	<input type="text" name="hname"> 
	<input type="submit" value="변경">
	</form>
</div>