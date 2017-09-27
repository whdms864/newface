<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/homepage/admin.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("a").click(function() {
			$(this).addClass("now");
		});
	});
</script>
<ul>
	<li>
		<a href="<c:url value='/noti/admin/list'/>"style="margin-top: 0px;">공지사항</a>
	</li>
	<li>
		<a href="<c:url value='/adadmin'/>" >광고관리</a>
	</li>
	<li>
		<a href="<c:url value='/qna11/admin/list'/>">1:1문의</a>
	</li>
	<li>
		<a href="<c:url value='/marketadmin'/>">마켓관리</a>
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














