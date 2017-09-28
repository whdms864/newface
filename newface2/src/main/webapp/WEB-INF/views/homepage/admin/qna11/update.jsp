<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div style="margin-top: 20px;background-color: rgb(239, 238, 238);width: 89%;height:50%;margin-left: 40px;padding: 10px;">
		<div style="margin-left: 67px;">
			<div class="form-group has-warning" style="display: inline-block; ">
				<label class="control-label" for="inputWarning1">제목</label>
				<br>
				<input type="text" name="title" id="title" class="form-control" value="${vo.title }" readonly="readonly"  style="width:500px;">
			</div>
			<div class="form-group has-warning" style="display: inline-block; ">
				<label class="control-label" for="inputWarning1">문의내용</label>
				<br>
				<textarea rows="10" cols="65" name="content" class="form-control" readonly="readonly" >${vo.content }</textarea>
			</div>
		</div>
	</div>
	<div style="background-color: rgb(224, 224, 224);margin-top:10px;margin-left:10px;width: 97%; height:1px;"></div>
	<form method="post" action="<c:url value='/qna11/admin/updateok'/>">
		<div style="margin-top: 10px;background-color: rgb(239, 238, 238);width: 89%;height:33%;margin-left: 40px;padding: 10px 10px 0px 10px;">
			<div style="margin-left: 67px;">
				<div class="form-group has-error" style="display: inline-block; ">
					<label class="control-label" for="inputWarning1">관리자 답변</label>
					<br>
					<textarea rows="8" cols="65" name="content" class="form-control">${comvo.content }</textarea>
					<input type="hidden" name="id" value="admin"><!-- 나중에 꼭 고치기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
					<input type="hidden" name="qna11_com_num" value="${comvo.qna11_com_num }">
				</div>
			</div>
		</div>
		<div style="position:absolute;top:610px;width: 98%;"align="center">
			<div style="background-color: rgb(224, 224, 224);margin-left:10px;width: 99%; height:1px;"></div>
				<input type="submit" value="수정완료" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
					border-radius: 4px; background-color: rgb(52, 152, 219);width:120px; height:40px;margin-top:10px;"> 
		</div>
	</form>
