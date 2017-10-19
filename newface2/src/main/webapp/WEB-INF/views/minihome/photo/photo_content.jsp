<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/minihome/photo/photo_content.css?ver=32'/>">
<a href="<c:url value='/photo/write'/>" id="p_upload"><img
	src="<c:url value='/resources/images/minihome/photo_upload.PNG'/>"></a>
<c:forEach var="vo" items="${requestScope.list1 }">
<div class="p_title">
	<div class="title">${vo.title }</div>
	<a href="<c:url value='/photo/love?love=1&photo_num=${vo.photo_num }'/>" class="p_love_b">좋아요</a>
	<c:if test="${requestScope.id eq sessionScope.loginid}">
	<a class="l1">|</a>
	<a href="<c:url value='/photo/update?photo_num=${vo.photo_num }'/>" class="p_update">수정</a>
	<a class="l2">|</a>
	<a href="<c:url value='/photo/delete?photo_num=${vo.photo_num }'/>" class="p_delete">삭제</a>
	</c:if>
</div>
<div class="p_content_back">
	<div class="p_writer">${requestScope.name }</div>
	<div class="p_date">${vo.regdate }</div>
	<div class="p_love">좋아요: ${vo.love }</div>
	<div class="p_content_img">${vo.content }</div>
</div>
<div class="p_comment_back">
	<div class="p_comment_tt">댓글</div>
	<form method="post" action="<c:url value='/photo/com_insert'/>">
		<input type="hidden" value="${sessionScope.loginid }" name="id">
		<input type="hidden" value="${vo.photo_num }" name="photo_num">
		<input type="text" class="p_comment" value="내용을 입력해 주세요" name="content">
		<input type="submit" class="p_submit" value="확인">
	</form>
</div>
		<div class="p_comment_back1">
<c:forEach var="vo2" items="${requestScope.list2 }">
	<c:if test="${vo2.photo_num eq vo.photo_num}">
			<div class="p_comment_name">
			<a href="">${requestScope.name } :</a> ${vo2.content }
			<div style="display:inline;font-size:9px;color:gray;">(${vo2.regdate })</div>&nbsp;
			<c:if test="${sessionScope.loginid == vo2.id}">
			<a href="<c:url value='/photo/com_delete?photo_com_num=${vo2.photo_com_num }'/>"><img src="<c:url value='/resources/images/minihome/comment_delete1.png'/>" style="position:absolute;margin-top:2px;"></a>
			</c:if>
			</div>
	</c:if>
</c:forEach>
		</div>
<br><br>
</c:forEach>
<div style="position:relative; top:120px; text-align: center;">
	<c:choose>
		<c:when test="${pu.startPageNum>5 }">
			<a href="<c:url value='/photo/list?pageNum=${pu.startPageNum-1 }'/>">[이전]</a>
		</c:when>
		<c:otherwise>
			[이전]
		</c:otherwise>
	</c:choose>
	<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
		<c:choose>
			<c:when test="${i==pu.pageNum }">
				<a href="<c:url value='/photo/list?pageNum=${i }'/>"><span style="color:blue">[${i }]</span></a>
			</c:when>
			<c:otherwise>
				<a href="<c:url value='/photo/list?pageNum=${i }'/>"><span style="color:gray">[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<!-- 다음 -->
	<c:choose>
	<c:when test="${pu.endPageNum<pu.totalPageCount}">
		<a href="<c:url value='/photo/list?pageNum=${pu.endPageNum+1 }'/>">[다음]</a>
	</c:when>
	<c:otherwise>
		[다음]
	</c:otherwise>
</c:choose>
</div>
