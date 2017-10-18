<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div style="background-color: rgba(250, 250, 250, 0.78); margin-left:0px; margin-top:25px; width: 438px; height: 335px;"align="center">
		<table class="table table-hover" style="width: 430px; margin-top: 20px;">
		<thead>
			<tr>
				<th colspan="3" class="info">받은쪽지함</th>
			</tr>
			
	  		<tr>
	  			<th>보낸사람</th>
	  			<th style="width:40%">내용</th>
	  			<th>날짜</th>
	  		</tr>
	  	</thead>
	  	<tbody>
	  		<c:forEach var="msgrecv_list" items="${msgrecv_list }">
	  			<tr>
		  			<td>${msgrecv_list.sender }</td>
		  			<td style="text-overflow: ellipsis; white-space: nowrap; max-width:200px; overflow: hidden;"><a href="<c:url value='/msgrecv_getinfo?msg_num=${msgrecv_list.msg_num }'/>">${msgrecv_list.content }</a></td>
		  			<td>${msgrecv_list.regdate }</td>
		  		</tr>
		  	</c:forEach>
		</tbody>
		</table>
	</div>

	
	
	