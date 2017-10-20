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
	  		
	  			  		
	  		<%-- <div style="width:460px; height:150px; background-color: blue;">
	  			<div style="width:460px; height:70px; background-color: red; ">
		  			<div style="width:130px; height:60px; float:left;">
		  				<span style="font-weight: bold; font-size: 14px;">아이디</span><br> <span>${vo.id}</span>
		  			</div>
		  			
		  			<div style="width:130px; height:60px; float:left;">
		  				<span style="font-weight: bold; font-size: 14px;">이름</span><br><span>${vo.name}</span>
		  			</div>
		  			
		  			<div style="width:190px; height:60px; float:left;">
		  				<span style="font-weight: bold; font-size: 14px;">이메일</span><br> <span>${vo.email}</span>
		  			</div>
	  			</div>
	  			
	  			<div style="width:460px; height:70px">
		  			<div style="width:230px; height:60px; float:left;">
		  				<span style="font-weight: bold; font-size: 14px;">지역</span><br><span>${vo.addr}</span>
		  			</div>
		  			
		  			<div style="width:230px; height:60px; float:left;">
		  				<span style="font-weight: bold; font-size: 14px;">학교</span><br><span>${vo.school}</span>
		  			</div>
		  		</div>
	  		</div> --%>
	<c:forEach var="vo" items="${fsearch_list}">
		<table class="table table-bordered" style="width: 460px; margin-top: 20px;">
			<thead>
				<tr class="success">
					<td colspan="6"></td>
				</tr>
		  		<tr >
		  			<th colspan="2" style="width:130px; text-align: center;">아이디</th>
		  			<th colspan="2" style="width:130px; text-align: center;">이름</th>
		  			<th colspan="2" style="width:230px; text-align: center;">학교</th>
		  		</tr>
		  	</thead>
		  	<tbody>
		 		<tr>
		  			<td colspan="2" style="text-align: center;">${vo.id}</td>
		  			<td colspan="2" style="text-align: center;">${vo.name}</td>
		  			<td colspan="2" style="text-align: center;">${vo.school}</td>
		  		</tr>
			</tbody>
			
			<thead>
		  		<tr>
		  			<th colspan="3" style="width:230px; text-align: center;">지역</th>
		  			<th colspan="3" style="width:230px; text-align: center;">이메일</th>
		  		</tr>
		  	</thead>
		  	<tbody>
		 		<tr>
		  			<td colspan="3" style="text-align: center;">${vo.addr}</td>
		  			<td colspan="3" style="text-align: center;">${vo.email}</td>
		  		</tr>
			</tbody>
				<tr class="success">
					<td colspan="6"></td>
				</tr>
		</table>
	</c:forEach>
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
