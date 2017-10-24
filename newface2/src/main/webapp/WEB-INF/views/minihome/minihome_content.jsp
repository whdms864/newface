<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/minihome_content.css?var=45'/>">
<script type="text/javascript" src='<c:url value="/resources/js/jquery-3.2.1.min.js" />'></script>
<script type="text/javascript" src="/newface/resources/js/jquery-ui.min.js"></script>
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
					$("#iu_content").append(com.content + " (<span class='com_name' id='" + com.hompy_num + "'>" + com.name + "</span>) <img class='history' id='" + com.id + "' alt='일촌평 히스토리' src='<c:url value='/resources/images/minihome/arrow.png'/>'><hr>");
				});
			});
		}
		iu_content();
		var miniroom=function(){
			$.getJSON("<c:url value='/minihome/miniroom'/>",function(data){
				$(data).each(function(i,com){
					$("#miniroom").append("<div id='"+com.mine_num+"' style='position:absolute;'>"+com.item_img+"</div>");
					console.log("<div id='"+com.mine_num+"'>"+com.category_num+"</div>");
					if(com.category_num != 6){
						$("#"+com.mine_num+" p img").offset({left: com.x});
						$("#"+com.mine_num+" p img").offset({top: com.y});
					}
						$("#"+com.mine_num+" p img").draggable({
						      containment : '#miniroom' // 부모요소 안에 종속
					    })
				});
			});
		}
		miniroom();
		$("#iu_content").on("click",".history",function(){
			var id=$(this).attr("id");
			var hompy_num=$("#hompy_num").val();
			window.open("<c:url value='/minihome/iu_history?hompy_num=" + hompy_num + "&id=" + id + "'/>","_minihome3"," width=385,height=594,left=100,top=100");
		});
		$("#iu_content").on("click",".com_name",function(){
			var hompy_num=$(this).attr("id");
			var url="<c:url value='/minihome/?hompy_num=" + hompy_num + "'/>";
			$(location).attr("href",url);
			
		});
	});
</script>
<div id="news_back">
	<div id="news">
		Upload news 
	</div>
	<hr>
</div>
<div id="board_back">
	<ul id="board">
		<c:forEach var="nowVo" items="${requestScope.now }">
			<c:choose>
				<c:when test="${nowVo.division==1 }">
					<li><span class="photo_now">사진첩</span><a href="<c:url value='/photo/list?photo_folder_num=${nowVo.folder_num }'/>"> ${nowVo.title }</a></li>			
				</c:when>
				<c:when test="${nowVo.division==2 }">
					<li><span class="diary_now">다이어리</span><a href="<c:url value='/diary/content?diary_num=${nowVo.num }'/>"> ${nowVo.title }</a></li>					
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${requestScope.now=='[]' }">
			<li id="new_now">등록된 게시물이 없습니다</li>
		</c:if>
	</ul>
</div>
<div id="board_cnt">
	<hr>
	<a href="<c:url value='/diary/folder_all_list'/>">다이어리
	<span class="number">${requestScope.diary_now }/${requestScope.diary_count }</span></a><c:if test="${requestScope.diary_now>0 }">  <span class="new"> N </span></c:if>
	<hr>
	<a href="<c:url value='/photo/list'/>">사진첩 
	<span class="number">${requestScope.photo_now }/${requestScope.photo_count }</span></a><c:if test="${requestScope.photo_now>0 }"> <span class="new">N</span></c:if>
	<hr>
	<a href="<c:url value='/guest/list_all'/>">방명록
	<span class="number">${requestScope.guest_now }/${requestScope.guest_count }</span></a> <c:if test="${requestScope.guest_now>0 }"> <span class="new"> N </span></c:if>
	<hr>
</div>
<div id="miniroom_back">
	Mini Room
	<hr>
	<div id="miniroom">
	
	</div>
</div>
<div id="friends_say_back">
	<div id="friends_say">Friends say</div>
	<div id="iu_com">
		<input type="text" id="iu_text" size="38" name="iu_com" placeholder="일촌과 나누고 싶은 이야기를 남겨보세요">
		&nbsp;<input type="button" value="확인" id="btn">
	</div>
</div>

<div id="iu_content"></div>
<input type="hidden" id="hompy_num" value="${sessionScope.hompy_num }">
<input type="hidden" id="loginid" value="${sessionScope.loginid }">
<input type="hidden" id="hompyid" value="${sessionScope.hompyid }">
<script>
	$(function(){
		var loginid=$("#loginid").val();
		var hompyid=$("#hompyid").val();
		console.log("loginid : " + loginid);
		console.log("hompyid : " + hompyid);
		if(loginid==hompyid){
			$("#friends_say_back").css("display","none");
		}
	});
</script>
