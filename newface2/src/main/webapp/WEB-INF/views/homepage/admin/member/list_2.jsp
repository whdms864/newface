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
			if(text==""){
				$("#text").focus();
				alert("검색할 내용을 입력해주세요");
			}else{
				location.href="<c:url value='/memadmin/2'/>?text="+text;
			}
		});
		$("#text").keypress(function(event){
			if(event.keyCode==13){
				var text=$("#text").val();
				if(text==""){
					$("#text").focus();
					alert("검색할 내용을 입력해주세요");
				}else{
					location.href="<c:url value='/memadmin/2'/>?text="+text;
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
			<a href="<c:url value='/qna11/admin/list'/>">1:1문의</a>
		</li>
		<li>
			<a href="<c:url value='/market/admin/item/list'/>">마켓관리</a>
		</li>
		<li>
			<a href="<c:url value='/memadmin'/>"  class="now">회원관리</a>
		</li>
		<li>
			<a href="<c:url value='/singoadmin'/>">신고관리</a>
		</li>
	</ul>
</div>
<div id="con_wrap">
	<div id="tab">
		<div style="margin-left: 30px;margin-top: 10px;">
			<label style="font-weight:bold;font-size:25px;">회원관리</label>
		</div>
		<ul>
		    <li><a href="<c:url value='/memadmin'/>" style="margin-left:0px;">전체회원</a></li>
		    <li><a href="<c:url value='/memadmin/1'/>">경고회원</a></li>
		    <li><a href="<c:url value='/memadmin/2'/>" class="hover_a">탈퇴회원</a></li>
		</ul>
	</div>
	<div id="con">	
		<div align="center">
			<table class="table table-hover" style="width: 90%;margin-top: 20px;">
				<thead>
			  		<tr class="danger">
			  			<th>아이디</th>
			  			<th>이름</th>
			  			<th>이메일</th>
			  			<th>상태</th>
			  			<th>가입일</th>
			  		</tr>
			  	</thead>
			  	<tbody>
				  	<c:choose>
					  	<c:when test="${list.size()==0 }">
							<label style="font-weight:bold;font-size: 30px; position: absolute;top:150px;left: 210px;"> 
								조회할 회원이 없습니다.
							</label>
						</c:when>
						<c:otherwise>
					  		<c:forEach var="vo" items="${list}">
					  			<tr>
						  			<td><a href="<c:url value='/memadmin/getinfo?id=${vo.id }'/>">${vo.id}</a></td>
						  			<td>${vo.name}</td>
						  			<td>${vo.email}</td>
						  			<td>${vo.type}</td>
						  			<td>${vo.regdate}</td>
						  		</tr>
						  	</c:forEach>
						 </c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<div style="position:absolute;top:540px;width: 100%;"align="center">
			<c:choose>
				<c:when test="${pu.startPageNum>5 }">
					<a href="<c:url value='/memadmin/2?pageNum=${pu.startPageNum-1 }&text=${text }'/>">
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
						<a href="<c:url value='/memadmin/2?pageNum=${i }&text=${text }'/>">
							<span data-tooltip="${i }" class="pagination__dot pagination__dot--active"></span>
						</a>
					</c:when>
					<c:otherwise>
						<a href="<c:url value='/memadmin/2?pageNum=${i }&text=${text }'/>">
							<span data-tooltip="${i }" class="pagination__dot pagination__dot">
							</span>
						</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>	
			</div>
			<c:choose>
				<c:when test="${pu.endPageNum<pu.totalPageCount}">
					<a href="<c:url value='//memadmin/2?pageNum=${pu.endPageNum+1 }&text=${text }'/>">
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
					<input type="text" name="text" id="text" class="form-control" placeholder="검색할 아이디 또는 회원이름을 입력하세요" value="${text }" style="width:520px;float:left;margin-left: 5px;">
					<input type="button" id="search" value="검색" style=" color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
					border-radius: 4px; background-color: rgb(52, 152, 219);width:80px; height:35px;float:left;margin-left: 5px;" > 
				</div>
			</div>
		</div>
	</div>
</div>