<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
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
			var name=$("#name").val();
			
			if(pwd==""){
				$("#pwd").focus();
				$("#pwd1").html("비밀번호를 입력해주세요");
				event.preventDefault();
			}else if(pwdok==""){
				$("#pwdok").focus();
				$("#pwd2").html("비밀번호확인란을 입력해주세요");
				event.preventDefault();
			}else if(pwd!=pwdok){
				$("#pwdok").focus();
				$("#pwd2").html("비밀번호가 일치하지 않습니다");
				event.preventDefault();
			}
			
		});
		
	});
	


</script>
<style>
.form-group {
    margin-bottom: 10px;
}
</style>
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
	<form method="post" id="f" name="f" action="<c:url value='/member/update'/>">
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
  				<input type="password" name="pwd" id="pwd" class="form-control" style="width:400px;"value="${vo.pwd }"placeholder="비밀번호">
  				<span id="pwd1"></span>
  				<input type="password" name="pwdok" id="pwdok" class="form-control" style="width:400px;margin-top:10px;" placeholder="비밀번호 확인">
  				<span id="pwd2"></span>
			</div>
			<div class="form-group has-warning" style="display: inline-block; ">
  				<label class="control-label" for="inputWarning1">이름</label>
  				<label class="control-label" for="inputWarning1" style="color:#a94442;">(*)</label>
  				<br>
  				<input type="text" name="name" id="name" class="form-control" style="width:400px;" value="${vo.name }">
  				<span id="nameok"></span>
			</div>
			<div class="form-group has-warning" style="display: inline-block; ">
  				<label class="control-label" for="inputWarning1">이메일</label>
  				<br>
  				<input type="email" name="email" id="email" class="form-control" style="width:400px;" value="${vo.email }">
			</div>
			<div class="form-group has-warning" style="display: inline-block; ">
  				<label class="control-label" for="inputWarning1">주소</label>
  				<br>
  				<input type="text" name="addr" id="addr" class="form-control" style="width:400px;" value="${vo.addr }">
			</div>
			<div class="form-group has-warning" style="display: inline-block; ">
  				<label class="control-label" for="inputWarning1">생년월일</label>
  				<br>
  				<input type="text" name="birth" id="birth" class="form-control" style="width:400px;" value="${vo.birth }">
			</div>
			<div class="form-group has-warning" style="display: inline-block; ">
  				<label class="control-label" for="inputWarning1">학교</label>
  				<br>
  				<input type="text" name="school" id="school" class="form-control" style="width:400px;" value="${vo.school }">
			</div>
			<div class="form-group has-warning" style="display: inline-block; ">
  				<label class="control-label" for="inputWarning1">가입일</label>
  				<br>
  				<input type="text" name="regdate" id="regdate" class="form-control" style="width:400px;" value="${vo.regdate }" disabled="disabled">
			</div>
		</div>
		<div style="position:absolute;top:610px;width: 100%;"align="center">
			<div style="background-color: rgba(224, 224, 224, 0.78);width: 490px; height:1px;"></div>
			<input type="submit" id="update" name="update" value="수정" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
			border-radius: 4px; background-color: rgb(52, 152, 219);width:120px; height:40px;margin-top:10px;" >
			
			<input type="button" id="leave" name="leave" value="탈퇴" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
			border-radius: 4px; background-color: rgb(52, 152, 219);width:120px; height:40px;margin-top:10px;" onClick="location.href='/newface/member/leave?id=${sessionScope.loginid}'"> 
		</div>
	</form>
</div>
