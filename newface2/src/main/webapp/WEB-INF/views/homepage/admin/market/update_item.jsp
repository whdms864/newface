<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			<a href="<c:url value='/ader_list'/>" >광고관리</a>
		</li>
		<li>
			<a href="<c:url value='/qna11/admin/list'/>">1:1문의</a>
		</li>
		<li>
			<a href="<c:url value='/market/admin/item/list'/>" class="now">마켓관리</a>
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
			<label style="font-weight:bold;font-size:25px;">마켓관리</label>
		</div>
		<ul>
		    <li><a href="<c:url value='/market/admin/item/list'/>"style="margin-left:0px;" class="hover_a">상품목록</a></li>
		    <li><a href="<c:url value='/market/admin/item/insert'/>">상품등록</a></li>
		    <li><a href="<c:url value='/market/admin/cate/list'/>">카테고리관리</a></li>
		</ul>
	</div>
	<div id="con">
		<div align="center">
			<form action="<c:url value=''/>" method="post" id="frm" >
				<input type="hidden" name="item_num" value="${vo.item_num }">
				<table>
					<tr>
						<td>타입</td>
						<td><input type="text" name="name" id="name" value="${vo.name }"></td>
					</tr>
					
					<tr>
						<td>가격</td>
						<td><input type="text" name="pay" id="pay" value="${vo.pay }"></td>
					</tr>
					<tr>
						<td>상세내용</td>
						<td>
							<textarea name="content" rows="7" cols="69" style="margin-left: 5px;">${vo.content }</textarea>
						</td>
					</tr>
					<tr>
						<td style="margin:0; padding:0;" colspan="2">
							<textarea name="item_img" id="smarteditor" rows="1" cols="100" style="width:100%;">${vo.item_img }</textarea>
						</td>
					</tr>
					
				</table>
			<div style="position:absolute;top:600px;width: 100%;">
					<div style="background-color: rgba(224, 224, 224, 0.78);width: 100%; height:1px;"></div>
					<input id="addBtn" type="submit" value="수정완료" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
					border-radius: 4px; background-color: rgb(52, 152, 219);width:120px; height:40px;margin-top:12px;" > 
			</div>
			</form>
		</div>
	</div>
</div>