<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<form method="post" action="<c:url value='/member/update'/>">
		<div style="margin-left:50px;">
			<div class="form-group has-warning" style="display: inline-block; ">
  				<label class="control-label" for="inputWarning1">아이디</label>
  				
  				<br>
  				<input type="text" name="id" id="id" class="form-control" style="width:400px;" value="${vo.id }" readonly="readonly">
  				<span id="idok"></span>
			</div>	
			<div class="form-group has-warning" style="display: inline-block; ">
  				<label class="control-label" for="inputWarning1">이름</label>
  				
  				<br>
  				<input type="text" name="name" id="name" class="form-control" style="width:400px;" value="${vo.name }" readonly="readonly">
  				<span id="nameok"></span>
			</div>
			<div class="form-group has-warning" style="display: inline-block; ">
  				<label class="control-label" for="inputWarning1">이메일</label>
  				<br>
  				<input type="text" name="email" id="email" class="form-control" style="width:400px;" value="${vo.email }" readonly="readonly">
			</div>
			<div class="form-group has-warning" style="display: inline-block; ">
  				<label class="control-label" for="inputWarning1">주소</label>
  				<br>
  				<input type="text" name="addr" id="addr" class="form-control" style="width:400px;" value="${vo.addr }" readonly="readonly">
			</div>
			<div class="form-group has-warning" style="display: inline-block; ">
  				<label class="control-label" for="inputWarning1">생년월일</label>
  				<br>
  				<input type="text" name="birth" id="birth" class="form-control" style="width:400px;" value="${vo.birth }" readonly="readonly">
			</div>
			<div class="form-group has-warning" style="display: inline-block; ">
  				<label class="control-label" for="inputWarning1">학교</label>
  				<br>
  				<input type="text" name="school" id="school" class="form-control" style="width:400px;" value="${vo.school }" readonly="readonly">
			</div>
			<div class="form-group has-warning" style="display: inline-block; ">
  				<label class="control-label" for="inputWarning1">가입일</label>
  				<br>
  				<input type="text" name="regdate" id="regdate" class="form-control" style="width:400px;" value="${vo.regdate }" readonly="readonly">
			</div>
		</div>
		<div style="position:absolute;top:610px;width: 100%;"align="center">
			<div style="background-color: rgba(224, 224, 224, 0.78);width: 490px; height:1px;"></div>
			<input type="button" id="update" name="update" value="수정" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
			border-radius: 4px; background-color: rgb(52, 152, 219);width:120px; height:40px;margin-top:10px;" onClick="location.href='/newface/member/update?id=${sessionScope.loginid}'">
			<input type="button" id="leave" name="leave" value="탈퇴" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
			border-radius: 4px; background-color: rgb(52, 152, 219);width:120px; height:40px;margin-top:10px;" onClick="location.href='/newface/member/leave?id=${sessionScope.loginid}'">
		</div>
	</form>
</div>
