<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<nav class="navbar navbar-default navbar-fixed-top"style=" background-color: rgb(52, 152, 219); height:70px;border-bottom: 1px solid #174e73;">
	  <div class="container">
	  	<a href="<c:url value='/admin'/>">
			<img src="<c:url value='/resources/images/homepage/싸이관리자로고.png'/>"
			style="top:4px; left:410px;position:absolute; height:63px;">
	 	</a>
  		<a href="<c:url value='/members/logout'/>" style="top:3px; left:1350px;position:absolute;">
  			<img src="<c:url value='/resources/images/homepage/icon/exit.png'/>">
  		</a>
	  </div>
</nav>