<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

	
	<div style="width:400px; height:50px; margin-left:10px;">
		
		<div style="font-size: 12px; color: rgb(255, 255, 255); text-align: center;
				line-height: 2.4em; border-radius: 4px; background-color: rgb(52, 152, 219); 
				width: 80px; height:30px; float:left; margin-top:10px; margin-left:20px;" >
			<button type="button" class="btn btn-default btn-sm" onclick="location.href='/newface/adminmsg_list?receiver=${loginid }'">관리자쪽지함</button>&nbsp;&nbsp;
		</div>

	  	<div style="font-size: 12px; color: rgb(255, 255, 255); text-align: center;
				line-height: 2.4em; border-radius: 4px; background-color: rgb(52, 152, 219); 
				width: 60px; height:30px; float:left; margin-top:10px; margin-left:25px;" >
			<button type="button" class="btn btn-default btn-sm" onclick="location.href='/newface/msgrecv_list?receiver=${loginid }'">받은쪽지함(${msgnorecv_count })</button>&nbsp;&nbsp;
		</div>
		
		<div style="font-size: 12px; color: rgb(255, 255, 255); text-align: center;
				line-height: 2.4em; border-radius: 4px; background-color: rgb(52, 152, 219); 
				width: 60px; height:30px; ; float:left; margin-top:10px; margin-left: 48px;">
			<button type="button" class="btn btn-default btn-sm" onclick="location.href='/newface/msgsend_list?sender=${loginid }'">보낸쪽지함</button>
		</div>
		
		<div style="font-size: 12px; color: rgb(255, 255, 255); text-align: center;
				line-height: 2.4em; border-radius: 4px; background-color: rgb(52, 152, 219); 
				width: 60px; height:30px; ; float:left; margin-top:10px; margin-left: 33px;">
			<button type="button" class="btn btn-default btn-sm" onclick="location.href='/newface/msg_send'">쪽지보내기</button>
		</div>
	  
	</div>

	
	

