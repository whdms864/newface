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
		$("#select_cate").change(function(){
			var category_num=$(this).val();
			location.href='list?category_num='+category_num;
		});
	});
</script>
<style>
	td p img{
		width: 60px;
		height: 60px;
	}
</style>
	<div align="center">
		<select name="category_num" id="select_cate" style="top: 20px;right: 38px;position:absolute;">
			<c:forEach var="vo" items="${list_cate }">
				<option value="${vo.category_num}" ${vo.category_num == category_num ? 'selected="selected"' : '' }>${vo.name}</option>
			</c:forEach>
		</select>
		<table class="table table-hover" style="width: 90%;margin-top: 50px;">
			<thead>
		  		<tr class="success">
		  			<th>No.</th>
		  			<th>상품명</th>
		  			<th>이미지</th>
		  			<th>상세내용</th>
		  			<th>가격(개)</th>
		  			<th>등록일</th>
		  		</tr>
		  	</thead>
		  	<tbody>
		  		<c:forEach var="vo" items="${list}">
		  			<tr>
			  			<td>${vo.item_num}</td>
			  			<td>
			  				<a href="<c:url value='/'/>">
			  					${vo.name}
			  				</a>
			  			</td>
			  			<td>${vo.item_img}</td>
			  			<td>${vo.content}</td>
			  			<td>${vo.pay}</td>
			  			<td>${vo.regdate}</td>
			  		</tr>
			  	</c:forEach>
			 </tbody>
		</table>
	</div>
<div style="position:absolute;top:610px;width: 100%;"align="center">
		<c:choose>
			<c:when test="${pu.startPageNum>5 }">
				<a href="<c:url value='/market/admin/item/list?pageNum=${pu.startPageNum-1 }'/>">
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
					<a href="<c:url value='/market/admin/item/list?pageNum=${i }'/>">
						<span data-tooltip="${i }" class="pagination__dot pagination__dot--active"></span>
					</a>
				</c:when>
				<c:otherwise>
					<a href="<c:url value='/market/admin/item/list?pageNum=${i }'/>">
						<span data-tooltip="${i }" class="pagination__dot pagination__dot">
						</span>
					</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>	
		</div>
		<c:choose>
			<c:when test="${pu.endPageNum<pu.totalPageCount}">
				<a href="<c:url value='/market/admin/item/list?pageNum=${pu.endPageNum+1 }'/>">
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
