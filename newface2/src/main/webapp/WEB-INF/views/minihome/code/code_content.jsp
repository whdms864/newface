<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/minihome_content.css'/>">
<h1>${requestScope.code }</h1>
<a href="<c:url value='${requestScope.url }'/>">확인</a>