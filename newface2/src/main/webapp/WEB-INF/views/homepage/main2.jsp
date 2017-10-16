<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/homepage/timeline.css?ver=28'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".c_love").click(function(){
			/* location.href="<c:url value='/memadmin/getinfo?id=${vo.id }&up=1'/>"; */
		});
		/* $("#c_love").click(function(){
			var m_type=$("#m_type").val();
			if(m_type==""){
				$("#m_type").focus();
				alert("회원 상태를 입력해주세요");
			}else{
				location.href="<c:url value='/memadmin/getinfo/update?id=${vo.id }'/>&type="+m_type;
			}
		}); */
	});
</script>
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
				<div class="content3" align="left">
					<ul>
						<li>좋아요 ${vo.love }명</li>
						<li>댓글수</li>
					</ul>
				</div>
				<hr style="margin:0px;padding:0px;">
				<div class="content2" align="left">
					<ul>
						<li>
						<c:choose>
							<c:when test="${love!=1 }">
								<a href="" class="c_love">좋아요</a>
							</c:when>
							<c:otherwise>
								<a href="" class="c_love" style="font-style: bold;color:#337ab7">좋아요</a>
							</c:otherwise>
						</c:choose>
						</li>
						<li><a href="">댓글달기</a></li>
						<li><a href="">공유하기</a></li>
						<li><a href="">신고하기</a></li>
					</ul>
				</div>
			</div>	
			<div class="timecom" align="center">
				<c:choose>
					<c:when test="${pro_img!=null }">
						<img src="<c:url value='/resources/upload/${pro_img}'/>" class="img-circle">
					</c:when>
					<c:otherwise>
						<img src="<c:url value='/resources/images/homepage/싸이_가상화폐.png'/>" class="img-circle">
					</c:otherwise>
				</c:choose>
				<input type="text" class="form-control" placeholder="댓글을 입력하세요">
				<%-- <img class="input-icon" src="<c:url value='/resources/images/homepage/icon/photo-camera.png'/>" > --%>
				<div class="com_main">
					<table style="padding:0px; margin: 0px;">
						<tr>
							<td rowspan="2">
								<img src="" class="img-circle">
								
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
	
	
	
	