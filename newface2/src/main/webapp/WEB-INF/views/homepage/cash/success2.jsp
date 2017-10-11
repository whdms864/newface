<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/homepage/cash/main.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#btn_end").click(function(){
			opener.parent.location.reload();
			window.self.close();
		});
		$("#btn_link").click(function(){
			opener.parent.location='<c:url value="/member/mypage?id=${loginid}"/>';
			window.self.close();
		});
	});
</script>
<div id="main_wrap" style="font-size: 30px;font-weight:bold;margin-top: 50px;" align="center">
	<label style="color: #ff8100;">결제를 완료하였습니다.</label><br>
	<img src="<c:url value='/resources/images/homepage/싸이_가상화폐.png'/>" style="margin-top: 30px;width: 150px; height: 150px;">
	<br>
	<label style="font-weight:lighter;font-size: 20px;">현재 잔액 ${cnt }개</label>
	<div id="btn_wrap" style="margin: 0px;margin-top: 70px;">
		<input type="button" value="마이페이지" id="btn_link" style="background :linear-gradient(#ffb000,#ff5e00);border: 1px solid #ff5e00;width: 80px; ">
		<input type="button" value="확인" id="btn_end" style="background: linear-gradient(#b4b4b4,gray); border: 1px solid gray;margin:0px;margin-right: 20px;">
	</div>
</div>
