<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="msg_sendlist" style="background-color: rgba(250, 250, 250, 0.78); margin-left:7px; margin-top:25px; width: 95%; height: 335px;"align="center">
	<table class="table table-hover" style="width: 330px; margin-top: 20px;">
	<thead>
  		<tr class="danger">
  			<th>아이디</th>
  			<th>내용</th>
  			<th>날짜</th>
  			<th>읽음</th>
  			<th>발신취소</th>
  		</tr>
  	</thead>
  	
  		<c:forEach var="msgsend_list" items="${msgsend_list }"> 
  			<tr>
	  			<td>${msgsend_list.receiver }</td>
	  			<td style="text-overflow: ellipsis; white-space: nowrap; max-width:200px; overflow: hidden;"><a href="<c:url value='/msgsend_getinfo?msg_num=${msgsend_list.msg_num }'/>">${msgsend_list.content }</a></td>
	  			<td>${msgsend_list.regdate }</td>
	  			<td>${msgsend_list.chk }</td>
	  			<td>${msgsend_list.send_clx }</td>
	  		</tr>
	  	</c:forEach>	
	  	
	
	</table>
</div>

	
	
	