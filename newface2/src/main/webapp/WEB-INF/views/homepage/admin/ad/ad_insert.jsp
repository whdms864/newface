<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<form method="post" action="<c:url value=''/>">
	<div style="margin-top: 20px;background-color: rgb(239, 238, 238);width: 89%;height:50%;margin-left: 40px;padding: 10px;">
		<div style="margin-left: 67px;">
			
			<div class="form-group has-warning" style="display: inline-block; ">
				<select name="type" style="width:500px; height:33px;">
						<option value="1">계약협상</option>
						<option value="2">광고게시</option>
						<option value="3">계약만료</option>
				</select>
			</div>
			
			<div class="form-group has-warning" style="display: inline-block; ">
				<label class="control-label" for="inputWarning1">계약금액</label>
				<br>
				<input type="text" name="pay" class="form-control" style="width:500px;">
			</div>
						
			
			<div class="form-group has-warning" style="display: inline-block; ">
				<label class="control-label" for="inputWarning1">광고시작일</label>
				<br>
				<input type="date" name="sdate" class="form-control" style="width:500px;">
			</div>
			
			<div class="form-group has-warning" style="display: inline-block; ">
				<label class="control-label" for="inputWarning1">광고만료일</label>
				<br>
				<input type="date" name="edate" class="form-control" style="width:500px;">
			</div>
		</div>
	</div>
		<div style="position:absolute;top:610px;width: 98%;"align="center">
			<div style="background-color: rgb(224, 224, 224);margin-left:10px;width: 99%; height:1px;"></div>
			<input type="submit" value="등록" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
			border-radius: 4px; background-color: rgb(52, 152, 219);width:120px; height:40px;margin-top:10px;"> 
	</div>
	</form>
	