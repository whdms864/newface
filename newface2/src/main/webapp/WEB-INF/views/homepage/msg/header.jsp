<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<nav class="navbar navbar-default navbar-fixed-top"style="background-color: rgb(243, 164, 18); height:30px;"> 
	
	<div style="width:260px; height:50px; margin:auto;">

	  	<div style="font-size: 12px; color: rgb(255, 255, 255); text-align: center;
				line-height: 2.4em; border-radius: 4px; background-color: rgb(52, 152, 219); 
				width: 80px; height:30px; float:left; margin-top:10px;" >
			<a href="<c:url value='/msg'/>">받은쪽지함</a>
		</div>
		
		<div style="font-size: 12px; color: rgb(255, 255, 255); text-align: center;
				line-height: 2.4em; border-radius: 4px; background-color: rgb(52, 152, 219); 
				width: 80px; height:30px; ; float:left; margin-top:10px; margin-left: 10px;">
			<a href="<c:url value='/msg_sendlist'/>">보낸쪽지함</a>
		</div>
		
		<div style="font-size: 12px; color: rgb(255, 255, 255); text-align: center;
				line-height: 2.4em; border-radius: 4px; background-color: rgb(52, 152, 219); 
				width: 80px; height:30px; ; float:left; margin-top:10px; margin-left: 10px;">
			<a href="<c:url value='/msg_send'/>">쪽지보내기</a>
		</div>
	  
	</div>


</nav>
	
	

