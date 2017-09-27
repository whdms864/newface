<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div align="center">
		<table class="table table-hover" style="width: 90%;margin-top: 20px;">
		  		<tr class="success">
		  			<th>No.</th>
		  			<th>아이디</th>
		  			<th>제목</th>
		  			<th>등록일</th>
		  			<th>상태</th>
		  			<th>상세보기</th>
		  		</tr>
		  		<c:forEach var="vo" items="${list}">
		  			<tr>
			  			<td>${vo.qna11_num}</td>
			  			<td>${vo.id}</td>
			  			<td>${vo.title}</td>
			  			<td>${vo.regdate}</td>
			  			<td>${vo.confirm}</td>
			  			<td><a href="<c:url value='/qna11/detail?qna11_num=${vo.qna11_num }'/>">보기</a></td>
			  		</tr>
			  	</c:forEach>
		</table>
		<div style="position:absolute;top:620px;width: 98%;"align="center">
			<div style="background-color: rgba(224, 224, 224, 0.78);width: 490px; height:1px;"></div>
			페이징
		</div>
	</div>
