<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
<script type="text/javascript" charset="utf-8">
$(function(){
	
	$("#iu_list").click(function(){
		var iu_list=$("#iu_list").val();
		$("#receiver").val(iu_list);
	});
	
});

	
</script>

<div style="background-color: rgba(250, 250, 250, 0.78); margin-left:7px; margin-top:25px; width: 96%; height: 335px;"align="center">
	<form action="<c:url value='/msg_send'/>" method="post">
		
		<div style="width:430px; height:37px; margin-top:25px; background-color: #fcf8e3;">
			<span style="float:left; margin-left:7px; margin-top:8px; font-weight: bold;">쪽지보내기</span>
		</div>
		<div style="width:420px; height:25px; margin-top:7px; margin-left:10px;">
			<span style="float:left; margin-right:10px; margin-top:3px; font-weight: bold;">받는 사람</span>
			<input type="text" id="receiver" name="receiver" style="width:120px; height:30px; float:left;">
			
		<select style="width:150px; height:30px;" id="iu_list">
				<option></option>
			<c:forEach var="iu" items="${sessionScope.iu_list }">
				<option value="${iu.u_id}">${iu.name } (${iu.u_id})</option>		
			</c:forEach>
		</select>
		
		</div>
		
		<div style="background-color: rgb(224, 224, 224);margin-left:0px;width: 430px; height:2px; position:absolute; top:91px;"></div>
		
		<div style="background-color: rgb(224, 224, 224);margin-left:0px;width: 430px; height:2px; position:absolute; top:135px;"></div>
		
		<div style="margin-top:25px; height:180px; margin-left:7px;">
			<textarea name="content" style="width:100%; height:100%; resize: none;"></textarea>
		</div>
		<input type="hidden" name="sender" value="${loginid }">
					
		<div style="margin-top:10px;">
			<button type="submit" class="btn btn-warning btn-sm">보내기</button>
		</div>
	</form>
</div>



	
	
	