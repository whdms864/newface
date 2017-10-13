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
<div id="tab">
	<div style="margin-left: 30px;margin-top: 10px;">
		<label style="font-weight:bold;font-size:25px;">공지사항</label>
	</div>
	<ul>
	    <li><a href="<c:url value='/qna11/getinfo'/>"style="margin-left:0px;" class="hover_a">목록</a></li>
	</ul>
</div>
<div id="con" align="center">
	<table class="table" style="width: 90%;margin-top: 20px;">
	  		<tr class="success">
	  			<td>No.${vo.noti_num}</td>
	  			<td>${vo.title}</td>
	  		</tr>
	  		<tr>
	  			<td>작성자 : ${vo.id }</td>
	  			<td>작성일 : ${vo.regdate }</td>
		  	</tr>
		  	<tr>
	  			<td colspan="2" style="height:340px">
			  		<textarea rows="16" cols="65" readonly="readonly" style="border-style:hidden; resize:none;">${vo.content }</textarea>
				</td>
		  	</tr>
	</table>
	<div style="position:absolute;top:430px; width:98%;"align="center">
		<div style="background-color: rgb(224, 224, 224);margin-left:8px;width: 99%; height:1px;"></div>
	</div>
	
	<div style="background-color: rgb(239, 238, 238);width: 95%;height:225px; position:absolute; bottom:25px; left:13px">
		<form method="post" id="noti_com_insert" action="<c:url value='/noti_com_insert'/>">
		
		<div style="display: inline-block;">
			<div class="form-group has-success" style="display: inline-block; width:500px; height:35px;">
				<input type="text" name="content" id="com_content" class="form-control" style="width:400px;height:30px; float:left; position:absolute;right:75px; top:5px;">
					<input type="submit" value="등록" style=" color: rgb(255, 255, 255); text-align: center; border-radius: 4px; background-color: rgb(52, 152, 219); width:60px; height:27px;float:left; position:absolute; left:420px; top:5px;">
				<div style="width:95%; height:160px; background-color: white; position:absolute; top:40px; right:12px;">
					<table style="width:100%;">
						<tr align="center">
						<th>글쓴이</th>
						<th>내용</th>
						<th>작성일</th>
						<th></th>
						</tr>
						<c:forEach var="noti_com_list" items="${noti_com_list }">
						<tr>
							<td style="width:18%; height:20%" >${noti_com_list.id }</td>
							<td style="width:55%;">${noti_com_list.content }</td>
							<td style="width:18%;">${noti_com_list.regdate }</td>
							<c:choose>
								<c:when test="${noti_com_list.id != sessionScope.loginid}">
									<td style="width:9%;">신고</td>
								</c:when>
									
								<c:otherwise>
									<td></td>
								</c:otherwise>
							</c:choose>
						</tr>
						</c:forEach>
					</table>
					<input type="hidden" name="id" value="${sessionScope.loginid }">
					<input type="hidden" name="noti_num" value="${vo.noti_num}">
				</div> 
			</div>
		</div>
		</form>
	</div>
</div>

<div style="position:absolute;top:695px;width: 100%;"align="center">
	<c:choose>
		<c:when test="${pu.startPageNum>5 }">
			<a href="<c:url value='/noti_getinfo?pageNum=${pu.startPageNum-1 }&noti_num=${vo.noti_num }'/>">
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
				<a href="<c:url value='/noti_getinfo?pageNum=${i }&noti_num=${vo.noti_num }'/>">
					<span data-tooltip="${i }" class="pagination__dot pagination__dot--active"></span>
				</a>
			</c:when>
			<c:otherwise>
				<a href="<c:url value='/noti_getinfo?pageNum=${i }&noti_num=${vo.noti_num }'/>">
					<span data-tooltip="${i }" class="pagination__dot pagination__dot">
					</span>
				</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>	
	</div>
	<c:choose>
		<c:when test="${pu.endPageNum<pu.totalPageCount}">
			<a href="<c:url value='/noti_getinfo?pageNum=${pu.endPageNum+1 }&noti_num=${vo.noti_num }'/>">
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
	
	
	
