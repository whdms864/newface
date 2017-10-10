<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/homepage/cash/main.css?ver=20'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript">
$(document).ready(function(){
	/* $("#qna11_insert_form").submit(function(event){
		var title=$("#qna11_title").val();
		var content=$("#qna11_content").val();
		
		if(title==""){
			$("#qna11_title").focus();
			alert("제목을 입력해주세요");
			event.preventDefault();
		}else if(content==""){
			$("#qna11_content").focus();
			alert("문의할 내용을 입력해주세요");
			event.preventDefault();
		} */
	});
});
</script>
<div id="main_wrap">
<form action="" method="post">
	<div id="title">
		싸이 충전 
		<label style="font-weight: lighter;color: rgb(220, 220, 220);"> | </label>
		<label style="color: #ff8100;">핸드폰 결제</label>
		<br>
		<label style="font-size: 13px;font-weight:lighter;">현재잔액 0개</label>
	</div>
	<hr size="2" color= "gray">
	<div style="font-size: 12px;margin-top: 20px;">
		<label style="font-weight: bold;">싸이 충전 </label>
		(싸이는 10개 단위로 충전 가능합니다.)
	</div>
	<div class="money">
		<input type="radio" value="10" name="mon" checked="checked" style="margin-left: 10px;">
		<label >10</label>개(1,000원)&nbsp;&nbsp;&nbsp;
		<input type="radio" value="30" name="mon">
		<label>30</label>개(3,000원)&nbsp;&nbsp;&nbsp;
		<input type="radio" value="50" name="mon">
		<label>50</label>개(5,000원)
		<input type="radio" value="100" name="mon">
		<label>100</label>개(10,000원)
		<br>
		<input type="radio" value="300" name="mon" style="margin-left: 10px;">
		<label>300</label>개(30,000원)
		<input type="radio" value="500" name="mon">
		<label>500</label>개(50,000원)
		<input type="radio" value="직접입력" name="mon">
		직접입력&nbsp;<input type="text" name="mon" size="4" style="margin: 0px;">개(<span>0</span>원)
	</div>
	<div style="font-size: 12px;margin-top: 20px;font-weight: bold;">
		결제 수단
	</div>
	<div class="money">
		<label style="margin-left: 10px;color: black;">선택된 결제 수단</label>
		<select style="font-size: 12px;height: 20px;">
			<option value="핸드폰 결제">핸드폰 결제</option>
		</select>
	</div>
	<div style="font-size: 12px;margin :20px 30px 20px;font-weight: bold;" id="info_input">
		<div>
			<div>
				핸드폰번호 
				<select style="font-size: 12px;height: 20px;width:54px;margin-left: 24px;">
					<option value="KT">KT</option>
					<option value="LG">LG</option>
					<option value="SKT">SKT</option>
				</select>
				<input type="text" name="ph1" style="margin-left: 10px;"> -
				<input type="text" name="ph2"> -
				<input type="text" name="ph3">
			</div>
			<div style="margin-top: 5px;">
				가입자주민번호
				<input type="text" name="jumin1"> -
				<input type="text" name="jumin2">
			</div>
			<div class="small">
				<input type="checkbox" id="chk1" style="width: 15px;">
				<label>이용약관에 동의합니다.</label><br>
				<input type="checkbox" id="chk2" style="width: 15px;margin-top: 3px;">
				<label>결제 대행사에 결제정보를 제공하는 것을 동의합니다.</label>
			</div>
		</div>
	</div>
	<hr>
	<div class="small">
	· 충전하시는 이용요금은 다음달 핸드폰 요금고지서의 정보이용료 항목으로 통합 청구됩니다.<br>
	· 핸드폰 주인의 동의 없이 사용한 경우 범죄에 해당되어 형사처벌 될 수 있습니다.<br>
	· 미성년자, 법인 핸드폰은 이용하실 수 없으며, 이동사의 상황에 따라 전송시간이 지연될 수도 있습니다.<br>
	</div>
	<hr>
	<div id="btn_wrap">
		<input type="submit" value="결제" style="background :linear-gradient(#ffb000,#ff5e00);border: 1px solid #ff5e00  ">
		<input type="button" value="취소" id="end" style="background: linear-gradient(#b4b4b4,gray); border: 1px solid gray">
	</div>
</form>
</div>
