<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

	
	<div style="width:300px; height:50px; margin:auto;">

	  	<div style="font-size: 12px; color: rgb(255, 255, 255); text-align: center;
				line-height: 2.4em; border-radius: 4px; background-color: rgb(52, 152, 219); 
				width: 80px; height:30px; float:left; margin-top:10px;" >
			<button type="button" class="btn btn-default" onclick="location.href='/newface/msgrecv_list?receiver=${loginid }'">받은쪽지함</button>&nbsp;&nbsp;
		</div>
		
		<div style="font-size: 12px; color: rgb(255, 255, 255); text-align: center;
				line-height: 2.4em; border-radius: 4px; background-color: rgb(52, 152, 219); 
				width: 80px; height:30px; ; float:left; margin-top:10px; margin-left: 20px;">
			<button type="button" class="btn btn-default" onclick="location.href='/newface/msgsend_list?sender=${loginid }'">보낸쪽지함</button>
		</div>
		
		<div style="font-size: 12px; color: rgb(255, 255, 255); text-align: center;
				line-height: 2.4em; border-radius: 4px; background-color: rgb(52, 152, 219); 
				width: 80px; height:30px; ; float:left; margin-top:10px; margin-left: 20px;">
			<button type="button" class="btn btn-default" onclick="location.href='/newface/msg_send'">쪽지보내기</button>
		</div>
	  
	</div>

	
	

