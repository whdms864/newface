<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<div style="background-color: rgba(224, 224, 224, 0.78);margin-left:20px;width: 95%;height: 800px;">
	<div style="margin-left: 30px;">
		<label style="font-weight:bold;font-size:25px;">아이디/비밀번호 찾기</label>
	</div>
	<div style="border-radius: 2px; box-shadow: rgba(0, 0, 0, 0.227451) 3px 3px 8px 0px; background-color: rgb(250, 250, 250); 
		width:90%; height:90%;margin-left:30px;padding: 10px;"align="left">
		<form method="post" id="f" name="f" action="<c:url value='/member/searchid'/>">
			<div style="margin-left: 30px; margin-top:20px;">
				<label style="font-weight:bold;font-size:15px;">아이디 찾기</label>
			</div>
			
			<div style="margin-left:50px;">
				<div class="form-group has-warning" style="display: inline-block; ">
	  				<label class="control-label" for="inputWarning1">이름</label>
	  				<br>
	  				<input type="text" name="name" id="name" class="form-control" style="width:400px;">
	  				<span id="nameok"></span>
				</div>
				<div class="form-group has-warning" style="display: inline-block; ">
	  				<label class="control-label" for="inputWarning1">이메일</label>
	  				<br>
	  				<input type="email" name="email" id="email" class="form-control" style="width:400px;">
					<input type="submit" id="serachid" name="serachid" value="아이디찾기" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
					border-radius: 4px; background-color: rgb(52, 152, 219);width:120px; height:40px;margin-top:10px;"> 
				</div>
				<!-- <div style="position:absolute;top:700px;width: 85%;"align="center">
				</div> -->
				
			</div>
		</form>
				<div style="background-color: rgba(224, 224, 224, 0.78);width: 490px; height:1px; margin-top:20px;"></div>
		<br><br>
		<form method="post" id="f" name="f" action="<c:url value='/member/searchid'/>">
			<div style="margin-left: 30px;">
				<label style="font-weight:bold;font-size:15px;">비밀번호 찾기</label>
			</div>
			
			<div style="margin-left:50px;">
				<div class="form-group has-warning" style="display: inline-block; ">
	  				<label class="control-label" for="inputWarning1">아이디</label>
	  				<br>
	  				<input type="text" name="name" id="name" class="form-control" style="width:400px;">
	  				<span id="nameok"></span>
				</div>
				<div class="form-group has-warning" style="display: inline-block; ">
	  				<label class="control-label" for="inputWarning1">이메일</label>
	  				<br>
	  				<input type="email" name="email" id="email" class="form-control" style="width:400px;">
					<input type="submit" id="serachpwd" name="serachpwd" value="비밀번호 찾기" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
					border-radius: 4px; background-color: rgb(52, 152, 219);width:120px; height:40px;margin-top:10px;"> 
				</div>
				<!-- <div style="position:absolute;top:700px;width: 85%;"align="center">
				</div> -->
				<div style="background-color: rgba(224, 224, 224, 0.78);width: 490px; height:1px;"></div>
			</div>
		</form>
	</div>
	
	<!-- <div style="border-radius: 2px; box-shadow: rgba(0, 0, 0, 0.227451) 3px 3px 8px 0px; background-color: rgb(250, 250, 250); 
		width:90%; height:90%;margin-left:30px;padding: 10px;"align="left">
		
	 </div> -->
</div>

