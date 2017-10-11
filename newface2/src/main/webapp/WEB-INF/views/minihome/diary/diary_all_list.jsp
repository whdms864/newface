<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/diary/diary_all_list.css?ver=52'/>">
<script type="text/javascript" src='<c:url value="/resources/js/jquery-3.2.1.min.js" />'></script>
<script>
	$(function(){
		//체크박스 전체 선택/해제
		$("#chk_all").click(function(){
			var chk=$("#chk_all").prop("checked");
			if(chk){
				$("input[name=num]:checkbox").each(function() {
					$(this).attr("checked", true);
				});						
			}else{
				$("input[name=num]:checkbox").each(function() {
					$(this).attr("checked", false);
				});	
			}
		});
		
		//이동
		$("#move").click(function(){ 
	        $("#popup_layer, #overlay_t").show(); 
	        $("#popup_layer").css("top", Math.max(0, $(window).scrollTop() + 100) + "px"); 
	    }); 
	    $('#close, .close').click(function(e){ 
	        e.preventDefault(); 
	        $("#popup_layer, #overlay_t").hide(); 
	    }); 
		var diary_nums=[];
		$("#moveOk").click(function(){
			var diary_folder_num=$("#select").val();
			$("input[name=num]:checked").each(function(){
				diary_nums.unshift($(this).val());
			});
			var url="<c:url value='/diary/folder_moves?diary_nums=" + diary_nums + "&diary_folder_num=" + diary_folder_num + "'/>";
			$(location).attr("href",url);
			
		});
		
		//삭제
		var diary_nums=[];
		$("#delete").click(function(){
			var diary_folder_num=$("#diary_folder_num").val();
			$("input[name=num]:checked").each(function(){
				diary_nums.unshift($(this).val());
			});
			var url="<c:url value='/diary/deletes?diary_nums="+ diary_nums +"&diary_folder_num=-1'/>";
			$(location).attr("href",url);
		});
	});
</script>
<input type="hidden" id="diary_folder_num" value="${requestScope.diary_folder_num }">
<div id="diary_list_back">
	<hr>
	<div id="title_back">
		<c:if test="${requestScope.hompy_id==sessionScope.loginid }">
			<div class="chk"><input type="checkbox" id="chk_all"></div>
		</c:if>
		<div class="num">번호</div>
		<div id="title">제목</div>
		<div class="name">작성자</div>
		<div class="regdate">작성일</div>
		<div class="love">좋아요</div><br>
	</div>
	<c:forEach var="vo" items="${requestScope.list }">
		<hr>
		<c:if test="${requestScope.hompy_id==sessionScope.loginid }">
			<div class="chk"><input type="checkbox" name="num" value="${vo.diary_num }"></div>
		</c:if>
		<div class="num">${vo.diary_num }</div>
		<div class="title"><a href="<c:url value='/diary/content?diary_num=${vo.diary_num }'/>">&nbsp;${vo.title }</a></div>
		<div class="name">${vo.name }</div>
		<div class="regdate">${vo.regdate }</div>
		<div class="love">${vo.love }</div><br>
	</c:forEach> 
	<hr>
</div>
<div id="page">
	<c:choose>
		<c:when test="${requestScope.pageNum>1 }">
			<a href="<c:url value='/diary/folder_all_list?pageNum=${requestScope.pageNum-1 }'/>">▲</a>
		</c:when>
		<c:otherwise>
			△		
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${requestScope.pageNum<requestScope.endPageNum }">
			<a href="<c:url value='/diary/folder_all_list?pageNum=${requestScope.pageNum+1 }'/>">▼</a>
		</c:when>
		<c:otherwise>
			▽		
		</c:otherwise>
	</c:choose>	
	<c:if test="${requestScope.hompy_id==sessionScope.loginid }">
		<div id="write">
			<img alt='폴더사진' src="<c:url value='/resources/images/minihome/pensil.png'/>">
			<a href="<c:url value='/diary/insert?diary_folder_num=${requestScope.diary_folder_num }'/>">글쓰기</a>
			<img alt='이동사진' src="<c:url value='/resources/images/minihome/move.png'/>">
			<a id="move">이동</a>
			<img alt='삭제사진' src="<c:url value='/resources/images/minihome/eraser.png'/>">
			<a id="delete">삭제</a> 
		</div>
	</c:if>
</div>

<div id="overlay_t"></div> 
<div id="popup_layer">
<h2>폴더이동</h2><br>
	<select name="diary_folder_num" id="select">
	<c:forEach var="vo" items="${requestScope.folder }">
		<option value="${vo.diary_folder_num }">${vo.fname}</option>
	</c:forEach>
	</select><br>
	<input type="button" value="완료" id="moveOk">
	<input type="button" value="닫기" id="close">
</div>

 