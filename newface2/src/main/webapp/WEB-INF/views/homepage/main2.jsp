<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/homepage/timeline.css?ver=24'/>">
	<div class="loginafter" align="center">
	<c:forEach var="vo" items="${list }">
		<div class="timeline">
			<div class="first" align="center">
				<div align="left" style="margin-left: 5px;">
				<table style="padding:0px; margin: 0px;">
						<tr>
							<td rowspan="2">
								<c:choose>
									<c:when test="${vo.save_name!=null }">
										<img src="<c:url value='/resources/upload/${vo.save_name }'/>" class="img-circle">
									</c:when>
									<c:otherwise>
										<img src="<c:url value='/resources/images/homepage/싸이_가상화폐.png'/>" class="img-circle">
									</c:otherwise>
								</c:choose>
							</td>
							<td style="width: 94%;padding-left:10px;height: 20px;margin-top: 5px;font-weight: bold;color:#365899;">
								${vo.name }
							</td>
						</tr>
						<tr>
							<td style="width: 94%;padding-left:10px;height: 20px;color:#90949c;">
								${vo.regdate }
							</td>
						</tr>
						<tr>
							<td colspan="2"style="width: 100%;">
							<p style="margin-left:5px;">${vo.title }</p>
							</td>
						</tr>
					</table>
				</div>
				<div class="content1" align="left">
					${vo.content }
				</div>
				<div class="content2" align="left">
					<hr style="margin-bottom:15px;">
					<ul>
						<li><a href="">좋아요</a></li>
						<li><a href="">댓글달기</a></li>
						<li><a href="">공유하기</a></li>
						<li><a href="">신고하기</a></li>
					</ul>
				</div>
			</div>	
			<div class="timecom" align="center">
				<img src="" class="img-circle">
				<input type="text" class="form-control" placeholder="댓글을 입력하세요">
				<%-- <img class="input-icon" src="<c:url value='/resources/images/homepage/icon/photo-camera.png'/>" > --%>
				<div class="com_main">
					<table style="padding:0px; margin: 0px;">
						<tr>
							<td rowspan="2">
								<c:choose>
									<c:when test="${pro_img.save_name!=null }">
										<img src="<c:url value='/resources/upload/${pro_img.save_name }'/>" class="img-circle">
									</c:when>
									<c:otherwise>
										<img src="<c:url value='/resources/images/homepage/싸이_가상화폐.png'/>" class="img-circle">
									</c:otherwise>
								</c:choose>
							</td>
							<td style="width: 94%;padding-left:10px;height: 30px;">
								댓글내용
							</td>
						</tr>
						<tr>
							<td>
								<ul>
									<li><a href="" style="margin: 0px;">좋아요</a></li>
									<li><a href="">답글달기</a></li>
								</ul>
							</td>
						</tr>
					</table>
					<a href="" class="com_a">댓글 더보기</a>
				</div>
			</div>
		</div>
	</c:forEach>
</div>
	
	
	
	