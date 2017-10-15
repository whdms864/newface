<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/setup/setup_iu.css?var=2'/>"> 
<script type="text/javascript" src='<c:url value="/resources/js/jquery-3.2.1.min.js" />'></script>
<script>
	$(function(){
		$(".ok").click(function(){
			var u_id=$(this).attr("id");
			$.getJSON("<c:url value='/setup/iuOk'/>",{"u_id":u_id},function(data){
				var url="<c:url value='/setup/iu'/>";				
				if(data.n>0){
					$(location).attr("href",url);
				}else{
					alert("오류로 인하여 일촌수락을 하지 못했습니다");
				}
			});
		});
	});
</script>
<div id="setup_iu_back">
	<h3>일촌 신청관리</h3>
	<hr>
	<div class="iu_back">
	<form method="post" action="<c:url value='/setup/profile_photo'/>">
		<table>
			<tr>
				<th>신청한 아이디</th>
			</tr>
			<c:if test="${requestScope.iuVo=='[]' }">
			<tr>
				<td>일촌신청한 아이디가 없습니다</td>
			</tr>
			</c:if>
				<c:forEach var="iu" items="${requestScope.iuVo }">
			<tr>
				<td>${iu.u_id } <a class="ok" id="${iu.u_id }"> 수락</a></td>
			</tr>
				</c:forEach>		
		</table>
	</form>
	</div>
	<hr>
</div>