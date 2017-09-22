<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!----------------- 여기서부터 왼쪽 사이드바 ----------------->

<div style="width: 200px; height: 192px;">
	<!-- 아이디 입력창 -->
	<div id="id" style="width: 150px; height: 32px;">
		<input type="text"	style="color: rgb(94, 94, 94); border-radius: 0px 4px 4px 0px; border-width: 1px 1px 1px 0px; border-style: solid; 
		border-color: rgb(204, 204, 204); width: 150px; height: 30px;">
	</div>

	<div id="lid"
		style="margin-top:10px;width: 30px; height: 32px; background-color: rgb(241, 238, 238); border-radius: 4px 0px 0px 4px; border-color: rgb(204, 204, 204); border-style: solid; border-width: 1px 1px 1px 1px;">
	</div>

	<!-- 비밀번호 입력창 -->
	<div id="pwd"
		style="margin-top:10px;width: 150px; height: 32px;">
		<input type="password"
			style="color: rgb(94, 94, 94); border-radius: 0px 4px 4px 0px; border-width: 1px 1px 1px 0px; border-style: solid; border-color: rgb(204, 204, 204); width: 150px; height: 30px;"
			spellcheck="false">
	</div>

	<div id="lpwd"
		style="margin-top:10px;width: 30px; height: 32px; background-color: rgb(241, 238, 238); border-radius: 4px 0px 0px 4px; border-color: rgb(204, 204, 204); border-style: solid; border-width: 1px 1px 1px 1px;">
	</div>

	<div style="width: 182px; height:44px;top:190px; left: 410px;">
	<input type="submit" value="로그인" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; 
		line-height: 2.4em; border-radius: 4px; background-color: rgb(52, 152, 219); width: 182px;">
	</div>
	
		<!--------------------자동로그인 ---------------------------------->
		<div style="top: 234px; left: 415px; width: 15px; height: 14.5714px;">
			<label data-form-control="checkbox" data-min-width="20"
				data-min-height="20"> <input type="checkbox"
				checked="checked"><span data-form-decorator="true"></span></label>
		</div>
		<div style="top: 235px; left: 435px; width: 70px; height: 20px;">
			<div style="font-size: 12px;">자동로그인</div>
		</div>
	</div>
	<!-- ------------------------------------------------------------- -->

	<!-----------------아이디저장 ---------------------------->
	<div style="left: 265px; top: 204px; width: 73px; height: 17px;">
		<div style="top: 31px; left: 235px; width: 15px; height: 14.5714px;">
			<label data-form-control="checkbox" data-min-width="20"	
				data-min-height="20"> <input type="checkbox"
				checked="checked"></label>
		</div>
		<div style="top: 32px; left: 255px; width: 70px; height: 17px;">
			<div data-text-content="true" style="font-size: 12px;">아이디저장</div>
		</div>
	</div>
	<!-- ---------------------------------------------------- -->	
	<div style="background-color: rgb(224, 224, 224); width: 100%; height: 100%;">


	<div style="top: 260px; left: 410px; width: 62px; height: 20px;">
		<div style="font-size: 13px; color: rgb(41, 90, 221); text-decoration: underline;"><a href="<c:url value='/member'/>" style="text-decoration: none;">회원가입</a></div>
	</div>
	<div style="top: 260px; left: 470px; width: 140px; height: 20px;">
		<div style="font-size: 13px; color: rgb(41, 90, 221); text-decoration: underline;">아이디/비밀번호 찾기</div>
	</div>

	
	
</div>
		<div>
		<a href="<c:url value='/'/>">main</a>
		</div>
		<div>
		<a href="<c:url value='/market'/>">market</a>
		</div>
		<div>
		<a href="<c:url value='/admin'/>">admin</a>
		</div>
		<div>
		<a href="<c:url value='/noti'/>">notice</a>
		</div>














