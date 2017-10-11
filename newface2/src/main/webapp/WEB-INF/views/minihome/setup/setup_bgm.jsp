<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<link type="text/css" href="/css/jplayer/jplayer.pink.flag.css" rel="stylesheet" />
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/jquery.jplayer.min.js"></script>

<div id="test">
	<h3>음악설정</h3>
</div>
<audio id="audio" preload="auto" src="music.mp3"></audio>

<script type="text/javascript">
 $(document).ready(function(){
  $("#jquery_jplayer_1").jPlayer({
   ready: function () {
    $(this).jPlayer("setMedia", {
     m4a: "/media/mysound.mp4",
     oga: "/media/mysound.ogg"
    });
   },
   swfPath: "/js",
   supplied: "m4a, oga"
  });
 });
</script>
<div id="jquery_jplayer_1"></div>
<div id="jp_container_1">
 <a href="#" class="jp-play">Play</a>
 <a href="#" class="jp-pause">Pause</a>
</div>