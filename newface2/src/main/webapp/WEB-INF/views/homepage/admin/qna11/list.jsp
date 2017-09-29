<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resources/css/paging_style.css?ver=1'/>">
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
	<div align="center">
		<table class="table table-hover" style="width: 90%;margin-top: 20px;">
	  		<tr class="success">
	  			<th>No.</th>
	  			<th>아이디</th>
	  			<th>제목</th>
	  			<th>등록일</th>
	  			<th>상태</th>
	  		</tr>
	  		<c:forEach var="vo" items="${list}">
	  			<tr>
		  			<td>${vo.qna11_num}</td>
		  			<td>${vo.id}</td>
		  			<td style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;max-width: 300px;">
		  			<a href="<c:url value='/qna11/admin/detail?qna11_num=${vo.qna11_num }'/>">${vo.title}</a></td>
		  			<td>${vo.regdate}</td>
		  			<td>${vo.confirm}</td>
		  		</tr>
		  	</c:forEach>
		</table>
	</div>
	<div style="position:absolute;top:610px;width: 100%;"align="center">
		<c:choose>
			<c:when test="${pu.startPageNum>5 }">
				<a href="<c:url value='/qna11/admin/list?pageNum=${pu.startPageNum-1 }'/>">
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
					<a href="<c:url value='/qna11/admin/list?pageNum=${i }'/>">
						<span data-tooltip="${i }" class="pagination__dot pagination__dot--active"></span>
					</a>
				</c:when>
				<c:otherwise>
					<a href="<c:url value='/qna11/admin/list?pageNum=${i }'/>">
						<span data-tooltip="${i }" class="pagination__dot pagination__dot">
						</span>
					</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>	
		</div>
		<div class="btnnext">▷▷</div>
		<c:choose>
			<c:when test="${pu.endPageNum<pu.totalPageCount}">
				<a href="<c:url value='/qna11/admin/list?pageNum=${pu.endPageNum+1 }'/>">
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
