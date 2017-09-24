<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<c:forEach var="vo" items="${requestScope.list }">
	글번호 : ${vo.diary_num } 글순서 : ${vo.rownum } 제목 : <a href="<c:url value='/diary/content?diary_num=${vo.diary_num }'/>">${vo.title }</a> ㅣ 등록일 : ${vo.regdate } <br> 
</c:forEach>  
