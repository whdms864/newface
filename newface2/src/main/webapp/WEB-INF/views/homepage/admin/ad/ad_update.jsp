<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<div>
	<a href="<c:url value='/'/>">main</a>
	</div>
</div>
<div id="con_wrap">
	<div id="tab">
		<div style="margin-left: 30px;margin-top: 10px;">
			<label style="font-weight:bold;font-size:25px;">광고관리</label>
		</div>
		<ul>
		    <li><a href="<c:url value='/ader_list'/>" style="margin-left:0px;">광고주목록</a></li>
		    <li><a href="<c:url value='/ader_insert'/>">광고주등록</a></li>
		    <li><a href="<c:url value=''/>">광고매출현황</a></li>
		</ul>
	</div>
	<div id="con">
		<form method="post" action="<c:url value='/ad_update'/>">
		<div style="margin-top: 20px;background-color: rgb(239, 238, 238);width: 89%;height:50%;margin-left: 40px;padding: 10px;">
			<div style="margin-left: 67px;">
				<div class="form-group has-warning" style="display: inline-block; ">
					<label class="control-label" for="inputWarning1">제목</label>
					<br>
					<input type="hidden" name="noti_num" value="${ad_getinfo.ad_num }">
					<input type="text" name="title" id="title" class="form-control" style="width:500px;" value="${ad_getinfo.title }">
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
	</div>
</div>
		