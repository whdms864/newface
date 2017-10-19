<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resources/css/paging_style_user.css?ver=4'/>">
<style type="text/css>">
	a:visited {color : black}
</style>
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

<div id="msg_sendlist" style="background-color: rgba(250, 250, 250, 0.78); margin-left:0px; margin-top:25px; width: 430px; height: 305px;"align="center">
	<table class="table table-hover" style="width: 430px; margin-top: 20px;">
	<thead>
		<tr>
			<th colspan="5" class="danger">보낸쪽지함</th>
		</tr>
		
  		<tr>
  			<th style="text-align: center;">받은사람</th>
  			<th style="text-align: center;">내용</th>
  			<th style="text-align: center;">날짜</th>
  			<th style="text-align: center;">읽음</th>
  			<th style="text-align: center;">발신취소</th>
  		</tr>
  	</thead>
  	<tbody>
  		<c:forEach var="msgsend_list" items="${msgsend_list }"> 
  			<tr>
	  			<td style="text-align: center; text-overflow: ellipsis; white-space: nowrap; max-width:74px; overflow: hidden;">${msgsend_list.receiver }</td>
	  			<td style="text-overflow: ellipsis; white-space: nowrap; max-width:74px; overflow: hidden;"><a href="<c:url value='/msgsend_getinfo?msg_num=${msgsend_list.msg_num }'/>">${msgsend_list.content }</a></td>
	  			<td style="text-align: center;">${msgsend_list.regdate }</td>
	  			<td style="text-align: center;">${msgsend_list.chk }</td>
	  			<c:choose>
	  				<c:when test="${msgsend_list.chk=='읽지않음' && msgsend_list.send_clx=='1' }">
	  					<td style="text-align: center;"><a href="<c:url value='/send_clx?msg_num=${msgsend_list.msg_num }'/>">발송취소</a></td>
	   				</c:when>
	   				
	   				<c:when test="${msgsend_list.chk=='읽지않음' && msgsend_list.send_clx=='0' }">
	  					<td style="text-align: center;">취소완료</td>
	   				</c:when>
	   					   				
	  				<c:otherwise>
	  					<td style="text-align: center;"></td>
	  				</c:otherwise>
	  			</c:choose>
	  		</tr>
	  	</c:forEach>
	  	</tbody>
	 </table>
</div>

<div style="position:absolute;top:300px;width: 430px; height:50px;"align="center">
			<c:choose>
				<c:when test="${pu.startPageNum>5 }">
					<a href="<c:url value='/msgsend_list?pageNum=${pu.startPageNum-1 }&sender=${loginid }'/>">
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
						<a href="<c:url value='/msgsend_list?pageNum=${i }&sender=${loginid }'/>">
							<span data-tooltip="${i }" class="pagination__dot pagination__dot--active"></span>
						</a>
					</c:when>
					<c:otherwise>
						<a href="<c:url value='/msgsend_list?pageNum=${i }&sender=${loginid }'/>">
							<span data-tooltip="${i }" class="pagination__dot pagination__dot">
							</span>
						</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>	
			</div>
			<c:choose>
				<c:when test="${pu.endPageNum<pu.totalPageCount}">
					<a href="<c:url value='/msgsend_list?pageNum=${pu.endPageNum+1 }&sender=${loginid }'/>">
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

	
	
	