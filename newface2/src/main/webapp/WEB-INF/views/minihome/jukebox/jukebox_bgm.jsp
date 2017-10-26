<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/jukebox/jukebox.css?var=22'/>"> 
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
<script>
$(function(){	
	var i=1;
	var j=0;
	$.getJSON("<c:url value='/bgm'/>",function(data){
	var bgm=[];
	var img=[];
		$(data).each(function(i,bgms){
			bgm[i]=bgms.content;
			img[i]=bgms.img;
			$("#title_list").append("<a class='btn' id='" + i + "'>" + bgms.content + "</a><hr>");
		});
		
		$("#bgm_list").html(
	    		"<audio id='bgm" + i + "' controls='controls' autoplay='autoplay' >" +
				"<source src='<c:url value='/resources/bgm/" + bgm[j] + ".mp3'/>' type='audio/mpeg'>" +
				"</audio>"
		);	
		$("#img").html(img[j]);
		$("#title").html(bgm[j]);
		//테스트중
		var test=document.getElementById("bgm" + i);
		console.log(test.duration);
		
		function name() {
			var aud2 = document.getElementById("bgm" + i );
			aud2.onended = function() {
			    $("#bgm_list").html(
			    		"<audio id='bgm" + ++i + "' controls='controls' autoplay='autoplay' >" +
						"<source src='<c:url value='/resources/bgm/" + bgm[++j] + ".mp3'/>' type='audio/mpeg'>" +
						"</audio>"
				);
			    $("#img").html(img[j]);
				$("#title").html(bgm[j]);
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
		    $("#img").html(img[j]);
			$("#title").html(bgm[j]);
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
			var aud = document.getElementById("bgm" + i );
			aud.play();
		});
		$("#stop").click(function(){
			var aud = document.getElementById("bgm" + i );
			aud.pause();
		});
		$("#muted").click(function(){
			var aud = document.getElementById("bgm" + i );
			aud.volume = 0; 
		});
		$('#seek').on('mousedown', function() {
		}).on('mouseup mouseleave', function() {
			var aud = document.getElementById("bgm" + i );
			var vol=$(this).val()/100;
			aud.volume = vol; 
			aud.currentTime
		});
		$(".btn").click(function(){
			var j=$(this).attr("id");
			/* var i=Number(j)+Number(1); */
			$("#bgm_list").html(
		    		"<audio id='bgm" + ++i + "' controls='controls' autoplay='autoplay' >" +
					"<source src='<c:url value='/resources/bgm/" + bgm[j] + ".mp3'/>' type='audio/mpeg'>" +
					"</audio>"
			);	
			$("#img").html(img[j]);
			$("#title").html(bgm[j]);
			if(bgm.length-1>j){
		    	//다음곡
		    	name();
		    }else{
		    	//처음으로
		    	j=-1;
		    	name();
		    }	
		});
	});
});
</script>
<div id="jukebox_back">
	<c:choose>
		<c:when test="${requestScope.list=='[]' }">
			<p id="zero">음원이 없습니다.</p>
			<img id="zero_img" src="<c:url value='/resources/images/minihome/zero.png'/>">
		</c:when>
		<c:otherwise>
			<div id="img"></div>
			<div id="title"></div>
			<div id="bgm_list"></div>
			<div id="title_list">
			<hr>
			</div>		
		</c:otherwise>
	</c:choose>
</div>