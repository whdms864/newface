<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >

<form method="post" action="">
<div style="background-color: rgba(224, 224, 224, 0.78); position: absolute; top:100px; left: 630px; width: 545px; height: 680px; margin:auto;">
	<div style="font-weight:bold;font-size:25px; position:absolute; left:45px; top:2px; width:200px;">회원가입</div>
	
	<div style="border-radius: 2px; box-shadow: rgba(0, 0, 0, 0.227451) 3px 3px 8px 0px; background-color: rgb(250, 250, 250); 
	width:500px; height:600px; position:absolute; left:20px; top:40px;">
				
		
		<div style="font-size: 15px; color: rgb(158, 158, 158); position:absolute; top:8px; left: 30px;">아이디</div>
		
		<div style="background-color: rgb(158, 158, 158); width:470px; height:2px; position:absolute; top:30px; left:10px;"></div>
				
		<div id="id" style="width: 200px; height: 32px; position: absolute; top: 38px; left: 30px; ">
			<input type="text" name="id" style="color: rgb(94, 94, 94); border-radius: 4px 4px 4px 4px; border-width: 1px 1px 1px 1px; border-style: solid; 
			border-color: rgb(204, 204, 204); width: 200px; height: 30px;">
		</div>
		
		
		<div style="font-size: 15px; color: rgb(158, 158, 158); position:absolute; top:79px; left: 30px;">비밀번호</div>
		
		<div style="background-color: rgb(158, 158, 158); width:470px; height:2px; position:absolute; top:101px; left:10px;"></div>
				
		<div id="pwd" style="width: 200px; height: 32px; position: absolute; top: 109px; left: 30px; ">
			<input type="password" name="pwd" style="color: rgb(94, 94, 94); border-radius: 4px 4px 4px 4px; border-width: 1px 1px 1px 1px; border-style: solid; 
			border-color: rgb(204, 204, 204); width: 200px; height: 30px;">
		</div>
		
		<div id="pwdok" style="width: 200px; height: 32px; position: absolute; top: 149px; left: 30px; ">
			<input type="password" name="pwdok" style="color: rgb(94, 94, 94); border-radius: 4px 4px 4px 4px; border-width: 1px 1px 1px 1px; border-style: solid; 
			border-color: rgb(204, 204, 204); width: 200px; height: 30px;">
		</div>
		
		
		<div style="font-size: 15px; color: rgb(158, 158, 158); position:absolute; top:192px; left: 30px;">이름</div>
		
		<div style="background-color: rgb(158, 158, 158); width:470px; height:2px; position:absolute; top:214px; left:10px;"></div>
				
		<div id="name" style="position: absolute; top: 224px; left: 30px; width: 200px; height: 32px;">
			<input type="text" name="name" style="color: rgb(94, 94, 94); border-radius: 4px 4px 4px 4px; border-width: 1px 1px 1px 1px; border-style: solid; 
			border-color: rgb(204, 204, 204); width: 200px; height: 30px;">
		</div>
		
		<div style="font-size: 15px; color: rgb(158, 158, 158); position:absolute; top:265px; left: 30px;">이메일</div>
		
		<div style="background-color: rgb(158, 158, 158); width:470px; height:2px; position:absolute; top:287px; left:10px;"></div>
				
		<div id="email" style="width: 200px; height: 32px; position: absolute; top: 295px; left: 30px; ">
			<input type="text" name="email" style="color: rgb(94, 94, 94); border-radius: 4px 4px 4px 4px; border-width: 1px 1px 1px 1px; border-style: solid; 
			border-color: rgb(204, 204, 204); width: 200px; height: 30px;">
		</div>
		
		<div style="font-size: 15px; color: rgb(158, 158, 158); position:absolute; top:333px; left: 30px;">주소</div>
		
		<div style="background-color: rgb(158, 158, 158); width:470px; height:2px; position:absolute; top:353px; left:10px;"></div>
				
		<div id="addr" style="position: absolute; top: 361px; left: 30px; width: 200px; height: 32px;">
			<input type="text" name="addr" style="color: rgb(94, 94, 94); border-radius: 4px 4px 4px 4px; border-width: 1px 1px 1px 1px; border-style: solid; 
			border-color: rgb(204, 204, 204); width: 200px; height: 30px;">
		</div>
		
		<div style="font-size: 15px; color: rgb(158, 158, 158); position:absolute; top:401px; left: 30px;">생년월일</div>
		
		<div style="background-color: rgb(158, 158, 158); width:470px; height:2px; position:absolute; top:421px; left:10px;"></div>
				
		<div id="birth" style="width: 200px; height: 32px; position: absolute; top: 430px; left: 30px; ">
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
			border-radius: 4px; background-color: rgb(52, 152, 219); position: absolute; width:120px; height:40px;"> 
		</div>
	
	
	
	


</div>
</div>
</form>