<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>

<script type="text/javascript">
	$(document).ready(function(){
		$("form span").css({
			color:"red",
			fontsize:12
		});
		
		$(".required").focusin(function(){
			$(this).next().html("필수입력사항입니다");
		});
		$(".required").focusout(function(){
			$(this).next().html("");
		}); 
		$("a").click(function(event){
			//이벤트가 발생되었을 때 해야할 작업을 안하기(href로 연결된 페이지로 이동안하게 하기)
			event.preventDefault();
		});
		
		$("#idcheck").click(function(){
			var id=$("#id").val();
			$.getJSON("<c:url value='/idcheck/json'/>",{id:id},function(data){
				if(id==""){
					$("id").focus();
					$("#idok").html("아이디를 입력해주세요");
					return false;
				}
				
				if(!(id.length>=5 && id.length <=20)){
					$("#idok").html("아이디는 5자이상 20자 이하여야 합니다.");
					return false;
				}
				
				for (var i = 0; i < id.length; i++) {
					var ch = id.charAt(i);
					if (!((ch >= 'A' && ch <= 'Z') || (ch >= 'a' && ch <= 'z') || (ch >= 0 && ch <= 9))) {
						$("#idok").html("아이디는 영문자나 숫자로만 입력하세요");
						return false;
					}
				}
				$("#idok").html("사용하실 수 있습니다");
				idcheck.disabled = true;
			});
		});
		
		
		$("#pwd").keyup(function(){
			var pwd=$("#pwd").val();
			
			if(pwd.length<4 || pwd.length>20 || pwd==""){
				$("#pwd1").html("비밀번호를 4자 이상 20자 이하로 입력하세요");
			
			}else{
				$("#pwd1").html("");	
			}
		});
		
		$("#pwdok").keyup(function(){
			var pwd=$("#pwd").val();
			var pwdok=$("#pwdok").val();
			if(pwd.length<4 || pwd.length>20 || pwd==""){
				$("#pwd1").html("비밀번호를 4자 이상 20자 이하로 입력하세요");
			
			}else if(pwd!=pwdok || pwdok==""){
				$("#pwdok").focus();
				$("#pwd2").html("비밀번호가 일치하지 않습니다");
			}else{
				$("#pwd2").html("");
			}
		});
		
		$("form").submit(function(event){
			var id=$("#id").val();
			
			var pwdok=$("#pwdok").val();
			var name=$("#name").val();
			
			if(id==""){
				$("#idok").html("아이디를 입력해주세요");
				event.preventDefault();
						
			}else if(name==""){
				$("#name").focus();
				event.preventDefault();
			}else if(idcheck.disabled != true){
				alert("아이디 중복확인 해주세요");
				event.preventDefault();
			}
		});
		
		
});

</script>
<form method="post" id="f" name="f" action="<c:url value='/member/insert'/>">
<div style="background-color: rgba(224, 224, 224, 0.78);margin-left:20px;width: 95%;height: 800px;"align="center">
		<div style="font-weight:bold;font-size:25px;">회원가입</div>
	<div style="border-radius: 2px; box-shadow: rgba(0, 0, 0, 0.227451) 3px 3px 8px 0px; background-color: rgb(250, 250, 250); 
	width:70%; height:80%;"align="left" >
		<div style="font-size: 15px; color: rgb(158, 158, 158);">아이디(*)</div>
		<div style="background-color: rgb(158, 158, 158); width:470px; height:1px;"></div>
		<div style="width: 200px; height: 32px;display: inline-block;">
			<input type="text" name="id" id="id" style="color: rgb(94, 94, 94); border-radius: 4px 4px 4px 4px; border-width: 1px 1px 1px 1px; border-style: solid; 
			border-color: rgb(204, 204, 204); width: 200px; height: 30px;float: left; padding:10px;" placeholder="영문,숫자로만 입력" class="required"><span id="idok"></span>
			<input type="button" value="중복확인" id="idcheck" style="height: 30px;float: left;">
		</div>
			
		<div style="font-size: 15px; color: rgb(158, 158, 158);">비밀번호(*)</div>
		
		<div style="background-color: rgb(158, 158, 158); width:470px; height:2px;"></div>
				
		<div style="width: 200px; height: 32px;">
			<input type="password" name="pwd" id="pwd" style="color: rgb(94, 94, 94); border-radius: 4px 4px 4px 4px; border-width: 1px 1px 1px 1px; border-style: solid; 
			border-color: rgb(204, 204, 204); width: 200px; height: 30px; padding:10px;" placeholder="비밀번호" class="required"><span  id="pwd1"></span>
		</div>
		
		<div style="width: 200px; height: 32px;">
			<input type="password" name="pwdok" id="pwdok" style="color: rgb(94, 94, 94); border-radius: 4px 4px 4px 4px; border-width: 1px 1px 1px 1px; border-style: solid; 
			border-color: rgb(204, 204, 204); width: 200px; height: 30px; padding:10px; float:left;" placeholder="비밀번호 확인" class="required"><span id="pwd2"></span>
			
		</div>
		
		<div style="font-size: 15px; color: rgb(158, 158, 158);">이름(*)</div>
		<div style="background-color: rgb(158, 158, 158); width:470px; height:2px;"></div>
		<div style="width: 200px; height: 32px;">
			<input type="text" name="name" id="name" style="color: rgb(94, 94, 94); border-radius: 4px 4px 4px 4px; border-width: 1px 1px 1px 1px; border-style: solid; 
			border-color: rgb(204, 204, 204); width: 200px; height: 30px;"class="required"><span id="nameok"></span>
		</div>
		
		<div style="font-size: 15px; color: rgb(158, 158, 158);">이메일</div>
		
		<div style="background-color: rgb(158, 158, 158); width:470px; height:2px;"></div>
				
		<div style="width: 200px; height: 32px;">
			<input type="email" name="email" id="email" style="color: rgb(94, 94, 94); border-radius: 4px 4px 4px 4px; border-width: 1px 1px 1px 1px; border-style: solid; 
			border-color: rgb(204, 204, 204); width: 200px; height: 30px;">
		</div>
		
		<div style="font-size: 15px; color: rgb(158, 158, 158);">주소</div>
		
		<div style="background-color: rgb(158, 158, 158); width:470px; height:2px;"></div>
				
		<div id="addr" style="width: 200px; height: 32px;">
			<input type="text" name="addr" id="addr" style="color: rgb(94, 94, 94); border-radius: 4px 4px 4px 4px; border-width: 1px 1px 1px 1px; border-style: solid; 
			border-color: rgb(204, 204, 204); width: 200px; height: 30px; padding:10px;" placeholder="ex)서울특별시  성북구">
		</div>
		
		<div style="font-size: 15px; color: rgb(158, 158, 158);">생년월일</div>
		
		<div style="background-color: rgb(158, 158, 158); width:470px; height:2px;"></div>
				
		<div style="width: 200px; height: 32px;">
			<input type="date" name="birth" id="birth" style="color: rgb(94, 94, 94); border-radius: 4px 4px 4px 4px; border-width: 1px 1px 1px 1px; border-style: solid; 
			border-color: rgb(204, 204, 204); width: 200px; height: 30px;">
		</div>
		
		<div style="font-size: 15px; color: rgb(158, 158, 158);">학교</div>
		
		<div style="background-color: rgb(158, 158, 158); width:470px; height:2px;"></div>
				
		<div id="school" style="width: 200px; height: 32px;">
			<input type="text" name="school" id="school" style="color: rgb(94, 94, 94); border-radius: 4px 4px 4px 4px; border-width: 1px 1px 1px 1px; border-style: solid; 
			border-color: rgb(204, 204, 204); width: 200px; height: 30px;">
		</div>
		
		<div style="width:120px; height:40px;">
			<input type="submit" id="join" name="join" value="가입하기" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
			border-radius: 4px; background-color: rgb(52, 152, 219);width:120px; height:40px;" > 
		</div>
	</div>
</div>
</form>