<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resources/css/paging_style_user.css?ver=4'/>">
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
	});
</script>	
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
		    <li><a href="<c:url value='/ader_list'/>" style="margin-left:0px;"  class="hover_a">광고주목록</a></li>
		    <li><a href="<c:url value='/ader_insert'/>">광고주등록</a></li>
		    <li><a href="<c:url value=''/>">광고매출현황</a></li>
		</ul>
	</div>
	<div id="con">
		<div align="center">
			<table class="table table-hover" style="width: 90%;margin-top: 20px;">
				<thead>
					<tr class="danger">
			  			<th>No.</th>
			  			<th>회사명</th>
			  			<th>대표명</th>
			  			<th>사업자번호</th>
			  			<th>광고목록</th>
			  			<th>광고등록</th>
			  		</tr>
			  	</thead>
		  		<tbody>	  	
			  		<c:forEach var="vo" items="${ader_list}">
			  			<tr>
				  			<td>${vo.ader_num}</td>
				  			<td><a href="<c:url value='/ader_getinfo?ader_num=${vo.ader_num}'/>">${vo.hname}</a></td>
				  			<td>${vo.pname}</td>
				  			<td>${vo.snum}</td>
				  			<td><input type="button" onclick="location.href='/newface/ad_list?ader_num=${vo.ader_num}'" value="광고목록"></td>
			  				<td><input type="button" onclick="location.href='/newface/ad_insert?ader_num=${vo.ader_num}'" value="광고등록"></td>
				  		</tr>
				  	</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<div style="position:absolute;top:780px;width: 792px;"align="center">
			<c:choose>
				<c:when test="${pu.startPageNum>5 }">
					<a href="<c:url value='/ader_list?pageNum=${pu.startPageNum-1 }'/>">
						<span class="btnprev">◁◁</span>
					</a>
				</c:when>
				<c:otherwise>
						<span class="btnprev-a">◁◁</span>
				</c:otherwise>
			</c:choose>
			<div class="pagination">
			<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
				<c:choose>
					<c:when test="${i==pu.pageNum }">
						<a href="<c:url value='/ader_list?pageNum=${i }'/>">
							<span data-tooltip="${i }" class="pagination__dot pagination__dot--active"></span>
						</a>
					</c:when>
					<c:otherwise>
						<a href="<c:url value='/ader_list?pageNum=${i }'/>">
							<span data-tooltip="${i }" class="pagination__dot pagination__dot">
							</span>
						</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>	
			</div>
			<c:choose>
				<c:when test="${pu.endPageNum<pu.totalPageCount}">
					<a href="<c:url value='/ader_list?pageNum=${pu.endPageNum+1 }'/>">
						<span class="btnnext">
								▷▷
						</span>
					</a>
				</c:when>
				<c:otherwise>
					<span class="btnnext-a">▷▷</span>
				</c:otherwise>
			</c:choose>
		</div>
</div>