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
		$("#btn_up").click(function(){
			location.href="<c:url value='/memadmin/getinfo?id=${vo.id }&up=1'/>";
		});
		$("#btn_upok").click(function(){
			var m_type=$("#m_type").val();
			if(m_type==""){
				$("#m_type").focus();
				alert("회원 상태를 입력해주세요");
			}else{
				location.href="<c:url value='/memadmin/getinfo/update?id=${vo.id }'/>&type="+m_type;
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
</div>
<div id="con_wrap">
	<div id="tab">
		<div style="margin-left: 30px;margin-top: 10px;">
			<label style="font-weight:bold;font-size:25px;">회원관리</label>
		</div>
		<ul>
		    <li><a href="<c:url value='/memadmin'/>" style="margin-left:0px;">전체회원</a></li>
		    <li><a href="<c:url value='/memadmin/1'/>">경고회원</a></li>
		    <li><a href="<c:url value='/memadmin/2'/>">탈퇴회원</a></li>
		</ul>
	</div>
	<div id="con">	
		<div align="center">
			<div style="margin-top: 10px;margin-left:110px;"align="left">
				<label style="font-size:20px;">[ 회원정보 ]</label>
			</div>
			<table class="table table-hover" style="width: 70%;margin-top: 20px;">
				<thead>
			  		<tr class="danger">
			  			<td style="width: 50%;">아이디</td>
			  			<td>${vo.id}</td>
			  		</tr>
			  	</thead>
			  	<tbody>
			  		<tr>
			  			<td>이름</td>
			  			<td>${vo.name}</td>
			  		</tr>
			  		<tr>
			  			<td>이메일</td>
			  			<td>${vo.email}</td>
			  		</tr>
			  		<tr>
			  			<td>생일</td>
			  			<td>${vo.birth}</td>
			  		</tr>
			  		<tr>
			  			<td>학교</td>
			  			<td>${vo.school}</td>
			  		</tr>
			  		<tr>
			  			<td>상태</td>
			  			<c:choose>
			  				<c:when test="${up==1}">
						  			<td>
						  			<select id="m_type" class="control-label" style="font-weight: bold;height: 25px;">
										<option value="회원" ${vo.type == '회원' ? 'selected="selected"' : '' }>회원</option>
										<option value="1회경고" ${vo.type == '1회경고' ? 'selected="selected"' : '' }>1회경고</option>
										<option value="2회경고" ${vo.type == '2회경고' ? 'selected="selected"' : '' }>2회경고</option>
										<option value="3회경고" ${vo.type == '3회경고' ? 'selected="selected"' : '' }>3회경고</option>
										<option value="탈퇴" ${vo.type == '탈퇴' ? 'selected="selected"' : '' }>탈퇴</option>
									</select>
						  			<input type="button" value="확인" class="btn btn-primary" id="btn_upok"
						  			style="width: 50px;padding: 0px;height: 25px;float: right;">
						  			</td>
			  				</c:when>
			  				<c:otherwise>
						  			<td>
						  			${vo.type} 
						  			<input type="button" class="btn btn-primary" value="수정" id="btn_up"
						  			style="width: 50px;padding: 0px;height: 25px;float: right;">
						  			<%-- <a href="<c:url value='/memadmin?id=${vo.id }&up=1'/>">수정</a> --%>
						  			</td>
					  		</c:otherwise>
						</c:choose>
			  		</tr>
			  		<tr>
			  			<td>가입일</td>
			  			<td>${vo.regdate}</td>
			  		</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>