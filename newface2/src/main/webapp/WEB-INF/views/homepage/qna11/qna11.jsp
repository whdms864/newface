<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$( function() {
  $( "#tabs" ).tabs();
} );
</script>
<div style="background-color: rgba(224, 224, 224, 0.78);margin-left:20px;width: 95%;height: 800px;">
	<div style="margin-left: 30px;">
		<label style="font-weight:bold;font-size:25px;">1:1문의</label>
	</div>
	<div id="tabs" style="border: none;border-radius: 2px; box-shadow: rgba(0, 0, 0, 0.227451) 3px 3px 8px 0px; background-color: rgb(250, 250, 250); 
					width:90%; height:90%;margin-left:30px;padding: 0px;">
		<ul style="margin:0px;padding:0px;border-radius: 0px;">
		    <li><a href="#tabs-1">목록</a></li>
		    <li><a href="#tabs-2">작성</a></li>
		</ul>
		<div id="tabs-1">
			<div align="center">
				<table class="table table-hover" style="width: 90%;margin-top: 20px;">
				  		<tr class="success">
				  			<th>No.</th>
				  			<th>제목</th>
				  			<th>등록일</th>
				  			<th>상태</th>
				  			<th>상세보기</th>
				  		</tr>
				  		<c:set var="i" value="1"/>
				  		<c:forEach var="vo" items="${requestScope.list }">
				  			<tr>
					  			<td>${i}</td>
					  			<td>${vo.title}</td>
					  			<td>${vo.regdate}</td>
					  			<td>${vo.confirm}</td>
					  			<td><a href="<c:url value='/qna11/detail'/>">보기</a></td>
					  		</tr>
					  	</c:forEach>
				</table>
				<div style="position:absolute;top:650px;width: 85%;"align="center">
					<div style="background-color: rgba(224, 224, 224, 0.78);width: 490px; height:1px;"></div>
					페이징
				</div>
			</div>
		</div>
		<div id="tabs-2">
			<div align="left">
				<form method="post" id="f" name="f" action="<c:url value='/qna11/insertok'/>">
					<div style="margin-left:40px;">
						<div class="form-group has-warning" style="display: inline-block; ">
							<label class="control-label" for="inputWarning1">작성자</label>
							<br>
							<input type="text" name="id" class="form-control" readonly="readonly" value="${sessionScope.loginid }" style="width:400px;">
						</div>
					</div>
					<div style="margin-left:40px;">
						<div class="form-group has-warning" style="display: inline-block; ">
							<label class="control-label" for="inputWarning1">제목</label>
							<br>
							<input type="text" name="title" id="title" class="form-control" style="width:400px;">
						</div>
					</div>
					<div style="margin-left:40px;">
						<div class="form-group has-warning" style="display: inline-block; ">
							<label class="control-label" for="inputWarning1">문의내용</label>
							<br>
							<textarea rows="15" cols="51" name="content" class="form-control"></textarea>
						</div>
					</div>
					<div style="position:absolute;top:650px;width: 85%;"align="center">
							<div style="background-color: rgba(224, 224, 224, 0.78);width: 490px; height:1px;"></div>
							<input type="submit" id="join" name="join" value="등록" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
							border-radius: 4px; background-color: rgb(52, 152, 219);width:120px; height:40px;margin-top:10px;" > 
					</div>
				</form>
			</div>
		</div>
	</div>
</div>