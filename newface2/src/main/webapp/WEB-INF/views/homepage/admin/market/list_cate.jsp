<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resources/css/paging_style.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
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
		$("#insert_cate").submit(function(event){
			var name=$("#name").val();
			if(name==""){
				$("#name").focus();
				alert("카테고리명을 입력해주세요");
				event.preventDefault();
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
			<a href="<c:url value='/market/admin/item/list'/>" class="now">마켓관리</a>
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
			<label style="font-weight:bold;font-size:25px;">마켓관리</label>
		</div>
		<ul>
		    <li><a href="<c:url value='/market/admin/item/list'/>"style="margin-left:0px;">상품목록</a></li>
		    <li><a href="<c:url value='/market/admin/item/insert'/>">상품등록</a></li>
		    <li><a href="<c:url value='/market/admin/cate/list'/>" class="hover_a">카테고리관리</a></li>
		</ul>
	</div>
	<div id="con">
		<div align="center">
			<form method="post" action="<c:url value='/market/admin/cate/update'/>">
				<table class="table table-hover" style="width: 90%;margin-top: 20px;">
					<thead>
				  		<tr class="danger">
				  			<th>No.</th>
				  			<th>카테고리</th>
				  			<th>수정</th>
				  			<th>삭제</th>
				  		</tr>
				  	</thead>
				  	<tbody>
				  		<c:forEach var="vo" items="${list}">
		  					<tr>
					  			<c:choose>
					  				<c:when test="${up==1 && vo.category_num==category_num}">
							  				<td>
							  				<input type="hidden" value="${vo.category_num}" name="category_num">
							  				${vo.category_num}
							  				</td>
								  			<td><input type="text" value="${vo.name}" name="name"></td>
								  			<td><input type="submit" value="확인" class="btn btn-primary"></td>
					  				</c:when>
					  				<c:otherwise>
							  			<tr>
								  			<td>${vo.category_num}</td>
								  			<td>${vo.name}</td>
								  			<td><a href="<c:url value='/market/admin/cate/list?category_num=${vo.category_num}&up=1'/>">수정</a></td>
							  		</c:otherwise>
						  		</c:choose>
					  			<td><a href="<c:url value='/market/admin/cate/delete?category_num=${vo.category_num}'/>">삭제</a></td>
					  		</tr>
					  	</c:forEach>
					 </tbody>
				</table>
			</form>
		</div>
		<div align="center" style="position:absolute;top:540px;width: 100%;">
			<c:choose>
				<c:when test="${pu.startPageNum>5 }">
					<a href="<c:url value='/market/admin/cate/list?pageNum=${pu.startPageNum-1 }'/>">
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
						<a href="<c:url value='/market/admin/cate/list?pageNum=${i }'/>">
							<span data-tooltip="${i }" class="pagination__dot pagination__dot--active"></span>
						</a>
					</c:when>
					<c:otherwise>
						<a href="<c:url value='/market/admin/cate/list?pageNum=${i }'/>">
							<span data-tooltip="${i }" class="pagination__dot pagination__dot">
							</span>
						</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>	
			</div>
			<c:choose>
				<c:when test="${pu.endPageNum<pu.totalPageCount}">
					<a href="<c:url value='/market/admin/cate/list?pageNum=${pu.endPageNum+1 }'/>">
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
		<div style="position:absolute;top:600px;width: 100%;"align="center">
			<div style="background-color: rgb(224, 224, 224);width:100%; height:1px;"></div>
			<form method="post" id="insert_cate" name="f" action="<c:url value='/market/admin/cate/insertok'/>">
				<div style="display: inline-block;margin-top: 20px;">
					<div class="form-group has-success" style="display: inline-block; ">
						<label class="control-label" for="inputWarning1" style="float:left;margin-top: 5px;">카테고리</label>
						<input type="text" name="name" id="name" class="form-control" style="width:520px;float:left;margin-left: 5px;">
						<input type="submit" value="등록" style=" color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
						border-radius: 4px; background-color: rgb(52, 152, 219);width:80px; height:35px;float:left;margin-left: 5px;" > 
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
