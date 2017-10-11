<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div style="margin-left: 30px;margin-top: 10px;">
		<label style="font-weight:bold;font-size:25px;">공지사항</label>
	</div>
	<ul>
	    <li><a href="<c:url value='/adimg_list'/>"style="margin-left:0px;">광고목록</a></li>
	    <li><a href="<c:url value='/adimg_insert'/>">광고등록</a></li>
	    <li><a href="<c:url value='/ad_list'/>">광고계약목록</a></li>
	    <li><a href="<c:url value='/ad_insert'/>">광고계약등록</a></li>
	    <li><a href="<c:url value='/ader_list'/>">광고주목록</a></li>
	    <li><a href="<c:url value='/ader_insert'/>">광고주등록</a></li>
	    <li><a href="<c:url value=''/>">광고매출현황</a></li>
	</ul>
