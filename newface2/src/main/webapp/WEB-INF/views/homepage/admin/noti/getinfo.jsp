<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resources/css/paging_style_user.css?ver=1'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$("#noti_com_insert").submit(function(event){
			var content=$("#com_content").val();
			
			if(content==""){
				$("#com_content").focus();
				alert("내용을 입력해주세요");
				event.preventDefault();
			}
		});
		
			
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
			<table class="table" style="width: 70%;margin-top: 20px;">
			  		<tr class="danger">
			  			<td>No.${vo.noti_num}</td>
			  			<td>${vo.title}</td>
			  		</tr>
			  		<tr>
			  			<td>작성자 : ${vo.id }</td>
			  			<td>작성일 : ${vo.regdate }</td>
				  	</tr>
				  	<tr>
			  			<td colspan="2" style="height:100px"><textarea rows="13" cols="91" name="content" readonly="readonly" style="border-style:hidden; resize:none;">${vo.content }</textarea></td>
				  	</tr>
			</table>
				
			<div style="width:90%; height:148px; background-color: white; position:absolute; top:375px; right:38px;">
					<table class="table table-condensed" style="width:100%;">
						<tr>
						<th style="text-align: center;">글쓴이</th>
						<th style="text-align: center;">내용</th>
						<th style="text-align: center;">작성일</th>
						<th></th>
						</tr>
						<c:forEach var="noti_com_list" items="${noti_com_list }">
						<tr>
							<td style="width:18%; height:20%; text-align: center;" >${noti_com_list.id }</td>
							<td style="width:55%;">${noti_com_list.content }</td>
							<td style="width:18%; text-align: center;">${noti_com_list.regdate }</td>
							<td><input type="button" value="블라인드"></td>
						</tr>
						</c:forEach>
					</table>
					
				
		</div>
		
	</div>
		
		
		<div style="position:absolute;top:610px;width: 98%;"align="center">
				<div style="background-color: rgb(224, 224, 224);margin-left:10px;width: 99%; height:1px;"></div>
				<input type="button" value="수정" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
				border-radius: 4px; background-color: rgb(52, 152, 219);width:120px; height:40px;margin-top:10px;" onclick="location.href='/newface/notiadmin_update?noti_num=${vo.noti_num}'">
				<input type="button" value="삭제" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
				border-radius: 4px; background-color: rgb(52, 152, 219);width:120px; height:40px;margin-top:10px;" onclick="location.href='/newface/notiadmin_delete?noti_num=${vo.noti_num}'">
		</div>
		
		<div style="position:absolute;top:555px;width: 100%;"align="center">
			<c:choose>
				<c:when test="${pu.startPageNum>5 }">
					<a href="<c:url value='/notiadmin_getinfo?pageNum=${pu.startPageNum-1 }&noti_num=${vo.noti_num }'/>">
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
						<a href="<c:url value='/notiadmin_getinfo?pageNum=${i }&noti_num=${vo.noti_num }'/>">
							<span data-tooltip="${i }" class="pagination__dot pagination__dot--active"></span>
						</a>
					</c:when>
					<c:otherwise>
						<a href="<c:url value='/notiadmin_getinfo?pageNum=${i }&noti_num=${vo.noti_num }'/>">
							<span data-tooltip="${i }" class="pagination__dot pagination__dot">
							</span>
						</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>	
			</div>
			<c:choose>
				<c:when test="${pu.endPageNum<pu.totalPageCount}">
					<a href="<c:url value='/notiadmin_getinfo?pageNum=${pu.endPageNum+1 }&noti_num=${vo.noti_num }'/>">
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
</div>
	
