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
		$("#search").click(function(){
			var text=$("#text").val();
			var category_num=$("#select_cate").val();
			if(text==""){
				$("#text").focus();
				alert("검색할 내용을 입력해주세요");
			}else{
				location.href='list?category_num='+category_num+'&text='+text;
			}
		});
		$("#text").keypress(function(event){
			if(event.keyCode==13){
				var text=$("#text").val();
				var category_num=$("#select_cate").val();
				if(text==""){
					$("#text").focus();
					alert("검색할 내용을 입력해주세요");
				}else{
					location.href='list?category_num='+category_num+'&text='+text;
				}
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
			<a href="<c:url value='/qna11/admin/list'/>" class="now">1:1문의</a>
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
			<label style="font-weight:bold;font-size:25px;">1:1문의</label>
		</div>
		<ul>
		    <li><a href="<c:url value='/qna11/admin/list'/>"style="margin-left:0px;" class="hover_a">전체회원</a></li>
		    <li><a href="<c:url value='/qna11/admin/list'/>"style="margin-left:0px;">제재회원</a></li>
		    <li><a href="<c:url value='/qna11/admin/list'/>"style="margin-left:0px;">탈퇴회원</a></li>
		</ul>
	</div>
	<div id="con">	
		<div align="center">
			<table class="table table-hover" style="width: 90%;margin-top: 20px;">
				<thead>
			  		<tr class="danger">
			  			<th>No.</th>
			  			<th>아이디</th>
			  			<th>제목</th>
			  			<th>등록일</th>
			  			<th>상태</th>
			  		</tr>
			  	</thead>
			  	<tbody>
			  		<c:forEach var="vo" items="${list}">
			  			<tr>
				  			<td>${vo.qna11_num}</td>
				  			<td>${vo.id}</td>
				  			<td style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;max-width: 300px;">
				  			<a href="<c:url value='/qna11/admin/detail?qna11_num=${vo.qna11_num }'/>">${vo.title}</a></td>
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
		</div>
		<div style="position:absolute;top:540px;width: 100%;"align="center">
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
		<div style="position:absolute;top:600px;width: 100%;"align="center">
			<div style="background-color: rgb(224, 224, 224);width:100%; height:1px;"></div>
			<div style="display: inline-block;margin-top: 20px;">
				<div class="form-group has-success" style="display: inline-block; ">
					<input type="text" name="text" id="text" class="form-control" placeholder="검색할 상품명을 입력하세요" value="${text }" style="width:520px;float:left;margin-left: 5px;">
					<input type="button" id="search" value="검색" style=" color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
					border-radius: 4px; background-color: rgb(52, 152, 219);width:80px; height:35px;float:left;margin-left: 5px;" > 
				</div>
			</div>
		</div>
	</div>
</div>