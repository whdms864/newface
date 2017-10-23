<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#qna11_com_form_update").submit(function(event){
		var content=$("#qna11_com_content").val();
		if(content==""){
			$("#qna11_com_content").focus();
			alert("답변할 내용을 입력해주세요");
			event.preventDefault();
		}
	});
});
</script>
<div id="sidebar">
	<ul>
		<li>
			<a href="<c:url value='/notiadmin_list'/>"style="margin-top: 0px;">공지사항</a>
		</li>
		<li>
			<a href="<c:url value='/ader_list'/>" >광고관리</a>
		</li>
		<li>
			<a href="<c:url value='/qna11/admin/list'/>" class="now">1:1문의</a>
		</li>
		<li>
			<a href="<c:url value='/market/admin/item/list'/>">마켓관리</a>
		</li>
		<li>
			<a href="<c:url value='/memadmin'/>" >회원관리</a>
		</li>
		<li>
			<a href="<c:url value='/singoadmin'/>">신고관리</a>
		</li>
	</ul>
</div>
<div id="con_wrap">
	<div id="tab">
		<div style="margin-left: 30px;margin-top: 10px;">
			<label style="font-weight:bold;font-size:25px;">1:1문의</label>
		</div>
		<ul>
		    <li><a href="<c:url value='/qna11/admin/list'/>"style="margin-left:0px;" class="hover_a">목록</a></li>
		</ul>
	</div>
	<div id="con">
		<div align="center">
			<table class="table" style="width: 90%;margin-top: 20px;">
			  		<tr class="success">
			  			<td>No.${vo.qna11_num}</td>
			  			<td>${vo.title}</td>
			  		</tr>
			  		<tr>
			  			<td>작성자 : ${vo.id }</td>
			  			<td>작성일 : ${vo.regdate }</td>
				  	</tr>
				  	<tr>
			  			<td colspan="2" style="height:100px"><textarea rows="11" cols="91" name="content" readonly="readonly" style="resize: none;border-style:hidden;">${vo.content }</textarea></td>
				  	</tr>
			</table>
		</div>
		<div style="background-color: rgb(224, 224, 224);margin-top:10px;margin-left:10px;width: 97%; height:1px;"></div>
		<form method="post" id="qna11_com_form_update" action="<c:url value='/qna11/admin/updateok'/>">
			<div style="margin-top: 10px;width: 90%;height:33%;margin-left: 40px;padding: 10px 10px 0px 10px;">
					<div class="form-group has-error" style="display: inline-block; ">
						<label class="control-label" for="inputWarning1">관리자 답변</label>
						<br>
						<textarea rows="8" cols="91" name="content" id="qna11_com_content"class="form-control" style="resize: none;">${comvo.content }</textarea>
						<input type="hidden" name="id" value="${sessionScope.loginid }">
						<input type="hidden" name="qna11_com_num" value="${comvo.qna11_com_num }">
					</div>
				</div>
			<div style="position:absolute;top:610px;width: 98%;"align="center">
				<div style="background-color: rgb(224, 224, 224);margin-left:10px;width: 99%; height:1px;"></div>
					<input type="submit" value="수정완료" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
						border-radius: 4px; background-color: rgb(52, 152, 219);width:120px; height:40px;margin-top:10px;"> 
			</div>
		</form>
	</div>
</div>
