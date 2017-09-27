<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("form span").css({
		color:"red",
		fontsize:10
	});
	
	
	$("#loginid").keyup(function(){
		var loginid=$("#loginid").val();
		$("#idok").html("");	
		
		
	});
	
	$("#loginpwd").keyup(function(){
		var loginpwd=$("#loginpwd").val();
		$("#pwd1").html("");	
		
	});
		
	$("#f").submit(function(event){
		var loginid=$("#loginid").val();
		var loginpwd=$("#loginpwd").val();
		
		if(loginid==""){
			$("#loginid").focus();
			$("#idok").html("아이디를 입력해주세요");
			event.preventDefault();
		}else if(loginpwd==""){
			$("#loginpwd").focus();
			$("#pwd1").html("비밀번호를 입력해주세요");
			event.preventDefault();
		}
	});
	
	var userid = getCookie("userid");
    var userpwd = getCookie("userpwd");
    $("#loginid").val(userid);
    $("#loginpwd").val(userpwd);
    
    if($("#loginid").val() != "" && $("#loginpwd").val() != "" ){ // 그 전에 id,pwd 를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 id,pwd가 표시된 상태라면,
        $("#auto").attr("checked", true); // id,pwd 저장하기를 체크 상태로 두기.
    }
    
    $("#auto").change(function(){ // 체크박스에 변화가 있다면,
        if($("#auto").is(":checked")){ // 자동로그인 체크했을 때,
            var userid = $("#loginid").val();
        	var userpwd = $("#loginpwd").val();
            setCookie("userid", userid, 7); // 7일 동안 쿠키 보관
            setCookie("userpwd", userpwd, 7);
        }else{ // 자동로그인 체크 해제 시,
            deleteCookie("userid");
            deleteCookie("userpwd");
        }
    });
    
    $("#loginid").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#auto").is(":checked")){ // 자동 로그인를 체크한 상태라면,
            var userid = $("#loginid").val();
            setCookie("userid", userid, 7); // 7일 동안 쿠키 보관
        }
    });
    
    $("#loginpwd").keyup(function(){ // pwd 입력 칸에 pwd를 입력할 때,
        if($("#auto").is(":checked")){ // 자동로그인를 체크한 상태라면,
            var userpwd = $("#loginpwd").val();
            setCookie("userpwd", userpwd, 7); // 7일 동안 쿠키 보관
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


	<div style="background-color: rgba(224, 224, 224, 0.78);margin-left:20px;width: 95%;height: 800px;">
	<div style="margin-left: 30px;">
		<label style="font-weight:bold;font-size:25px;">로그인</label>
	</div>
	<div style="border-radius: 2px; box-shadow: rgba(0, 0, 0, 0.227451) 3px 3px 8px 0px; background-color: rgb(250, 250, 250); 
		width:90%; height:90%;margin-left:30px;padding: 10px;"align="left">
		<form method="post" id="f" name="f" action="<c:url value='/member/login'/>">
			<div  style="margin-left:50px;">
				<div class="form-group has-warning" style="display: inline-block; ">
	  				<label class="control-label" for="inputWarning1">아이디</label>
	  				<br>
	  				<input type="text" name="loginid" id="loginid" class="form-control" style="width:400px;">
	  				<span id="idok"></span>
	  			</div>	
				<div class="form-group has-warning" style="display: inline-block; ">
	  				<label class="control-label" for="inputWarning1">비밀번호</label>
	  				<br>
	  				<input type="password" name="loginpwd" id="loginpwd" class="form-control" style="width:400px;">
	  				<span id="pwd1"></span>
	  			</div>
	  			<div>
	  				<span>${errMsg }</span>
	  			</div>
	  			
	  			<div style="float:left;width: 20px; height: 20px;">
				<label data-form-control="checkbox" data-min-width="20" data-min-height="20">
				<input type="checkbox" id="auto" name="auto">
				
				<span data-form-decorator="true"></span></label>
				</div>
				<div style="float:left;width: 120px; height: 20px;">
					<div style="font-size: 12px;">아이디/비밀번호 저장</div>
				</div>
			</div>
			<div style="position:absolute;top:700px;width: 85%;"align="center">
				<div style="background-color: rgba(224, 224, 224, 0.78);width: 490px; height:1px;"></div>
				<input type="submit" id="login" name="login" value="로그인" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
				border-radius: 4px; background-color: rgb(52, 152, 219);width:120px; height:40px;margin-top:10px;" > 
			</div>
		</form>
	</div>
</div>

	
	
	