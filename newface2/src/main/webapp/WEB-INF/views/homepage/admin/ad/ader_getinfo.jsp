<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div align="center">
		<table class="table table-hover" style="width: 70%;margin-top: 20px;">
		  		<tr class="success">
		  			<td>광고주 No.</td>
		  			<td>${vo.ader_num}</td>
		  		</tr>
		  		
		  		<tr>
		  			<td>회사명</td>
		  			<td>${vo.hname}</td>
		  		</tr>
		  		
		  		<tr>
		  			<td>대표명</td>
		  			<td>${vo.pname}</td>
		  		</tr>
		  		
		  		
		  		<tr>
		  			<td>사업자번호</td>
		  			<td>${vo.snum}</td>
		  		</tr>
		  		
		  		<tr>
		  			<td>담당자명</td>
		  			<td>${vo.dname}</td>
		  		</tr>
		  				  		
		  		<tr>
		  			<td>전화번호</td>
		  			<td>${vo.phone}</td>
		  		</tr>
		  		
		  		<tr>
		  			<td>등록날짜</td>
		  			<td>${vo.regdate}</td>
		  		</tr>
		  		
		  		<tr>
		  			<td colspan="2" align="center"><input type="button" onclick="location.href='/newface/ad_insert?ader_num=${vo.ader_num}'" value="광고등록"> </td>
		  		</tr>
		</table>
	</div>
	
	<div style="position:absolute;top:610px;width: 98%;"align="center">
			<div style="background-color: rgb(224, 224, 224);margin-left:10px;width: 99%; height:1px;"></div>
			<input type="button" value="수정" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
			border-radius: 4px; background-color: rgb(52, 152, 219);width:120px; height:40px;margin-top:10px;" onclick="location.href='/newface/ader_update?ader_num=${vo.ader_num}'">
			<input type="button" value="삭제" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
			border-radius: 4px; background-color: rgb(52, 152, 219);width:120px; height:40px;margin-top:10px;" onclick="location.href='/newface/ader_delete?ader_num=${vo.ader_num}'">
	</div>
	
	
	
