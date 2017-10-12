<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div align="center">
		<table class="table table-hover" style="width: 90%;margin-top: 20px;">
			<thead>
		  		<tr class="success">
		  			<th>계약상태</th>
		  			<th>URL</th>
		  			<th>시작일</th>
		  			<th>만료일</th>
		  		</tr>
		  	</thead>
		  	<tbody>
		  		<c:forEach var="ad" items="${ad_list}">
		  			<tr>
			  			<td>${ad.type}</td>
			  			<td style="text-overflow: ellipsis; white-space: nowrap; max-width:280px; overflow: hidden;"><a href="<c:url value='/ad_getinfo?ad_num=${ad.ad_num }'/>">${ad.url}</a></td>
			  			<td>${ad.sdate}</td>
			  			<td>${ad.edate}</td>
			  		</tr>
			  	</c:forEach>
			</tbody>
		</table>
	</div>
	<div style="position:absolute;top:600px;width: 100%;"align="center">
		<div style="background-color: rgb(224, 224, 224);width:100%; height:1px;"></div>
		페이징
	</div>
