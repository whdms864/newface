<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/setup/setup_menu.css?var=1'/>"> 
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
<script>
$(function(){	
	var i=1;
	var j=0;
	$.getJSON("<c:url value='/minihome/bgm'/>",function(data){
	var bgm=[];
		$(data).each(function(i,bgms){
			bgm[i]=bgms.content;
		});
		
		
		$("#bgm_list").html(
	    		"<audio id='bgm" + i + "' controls='controls' autoplay='autoplay' >" +
				"<source src='<c:url value='/resources/bgm/" + bgm[j] + ".mp3'/>' type='audio/mpeg'>" +
				"</audio>"
		);	
		$("#title_list").html(bgm[j]);
		
		function name() {
			var aud2 = document.getElementById("bgm" + i );
			aud2.onended = function() {
			    $("#bgm_list").html(
			    		"<audio id='bgm" + ++i + "' controls='controls' autoplay='autoplay' >" +
						"<source src='<c:url value='/resources/bgm/" + bgm[++j] + ".mp3'/>' type='audio/mpeg'>" +
						"</audio>"
				);
			    $("#title_list").html(bgm[j]);
			    if(bgm.length-1>j){
			    	//다음곡
			    	name();
			    }else{
			    	//처음으로
			    	j=-1;
			    	name();
			    }
			}	
		}
		
		var aud1 = document.getElementById("bgm" + i );
		aud1.onended = function() {
		    $("#bgm_list").html(
		    		"<audio id='bgm" + ++i + "' controls='controls' autoplay='autoplay' >" +
					"<source src='<c:url value='/resources/bgm/" + bgm[++j] + ".mp3'/>' type='audio/mpeg'>" +
					"</audio>"
			);
		    $("#title_list").html(bgm[j]);
		    if(bgm.length-1>j){
		    	//다음곡
		    	name();
		    }else{
		    	//처음으로
		    	j=-1;
		    	name();
		    }
		}	
		
		$("#play").click(function(){
			var aud3 = document.getElementById("bgm" + i );
			aud3.play();
		});
		$("#stop").click(function(){
			var aud4 = document.getElementById("bgm" + i );
			aud4.pause();
		});
	});
});
</script>
<div id="menu">
	<h3 id="first">메뉴 설정</h3>
	<hr>
	<div class="menu_back">
		<div id="bgm_list"></div>
		<input type="button" value="실행" id="play" >
		<input type="button" value="정지" id="stop" >
		<div id="title_list"></div>
	<hr>
	</div>
</div>