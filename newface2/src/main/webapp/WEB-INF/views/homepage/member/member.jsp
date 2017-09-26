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
		
		$(".form-control").focusin(function(){
			$(this).next().html("필수입력사항입니다");
		});
		$(".form-control").focusout(function(){
			$(this).next().html("");
		}); 
				
		$("#id").keyup(function(){
			var id=$("#id").val();
			$.getJSON("<c:url value='/idcheck/json'/>",{id:id},function(data){
				
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
				$("#idok").html(data.id);
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
			
			if(pwd!=pwdok || pwdok==""){
				$("#pwdok").focus();
				$("#pwd2").html("비밀번호가 일치하지 않습니다");
			}else{
				$("#pwd2").html("");
			}
		});
		
		$("#f").submit(function(event){
			var id=$("#id").val();
			var pwd=$("#pwd").val();
			var pwdok=$("#pwdok").val();
			var name=$("#name").val();
			
			if(id==""){
				$("#id").focus();
				$("#idok").html("아이디를 입력해주세요");
				event.preventDefault();
			}else if(name==""){
				$("#name").focus();
				event.preventDefault();
			}else if(pwd==""){
				$("#pwd").focus();
				$("#pwd1").html("비밀번호를 입력해주세요");
				event.preventDefault();
			}else if(pwdok==""){
				$("#pwdok").focus();
				$("#pwd2").html("비밀번호확인란을 입력해주세요");
				event.preventDefault();
			}
		});
});

</script>
<div style="background-color: rgba(224, 224, 224, 0.78);margin-left:20px;width: 95%;height: 800px;">
	<div style="margin-left: 30px;">
		<label style="font-weight:bold;font-size:25px;">회원가입</label>
	</div>
	<div style="border-radius: 2px; box-shadow: rgba(0, 0, 0, 0.227451) 3px 3px 8px 0px; background-color: rgb(250, 250, 250); 
		width:90%; height:90%;margin-left:30px;padding: 10px;"align="left">
		<form method="post" id="f" name="f" action="<c:url value='/member/insert'/>">
			<div  style="margin-left:50px;">
				<div class="form-group has-warning" style="display: inline-block; ">
	  				<label class="control-label" for="inputWarning1">아이디</label>
	  				<label class="control-label" for="inputWarning1" style="color:#a94442;">(*)</label>
	  				<br>
	  				<input type="text" name="id" id="id" class="form-control" style="width:400px;"placeholder="영문,숫자로만 입력">
	  				<span id="idok"></span>
				</div>	
				<div class="form-group has-warning" style="display: inline-block; ">
	  				<label class="control-label" for="inputWarning1">비밀번호</label>
	  				<label class="control-label" for="inputWarning1" style="color:#a94442;">(*)</label>
	  				<br>
	  				<input type="password" name="pwd" id="pwd" class="form-control" style="width:400px;"placeholder="비밀번호">
	  				<span id="pwd1"></span>
	  				<input type="password" name="pwdok" id="pwdok" class="form-control" style="width:400px;margin-top:10px;" placeholder="비밀번호 확인">
	  				<span id="pwd2"></span>
				</div>
				<div class="form-group has-warning" style="display: inline-block; ">
	  				<label class="control-label" for="inputWarning1">이름</label>
	  				<label class="control-label" for="inputWarning1" style="color:#a94442;">(*)</label>
	  				<br>
	  				<input type="text" name="name" id="name" class="form-control" style="width:400px;">
	  				<span id="nameok"></span>
				</div>
				<div class="form-group has-warning" style="display: inline-block; ">
	  				<label class="control-label" for="inputWarning1">이메일</label>
	  				<br>
	  				<input type="email" name="email" id="email" class="form-control" style="width:400px;">
				</div>
				<div class="form-group has-warning" style="display: inline-block; ">
	  				<label class="control-label" for="inputWarning1">주소</label>
	  				<br>
	  				<input type="email" name="email" id="email" class="form-control" style="width:400px;"placeholder="ex)서울특별시  성북구">
				</div>
				<div class="form-group has-warning" style="display: inline-block; ">
	  				<label class="control-label" for="inputWarning1">생년월일</label>
	  				<br>
	  				<input type="date" name="birth" id="birth" class="form-control" style="width:400px;">
				</div>
				<div class="form-group has-warning" style="display: inline-block; ">
	  				<label class="control-label" for="inputWarning1">학교</label>
	  				<br>
	  				<input type="text" name="school" id="school" class="form-control" style="width:400px;">
				</div>
			</div>
			<div style="position:absolute;top:700px;width: 85%;"align="center">
				<div style="background-color: rgba(224, 224, 224, 0.78);width: 490px; height:1px;"></div>
				<input type="submit" id="join" name="join" value="가입하기" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
				border-radius: 4px; background-color: rgb(52, 152, 219);width:120px; height:40px;margin-top:10px;" > 
			</div>
		</form>
	</div>
</div>