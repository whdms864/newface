<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/homepage/qna11.css?ver=1'/>">
</head>
<body>
<div id="wrap">
	<div id="header">
		<tiles:insertAttribute name="header"/>
	</div>
	
	<div id="main2">
		<div id="sidebar">
			<tiles:insertAttribute name="sidebar"/>
		</div>
		<div id="content">
			<div id="tab">
				<tiles:insertAttribute name="tab"/>
			</div>
			<div id="con">
				<tiles:insertAttribute name="con"/>
			</div>
		</div>
		<div id="ad">
			<tiles:insertAttribute name="ad"/>
		</div>
	</div>
  </div>
</body>
</html>