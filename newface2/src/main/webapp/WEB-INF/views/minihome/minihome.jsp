<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<title>홈 (1 of 4)</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/minihome.css?ver=22'/>">
<script type="text/javascript" src='<c:url value="/resources/js/jquery-3.2.1.min.js" />'></script>
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
</head>
<body>
<input type="hidden" id="bgms" value="${sessionScope.bgms }">
<div id="bgm_list"></div>
<input type="button" value="실행" id="play" >
<input type="button" value="정지" id="stop" >
<div id="title_list"></div>
 <c:choose>
 	<c:when test="${sessionScope.item_img!=null }">
		<div id="webView"> 
 		<span id="skin_size" style="position:absolute ; top: -20px; z-index: 0">${sessionScope.item_img }</span>
 	</c:when>
 	<c:otherwise>
		<div id="webView" style=" width:1024px;height:592px;  background-image: url('<c:url value='/resources/skin/cyworldSkin01.jpg'/>');">		
 	</c:otherwise>
 </c:choose>
	<div id="skin_back">
		<div id="skin"></div>
	</div>
	<div id="profile_skin_back">
		<div id="profile_skin">
			<tiles:insertAttribute name="left"/>		
		</div>		
	</div>
	<div id="main_skin_back">
		<div id="main_skin">
			<tiles:insertAttribute name="content"/>
		</div>
	</div>

	<div id="today_back">
		today
		<div id="today">${sessionScope.today }</div>
	</div>
	<div id="total">total ${sessionScope.total }</div>
	<div id="hname_back">
		<div id="hname">
			${sessionScope.hname } <c:if test="${sessionScope.loginid==sessionScope.hompyid }">
			<a id="hname_edit" href="<c:url value='/setup/basic'/>"><img alt="환경설정" id="setup_img" src="<c:url value='/resources/images/minihome/setup.jpg'/>">	</a>
			</c:if>
		</div>
	</div>
	<div id="home">
		<div class="menu">
			홈
		</div>
	</div>
	<c:if test="${sessionScope.diary==1 }">
		<div id="diary">
			<div class="menu">
				다이어리
			</div>
		</div>
	</c:if>
	<c:if test="${sessionScope.photo==1 }">
		<div id="photo">
			<div class="menu">
				사진첩
			</div>
		</div>
	</c:if>
	<c:if test="${sessionScope.guest==1 }">
	<div id="guest">
		<div class="menu">
			방명록
		</div>
	</div>
	</c:if>
	<c:if test="${sessionScope.loginid==sessionScope.hompyid }">
	<div id="set">
		<div class="menu">
			설정
		</div>
	</div>	
	</c:if>	
</div>
<input type="hidden" id="hompy_admin" value="${sessionScope.hompy_admin }">
<input type="hidden" id="hompy_num" value="${sessionScope.hompy_num }">
<input type="hidden" id="choice" value="${sessionScope.choice }">
<script> 
	$(function(){
		var choice=$("#choice").val();
		$("#" + choice + " .menu").css({"background-color":"white","color":"black","font-weight":"900"});
	});
	$("#home").click(function(){
		var hompy_admin=$("#hompy_admin").val();
		var hompy_num=$("#hompy_num").val();;
		if(hompy_admin==1){
			var url="<c:url value='/minihome'/>";					
			$(location).attr("href",url);
		}else if(hompy_admin==2){
			var url="<c:url value='/minihome?hompy_num=" + hompy_num + "'/>";					
			$(location).attr("href",url);
		}
	});
	$("#diary").click(function(){
		var url="<c:url value='/diary/folder_all_list'/>";
		$(location).attr("href",url);
	});
	$("#photo").click(function(){
		var url="<c:url value='/photo/list'/>";
		$(location).attr("href",url);
	});
	$("#guest").click(function(){
		var url="<c:url value='/guest/list_all'/>";
		$(location).attr("href",url);
	});
	$("#set").click(function(){
		var url="<c:url value='/setup/basic'/>";
		$(location).attr("href",url);
	});
</script>
</body>
</html>