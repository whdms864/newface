<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!----------------- 여기서부터 왼쪽 사이드바 ----------------->
		
<div align="center" style="width: 250px; height: 200px;background-color: rgb(224, 224, 224);">
	<div align="center" style="display:inline-block;">
		<table width="240px" style="margin: 10px;text-align: center;">
			<tr>
				<td rowspan="5" width="80px"><!-- 미니미 -->
					<div style="background-color: rgb(255, 255, 255); width:74px; height:111px;">미니미</div>
				</td>
			</tr>
			<tr>
				<td>방문자</td>
				<td>20</td>
			</tr>
			<tr>
				<td>방명록</td>
				<td>20</td>
			</tr>
			<tr>
				<td>일촌신청</td>
				<td>20</td>
			</tr>
			<tr>
				<td align="center">
					<img src="<c:url value='/resources/images/homepage/싸이_가상화폐.png'/>"style="width:20px; height:20px "> &nbsp;20
				</td>
				<td>
					<div style="font-size: 16px;"><a href="">충전</a></div>
				</td>
			</tr>
		</table>
		<div style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; 
				line-height: 2.4em; border-radius: 4px; background-color: rgb(52, 152, 219); width: 230px; height:44px;margin-top: 5px;margin-right: 10px;">
			<a href="<c:url value='/minihome'/>" style="text-decoration: none;">내 미니홈피 가기</a>
		</div>
		<div>
			<a href="" >1:1문의</a>
			<a href="<c:url value='/market'/>" style="margin-left: 40px;">마켓</a>
			<a href=""style="margin-left: 40px;">쪽지</a>
		</div>
	</div>
</div>
<div>
	<a href="<c:url value='/'/>">main</a>
	<a href="<c:url value='/market'/>">market</a>
	<a href="<c:url value='/admin'/>">admin</a>
	<a href="<c:url value='/noti'/>">notice</a>
</div>
		
		
		
		
			
		
		
						
		
		
		
		
		
		
		
		