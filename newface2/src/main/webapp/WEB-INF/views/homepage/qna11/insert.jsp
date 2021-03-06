<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#qna11_insert_form").submit(function(event){
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
		}
	});
});
</script>
<div id="tab">
		<div style="margin-left: 30px;margin-top: 10px;">
			<label style="font-weight:bold;font-size:25px;">1:1문의</label>
		</div>
		<ul>
		    <li><a href="<c:url value='/qna11/getinfo'/>"style="margin-left:0px;">목록</a></li>
		    <li><a href="<c:url value='/qna11/insert'/>" class="hover_a">작성</a></li>
		</ul>
	</div>
<div id="con">
	<div align="left" style="margin-top: 20px;">
		<form method="post" id="qna11_insert_form" action="<c:url value='/qna11/insertok'/>">
			<div style="margin-left:55px;">
				<div class="form-group has-warning" style="display: inline-block; ">
					<label class="control-label" for="inputWarning1">작성자</label>
					<br>
					<input type="text" name="id" class="form-control" readonly="readonly" value="${sessionScope.loginid }" style="width:400px;">
				</div>
			</div>
			<div style="margin-left:55px;">
				<div class="form-group has-warning" style="display: inline-block; ">
					<label class="control-label" for="inputWarning1">제목</label>
					<br>
					<input type="text" name="title" id="qna11_title" class="form-control" style="width:400px;">
				</div>
			</div>
			<div style="margin-left:55px;">
				<div class="form-group has-warning" style="display: inline-block; ">
					<label class="control-label" for="inputWarning1">문의내용</label>
					<br>
					<textarea rows="10" cols="51" id="qna11_content" name="content" class="form-control" style="resize: none;"></textarea>
				</div>
			</div>
			<div style="position:absolute;top:620px;width: 98%;"align="center">
					<div style="background-color: rgba(224, 224, 224, 0.78);width: 490px; height:1px;"></div>
					<input type="submit" value="등록" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
					border-radius: 4px; background-color: rgb(52, 152, 219);width:120px; height:40px;margin-top:10px;" > 
			</div>
		</form>
	</div>
</div>
