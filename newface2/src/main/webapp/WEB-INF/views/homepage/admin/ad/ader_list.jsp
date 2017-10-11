<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div align="center">
		<table class="table table-hover" style="width: 90%;margin-top: 20px;">
			<thead>
				<tr class="success">
		  			<th>No.</th>
		  			<th>회사명</th>
		  			<th>대표명</th>
		  			<th>사업자번호</th>
		  		</tr>
		  	</thead>
	  		<tbody>	  	
		  		<c:forEach var="vo" items="${ader_list}">
		  			<tr>
			  			<td>${vo.ader_num}</td>
			  			<td><a href="<c:url value='/ader_getinfo?ader_num=${vo.ader_num}'/>">${vo.hname}</a></td>
			  			<td>${vo.pname}</td>
			  			<td>${vo.snum}</td>
			  		</tr>
			  	</c:forEach>
			</tbody>
		</table>
	</div>
	<div style="position:absolute;top:600px;width: 100%;"align="center">
		<div style="background-color: rgb(224, 224, 224);width:100%; height:1px;"></div>
		페이징
	</div>
