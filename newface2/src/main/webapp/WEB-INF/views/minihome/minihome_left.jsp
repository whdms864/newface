<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/minihome_left.css?var=33'/>">
<script type="text/javascript" src='<c:url value="/resources/js/jquery-3.2.1.min.js" />'></script>
<script>
	$(function(){
		/* $("#name").on("click","#name1",function(){
			$("#i_you").toggle(); 
		}); */
		$("#name1").click(function(){
			$("#i_you").toggle();
		});
		$("#i_you1").click(function(){
			$.getJSON("<c:url value='/minihome/iu_request'/>",function(data){
				var name=$("#hompy_name").val();
				alert(name + "님과 일촌맺기를 했습니다")
			});
		});
		$("#bgm").click(function(){
			window.open("<c:url value='/setup/bgm/test'/>","_bgm12"," width=445,height=390,left=100,top=100"); 
		});
		$("#iu_list").change(function(){
			var hompy_num=$(this).val();
			var url = "<c:url value='/minihome?hompy_num=" + hompy_num + "'/>"; 
			if(hompy_num=='myhompy'){
				var url2="<c:url value='/minihome'/>";
				$(location).attr('href',url2);
			}else if(hompy_num!='일촌목록'){
				$(location).attr('href',url);			
			}
		});
		$("#history").click(function(){
			var hompy_num=$(this).val();
			window.open("<c:url value='/minihome/profile_history?hompy_num=" + hompy_num + "'/>","_minihome3"," width=235,height=594,left=100,top=100"); 
		});
		$("#msg").click(function(){
		    window.open("<c:url value='/msg_reply?receiver=${loginid}'/>","_msg"," width=445,height=390,left=100,top=100"); 
		});
		$("#iu_delete").click(function(){
			var name=$("#hompy_name").val();
			$.getJSON("<c:url value='/minihome/iu_delete'/>",function(data){
				alert(name + "님과 일촌끊기가 완료되었습니다");
				var iu_hompy_num=$("#iu_hompy_num").val();
				var url="<c:url value='/minihome?hompy_num=" + iu_hompy_num + "'/>";
				$(location).attr("href",url);
			});
		});
	});
</script>
<input type="hidden" id="hompy_name" value="${sessionScope.member.name }">
<input type="hidden" id="iu_hompy_num" value="${sessionScope.hompy_num }">
<div id="left_back">
	<div id="profile">
		<c:choose>
			<c:when test="${sessionScope.vo.save_name==null }">
				<img alt="프로필사진" class="photo" src="<c:url value='/resources/images/minihome/profile.PNG'/>">			
			</c:when>
			<c:otherwise>
				<img alt="프로필사진" class="photo" src="<c:url value='/resources/upload/${sessionScope.vo.save_name }'/>">
			</c:otherwise>
		</c:choose>
	</div>
	<div id="todayis"> 
		<a id="today_color">TODAY IS.. </a>  
	<c:choose>
		<c:when test="${sessionScope.vo.todayis=='행복' }">
			<img src="<c:url value='/resources/images/minihome/flower.png'/>">
		</c:when>
		<c:when test="${sessionScope.vo.todayis=='보통' }">
			<img src="<c:url value='/resources/images/minihome/sun.png'/>"> 
		</c:when>
		<c:when test="${sessionScope.vo.todayis=='나쁨' }">
			<img src="<c:url value='/resources/images/minihome/bolt.png'/>">
		</c:when>
	</c:choose>
		 ${sessionScope.vo.todayis }	
	</div>
	<div id="content">
		${sessionScope.vo.content }
	</div>
	<div id="edit">
		<c:if test="${sessionScope.loginid==sessionScope.hompyid }">
			<span class="triangle">▶</span><a href="<c:url value='/setup/profile'/>">edit</a>
		</c:if> 
		<span class="triangle">▶</span><a id="history">history</a>
	</div>
	<div id="member">
		<div id="name"><a id="name1">${sessionScope.member.name }</a></div>				
		<div id="email">${sessionScope.member.email }</div>
	</div>
	<c:if test="${sessionScope.loginid!=sessionScope.hompyid }">
		<div id="i_you">
			<c:choose>
				<c:when test="${sessionScope.iu==null }">
					<a id="i_you1">일촌맺기</a><br>
				</c:when>
				<c:otherwise>
					<a id="iu_delete">일촌끊기</a><br>					
				</c:otherwise>
			</c:choose>
			<a id="msg">쪽지</a>		
			<a id="bgm">BGM</a>		
		</div>
	</c:if>
	<div id="iu">
		<select style="width: 150px; height: 30px;" id="iu_list">
			<c:choose>
				<c:when test="${sessionScope.hompyid==sessionScope.loginid }">
					<option value="일촌목록" >일촌목록</option>		
					<option value="일촌목록" >----------------------------------</option>					
				</c:when>
				<c:otherwise>
					<option value="일촌목록" >----------------------------------</option>	
					<option value="myhompy">내 미니홈피 가기</option>							
				</c:otherwise>
			</c:choose>				
		<c:forEach var="iu" items="${sessionScope.iu_list }">
			<option value="${iu.hompy_num }">${iu.name } (${iu.u_id})</option>		
		</c:forEach>
		</select>
	</div>
</div>