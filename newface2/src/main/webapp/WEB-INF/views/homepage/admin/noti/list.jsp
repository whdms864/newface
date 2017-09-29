<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div align="center">
		<table class="table table-hover" style="width: 90%;margin-top: 20px;">
		  		<tr class="success">
		  			<th>No.</th>
		  			<th>제목</th>
		  			<th>작성자</th>
		  			<th>등록일</th>
		  		</tr>
		  		<c:forEach var="vo" items="${list}">
		  			<tr>
			  			<td>${vo.noti_num}</td>
			  			<td style="text-overflow: ellipsis; white-space: nowrap; max-width:280px; overflow: hidden;"><a href="<c:url value='/notiadmin_getinfo?noti_num=${vo.noti_num }'/>">${vo.title}</a></td>
			  			<td>${vo.id}</td>
			  			<td>${vo.regdate}</td>
			  		</tr>
			  	</c:forEach>
		</table>
	</div>
	<div style="position:absolute;top:600px;width: 100%;"align="center">
		<div style="background-color: rgb(224, 224, 224);width:100%; height:1px;"></div>
		페이징
	</div>
