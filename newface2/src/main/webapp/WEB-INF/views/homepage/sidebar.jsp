<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	
	// 저장된 쿠키값을 가져와서 id,pwd 칸에 넣어준다. 없으면 공백으로 들어감.
    var userid = getCookie("userid"); 

    var userpwd = getCookie("userpwd");
    $("#loginid").val(userid);
    $("#loginpwd").val(userpwd);
    
    if($("#loginid").val() != "" && $("#loginpwd").val() != "" ){ // 그 전에 id,pwd 를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 id,pwd가 표시된 상태라면,
        $("#auto").attr("checked", true); // id,pwd 저장하기를 체크 상태로 두기.
    }else{
    	$("#auto").attr("checked", false);
    }
			
	$("#ff").submit(function(event){
		var loginid=$("#loginid").val();
		var loginpwd=$("#loginpwd").val();
		
		if(loginid==""){
			$("#loginid").focus();
			event.preventDefault();
		}else if(loginpwd==""){
			$("#loginpwd").focus();
			event.preventDefault();
		}
		
		if($("#auto").is(":checked")){ // 자동로그인 체크했을 때,
			if(userid!=loginid){
				 deleteCookie("userid");
		         deleteCookie("userpwd");
			}
			setCookie("userid", loginid, 3); // 3일 동안 쿠키 보관
			setCookie("userpwd", loginpwd, 3);
		}else{
       		deleteCookie("userid");
            deleteCookie("userpwd");
       	}
	});
	
});



function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}

	
</script>
<!----------------- 여기서부터 왼쪽 사이드바 ----------------->
<div align="center" style="width: 250px; height: 200px;background-color: rgb(224, 224, 224);">
	<div align="center" style="display:inline-block;">
		<form method="post" id="ff" action="<c:url value='/member/login'/>">
			<!-- 아이디 입력창 -->
			<div style="margin-top: 10px;display: inline-block;">
				<div style="width: 40px; height: 32px; float:left;background-color: rgb(241, 238, 238); border-radius: 4px 0px 0px 4px; border-color: rgb(204, 204, 204); border-style: solid; border-width: 1px 1px 1px 1px;">
				</div>
				<input type="text" name="loginid" id="loginid" style="color: rgb(94, 94, 94);border-radius: 0px 4px 4px 0px; border-width: 1px 1px 1px 0px; border-style: solid; 
				border-color: rgb(204, 204, 204); width: 180px; height: 32px;float:left;">
			</div>
			<!-- 비밀번호 입력창 -->
			<div style="margin-top: 5px;display: inline-block;">
				<div style="width: 40px; height: 32px; float:left;background-color: rgb(241, 238, 238); border-radius: 4px 0px 0px 4px; border-color: rgb(204, 204, 204); border-style: solid; border-width: 1px 1px 1px 1px;">
				</div>
				<input type="password" name="loginpwd" id="loginpwd" style="color: rgb(94, 94, 94);border-radius: 0px 4px 4px 0px; border-width: 1px 1px 1px 0px; border-style: solid; 
				border-color: rgb(204, 204, 204); width: 180px; height: 32px;float:left;">
			</div>
			<!-- 로그인버튼 -->
			<input type="submit" value="로그인" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; 
					line-height: 2.4em; border-radius: 4px; background-color: rgb(52, 152, 219); width: 220px; height:44px;margin-top: 5px;">
			
		</form>
		<div style="margin-top: 5px; display: inline-block;">
		
			<!--------------------자동로그인 ---------------------------------->
			<div style="float:left;width: 200px; height: 20px;">
				<label>
				<input type="checkbox" id="auto" name="auto"> 아이디/비밀번호 저장
				</label>
			</div>
			
			<!-- <div style="float:left;width: 120px; height: 20px;">
				<div style="font-size: 12px;">아이디/비밀번호 저장</div>
			</div> -->
				
		</div>
		<div style="display: inline-block;">
			<div style="float:left;width: 62px; height: 20px;">
				<div style="font-size: 13px; color: rgb(41, 90, 221); text-decoration: underline;">
				<a href="<c:url value='/member/insert'/>" style="text-decoration: none;">회원가입</a></div>
			</div>
			<div style="float:left; height: 20px;margin-left: 10px;">
				<div style="font-size: 13px; color: rgb(41, 90, 221); text-decoration: underline;">
				<a href="<c:url value='/member/search'/>" style="text-decoration: none;">아이디/비밀번호 찾기</a></div>
			</div>
		</div>
	</div>
</div>

