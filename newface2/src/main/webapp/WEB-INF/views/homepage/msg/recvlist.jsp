<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div style="background-color: rgba(250, 250, 250, 0.78); margin-left:7px; margin-top:25px; width: 95%; height: 335px;"align="center">
		<table class="table table-hover" style="width: 330px; margin-top: 20px;">
		<thead>
	  		<tr class="success">
	  			<th>보낸사람</th>
	  			<th>내용</th>
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

	
	
	