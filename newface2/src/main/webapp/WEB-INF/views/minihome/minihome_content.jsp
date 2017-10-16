<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/minihome_content.css?var=24'/>">
<script type="text/javascript" src='<c:url value="/resources/js/jquery-3.2.1.min.js" />'></script>
<script>
	$(function(){
		$("#btn").click(function(){
			var content=$("#iu_text").val();
			$.getJSON("<c:url value='/minihome/iu_com'/>",{"content":content},function(data){
				$("#iu_text").val("");
				if(data.n>0){
					$("#iu_content").html("");
					iu_content();
				}else{
					alert("일촌상태가 아니거나 오류로 인하여 등록을 못했습니다");
				}
			});
		});
		var iu_content=function(){
			$.getJSON("<c:url value='/minihome/iu_com_list'/>",function(data){
				$(data).each(function(i,com){
					$("#iu_content").append(com.content + " (<span class='com_name'>" + com.name + "</span>) <img class='history' id='" + com.id + "' alt='일촌평 히스토리' src='<c:url value='/resources/images/minihome/arrow.png'/>'><hr>");
				});
			});
		}
		iu_content();
		$("#iu_content").on("click",".history",function(){
			var id=$(this).attr("id");
			var hompy_num=$("#hompy_num").val();
			window.open("<c:url value='/minihome/iu_history?hompy_num=" + hompy_num + "&id=" + id + "'/>","_minihome3"," width=385,height=594,left=100,top=100");
		});
	});
</script>
<div id="news_back">
	<div id="news">
		Upload news
		<hr>
	</div>
</div>
<div id="board_back">
	<ul id="board">
		<c:forEach var="nowVo" items="${requestScope.now }">
			<c:choose>
				<c:when test="${nowVo.division==1 }">
					<li><a href="<c:url value='/photo/list?photo_folder_num=${nowVo.folder_num }'/>">${nowVo.title }</a></li>			
				</c:when>
				<c:when test="${nowVo.division==2 }">
					<li><a href="<c:url value='/diary/content?diary_num=${nowVo.num }'/>">${nowVo.title }</a></li>					
				</c:when>
			</c:choose>
		</c:forEach>
	</ul>
</div>
<div id="board_cnt">
	<table >
		<tr>
			<td class="cnt">다이어리 ${requestScope.diary_now } / ${requestScope.diary_count }</td>
			<td class="cnt">사진첩 ${requestScope.photo_now } / ${requestScope.photo_count }</td>
		</tr>
		<tr>
			<td class="cnt">방명록 ${requestScope.guest_now } / ${requestScope.guest_count }</td>
		</tr>
	</table>
</div>
<div id="miniroom_back">
	Mini Room
	<hr>
	<div id="miniroom">
		<c:forEach var="miniVo" items="${requestScope.mini }">
			${miniVo.item_img }
		</c:forEach> 
	</div>
</div>
<div id="friends_say_back">
	<div id="friends_say">Friends say</div>
</div>
<div id="iu_com">
	<input type="text" id="iu_text" size="38" name="iu_com" placeholder="일촌과 나누고 싶은 이야기를 남겨보세요">
	&nbsp;&nbsp;<input type="button" value="확인" id="btn">
</div>
<input type="hidden" id="hompy_num" value="${sessionScope.hompy_num }">
<div id="iu_content"></div>