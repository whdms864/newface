<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<title>홈 (1 of 4)</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/minihome.css?ver=11'/>">
<script type="text/javascript" src='<c:url value="/resources/js/jquery-3.2.1.min.js" />'></script>
</head>
<body>
<script type="text/javascript" src="http://scmplayer.co/script.js" 
data-config="{'skin':'http://static.tumblr.com/d41lcii/FCymhefb4/unicornio.css','volume':50,'autoplay':true,'shuffle':false,'repeat':1,'placement':'top','showplaylist':false,'playlist':[{'title':'SiK-K, pH-1, %uBC15%uC7AC%uBC94 - iffy (prod by. GroovyRoom)','url':'https://youtu.be/Q8AK_wfGhkg'},{'title':'Sik-K (%uC2DD%uCF00%uC774) - %uC774%uC5B4%uD3F0 (Earphone) (Prod. BOYCOLD) [BOYCOLD]','url':'https://youtu.be/unBH_nFW8Ng'}]}" ></script>
<!-- SCM Music Player script end -->
<!-- {'title':'제목','url':'주소'} -->

<!-- sdfsdjfosdjfosfjo -->
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
		<div id="today">0</div>
	</div>
	<div id="total">total ${sessionScope.total }</div>
	<div id="hname_back">
		<div id="hname">
			${sessionScope.hname } <a id="hname_edit" href="<c:url value='/setup/basic'/>">edit</a>
		</div>
	</div>
	<%-- <div id="bgm_back">
		<div id="bgm">
			<input type="button" value="노래" id="bgm">
			<audio controls="controls" autoplay="autoplay" preload="none">
				<source src="<c:url value='/resources/bgm/WINNER-REALLY REALLY.mp3'/>" type="audio/mpeg">
				<source src="<c:url value='/resources/bgm/TWICE-SIGNAL.mp3'/>" type="audio/mpeg">
			</audio>
		</div>
	</div> --%>
	
	
	<div id="home">
		<div class="menu">
			<a href="<c:url value='/minihome'/>">홈</a>
		</div>
	</div>
	<c:if test="${sessionScope.diary==1 }">
		<div id="diary">
			<div class="menu">
				<a href="<c:url value='/diary/folder_all_list'/>">다이어리</a>
			</div>
		</div>
	</c:if>
	<c:if test="${sessionScope.photo==1 }">
		<div id="photo">
			<div class="menu">
				<a href="<c:url value='/photo/list'/>">사진첩</a>
			</div>
		</div>
	</c:if>
	<c:if test="${sessionScope.guest==1 }">
	<div id="guest">
		<div class="menu">
			<a href="<c:url value='/guest/list_all'/>">방명록</a>
		</div>
	</div>
	</c:if>
	<c:if test="${sessionScope.loginid==sessionScope.hompyid }">
	<div id="set">
		<div class="menu">
			<a href="<c:url value='/setup/basic'/>">설정</a>
		</div>
	</div>	
	</c:if>	
</div>
</body>
</html>