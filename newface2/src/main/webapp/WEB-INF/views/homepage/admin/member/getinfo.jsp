<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resources/css/paging_style.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".btnprev").hover(function() {
			$(this).html("◀◀");
		},function(){
			$(this).html("◁◁");
		});
		$(".btnnext").hover(function() {
			$(this).html("▶▶");
		},function(){
			$(this).html("▷▷");
		});
		$("#search").click(function(){
			var text=$("#text").val();
			if(text==""){
				$("#text").focus();
				alert("검색할 내용을 입력해주세요");
			}else{
				location.href="<c:url value='/memadmin'/>?text="+text;
			}
		});
		$("#text").keypress(function(event){
			if(event.keyCode==13){
				var text=$("#text").val();
				if(text==""){
					$("#text").focus();
					alert("검색할 내용을 입력해주세요");
				}else{
					location.href="<c:url value='/memadmin'/>?text="+text;
				}
			}
		});
	});
</script>
<div id="sidebar">
	<ul>
		<li>
			<a href="<c:url value='/notiadmin_list'/>"style="margin-top: 0px;">공지사항</a>
		</li>
		<li>
			<a href="<c:url value='/ader_list'/>" >광고관리</a>
		</li>
		<li>
			<a href="<c:url value='/qna11/admin/list'/>">1:1문의</a>
		</li>
		<li>
			<a href="<c:url value='/market/admin/item/list'/>">마켓관리</a>
		</li>
		<li>
			<a href="<c:url value='/memadmin'/>"  class="now">회원관리</a>
		</li>
		<li>
			<a href="<c:url value='/singoadmin'/>">신고관리</a>
		</li>
	</ul>
	<div>
	<a href="<c:url value='/'/>">main</a>
	</div>
</div>
<div id="con_wrap">
	<div id="tab">
		<div style="margin-left: 30px;margin-top: 10px;">
			<label style="font-weight:bold;font-size:25px;">회원관리</label>
		</div>
		<ul>
		    <li><a href="<c:url value='/memadmin'/>" style="margin-left:0px;">전체회원</a></li>
		    <li><a href="<c:url value='/memadmin/1'/>">제재회원</a></li>
		    <li><a href="<c:url value='/memadmin/2'/>">탈퇴회원</a></li>
		</ul>
	</div>
	<div id="con">	
		<div align="center">
			<table class="table table-hover" style="width: 90%;margin-top: 20px;">
				<thead>
			  		<tr class="danger">
			  			<th>아이디</th>
			  			<th>이름</th>
			  			<th>이메일</th>
			  			<th>상태</th>
			  			<th>가입일</th>
			  		</tr>
			  	</thead>
			  	<tbody>
			  			<tr>
				  			<td><a href="<c:url value='/memadmin/getinfo?id=${vo.id }'/>">${vo.id}</a></td>
				  			<td>${vo.name}</td>
				  			<td>${vo.email}</td>
				  			<td>${vo.type}</td>
				  			<td>${vo.regdate}</td>
				  		</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>