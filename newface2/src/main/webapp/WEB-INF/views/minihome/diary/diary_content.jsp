<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/diary/diary_content.css?var=333'/>">
<script type="text/javascript" src='<c:url value="/resources/js/jquery-3.2.1.min.js" />'></script>
<script>
	$(function(){	
		var regdate=$("#regdate").val();
		var diary_num=$("#diary_num").val();
		var loginid=$("#loginid").val();
		com();
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
					$("#dd").append("<span id='now'>" + i + "</span>  ");								
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
						$("#dd").append("<span id='now'>" + i + "</span>  ");								
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
						$("#dd").append("<span id='now'>" + i + "</span>  ");								
					}else{
						$("#dd").append(i + "  ");								
					}				
				}
			});
		
		});	
		
		 //댓글목록
	    function com() {
	    	$.getJSON("<c:url value='/diary/com_list'/>",{"diary_num":diary_num},function(data){
	    		$("#com_list").html("");
	    		$(data).each(function(i,com){
	    			$("#com_list").append("<span class='name' id='name" + com.diary_com_num + "'>" + com.name + "</span> : <span id='content" + com.diary_com_num + "'>" + com.content + "</span> <span class='date'>(" + com.regdate + ")</span>");
	    			if(com.id==loginid){
	    				$("#com_list").append(" <a href='#' class='update' id='" + com.diary_com_num + "'>수정</a> | " +
						"<a href='#' class='delete' id='" + com.diary_com_num + "'>삭제</a>");
	    			}
	    			$("#com_list").append("<br>");
	    		});
	    	});
		}
	    //삭제
	    $("#com_list_back").on("click",".delete",function(){
	    	var diary_com_num=$(this).attr("id");
	    	$.getJSON("<c:url value='/diary/com_delete'/>",{"diary_com_num":diary_com_num},function(data){
	    		if(data.n>0){
					com();
				}else{
					alert("오류로 인하여 댓글삭제 요청작업 실패했습니다")
				}
	    	});
	    });
		 
		 
		//등록
		$("#insert").click(function(){
			var content=$("#content").val();
			$.getJSON("<c:url value='/diary/com_insert'/>",{"diary_num":diary_num,"content":content},function(data){
				if(data.n>0){
					com();
				}else{
					alert("오류로 인하여 댓글등록 요청작업 실패했습니다")
				}
			});
			$("#content").val("");
		});
		
	  //수정
		$("#com_list").on("click",".update",function(){
			var num=$(this).attr("id"); 
	    	var content=$("#content" + num).html();
	    	var name=$("#name" + num).html();

	    	$("#com_content").val(content);
	    	$("#diary_com_num1").val(num);
	    	$("#com_name").html(name);
	    	
	        $('#popup_layer, #overlay_t').show(); 
	        $('#popup_layer').css("top", Math.max(0, $(window).scrollTop() + 100) + "px");
		}); 
	  	$("#update").click(function(e){
	  		var content=$("#com_content").val();
	  		var diary_com_num=$("#diary_com_num1").val();
	  		$.getJSON("<c:url value='/diary/com_update'/>",{"diary_num":diary_num,"content":content,"diary_com_num":diary_com_num},function(data){
	  			if(data.n>0){
	  				e.preventDefault(); 
	  		        $('#popup_layer, #overlay_t').hide(); 
	  				com();
	  			}else{
	  				alert("오류로 인하여 댓글수정에 실패했습니다")
	  			}
	  		});
	  	});	    
	    $("#close").click(function(e){ 
	        e.preventDefault(); 
	        $('#popup_layer, #overlay_t').hide(); 
	    }); 
	   
	    
	});	
</script>
<input type="hidden" id="regdate" value="${requestScope.vo.regdate }">
<input type="hidden" id="diary_num" value="${requestScope.vo.diary_num }">
<input type="hidden" id="loginid" value="${sessionScope.loginid }">
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
		<div id="com_list"></div>	
		댓글 <input type="text" name="content" size="45" id="content"> 
		<input type="button" value="확인" id="insert">
	</div>
</div>
<div id="overlay_t"></div> 	
<div id="popup_layer">	
	<h1><span id="com_name"></span>님의 댓글 수정</h1>												
		<input type="text" id="com_content">
		<input type="hidden" id="diary_com_num1">
		<input type="button" value="수정" id="update">		
		<input type="button" value="닫기" id="close">		
</div>
