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
	<div id="tab">
		<div style="margin-left: 30px;margin-top: 10px;">
			<label style="font-weight:bold;font-size:25px;">My Page</label>
		</div>
		<ul>
		    <li><a href="<c:url value='/member/mypage'/>"style="margin-left:0px;" >회원정보</a></li>
		    <li><a href="<c:url value='/market/buy/list'/>" class="hover_a">구매내역</a></li>
		    <li><a href="<c:url value='/market/mine/list'/>">보유내역</a></li>
		</ul>
	</div>
	<div id="con" align="center">
		<table class="table table-hover" style="width: 90%;margin-top: 20px;">
			<thead>
		  		<tr class="success">
		  			<th>No.</th>
		  			<th>제목</th>
		  			<th>등록일</th>
		  			<th>상태</th>
		  		</tr>
		  	</thead>
		  	<tbody>
		  		<c:set var="i" value="0"/>
		  		<c:forEach var="vo" items="${list}">
		  			<tr>
		  				<c:set var="i" value="${i + 1}"/>
			  			<td>${i}</td>
			  			<td style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;max-width: 200px;">
		  					<a href="<c:url value='/qna11/detail?qna11_num=${vo.qna11_num }'/>">${vo.title}</a>
		  				</td>
		  				<td>${vo.regdate}</td>
		  				<td>
				  			<c:choose>
				  				<c:when test="${vo.confirm=='0'}">대기</c:when>
				  				<c:when test="${vo.confirm=='1'}">확인중</c:when>
				  				<c:when test="${vo.confirm=='2'}">답변완료</c:when>
				  			</c:choose>
			  			</td>
			  		</tr>
			  	</c:forEach>
			 </tbody>
		</table>
		<div style="position:absolute;top:620px;width: 98%;"align="center">
			<c:choose>
			<c:when test="${pu.startPageNum>5 }">
				<a href="<c:url value='/qna11/getinfo?pageNum=${pu.startPageNum-1 }'/>">
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
					<a href="<c:url value='/qna11/getinfo?pageNum=${i }'/>">
						<span data-tooltip="${i }" class="pagination__dot pagination__dot--active"></span>
					</a>
				</c:when>
				<c:otherwise>
					<a href="<c:url value='/qna11/getinfo?pageNum=${i }'/>">
						<span data-tooltip="${i }" class="pagination__dot pagination__dot">
						</span>
					</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>	
		</div>
		<c:choose>
			<c:when test="${pu.endPageNum<pu.totalPageCount}">
				<a href="<c:url value='/qna11/getinfo?pageNum=${pu.endPageNum+1 }'/>">
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
