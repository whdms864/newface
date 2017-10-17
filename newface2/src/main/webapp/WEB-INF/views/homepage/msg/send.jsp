<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
<script type="text/javascript" charset="utf-8">
	
	
</script>

<div style="background-color: rgba(250, 250, 250, 0.78); margin-left:7px; margin-top:25px; width: 96%; height: 335px;"align="center">
	<form action="<c:url value='/msg_send'/>" method="post">
		<div style="width:420px; height:25px; margin-top:30px">
			<span style="float:left; margin-right:10px;">받는 사람</span>
			<input type="text" id="receiver" name="receiver" style="width:120px; height:25px; float:left; margin-bottom:6px;" value="${msgrecv_getinfo.sender}">
			
			<div class="btn-group">
			  <button class="btn btn-secondary btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    Small button
			  </button>
			  <button type="button" class="btn btn-sm btn-secondary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    <span class="sr-only">Toggle Dropdown</span>
			  </button>
			  <div class="dropdown-menu">
			    <c:forEach var="iu" items="${sessionScope.iu_list }">
					<input type="checkbox" value="${iu.hompy_num }">${iu.name } (${iu.u_id})		
				</c:forEach>
			  </div>
			</div>
		</div>
		
		<div style="margin-top:15px; height:250px;">
			<textarea name="content" style="width:100%; height:100%;"></textarea>
		</div>
		<input type="hidden" name="sender" value="${loginid }">
					
		<div style="margin-top:10px;">
			<input type="submit" value="보내기">
		</div>
	</form>
</div>



	
	
	