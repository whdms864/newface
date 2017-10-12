<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/homepage/cash/main2.css?ver=23'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript">
$(document).ready(function(){
	 $("#btn_end").click(function(){
		 window.self.close(); 
	 });
});
</script>
<div id="main_wrap" align="center">
<form action="<c:url value='/market/buy'/>" method="post" id="cash_add">
	<div style="font-size: 12px;margin-top: 20px;border: 1px solid rgb(210, 209, 209);width: 450px; height:290px; ">
		<div style="width: 100%; height: 190px;"class="item_img">
			${vo.item_img }
			<input type="hidden" name="item_num" value="${vo.item_num }">
			<input type="hidden" id="pay" value="${vo.pay }">
			<input type="hidden" id="cnt" value="${cnt }">
		</div>
		<div class="info">
			<div>
				<label>[ ${vo.name } ]</label>
				<br>
				${vo.content }
			</div>
		</div>
	</div>
	<div id="btn_wrap">
		<input type="button" value="확인" id="btn_end" style="background: linear-gradient(#b4b4b4,gray); border: 1px solid gray;margin-left: 15px;">
	</div>
</form>
</div>
