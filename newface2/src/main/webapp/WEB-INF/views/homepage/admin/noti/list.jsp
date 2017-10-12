<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="sidebar">
	<ul>
		<li>
			<a href="<c:url value='/notiadmin_list'/>"style="margin-top: 0px;" class="now">공지사항</a>
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
			<label style="font-weight:bold;font-size:25px;">공지사항</label>
		</div>
		<ul>
		    <li><a href="<c:url value='/notiadmin_list'/>"style="margin-left:0px;" class="hover_a">목록</a></li>
		    <li><a href="<c:url value='/notiadmin_insert'/>">작성</a></li>
		</ul>
	</div>
	<div id="con">	
		<div align="center">
			<table class="table table-hover" style="width: 90%;margin-top: 20px;">
				<thead>
			  		<tr class="danger">
			  			<th>No.</th>
			  			<th>제목</th>
			  			<th>작성자</th>
			  			<th>등록일</th>
			  		</tr>
			  	</thead>
			  	<tbody>
			  		<c:forEach var="vo" items="${list}">
			  			<tr>
				  			<td>${vo.noti_num}</td>
				  			<td style="text-overflow: ellipsis; white-space: nowrap; max-width:280px; overflow: hidden;"><a href="<c:url value='/notiadmin_getinfo?noti_num=${vo.noti_num }'/>">${vo.title}</a></td>
				  			<td>${vo.id}</td>
				  			<td>${vo.regdate}</td>
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
