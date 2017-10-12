<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/homepage/admin_qna11.css?ver=13'/>">
</head>
<body>
<div id="wrap">
	<div id="header">
		<tiles:insertAttribute name="header"/>
	</div>
	
	<div id="main2">
		<div id="content">
			<tiles:insertAttribute name="content"/>
		</div>
	</div>
  </div>
</body>
</html>