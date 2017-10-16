<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/minihome_left.css?var=2'/>">
<script type="text/javascript" src='<c:url value="/resources/js/jquery-3.2.1.min.js" />'></script>
<script>
	$(function(){
		/* $("#name").on("click","#name1",function(){
			$("#i_you").toggle(); 
		}); */
		$("#name1").click(function(){
			$("#i_you1").toggle();
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
		$("#iu_list").change(function(){
			var hompy_num=$(this).val();
			window.open("<c:url value='/minihome?hompy_num=" + hompy_num + "'/>","_minihome2"," width=1024,height=594,left=100,top=100"); 
		});
		$("#history").click(function(){
			var hompy_num=$(this).val();
			window.open("<c:url value='/minihome/profile_history?hompy_num=" + hompy_num + "'/>","_minihome3"," width=235,height=594,left=100,top=100"); 
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
	<div id="todayis"> 
		<a id="today_color">TODAY IS.. </a>  
	<c:choose>
		<c:when test="${requestScope.vo.todayis=='좋음' }">
			<img src="<c:url value='/resources/images/minihome/flower.png'/>">
		</c:when>
		<c:when test="${requestScope.vo.todayis=='보통' }">
			<img src="<c:url value='/resources/images/minihome/sun.png'/>"> 
		</c:when>
		<c:when test="${requestScope.vo.todayis=='나쁨' }">
			<img src="<c:url value='/resources/images/minihome/bolt.png'/>">
		</c:when>
	</c:choose>
		 ${requestScope.vo.todayis }
	
	</div>
	<div id="content">
		${requestScope.vo.content }
	</div>
	<div id="edit">
		<c:if test="${sessionScope.loginid==sessionScope.hompyid }">
			<span class="triangle">▶</span><a href="<c:url value='/setup/profile'/>">edit</a>
		</c:if> 
		<span class="triangle">▶</span><a id="history">history</a>
	</div>
	<div id="member">
		<div id="name"><a id="name1">${requestScope.member.name }</a> <span id="i_you"><a id="i_you1">일촌맺기</a></span></div>		
		<div id="email">${requestScope.member.email }</div>
	</div>
	<c:if test="${sessionScope.hompyid==sessionScope.loginid }">
	<div id="iu">
		<select style="width: 150px; height: 30px;" id="iu_list">
			<option>일촌목록</option>		
		<c:forEach var="iu" items="${sessionScope.iu_list }">
			<option value="${iu.hompy_num }">${iu.name } (${iu.u_id})</option>		
		</c:forEach>
		</select>
	</div>
	</c:if>
</div>