<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<link type="text/css" href="/css/jplayer/jplayer.pink.flag.css" rel="stylesheet" />
<script type="text/javascript" src='<c:url value="/resources/js/jquery-3.2.1.min.js" />'></script>

<div id="test">
	<h3>음악설정</h3>
</div>
<c:forEach var="vo" items="${requestScope.list }">
	<input type="checkbox" name="mine_num" value="${vo.mine_num }">${vo.name }<hr>
</c:forEach>
<input type="button" id="apply" value="적용">
<script>
	$(function(){
		var mine_nums=[];
		$("#apply").click(function(){
			$("input[name='mine_num']:checked").each(function(){
				mine_nums.unshift($(this).val());
			});
			var url="<c:url value='/setup/bgm_insert?mine_nums=" + mine_nums + "'/>";
			$(location).attr("href",url);
		});
	});
</script>
