<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!----------------- 여기서부터 왼쪽 사이드바 ----------------->
<div align="center" style="width: 250px; height: 200px;background-color: rgb(224, 224, 224);">
	<div align="center" style="display:inline-block;">
		<!-- 아이디 입력창 -->
		<div style="margin-top: 10px;display: inline-block;">
			<div style="width: 40px; height: 32px; float:left;background-color: rgb(241, 238, 238); border-radius: 4px 0px 0px 4px; border-color: rgb(204, 204, 204); border-style: solid; border-width: 1px 1px 1px 1px;">
			</div>
			<input type="text"	style="color: rgb(94, 94, 94);border-radius: 0px 4px 4px 0px; border-width: 1px 1px 1px 0px; border-style: solid; 
			border-color: rgb(204, 204, 204); width: 180px; height: 32px;float:left;">
		</div>
		<!-- 비밀번호 입력창 -->
		<div style="margin-top: 5px;display: inline-block;">
			<div style="width: 40px; height: 32px; float:left;background-color: rgb(241, 238, 238); border-radius: 4px 0px 0px 4px; border-color: rgb(204, 204, 204); border-style: solid; border-width: 1px 1px 1px 1px;">
			</div>
			<input type="text"	style="color: rgb(94, 94, 94);border-radius: 0px 4px 4px 0px; border-width: 1px 1px 1px 0px; border-style: solid; 
			border-color: rgb(204, 204, 204); width: 180px; height: 32px;float:left;">
		</div>
		<!-- 로그인버튼 -->
		<input type="submit" value="로그인" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; 
				line-height: 2.4em; border-radius: 4px; background-color: rgb(52, 152, 219); width: 220px; height:44px;margin-top: 5px;">
		<div style="margin-top: 5px;display: inline-block;">
			<!--------------------자동로그인 ---------------------------------->
			<div style="float:left;width: 20px; height: 20px;">
				<label data-form-control="checkbox" data-min-width="20" data-min-height="20">
				<input type="checkbox" checked="checked">
				<span data-form-decorator="true"></span></label>
			</div>
			<div style="float:left;width: 70px; height: 20px;">
				<div style="font-size: 12px;">자동로그인</div>
			</div>
			<!-----------------아이디저장 ---------------------------->
			<div style="float:left;width: 20px; height: 20px;margin-left: 10px;">
				<label data-form-control="checkbox" data-min-width="20" data-min-height="20">
				<input type="checkbox" checked="checked">
				<span data-form-decorator="true"></span></label>
			</div>
			<div style="float:left;width: 70px; height: 20px;">
				<div style="font-size: 12px;">아이디저장</div>
			</div>
			<!-- ---------------------------------------------------- -->	
		</div>
		<div style="display: inline-block;">
			<div style="float:left;width: 62px; height: 20px;">
				<div style="font-size: 13px; color: rgb(41, 90, 221); text-decoration: underline;">
				<a href="<c:url value='/member'/>" style="text-decoration: none;">회원가입</a></div>
			</div>
			<div style="float:left; height: 20px;margin-left: 10px;">
				<div style="font-size: 13px; color: rgb(41, 90, 221); text-decoration: underline;">
				<a href="<c:url value='/member'/>" style="text-decoration: none;">아이디/비밀번호 찾기</a></div>
			</div>
		</div>
	</div>
</div>
<div>
	<a href="<c:url value='/'/>">main</a>
	<a href="<c:url value='/market'/>">market</a>
	<a href="<c:url value='/admin'/>">admin</a>
	<a href="<c:url value='/noti'/>">notice</a>
</div>
	













