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
		  			<td colspan="2" style="height:350px">
				  		<textarea rows="17" cols="65" name="content" readonly="readonly" style="border-style:hidden; resize:none;">${vo.content }</textarea>
					</td>
			  	</tr>
		</table>
		<div style="position:absolute;top:455px; width:98%;"align="center">
			<div style="background-color: rgb(224, 224, 224);margin-left:8px;width: 99%; height:1px;"></div>
		</div>
		
		<div style="background-color: rgb(239, 238, 238);width: 95%;height:200px; position:absolute; bottom:20px; left:13px">
		
		</div>
		
	</div>
	
	
