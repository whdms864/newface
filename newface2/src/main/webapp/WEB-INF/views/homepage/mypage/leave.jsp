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
	
	$("#pwdok").keyup(function(){
		var pwd=$("#pwd").val();
		var pwdok=$("#pwdok").val();
		
		if(pwd!=pwdok || pwdok==""){
			$("#pwdok").focus();
			$("#pwd2").html("비밀번호가 일치하지 않습니다");
			
		}else{
			$("#pwd2").html("");
		}
	});
	
	$("#f").submit(function(event){
		var pwd=$("#pwd").val();
		var pwdok=$("#pwdok").val();
		var len=$("input:checked").length;
		if(pwdok==""){
			$("#pwdok").focus();
			$("#pwd2").html("비밀번호를 입력해주세요");
			event.preventDefault();
		}else if(pwd!=pwdok){
			$("#pwdok").focus();
			$("#pwd2").html("비밀번호가 일치하지 않습니다");
			event.preventDefault();
		}else if(len==0){
			$("#leaveok").html("정말로 탈퇴를 원하시면 동의란에 체크해주세요");
			event.preventDefault();
		}
	});
});

</script>
<div id="tab">
	<div style="margin-left: 30px;margin-top: 10px;">
		<label style="font-weight:bold;font-size:25px;">My Page</label>
	</div>
	<ul>
	    <li><a href="<c:url value='/qna11/getinfo'/>"style="margin-left:0px;" class="hover_a">회원정보</a></li>
	    <li><a href="<c:url value='/qna11/insert'/>">구매내역</a></li>
	    <li><a href="<c:url value='/qna11/insert'/>">보유내역</a></li>
	</ul>
</div>
<div style="margin-left:30px;padding: 10px;"align="left" id="con">
	<form method="post" id="f" name="f" action="<c:url value='/member/leave'/>">
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
			
			<div class="form-group has-warning" style="display: inline-block; ">
				
  				<label class="control-label" for="inputWarning1">아이디를 다시 사용하실 수 없습니다.<br>탈퇴하시겠습니까?</label>
  				<input type="checkbox" name="agree" id="agree" value="동의" style="width:50px; float:left;"><br>
  				<span id="leaveok" style="float:left;margin-left: 20px;"></span>
			</div>
			<div class="form-group has-warning" style="display: inline-block; ">
				
			</div>
		</div>
		<div style="position:absolute;top:610px;width: 100%;"align="center">
			<div style="background-color: rgba(224, 224, 224, 0.78);width: 490px; height:1px;"></div>
			<input type="submit" id="leave" name="leave" value="탈퇴" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
			border-radius: 4px; background-color: rgb(52, 152, 219);width:120px; height:40px;margin-top:10px;" >
		</div>
	</form>
</div>
