<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/setup/setup_miniroom.css?var=14'/>"> 
<script type="text/javascript" src='<c:url value="/resources/js/jquery-3.2.1.min.js" />'></script>

<div id="setup_miniroom_back">
	<h3 id="first">미니미</h3>
	<select>
		<c:forEach var="vo" items="${requestScope.list }">
		<option ></option>
		</c:forEach>
	</select>
	<hr>
</div>