<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#cash_add").click(function(){
			window.open("<c:url value='/cash'/>","_cash_insert","width=550,height=570,left=100,top=100");
		});
		$("#minihome").click(function(){
		    window.open("<c:url value='/minihome'/>","_minihome"," width=1024,height=594,left=100,top=100"); 
		});
		$("#msg").click(function(){
		    window.open("<c:url value='/msgrecv_list?receiver=${loginid}'/>","_msg"," width=442,height=396,left=100,top=100"); 
		});
	});
</script>	
<style>
	a{cursor:pointer;}
</style>	
<div align="center" style="width: 250px; height: 200px;background-color: rgb(224, 224, 224);">
	<div align="center" style="display:inline-block;">
		<table width="240px" style="margin: 10px;text-align: center;">
			<tr>
				<td rowspan="5" width="80px"><!-- 미니미 -->
					<div style="background-color: rgb(255, 255, 255); width:74px; height:111px;">${sessionScope.minime_img }</div>
				</td>
			</tr>
			<tr>
				<td>방문자</td>
				<td>0</td>
			</tr>
			<tr>
				<td>방명록</td>
				<td>0</td>
			</tr>
			<tr>
				<td>일촌신청</td>
				<td>0</td>
			</tr>
			<tr>
				<td align="center">
					<img src="<c:url value='/resources/images/homepage/도토리_최종.png'/>"style="width:20px; height:20px "> &nbsp;${cnt }
				</td>
				<td>
					<div style="font-size: 16px;"><a id="cash_add">충전</a></div>
				</td>
			</tr>
		</table>
		<div style="font-size: 16px; color: rgb(255, 255, 255); text-align: center;
				line-height: 2.4em; border-radius: 4px; background-color: rgb(52, 152, 219); width: 230px; height:44px;margin-top: 5px;margin-right: 10px;">
			<a id="minihome" style="text-decoration: none; color:white;">내 미니홈피 가기</a>
		</div>
		<div>
			<a href="<c:url value='/qna11/getinfo'/>">1:1문의</a>
			<a href="<c:url value='/market/item/list'/>" style="margin-left: 20px;">마켓</a>
			<a style="margin-left: 20px;" id="msg">쪽지</a>
			<a href="<c:url value='/member/mypage?id=${sessionScope.loginid }'/>" style="margin-left: 20px;">MyPage</a>
		</div>
	</div>
</div>
<div style="width: 250px; height: 175px;background-color: rgb(224, 224, 224);margin-top: 20px;padding: 5px;">
	<label style="font-weight:bold;font-size:16px;margin-left: 20px;">공지사항</label>
	<div style="width:90%; height:90%">
		<table style="margin-left:8px;">
				<c:forEach var="noti" items="${noti_side }">
				<tr>
					<td style="text-overflow: ellipsis; white-space: nowrap; max-width:220px; overflow: hidden; height:27px;" >
						<a href="<c:url value='/noti_getinfo?noti_num=${noti.noti_num }'/>">${noti.title}</a>
					</td>
				</tr>
				</c:forEach>
			
		</table>
	</div>
	<a href="<c:url value='/noti_list'/>" style="margin-right: 10px;float:right;">더보기</a>
</div>
<div style="margin-top: 20px;display: inline-block;">
	<div style="width: 50px; height: 40px; float:left;background-color: rgb(241, 238, 238); border-radius: 4px 0px 0px 4px; border-color: rgb(204, 204, 204); border-style: solid; border-width: 1px 1px 1px 1px;">
	</div>
	<input type="text"	style="color: rgb(94, 94, 94);border-radius: 0px 4px 4px 0px; border-width: 1px 1px 1px 0px; border-style: solid; 
		border-color: rgb(204, 204, 204); width: 200px; height: 40px;float:left;padding:10px;" placeholder="친구찾기">
</div>
<div>
	<a href="<c:url value='/members/logout'/>">로그아웃</a>
</div>		
