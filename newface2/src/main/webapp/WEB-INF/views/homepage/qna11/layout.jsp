<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html >
<html>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/homepage/qna11.css'/>">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="wrap">
	<div id="header">
		<tiles:insertAttribute name="header"/>
	</div>
	
	<div id="main3">
		<div id="sidebar2">
			<tiles:insertAttribute name="sidebar"/>
		</div>
		<div id="content2">
			<tiles:insertAttribute name="content"/>
		</div>
		<div id="ad2">
			<tiles:insertAttribute name="ad"/>
		</div>
	</div>
  </div>
</body>
</html>