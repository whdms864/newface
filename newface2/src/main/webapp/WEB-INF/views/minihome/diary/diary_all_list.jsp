<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/diary/diary_all_list.css?ver=12322'/>">
<script type="text/javascript" src='<c:url value="/resources/js/jquery-3.2.1.min.js" />'></script>
<script>
	$(function(){
		$("#chk_all").click(function(){
			var chk=$("#chk_all").prop("checked");
			if(chk){
				$(".num").prop('checked',true);						
			}else{
				$(".num").prop('checked',false);	
			}
		});
		$("#delete").click(function(){
			var diary_folder_num=$("#diary_folder_num").val();
			$(".num:checked").each(function(){
				var num=$(this).val();
				var url="<c:url value='/diary/delete?diary_num=2&diary_folder_num=" + diary_folder_num + "'/>";
				$(location).attr("href",url);
			});
		}); 
	});		
</script>
<input type="hidden" id="diary_folder_num" value="${requestScope.diary_folder_num }">
<%-- <div id="write">
	<img alt='폴더사진' src="<c:url value='/resources/images/minihome/pensil.png'/>" id="icon">
	<a href="<c:url value='/diary/insert?diary_folder_num=${requestScope.diary_folder_num }'/>">글쓰기</a><br>
</div> --%>
<div id="diary_list_back">
	<hr>
	<div id="title_back">
		<div class="chk"><input type="checkbox" id="chk_all"></div>
		<div class="num">번호</div>
		<div id="title">제목</div>
		<div class="name">작성자</div>
		<div class="regdate">작성일</div>
		<div class="love">좋아요</div><br>
	</div>
	<c:forEach var="vo" items="${requestScope.list }">
		<hr>
		<div class="chk"><input type="checkbox" name="num" class="num" value="${vo.diary_num }"></div>
		<div class="num">${vo.rownum }</div>
		<div class="title"><a href="<c:url value='/diary/content?diary_num=${vo.diary_num }'/>">&nbsp;${vo.title }</a></div>
		<div class="name">${requestScope.name }</div>
		<div class="regdate">${vo.regdate }</div>
		<div class="love">${vo.love }</div><br>
	</c:forEach> 
	<hr>
</div>
	<a>이동</a> <input type="button" id="delete" value="삭제">
