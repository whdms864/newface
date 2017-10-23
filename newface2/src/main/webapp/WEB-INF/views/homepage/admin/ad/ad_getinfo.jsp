<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
td img{
	width:190px;
	height:350px;
}
</style>

<div id="sidebar">
	<ul>
		<li>
			<a href="<c:url value='/notiadmin_list'/>"style="margin-top: 0px;">공지사항</a>
		</li>
		<li>
			<a href="<c:url value='/ader_list'/>"  class="now" >광고관리</a>
		</li>
		<li>
			<a href="<c:url value='/qna11/admin/list'/>">1:1문의</a>
		</li>
		<li>
			<a href="<c:url value='/market/admin/item/list'/>">마켓관리</a>
		</li>
		<li>
			<a href="<c:url value='/memadmin'/>" >회원관리</a>
		</li>
		<li>
			<a href="<c:url value='/singoadmin'/>">신고관리</a>
		</li>
	</ul>
</div>
<div id="con_wrap">
	<div id="tab">
		<div style="margin-left: 30px;margin-top: 10px;">
			<label style="font-weight:bold;font-size:25px;">광고관리</label>
		</div>
		<ul>
		    <li><a href="<c:url value='/ader_list'/>" style="margin-left:0px;">광고주목록</a></li>
		    <li><a href="<c:url value='/ader_insert'/>">광고주등록</a></li>
		    <li><a href="<c:url value=''/>">광고매출현황</a></li>
		</ul>
	</div>
	<div id="con">
		<div align="center">
			<table class="table table hover" style="width: 80%;margin-top: 20px;">
			  		<tr>
			  			<td class="danger" colspan="2">No. ${ad_getinfo.ad_num }</td>
			  			<td class="info" colspan="2">${ad_getinfo.type }</td>
			  		</tr>
			  		<tr>
			  			<td style="width:70px;">가격 </td> 
			  			<td style="width:350px;"> ${ad_getinfo.pay }</td>
			  			<td>시작일</td>
			  			<td> ${ad_getinfo.sdate }</td>
			  			
			  		</tr>
			  		
			  		<tr>
			  			<td>URL</td>
			  			<td> ${ad_getinfo.url }</td>
			  			<td>만료일</td>
			  			<td> ${ad_getinfo.edate }</td>
			  		</tr>
			  		
				  	<tr>
			  			<td colspan="4" align="center"> ${ad_getinfo.ad_img }</td>
				  	</tr>
			</table>
		</div>
		
		<div style="position:absolute;top:610px;width: 98%;"align="center">
				<div style="background-color: rgb(224, 224, 224);margin-left:10px;width: 99%; height:1px;"></div>
				<input type="button" value="수정" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
				border-radius: 4px; background-color: rgb(52, 152, 219);width:120px; height:40px;margin-top:10px;" onclick="location.href='/newface/ad_update?ad_num=${ad_getinfo.ad_num}'">
				<input type="button" value="삭제" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
				border-radius: 4px; background-color: rgb(52, 152, 219);width:120px; height:40px;margin-top:10px;" onclick="location.href='/newface/ad_delete?ad_num=${ad_getinfo.ad_num}'">
		</div>
	</div>
</div>
	
