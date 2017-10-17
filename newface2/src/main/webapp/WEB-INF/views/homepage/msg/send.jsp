<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div style="background-color: rgba(250, 250, 250, 0.78); margin-left:7px; margin-top:25px; width: 96%; height: 335px;"align="center">
		<form action="<c:url value='/msg_send'/>" method="post">
			<div style="width:200px; height:25px; margin-top:30px">
				<span style="float:left; margin-right:10px;">받는 사람</span>
				<input type="text" name="receiver" style="width:120px; height:25px; float:left; margin-bottom:6px;" value="${msgrecv_getinfo.sender}">
			</div>
			<div style="margin-top:15px; height:250px;">
				<textarea name="content" style="width:100%; height:100%;"></textarea>
			</div>
			<input type="hidden" name="sender" value="${loginid }">
						
			<div style="margin-top:10px;">
				<input type="submit" value="보내기">
			</div>
		</form>
	</div>

	
	
	