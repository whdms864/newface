<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/smarteditor/js/HuskyEZCreator.js"/>" charset="utf-8"></script>
	<script type="text/javascript" charset="utf-8" src="<c:url value="/resources/js/writeForm.js"/>"></script>
	<link rel="stylesheet" href="<c:url value="/resources/css/homepage/admin_common.css"/>"/>
	<script type="text/javascript" charset="utf-8">
		sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
	</script>
	
	<form action="<c:url value='/ad_insert'/>" method="post">
	<div style="margin-top: 20px;background-color: rgb(239, 238, 238);width: 89%;height:50%;margin-left: 40px;padding: 10px;">
		<div style="margin-left: 5px;">
			<input type="hidden" value=${vo.ader_num } name="ader_num">
			<div class="form-group has-warning" style="display: inline-block; ">
				<label class="control-label" for="inputWarning1" >광고주</label>
				<input type="text" class="form-control" value="${vo.hname }" readonly="readonly" style="width:250px;">
			</div>
			
			<div class="form-group has-warning" style="display: inline-block;">
				<label class="control-label" for="inputWarning1">진행상황</label>
				<select name="type" style="width:250px; height:33px;">
						<option value="1">계약협상</option>
						<option value="2">광고게시</option>
						<option value="3">계약만료</option>
				</select>
			</div>
			<br>
			
			<div class="form-group has-warning" style="display: inline-block; ">
				<label class="control-label" for="inputWarning1" >계약금액</label>
				<input type="text" name="pay" class="form-control" style="width:250px;">
			</div>
			
			<div class="form-group has-warning" style="display: inline-block; ">
				<label class="control-label" for="inputWarning1">url</label>
				<input type="text" name="url" class="form-control" style="width:350px;">
			</div>
			<br>				
			
				<label class="control-label" for="inputWarning1">광고 이미지</label>
				<br>
				<textarea name="ad_img" id="smarteditor" rows="15" cols="300" style="width:100%;"></textarea>
			
				
				
			<div class="form-group has-warning" style="display: inline-block; ">
				<label class="control-label" for="inputWarning1">광고시작일</label>
				<br>
				<input type="date" name="sdate" class="form-control" style="width:300px;">
			</div>
			
			<div class="form-group has-warning" style="display: inline-block; ">
				<label class="control-label" for="inputWarning1">광고만료일</label>
				<br>
				<input type="date" name="edate" class="form-control" style="width:300px;">
			</div>
		</div>
	</div>
		<div style="position:absolute;top:610px;width: 98%;"align="center">
			<div style="background-color: rgb(224, 224, 224);margin-left:10px;width: 99%; height:1px;"></div>
			<input type="submit" value="등록" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
			border-radius: 4px; background-color: rgb(52, 152, 219);width:120px; height:40px;margin-top:10px;"> 
	</div>
	</form>
	