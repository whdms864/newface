<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<div>
	<a href="<c:url value='/'/>">main</a>
	</div>
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
			<table class="table table-hover" style="width: 90%;margin-top: 20px;">
				<thead>
			  		<tr class="danger">
			  			<th>계약상태</th>
			  			<th>URL</th>
			  			<th>시작일</th>
			  			<th>만료일</th>
			  		</tr>
			  	</thead>
			  	<tbody>
			  		<c:forEach var="ad" items="${ad_getinfo}">
			  			<tr>
				  			<td>
				  			<c:choose>
				  				<c:when test="${ad.type==1 }">
				  					계약협상
				  				</c:when>
				  				
				  				<c:when test="${ad.type==2 }">
				  					광고게시
				  				</c:when>
				  				
				  				<c:otherwise>
				  					계약만료
				  				</c:otherwise>
				  			</c:choose>
				  			</td>
				  			<td style="text-overflow: ellipsis; white-space: nowrap; max-width:280px; overflow: hidden;"><a href="<c:url value='/ad_getinfo?ad_num=${ad.ad_num }'/>">${ad.url}</a></td>
				  			<td>${ad.sdate}</td>
				  			<td>${ad.edate}</td>
				  		</tr>
				  	</c:forEach>
				</tbody>
			</table>
		</div>
		<div style="position:absolute;top:600px;width: 100%;"align="center">
			<div style="background-color: rgb(224, 224, 224);width:100%; height:1px;"></div>
			페이징
		</div>
	</div>
</div>
