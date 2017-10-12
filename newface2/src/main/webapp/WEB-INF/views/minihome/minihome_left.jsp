<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/minihome_left.css?var=25'/>">
<script type="text/javascript" src='<c:url value="/resources/js/jquery-3.2.1.min.js" />'></script>
<script>
	$(function(){
		$("#name").on("click","#name1",function(){
			$("#i_you").toggle(); 
		});
		$("#i_you1").click(function(){
			$.getJSON("<c:url value='/minihome/iu_request'/>",function(data){
				if(data.n>0){
					alert("일촌신청이 완료되었습니다");
				}else{
					alert("이미 일촌신청을 했거나 오류로 인하여 일촌신청 하지 못했습니다")
				}
			});
		});
	});
</script>
<div id="left_back">
	<div id="profile">
		<c:choose>
			<c:when test="${requestScope.vo.save_name==null }">
				<img alt="프로필사진" class="photo" src="<c:url value='/resources/images/minihome/profile.PNG'/>">			
			</c:when>
			<c:otherwise>
				<img alt="프로필사진" class="photo" src="<c:url value='/resources/upload/${requestScope.vo.save_name }'/>">
			</c:otherwise>
		</c:choose>
	</div>
	<div id="todayis">today is ${requestScope.vo.todayis }</div>
	<div id="content">
		${requestScope.vo.content }
	</div>
	<div id="edit">
		<a href="<c:url value='/setup/profile'/>">edit</a> 
		<a href="">history</a>
	</div>
	<div id="member">
		<div id="name"><a id="name1">${requestScope.member.name }</a></div>
		<div id="i_you"><a id="i_you1">일촌맺기</a></div>
		<div id="email">${requestScope.member.email }</div>
	</div>
	<div id="iu">
		<select style="width: 150px; height: 30px;">
			<option>파도타기</option>
			<option>일촌1</option>
			<option>일촌2</option>
		</select>
	</div>
</div>