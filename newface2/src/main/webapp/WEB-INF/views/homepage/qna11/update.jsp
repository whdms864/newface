<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<form method="post" action="<c:url value='/qna11/updateok'/>" style="margin-top: 20px;">
		<div style="margin-left:55px;">
			<div class="form-group has-warning" style="display: inline-block; ">
				<label class="control-label" for="inputWarning1">작성자</label>
				<br>
				<input type="hidden" name="qna11_num"value="${vo.qna11_num }">
				<input type="text" name="id" class="form-control" readonly="readonly" value="${vo.id }" style="width:400px;">
			</div>
		</div>
		<div style="margin-left:55px;">
			<div class="form-group has-warning" style="display: inline-block; ">
				<label class="control-label" for="inputWarning1">제목</label>
				<br>
				<input type="text" name="title" id="title" class="form-control" value="${vo.title }" style="width:400px;">
			</div>
		</div>
		<div style="margin-left:55px;">
			<div class="form-group has-warning" style="display: inline-block; ">
				<label class="control-label" for="inputWarning1">문의내용</label>
				<br>
				<textarea rows="10" cols="51" name="content" class="form-control">${vo.content }</textarea>
			</div>
		</div>
		<div style="position:absolute;top:620px;width: 98%;"align="center">
				<div style="background-color: rgba(224, 224, 224, 0.78);width: 490px; height:1px;"></div>
				<input type="submit" id="join" name="join" value="완료" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
				border-radius: 4px; background-color: rgb(52, 152, 219);width:120px; height:40px;margin-top:10px;"> 
		</div>
	</form>
