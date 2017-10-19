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
		<label style="font-weight:bold;font-size:25px;">'${text }'&nbsp;검색결과</label>
	</div>
	
</div>
<div id="con" align="center">
	<table class="table table-hover" style="width: 460px; margin-top: 20px;">
		<thead>
	  		<tr class="success">
	  			<th>아이디</th>
	  			<th>이름</th>
	  			<th>이메일</th>
	  			<th>지역</th>
	  			<th>학교</th>
	  		</tr>
	  	</thead>
	  	<tbody>
	  		<c:forEach var="vo" items="${fsearch_list}">
	  			<tr>
		  			<td>${vo.id}</td>
		  			<td>${vo.name}</td>
		  			<td>${vo.email}</td>
		  			<td>${vo.addr}</td>
		  			<td>${vo.school}</td>
		  		</tr>
			</c:forEach>
		 </tbody>
	</table>
</div>
		<div style="position:absolute;top:700px;width: 100%;"align="center">
			<c:choose>
				<c:when test="${pu.startPageNum>5 }">
					<a href="<c:url value='/fsearch_list?pageNum=${pu.startPageNum-1 }&text=${text }'/>">
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
						<a href="<c:url value='/fsearch_list?pageNum=${i }&text=${text }'/>">
							<span data-tooltip="${i }" class="pagination__dot pagination__dot--active"></span>
						</a>
					</c:when>
					<c:otherwise>
						<a href="<c:url value='/fsearch_list?pageNum=${i }&text=${text }'/>">
							<span data-tooltip="${i }" class="pagination__dot pagination__dot">
							</span>
						</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>	
			</div>
			<c:choose>
				<c:when test="${pu.endPageNum<pu.totalPageCount}">
					<a href="<c:url value='/fsearch_list?pageNum=${pu.endPageNum+1 }&text=${text }'/>">
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