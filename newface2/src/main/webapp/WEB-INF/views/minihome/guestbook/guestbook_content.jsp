<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src='<c:url value="/resources/js/jquery-3.2.1.min.js" />'></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/minihome/guestbook/guestbook_content.css?ver=7'/>">
<div id=scroll style="overflow: scroll; width: 660px; height: 560px;">
	<div>
		<form method="post" action="<c:url value='/guest/insert'/>">
			<div id="g_write_b">
				<input type="hidden" value=${sessionScope.loginid } name="id"
					id="id"> <input type="hidden"
					value=${sessionScope.hompy_num } name="hompy_num" id="hompy_num">
				<div id="g_minime"></div>
				<textarea rows="100" cols="60" name="content" id="g_texta"></textarea>
				<select id="secret" name="secret">
					<option value="전체공개">전체공개</option>
					<option value="비밀글">비밀글</option>
				</select> <input type="submit" value="확인" id="g_submit" />
			</div>
		</form>
	</div>
	<c:forEach var="vo" items="${requestScope.list }">
		<div id="g_content_b">
			<c:if test="${vo.secret == '전체공개' }">
				<div id="g_header1">
					<div id="g_num">No.${vo.guest_num }</div>
					<div id="g_name">${vo.name }</div>
					<a href="" id="g_home"><img
						src="<c:url value='/resources/images/minihome/home_a.PNG'/>"></a>
					<div id="g_date">( ${vo.regdate } )</div>
					<div id="g_update">
						<a
							href="<c:url value='/guest/update?guest_num=${vo.guest_num }'/>">수정</a>
					</div>
					<div id="g_l1">|</div>
					<div id="g_secret">
						<a
							href="<c:url value='/guest/secret?value=비밀글&guest_num=${vo.guest_num }'/>">비밀로하기</a>
					</div>
					<div id="g_l2">|</div>
					<div id="g_delete">
						<a
							href="<c:url value='/guest/delete?guest_num=${vo.guest_num }'/>">삭제</a>
					</div>
				</div>
			</c:if>
			<c:if test="${vo.secret == '비밀글' }">
				<div id="g_header">
					<div id="g_num">No.${vo.guest_num }</div>
					<div id="g_name">${vo.name }</div>
					<a href="" id="g_home"><img
						src="<c:url value='/resources/images/minihome/home_s.PNG'/>"></a>
					<div id="g_date">( ${vo.regdate } )</div>
					<div id="g_update">
						<a
							href="<c:url value='/guest/update?guest_num=${vo.guest_num }'/>">수정</a>
					</div>
					<div id="g_l1">|</div>
					<div id="g_secret">
						<a
							href="<c:url value='/guest/secret?value=전체공개&guest_num=${vo.guest_num }'/>">전체공개</a>
					</div>
					<div id="g_l2">|</div>
					<div id="g_delete">
						<a
							href="<c:url value='/guest/delete?guest_num=${vo.guest_num }'/>">삭제</a>
					</div>
				</div>
			</c:if>
			<div id="g_minime1">이미지</div>
			<div id="g_content">${vo.content }</div>
			<c:if test="${vo.secret == '전체공개' }">
				<div id="g_secret_t"></div>
			</c:if>
			<c:if test="${vo.secret =='비밀글' }">
				<div id="g_secret_i">
					<img src="">
				</div>
				<div id="g_secret_t">비밀이야 ( 이 글은 홈주인과 작성자만 볼 수 있어요 )</div>
			</c:if>
			<div id="g_comment_b">
				<form method="post" action="<c:url value='/guest/com_insert'/>">
					<input type="hidden" value=${vo.guest_num } id="test_num"
						name="guest_num"> <input type="hidden"
						value=${sessionScope.loginid } name="id">
					<textarea rows="60" cols="30" id="g_text1" name="content"></textarea>
					<input type="submit" id="g_comment_result" value="확인">
				</form>
			</div>
			<div id="g_comment_b1" style="overflow: hidden;height: auto;">
				<c:forEach var="vo1" items="${requestScope.list1 }">
				<c:if test="${vo1.guest_num eq vo.guest_num}">
					<div class="c_name">
						<a href="">${vo1.name } :</a> ${vo1.content }
					</div>
				</c:if>
			</c:forEach>
			</div>
		</div>
		<br>
		<br>
		<br>
		<br>
	</c:forEach>
</div>