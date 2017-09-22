<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>

<script type="text/javascript">
	$(document).ready(function(){
		$("#idcheck").click(function(){
			var id=$("#id").val();
			$.getJSON("<c:url value='/idcheck/json'/>",{id:id},function(data){
				alert(data.id);
			});
		});
	});

	function validate() {
	//////////비밀번호///////////
	//////////////////비밀번호 조건/////////////////////////////////////
	var pwd = document.getElementById("pwd").value;
	if (!(pwd.length >= 4 && pwd.length <= 20)) {
		alert("비밀번호는 4자에서 20자 사이이어야 합니다");
		return false;
	}
	for (var i = 0; i < pwd.length; i++) {
		var ch = u_pw.charAt(i);
		if (!((ch >= 'A' && ch <= 'Z') || (ch >= 'a' && ch <= 'z')
				|| (ch >= 0 && ch <= 9) || ch == '!' || ch == '@')) {
			alert("비밀번호는 영문자, 숫자, !, @로만 입력하세요!!");
			return;
		}
	}
	//////////////////////비밀번호 확인 조건///////////////////////////////////
	var pwdok = document.getElementById("pwdok").value;
	if (pwd != pwdok) {
		alert("비밀번호를 확인하세요");
		return false;
	}

	////////////////////빈 칸이 입력되면////////////////////////////////////////
	var id = document.getElementById("id").value;
	var pwd = document.getElementById("pwd").value;
	var email = document.getElementById("email").value;
	
	if ((id == null) || (pwd == null) || (pwdok == null)){
		alert("미입력된 부분이 있습니다");
		return false;
	}
	var idcheckbtn = document.getElementById("idcheckbtn");
	
	if ((idcheckbtn.disabled != true || emailcheckbtn.disabled != true)) {
		alert("중복확인을 해주세요");
		return false;
	}
	alert("회원가입이 완료되었습니다!!");
	return true;
}

</script>


<form method="post" action="<c:url value='/member'/>">
<div style="background-color: rgba(224, 224, 224, 0.78); position: absolute; top:100px; left: 630px; width: 545px; height: 680px; margin:auto;">
	<div style="font-weight:bold;font-size:25px; position:absolute; left:45px; top:2px; width:200px;">회원가입</div>
	
	<div style="border-radius: 2px; box-shadow: rgba(0, 0, 0, 0.227451) 3px 3px 8px 0px; background-color: rgb(250, 250, 250); 
	width:500px; height:600px; position:absolute; left:20px; top:40px;">
			
	<div style="font-size: 15px; color: rgb(158, 158, 158); position:absolute; top:8px; left: 30px;">아이디</div>
	
	<div style="background-color: rgb(158, 158, 158); width:470px; height:2px; position:absolute; top:30px; left:10px;"></div>
			
	<div style="width: 200px; height: 32px; position: absolute; top: 38px; left: 30px; ">
		<input type="text" name="id" id="id" style="color: rgb(94, 94, 94); border-radius: 4px 4px 4px 4px; border-width: 1px 1px 1px 1px; border-style: solid; 
		border-color: rgb(204, 204, 204); width: 200px; height: 30px;" placeholder="영문,숫자로만 입력">
		<input type="button" value="중복확인" id="idcheck">
	</div>
		
		
	<div style="font-size: 15px; color: rgb(158, 158, 158); position:absolute; top:79px; left: 30px;">비밀번호</div>
	
	<div style="background-color: rgb(158, 158, 158); width:470px; height:2px; position:absolute; top:101px; left:10px;"></div>
			
	<div style="width: 200px; height: 32px; position: absolute; top: 109px; left: 30px; ">
		<input type="password" name="pwd" style="color: rgb(94, 94, 94); border-radius: 4px 4px 4px 4px; border-width: 1px 1px 1px 1px; border-style: solid; 
		border-color: rgb(204, 204, 204); width: 200px; height: 30px;" placeholder="영문,숫자,!,@로만 입력">
	</div>
	
	<div style="width: 200px; height: 32px; position: absolute; top: 149px; left: 30px; ">
		<input type="password" name="pwdok" style="color: rgb(94, 94, 94); border-radius: 4px 4px 4px 4px; border-width: 1px 1px 1px 1px; border-style: solid; 
		border-color: rgb(204, 204, 204); width: 200px; height: 30px;" placeholder="비밀번호 확인">
	</div>
	
	
	<div style="font-size: 15px; color: rgb(158, 158, 158); position:absolute; top:192px; left: 30px;">이름</div>
	
	<div style="background-color: rgb(158, 158, 158); width:470px; height:2px; position:absolute; top:214px; left:10px;"></div>
			
	<div style="position: absolute; top: 224px; left: 30px; width: 200px; height: 32px;">
		<input type="text" name="name" style="color: rgb(94, 94, 94); border-radius: 4px 4px 4px 4px; border-width: 1px 1px 1px 1px; border-style: solid; 
		border-color: rgb(204, 204, 204); width: 200px; height: 30px;"><span></span>
	</div>
	
	<div style="font-size: 15px; color: rgb(158, 158, 158); position:absolute; top:265px; left: 30px;">이메일</div>
	
	<div style="background-color: rgb(158, 158, 158); width:470px; height:2px; position:absolute; top:287px; left:10px;"></div>
			
	<div style="width: 200px; height: 32px; position: absolute; top: 295px; left: 30px; ">
		<input type="text" name="email" style="color: rgb(94, 94, 94); border-radius: 4px 4px 4px 4px; border-width: 1px 1px 1px 1px; border-style: solid; 
		border-color: rgb(204, 204, 204); width: 200px; height: 30px;">
	</div>
	
	<div style="font-size: 15px; color: rgb(158, 158, 158); position:absolute; top:333px; left: 30px;">주소</div>
	
	<div style="background-color: rgb(158, 158, 158); width:470px; height:2px; position:absolute; top:353px; left:10px;"></div>
			
	<div id="addr" style="position: absolute; top: 361px; left: 30px; width: 200px; height: 32px;">
		<input type="text" name="addr" style="color: rgb(94, 94, 94); border-radius: 4px 4px 4px 4px; border-width: 1px 1px 1px 1px; border-style: solid; 
		border-color: rgb(204, 204, 204); width: 200px; height: 30px;" placeholder="ex)서울특별시  성북구">
	</div>
	
	<div style="font-size: 15px; color: rgb(158, 158, 158); position:absolute; top:401px; left: 30px;">생년월일</div>
	
	<div style="background-color: rgb(158, 158, 158); width:470px; height:2px; position:absolute; top:421px; left:10px;"></div>
			
	<div style="width: 200px; height: 32px; position: absolute; top: 430px; left: 30px; ">
		<input type="date" name="birth" style="color: rgb(94, 94, 94); border-radius: 4px 4px 4px 4px; border-width: 1px 1px 1px 1px; border-style: solid; 
		border-color: rgb(204, 204, 204); width: 200px; height: 30px;">
	</div>
	
	<div style="font-size: 15px; color: rgb(158, 158, 158); position:absolute; top:470px; left: 30px;">학교</div>
	
	<div style="background-color: rgb(158, 158, 158); width:470px; height:2px; position:absolute; top:490px; left:10px;"></div>
			
	<div id="school" style="width: 200px; height: 32px; position: absolute; top: 500px; left: 30px; ">
		<input type="text" name="school" style="color: rgb(94, 94, 94); border-radius: 4px 4px 4px 4px; border-width: 1px 1px 1px 1px; border-style: solid; 
		border-color: rgb(204, 204, 204); width: 200px; height: 30px;">
	</div>
	
	<div style="width:120px; height:40px; position:absolute; top:540px; left:190px;">
		<input type="submit" value="가입하기" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
		border-radius: 4px; background-color: rgb(52, 152, 219); position: absolute; width:120px; height:40px;" onclick="return validate()"> 
	</div>
</div>
</div>
</form>