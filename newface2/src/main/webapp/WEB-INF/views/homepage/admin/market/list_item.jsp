<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div align="center">
		<table class="table table-hover" style="width: 90%;margin-top: 20px;">
			<thead>
		  		<tr class="success">
		  			<th>No.</th>
		  			<th>이미지</th>
		  			<th>상품명</th>
		  			<th>가격</th>
		  			<th>상세내용</th>
		  			<th>등록일</th>
		  		</tr>
		  	</thead>
		  	<tbody>
		  		<c:forEach var="vo" items="${list}">
		  			<tr>
			  			<td>${vo.item_num}</td>
			  			<td>이미지</td>
			  			<td>
			  				<a href="<c:url value='/qna11/admin/detail?'/>">
			  					${vo.name}
			  				</a>
			  			</td>
			  			<td>${vo.pay}</td>
			  			<td>${vo.content}</td>
			  			<td>${vo.regdate}</td>
			  		</tr>
			  	</c:forEach>
			 </tbody>
		</table>
	</div>
	<div style="position:absolute;top:600px;width: 100%;"align="center">
		<div style="background-color: rgb(224, 224, 224);width:100%; height:1px;"></div>
		페이징
	</div>
