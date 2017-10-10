<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div style="background-color: rgba(224, 224, 224, 0.78);margin-left:20px;width: 95%;height: 800px;">
	<div style="margin-left: 30px;">
		<label style="font-weight:bold;font-size:25px;">공지사항</label>
	</div>
	<div style="border-radius: 2px; box-shadow: rgba(0, 0, 0, 0.227451) 3px 3px 8px 0px; background-color: rgb(250, 250, 250); 
		width:90%; height:90%;margin-left:30px;padding-top: 10px;"align="center">
		<table class="table table-hover" style="width: 90%;margin-top: 20px;">
			<thead>
		  		<tr class="success">
		  			<th>No.</th>
		  			<th>제목</th>
		  			<th>등록일</th>
		  		</tr>
		  	</thead>
		  	<tbody>
	  			<tr>
		  			<td>No.</td>
		  			<td>제목</td>
		  			<td>등록일</td>
		  		</tr>
		  	</tbody>
		</table>
		<div style="position:absolute;top:700px;width: 85%;"align="center">
			<div style="background-color: rgba(224, 224, 224, 0.78);width: 490px; height:1px;"></div>
			페이징
		</div>
	</div>
</div>