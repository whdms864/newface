<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/diary/diary_content.css?var=23'/>">
<script type="text/javascript" src='<c:url value="/resources/js/jquery-3.2.1.min.js" />'></script>
<script>
	$(function(){	
		var regdate=$("#regdate").val();
		$.getJSON("<c:url value='/calendar_auto'/>",{"regdate":regdate},function(data){
			$(".y").html(data.year);
			$(".m").html(data.month);
			$("#day").html(data.date);
			$(".week").html(data.week);
			$("#y").html(data.year);
			$("#m").html(data.month);
			$("#d").html(data.date);
			$("#week").html(data.week);
			$("#dd").html("");	
			
			for(var i=1;i<=data.lastdate;i++){
				if(data.date==i){					
					$("#dd").append("<span class='cal'>" + i + "</span>  ");								
				}else{
					$("#dd").append(i + "  ");								
				}				
			}

		});
		$("#before").click(function(){
			var year=$(".y").html();
			var month=$(".m").html();
			var date=$("#day").html();
			var regdate=year + "-" + month + "-" + date;
			$.getJSON("<c:url value='/calendar_before'/>",{"regdate":regdate},function(data){
				$(".y").html(data.year);
				$(".m").html(data.month);
				$(".week").html(data.week);
				$("#dd").html("");	
				var y=$("#y").html();
				var m=$("#m").html();
				var d=$("#d").html();
				for(var i=1;i<=data.lastdate;i++){
					if(y==data.year && m==data.month && data.date==i){					
						$("#dd").append("<span id='today'>" + i + "</span>  ");								
					}else{
						$("#dd").append(i + "  ");								
					}				
				}
			});
		
		});
		$("#after").click(function(){
			var year=$(".y").html();
			var month=$(".m").html();
			var date=$("#day").html();
			var regdate=year + "-" + month + "-" + date;
			$.getJSON("<c:url value='/calendar_after'/>",{"regdate":regdate},function(data){
				$(".y").html(data.year);
				$(".m").html(data.month);
				$(".week").html(data.week);
				$("#dd").html("");	
				var y=$("#y").html();
				var m=$("#m").html();
				var d=$("#d").html();
				for(var i=1;i<=data.lastdate;i++){
					if(y==data.year && m==data.month && data.date==i){					
						$("#dd").append("<span id='today'>" + i + "</span>  ");								
					}else{
						$("#dd").append(i + "  ");								
					}				
				}
			});
		
		});		
		
   		//수정
	    $('.trigger').click(function(){    	
	    	var num=$(this).attr("id"); 
	    	var content=$("#content" + num).html();
	    	var diary_num=$("#diary_num").val();
	    	var name=$("#name" + num).html();

	    	$("#diary_num1").val(diary_num);
	    	$("#content1").val(content);
	    	$("#diary_com_num1").val(num);
	    	$("#com_name").html(name);
	    	
	        $('#popup_layer, #overlay_t').show(); 
	        $('#popup_layer').css("top", Math.max(0, $(window).scrollTop() + 100) + "px"); 
	    }); 
	    $('#close, .close').click(function(e){ 
	        e.preventDefault(); 
	        $('#popup_layer, #overlay_t').hide(); 
	    }); 
	});	
</script>
<input type="hidden" id="regdate" value="${requestScope.vo.regdate }">
<input type="hidden" id="diary_num" value="${requestScope.vo.diary_num }">
<br>
<div id="content_back">
	<div id="calendar_back">
		<div id="calendar_title">
			<div id="mmdd"><span class="y"></span>.<span class="m"></span></div>
			<div class="week"></div><div id="day"></div>			
		</div>
		<div id="calendar">
			<input type="button" value="◀" class="move" id="before">
			<span class="y"></span>.<span class="m"></span>
			<input type="button" value="▶" class="move" id="after"> 
			&nbsp;
			<span id="dd"></span>
		</div>
	</div>
	<div id="diary_content_back">
		<div id="diary_content">
			<div id="regdate">
				<span id="y"></span>.<span id="m"></span>.<span id="d"></span>  <span id="week"></span> 		
			</div>			
			<br>${requestScope.vo.content }<br>	
			<br><hr>
				<span id="type">공개설정 : ${requestScope.vo.type }</span>
			<hr>
			<div id="menu">
				<a href="<c:url value='/diary/update?diary_num=${requestScope.vo.diary_num }'/>">수정</a>ㅣ
				<a href="<c:url value='/diary/folder_move?diary_num=${requestScope.vo.diary_num }&diary_folder_num=${requestScope.vo.diary_folder_num }'/>">이동</a>ㅣ
				<a href="<c:url value='/diary/delete?diary_num=${requestScope.vo.diary_num }&diary_folder_num=${requestScope.vo.diary_folder_num }'/>">삭제</a>
			</div>
			<br><br>		
		</div>
	</div>
	<div id="com_list_back">
		<div id="com_list">			
			<c:forEach var="com" items="${requestScope.com_list }">
				<span id="name${com.diary_com_num }">${com.name }</span> : <span id="content${com.diary_com_num }">${com.content }</span> (${com.regdate }) 
				<c:if test="${com.id==sessionScope.loginid }">
					<a href="#" class="trigger" id="${com.diary_com_num }">수정</a>
					<a href="<c:url value='/diary/com_delete?diary_com_num=${com.diary_com_num }&diary_num=${requestScope.vo.diary_num }'/>">삭제</a><br>				
				</c:if>
			</c:forEach>
	<div>
		<form method="post" action="<c:url value='/diary/com_insert'/>">
			<input type="hidden" name="diary_num" id="diary_num" value="${requestScope.vo.diary_num }">
			댓글 <input type="text" name="content" size="45" id="content"> 
			<input type="submit" value="확인" id="insert">
		</form>
	</div>	
		</div>	
	</div>
</div>
<div id="overlay_t"></div> 	
<div id="popup_layer">	
	<h1><span id="com_name"></span>님의 댓글 수정</h1>										
	<form method="post" action="<c:url value='/diary/com_update'/>">
		<input type="text" name="content" id="content1">
		<input type="hidden" name="diary_com_num" id="diary_com_num1">
		<input type="hidden" name="diary_num" id="diary_num1">
		<input type="submit" value="수정" class="btn">		
		<input type="button" value="닫기" id="close" class="btn">		
	</form>
</div>
