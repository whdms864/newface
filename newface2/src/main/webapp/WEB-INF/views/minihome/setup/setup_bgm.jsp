<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<link type="text/css" href="/css/jplayer/jplayer.pink.flag.css" rel="stylesheet" />
<script type="text/javascript" src='<c:url value="/resources/js/jquery-3.2.1.min.js" />'></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/setup/setup_bgm.css?ver=23'/>">
	<h3>음악설정</h3>
	<div id="bgm_title">
		<hr><input type="checkbox" id="chk_all"> 음악정보<hr>	
	</div>
	<div id="bgm_list">
		<c:forEach var="vo" items="${requestScope.list }">
			<input type="checkbox" name="mine_num" value="${vo.mine_num }">${vo.name }<hr>
		</c:forEach>
		<input type="button" id="apply" value="적용">	
	</div>
<script>
	$(function(){
		//체크박스 전체 선택/해제
		$("#chk_all").click(function(){
			var chk=$("#chk_all").prop("checked");
			if(chk){
				$("input[name=mine_num]:checkbox").each(function() {
					$(this).attr("checked", true);
				});						
			}else{
				$("input[name=mine_num]:checkbox").each(function() {
					$(this).attr("checked", false);
				});	
			}
		});
		
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
