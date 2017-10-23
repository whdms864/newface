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
<div id="sidebar">
	<ul>
		<li>
			<a href="<c:url value='/notiadmin_list'/>"style="margin-top: 0px;">공지사항</a>
		</li>
		<li>
			<a href="<c:url value='/ader_list'/>"  class="now" >광고관리</a>
		</li>
		<li>
			<a href="<c:url value='/qna11/admin/list'/>">1:1문의</a>
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
			<label style="font-weight:bold;font-size:25px;">광고관리</label>
		</div>
		<ul>
		    <li><a href="<c:url value='/ader_list'/>" style="margin-left:0px;"  class="hover_a">광고주목록</a></li>
		    <li><a href="<c:url value='/ader_insert'/>">광고주등록</a></li>
		    <li><a href="<c:url value='/ad_total'/>">광고매출현황</a></li>
		</ul>
	</div>
	<div id="con">	
		<form action="<c:url value='/ad_update'/>" method="post">
		<div style="margin-top: 20px;background-color: rgb(239, 238, 238);width: 89%;height:50%;margin-left: 40px;padding: 10px;">
			<div style="margin-left: 5px;">
				<div class="form-group has-warning" style="display: inline-block; ">
					<label class="control-label" for="inputWarning1" >광고주</label>
					<input type="text" class="form-control" value="${vo.ad_num }" name="ad_num" readonly="readonly" style="width:250px;">
				</div>
				
				<div class="form-group has-warning" style="display: inline-block;">
					<label class="control-label" for="inputWarning1">진행상황</label>
					<select name="type" style="width:250px; height:33px;" class="form-control" value="${vo.type }">
							<option value="계약협상" >계약협상</option>
							<option value="광고게시" >광고게시</option>
							<option value="계약만료" >계약만료</option>
					</select>
				</div>
				<br>
				
				<div class="form-group has-warning" style="display: inline-block; ">
					<label class="control-label" for="inputWarning1" >계약금액</label>
					<input type="text" name="pay" class="form-control" value="${vo.pay }" style="width:250px;">
				</div>
				
				<div class="form-group has-warning" style="display: inline-block; ">
					<label class="control-label" for="inputWarning1">url</label>
					<input type="text" name="url" class="form-control" value="${vo.url }" style="width:350px;">
				</div>
				<br>				
				
					<label class="control-label" for="inputWarning1">광고 이미지</label>
					<br>
					<textarea name="ad_img" id="smarteditor" rows="12" cols="300" style="width:100%;">${vo.ad_img }</textarea>
								
					
				<div class="form-group has-warning" style="display: inline-block; ">
					<label class="control-label" for="inputWarning1">광고시작일</label>
					<br>
					<input type="date" name="sdate" class="form-control" value="${vo.sdate }" style="width:300px;">
				</div>
				
				<div class="form-group has-warning" style="display: inline-block; ">
					<label class="control-label" for="inputWarning1">광고만료일</label>
					<br>
					<input type="date" name="edate" class="form-control" value="${vo.edate }" style="width:300px;">
				</div>
			</div>
		</div>
			<div style="position:absolute;top:610px;width: 98%;"align="center">
				<div style="background-color: rgb(224, 224, 224);margin-left:10px;width: 99%; height:1px;"></div>
				<input id="addBtn" type="submit" value="수정" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
				border-radius: 4px; background-color: rgb(52, 152, 219);width:120px; height:40px;margin-top:10px;"> 
		</div>
		</form>
	</div>
</div>