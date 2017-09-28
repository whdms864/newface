<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div align="center">
		<table class="table" style="width: 90%;margin-top: 20px;">
		  		<tr class="success">
		  			<td>No.${vo.noti_num}</td>
		  			<td>${vo.title}</td>
		  		</tr>
		  		<tr>
		  			<td>작성자 : ${vo.id }</td>
		  			<td>작성일 : ${vo.regdate }</td>
			  	</tr>
			  	<tr>
		  			<td colspan="2" style="height:100px">${vo.content }</td>
			  	</tr>
		</table>
	</div>
	
	<div style="position:absolute;top:610px;width: 98%;"align="center">
			<div style="background-color: rgb(224, 224, 224);margin-left:10px;width: 99%; height:1px;"></div>
	</div>
	
