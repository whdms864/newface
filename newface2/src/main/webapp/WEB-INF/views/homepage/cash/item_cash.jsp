<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/homepage/cash/main2.css?ver=20'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript">
$(document).ready(function(){
	 $("#btn_end").click(function(){
		 window.self.close(); 
	 });
});
</script>
<div id="main_wrap">
<form action="<c:url value='/market/buy/insert'/>" method="post" id="cash_add">
	<div style="font-size: 12px;margin-top: 20px;border: 1px solid red;width: 480px; height:200px; ">
		${vo.item_img }<br>
		${vo.item_name }
	</div>
	<div class="money" align="center">
		총 결제가격 : 도토리 ${vo.pay }개<br>
		<label>내가 가진 도토리수 : ${cnt }개</label>
	</div>
	<hr>
	<div class="small">
		<img src="<c:url value='/resources/images/homepage/느낌표.JPG'/>">
		본 아이템은 결제 완료 후 환불이 불가한 상품입니다.
	</div>
	<hr>
	<div id="btn_wrap">
		<input type="submit" value="결제" style="background :linear-gradient(#ffb000,#ff5e00);border: 1px solid #ff5e00  ">
		<input type="button" value="취소" id="btn_end" style="background: linear-gradient(#b4b4b4,gray); border: 1px solid gray">
	</div>
</form>
</div>
