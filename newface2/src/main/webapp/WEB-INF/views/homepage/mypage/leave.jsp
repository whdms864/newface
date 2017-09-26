<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >

<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript">
$(document).ready(function(){
	

$("#f").submit(function(event){
	var pwd=$("#pwd").val();
	var pwdok=$("#pwdok").val();
		
	if(pwdok==""){
		$("#pwdok").focus();
		$("#pwd2").html("비밀번호를 입력해주세요");
		event.preventDefault();
	}else if(pwd!=pwdok){
		$("#pwdok").focus();
		$("#pwd2").html("비밀번호가 일치하지 않습니다");
		event.preventDefault();
	}
	
	});
});

</script>


<div style="background-color: rgba(224, 224, 224, 0.78);margin-left:20px;width: 95%;height: 800px;">
	<div style="margin-left: 30px;">
		<label style="font-weight:bold;font-size:25px;">MyPage</label>
	</div>
	<div style="border-radius: 2px; box-shadow: rgba(0, 0, 0, 0.227451) 3px 3px 8px 0px; background-color: rgb(250, 250, 250); 
		width:90%; height:90%;margin-left:30px;padding: 10px;"align="left">
		<form method="post" id="f" name="f" action="<c:url value='/member/'/>">
			<div style="margin-left:50px;">
				<div class="form-group has-warning" style="display: inline-block; ">
	  				<label class="control-label" for="inputWarning1">아이디</label>
	  				
	  				<br>
	  				<input type="text" name="id" id="id" class="form-control" style="width:400px;" value="${vo.id }" readonly="readonly">
	  				<span id="idok"></span>
				</div>	
				<div class="form-group has-warning" style="display: inline-block; ">
	  				<label class="control-label" for="inputWarning1">비밀번호</label>
	  				
	  				<br>
	  				<input type="hidden" name="pwd" id="pwd" class="form-control" style="width:400px;"value="${vo.pwd }">
	  				<span id="pwd1"></span>
	  				<input type="password" name="pwdok" id="pwdok" class="form-control" style="width:400px;margin-top:10px;">
	  				<span id="pwd2"></span>
				</div>
				
				<div class="form-group has-warning" style="display: inline-block; ">
	  				<label class="control-label" for="inputWarning1">가입일</label>
	  				<br>
	  				<input type="text" name="regdate" id="regdate" class="form-control" style="width:400px;" value="${vo.regdate }" readonly="readonly">
				</div>
			</div>
			<div style="position:absolute;top:700px;width: 85%;"align="center">
				<div style="background-color: rgba(224, 224, 224, 0.78);width: 490px; height:1px;"></div>
				<input type="submit" id="leave" name="leave" value="탈퇴" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
				border-radius: 4px; background-color: rgb(52, 152, 219);width:120px; height:40px;margin-top:10px;" >
			</div>
		</form>
	</div>
</div>