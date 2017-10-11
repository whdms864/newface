<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<form method="post" action="<c:url value='/notiadmin_updateok'/>">
	<div style="margin-top: 20px;background-color: rgb(239, 238, 238);width: 89%;height:50%;margin-left: 40px;padding: 10px;">
		<div style="margin-left: 67px;">
			<div class="form-group has-warning" style="display: inline-block; ">
				<label class="control-label" for="inputWarning1">제목</label>
				<br>
				<input type="hidden" name="noti_num" value="${vo.noti_num }">
				<input type="text" name="title" id="title" class="form-control" style="width:500px;" value="${vo.title }">
			</div>
			
			<div class="form-group has-warning" style="display: inline-block; ">
				<label class="control-label" for="inputWarning1">작성자</label>
				<br>
				<input type="text" name="id" id="id" class="form-control" style="width:500px;" value="${vo.id }" readonly="readonly">
			</div>
			
			<div class="form-group has-warning" style="display: inline-block; ">
				<label class="control-label" for="inputWarning1">내용</label>
				<br>
				<textarea rows="17" cols="65" name="content" class="form-control">${vo.content }</textarea>
			</div>
		</div>
	</div>
		<div style="position:absolute;top:610px;width: 98%;"align="center">
			<div style="background-color: rgb(224, 224, 224);margin-left:10px;width: 99%; height:1px;"></div>
			<input type="submit" value="등록" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
			border-radius: 4px; background-color: rgb(52, 152, 219);width:120px; height:40px;margin-top:10px;"> 
	</div>
	</form>
	