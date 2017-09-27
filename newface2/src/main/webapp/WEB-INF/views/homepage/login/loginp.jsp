<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("form span").css({
		color:"red",
		fontsize:10
	});
	
	
	$("#loginid").keyup(function(){
		var loginid=$("#loginid").val();
		$("#idok").html("");
		$("#errMsg").html("");
		$("#pwd1").html("");
		
	});
	
	$("#loginpwd").keyup(function(){
		var loginpwd=$("#loginpwd").val();
		$("#pwd1").html("");
		$("#errMsg").html("");
		$("#idok").html("");
		
	});
		
	$("#f1").submit(function(event){
		var loginid=$("#loginid").val();
		var loginpwd=$("#loginpwd").val();
		
		if(loginid==""){
			$("#loginid").focus();
			$("#idok").html("아이디를 입력해주세요");
			event.preventDefault();
		}else if(loginpwd==""){
			$("#loginpwd").focus();
			$("#pwd1").html("비밀번호를 입력해주세요");
			event.preventDefault();
		}
	});
	
});

</script>


	<div style="background-color: rgba(224, 224, 224, 0.78);margin-left:20px;width: 95%;height: 800px;">
	<div style="margin-left: 30px;">
		<label style="font-weight:bold;font-size:25px;">로그인</label>
	</div>
	<div style="border-radius: 2px; box-shadow: rgba(0, 0, 0, 0.227451) 3px 3px 8px 0px; background-color: rgb(250, 250, 250); 
		width:90%; height:90%;margin-left:30px;padding: 10px;"align="left">
		<form method="post" id="f1" name="f1" action="<c:url value='/member/login'/>">
			<div  style="margin-left:50px;">
				<div class="form-group has-warning" style="display: inline-block; ">
	  				<label class="control-label" for="inputWarning1">아이디</label>
	  				<br>
	  				<input type="text" name="loginid" id="loginid" class="form-control" style="width:400px;">
	  				<span id="idok"></span>
	  			</div>	
				<div class="form-group has-warning" style="display: inline-block; ">
	  				<label class="control-label" for="inputWarning1">비밀번호</label>
	  				<br>
	  				<input type="password" name="loginpwd" id="loginpwd" class="form-control" style="width:400px;">
	  				<span id="pwd1"></span>
	  			</div>
	  			<div>
	  				<span id="errMsg">${errMsg }</span>
	  			</div>
	  			
	  			<div style="float:left;width: 20px; height: 20px;">
				<label data-form-control="checkbox" data-min-width="20" data-min-height="20">
				
				<span data-form-decorator="true"></span></label>
				</div>
				
			</div>
			<div style="position:absolute;top:700px;width: 85%;"align="center">
				<div style="background-color: rgba(224, 224, 224, 0.78);width: 490px; height:1px;"></div>
				<input type="submit" id="login" name="login" value="로그인" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
				border-radius: 4px; background-color: rgb(52, 152, 219);width:120px; height:40px;margin-top:10px;" > 
			</div>
		</form>
	</div>
</div>

	
	
	