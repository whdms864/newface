<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src='<c:url value="/resources/js/jquery-3.2.1.min.js" />'></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/minihome/guestbook/guestbook_content.css?ver=4'/>">
	<div>
		<form method="post" action="<c:url value='/guest/insert'/>">
			<div class="g_write_b">
				<input type="hidden" value=${sessionScope.loginid } name="id"
					id="id"> <input type="hidden"
					value=${sessionScope.hompy_num } name="hompy_num" id="hompy_num">
				<div class="g_minime"></div>
				<textarea rows="100" cols="60" name="content" class="g_texta"></textarea>
				<select class="secret" name="secret">
					<option value="전체공개">전체공개</option>
					<option value="비밀글">비밀글</option>
				</select> <input type="submit" value="확인" class="g_submit" />
			</div>
		</form>
	</div>
	<c:forEach var="vo" items="${requestScope.list }">
		<div class="g_content_b">
				<c:if test="${vo.secret == '전체공개' }">
					<div class="g_header1">
						<div class="g_num">No.${vo.guest_num }</div>
						<div class="g_name">${vo.name }</div>
						<a href="" class="g_home">
						<img src="<c:url value='/resources/images/minihome/home_a.PNG'/>"></a>
						<div class="g_date">( ${vo.regdate } )</div>
						<div class="g_update">
							<a href="<c:url value='/guest/update?guest_num=${vo.guest_num }'/>">수정</a>
						</div>
						<div class="g_l1">|</div>
						<div class="g_secret">
							<a href="<c:url value='/guest/secret?value=비밀글&guest_num=${vo.guest_num }'/>">비밀로하기</a>
						</div>
						<div class="g_l2">|</div>
						<div class="g_delete">
							<a href="<c:url value='/guest/delete?guest_num=${vo.guest_num }'/>">삭제</a>
						</div>
					</div>
				</c:if>
				<c:if test="${vo.secret == '비밀글' }">
					<div class="g_header">
						<div class="g_num">No.${vo.guest_num }</div>
						<div class="g_name">${vo.name }</div>
						<a href="" class="g_home"><img
							src="<c:url value='/resources/images/minihome/home_s.PNG'/>"></a>
						<div class="g_date">( ${vo.regdate } )</div>
						<div class="g_update">
							<a href="<c:url value='/guest/update?guest_num=${vo.guest_num }'/>">수정</a>
						</div>
						<div class="g_l1">|</div>
						<div class="g_secret">
							<a href="<c:url value='/guest/secret?value=전체공개&guest_num=${vo.guest_num }'/>">전체공개</a>
						</div>
						<div class="g_l2">|</div>
						<div class="g_delete">
							<a href="<c:url value='/guest/delete?guest_num=${vo.guest_num }'/>">삭제</a>
						</div>
					</div>
				</c:if>
				<div class="g_minime1">${vo.minime_img }</div>
				<div class="g_content">${vo.content }</div>
				<c:if test="${vo.secret == '전체공개' }">
					<div class="g_secret_t"></div>
				</c:if>
				<c:if test="${vo.secret =='비밀글' }">
					<div class="g_secret_i">
						<img src="">
					</div>
					<div class="g_secret_t">비밀이야 ( 이 글은 홈주인과 작성자만 볼 수 있어요 )</div>
				</c:if>
				<div class="g_comment_b">
					<form method="post" action="<c:url value='/guest/com_insert'/>">
						<input type="hidden" value=${vo.guest_num } id="test_num"
							name="guest_num"> <input type="hidden"
							value=${sessionScope.loginid } name="id">
						<textarea rows="60" cols="30" class="g_text1" name="content"></textarea>
						<input type="submit" class="g_comment_result" value="확인">
					</form>
				</div>
			<div class="g_comment_b1" style="overflow: hidden;height: auto;">
				<c:forEach var="vo1" items="${requestScope.list1 }">
					<c:if test="${vo1.guest_num eq vo.guest_num}">
						<div class="c_name">
							<a href="<c:url value='/minihome?hompy_num=${vo1.hompy_num }'/>">${vo1.name } :</a> ${vo1.content }
							<div style="display:inline;font-size:9px;color:gray;">( ${vo1.regdate } )</div>&nbsp;
							<c:if test="${sessionScope.loginid == vo1.id}">
							<a href="<c:url value='/guest/com_delete?guest_com_num=${vo1.guest_com_num }'/>"><img src="<c:url value='/resources/images/minihome/comment_delete1.png'/>" style="position:absolute;margin-top:2px;"></a>
						</c:if>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</c:forEach>
<div style="position:relative;top:100px;text-align: center;">
	<c:choose>
		<c:when test="${pu.startPageNum>5 }">
			<a href="<c:url value='/guest/all_list?pageNum=${pu.startPageNum-1 }'/>">[이전]</a>
		</c:when>
		<c:otherwise>
			[이전]
		</c:otherwise>
	</c:choose>
	<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
		<c:choose>
			<c:when test="${i==pu.pageNum }">
				<a href="<c:url value='/guest/list_all?pageNum=${i }'/>"><span style="color:blue">[${i }]</span></a>
			</c:when>
			<c:otherwise>
				<a href="<c:url value='/guest/list_all?pageNum=${i }'/>"><span style="color:gray">[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<!-- 다음 -->
	<c:choose>
	<c:when test="${pu.endPageNum<pu.totalPageCount}">
		<a href="<c:url value='/guest/all_list?pageNum=${pu.endPageNum+1 }'/>">[다음]</a>
	</c:when>
	<c:otherwise>
		[다음]
	</c:otherwise>
</c:choose>
</div>
