<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/homepage/main.css?ver=16'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#msg").click(function(){
	    window.open("<c:url value='/msgrecv_list?receiver=${loginid}'/>","_msg"," width=445,height=390,left=100,top=100"); 
	});
	$("#iu_img").click(function(){
	    window.open("<c:url value='/minihome'/>","_minihome"," width=1024,height=592,left=100,top=100"); 
	});
	$(".search").keypress(function(event){
		if(event.keyCode==13){
			var text=$(this);
			if(text.val()==""){
				text.focus();
				alert("검색할 내용을 입력해주세요");
			}else{
				location.href="<c:url value='/main2'/>?text="+text.val();
			}
		}
	});
	setInterval(function(){
		$.getJSON('msg/msgnorecv_count', function(data) {
			if(data<=9){
				$("#msg_before").text(data);
			}else{
				$("#msg_after").text("++");
			}
		});
		$.getJSON('mem/iu_request_now', function(data) {
			if(data<=9){
				$("#iu_before").text(data);
			}else{
				$("#iu_after").text("++");
			}
		});
	},1000);
});
</script>
<nav class="navbar navbar-default navbar-fixed-top"style="background-color: white; height:90px;border: none;">
  <nav class="navbar navbar-default navbar-fixed-top"style="background-color: rgb(243, 164, 18); height:70px;border-bottom: 1px solid #bf7c01;">
	  <div class="container">
	  <c:choose>
	  	<c:when test="${not empty sessionScope.loginid }">
			<a href="<c:url value='/main2'/>" class="logo_A">
				<img src="<c:url value='/resources/images/homepage/싸이_메인로고.png'/>"class="logo">
		  	</a>
		  	<input type="text" placeholder="게시글 검색 ( 제목 / 내용 / 작성자 )" class="form-control search">
		  	<div class="icon">
		  		<div class="icon_set">
		  			<img src="<c:url value='/resources/images/homepage/icon/email.png'/>" id="msg">
		  			<div class="circle" align="center">
		  			<c:choose>
		  				<c:when test="${msgnorecv_count<=9 }">
		  					<label style="left:7px;" id="msg_before">${msgnorecv_count }</label>
		  				</c:when>
		  				<c:otherwise>
		  					<label style="left:5px;" id="msg_after">++</label>
		  				</c:otherwise>
		  			</c:choose>
		  			</div>
		  		</div>
		  		<div class="icon_set">
		  			<img src="<c:url value='/resources/images/homepage/icon/add-user.png'/>" id="iu_img">
		  			<div class="circle" align="center">
						<c:choose>
			  				<c:when test="${iu_request_now<=9 }">
			  					<label style="left:7px;" id="iu_before">${iu_request_now }</label>
			  				</c:when>
			  				<c:otherwise>
			  					<label style="left:5px;" id="iu_after">++</label>
			  				</c:otherwise>
		  			</c:choose>
					</div>
		  		</div>
		  		<div class="icon_set">
			  		<a href="<c:url value='/members/logout'/>">
			  			<img src="<c:url value='/resources/images/homepage/icon/exit.png'/>">
			  		</a>
		  		</div>
			</div>
		</c:when>
		<c:otherwise>
			<a href="<c:url value='/'/>" class="logo_A">
				<img src="<c:url value='/resources/images/homepage/싸이_메인로고.png'/>" class="logo">
		  	</a>
		</c:otherwise>
		
	  </c:choose>
	  </div>
  </nav>
</nav>
