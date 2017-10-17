<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/homepage/timeline.css?ver=58'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var startrow=0;
		var endrow=20;
		$(window).scroll(function() { 
			if ($(window).scrollTop() == $(document).height() - $(window).height()) { 
				startrow +=20;
				endrow +=20;
				$.getJSON('main2/list',{"startrow":startrow,"endrow":endrow},function(data){
					var list=data.list;
					var pro_img=data.pro_img;
					var html="";
					for(var i=0;i<list.length;i++){
						html +="<div class='timeline'>"
							+	"<div class='first' align='center'>"
							+		"<div align='left' style='margin-left: 5px;'>"
							+			"<table style='padding:0px; margin: 0px;'>"
							+				"<tr>"
							+					"<td rowspan='2'>";
					if(list[i].save_name!=null){
						html +="<img src='/newface/resources/upload/"+list[i].save_name +"' class='img-circle'>";
					}else{
						html +=	"<img src='/newface/resources/images/homepage/싸이_가상화폐.png' class='img-circle'>";
					}
					
					html +=						"</td>"
						+						"<td style='width: 94%;padding-left:10px;height: 20px;margin-top: 5px;font-weight: bold;color:#365899;'>"
						+							list[i].name
						+						"</td>"
						+					"</tr>"
						+					"<tr>"
						+						"<td style='width: 94%;padding-left:10px;height: 20px;color:#90949c;'>"
						+							list[i].regdate
						+						"</td>"
						+					"</tr>"
						+					"<tr>"
						+						"<td colspan='2'style='width: 100%;'>"
						+						"<p style='margin-left:5px;'>"+list[i].title+"</p>"
						+						"</td>"
						+					"</tr>"
						+				"</table>"
						+			"</div>"
						+			"<div class='content1' align='left'>"
						+				list[i].content
						+			"</div>"
						+			"<div class='content3' align='left'>"
						+				"<ul>"
						+					"<li>좋아요 <label class='loveval' style='font-weight: normal;'>"+list[i].love+"</label>명</li>"
						+					"<li>댓글수</li>"
						+				"</ul>"
						+			"</div>"
						+			"<hr style='margin:0px;padding:0px;'>"
						+			"<div class='content2' align='left'>"
						+				"<ul>"
						+					"<li>"
						+					"<input type='hidden'  value='"+list[i].tb+"' class='tb'>"
						+					"<input type='hidden'  value='"+list[i].num+"' class='num'>"
						+					"<a class='c_love'>좋아요</a>";
						+					"</li>"
						+					"<li><a href=''>댓글달기</a></li>"
						+					"<li><a href=''>공유하기</a></li>"
						+					"<li><a href=''>신고하기</a></li>"
						+				"</ul>"
						+			"</div>"
						+		"</div>"
						+	"<div class='timecom' align='center'>";
						
					if(pro_img!=null){
						html +="<img src='/newface/resources/upload/"+pro_img+"' class='img-circle'>";
					}else{
						html +=	"<img src='/newface/resources/images/homepage/싸이_가상화폐.png' class='img-circle'>";
					}
					html +=	"<input type='text' class='form-control' placeholder='댓글을 입력하세요'>"
						+			"<div class='com_main'>"
						+				"<table style='padding:0px; margin: 0px;'>"
						+					"<tr>"
						+						"<td rowspan='2'>"
						+							"<img src='' class='img-circle'>"
						+						"</td>"
						+						"<td style='width: 94%;padding-left:10px;height: 30px;'>"
						+						"	댓글내용"
						+						"</td>"
						+					"</tr>"
						+					"<tr>"
						+						"<td>"
						+							"<ul>"
						+								"<li><a href='' style='margin: 0px;'>좋아요</a></li>"
						+								"<li><a href=''>답글달기</a></li>"
						+							"</ul>"
						+						"</td>"
						+					"</tr>"
						+				"</table>"
						+				"<a href='' class='com_a'>댓글 더보기</a>"
						+			"</div>"
						+		"</div>"
						+	"</div>";
					}
					$(".list_time").append(html);
				});
			}
		});
		
		$(".c_love").click(function(){
			var tb=$(this).closest("li").find(".tb").val();
			var num=$(this).closest("li").find(".num").val();
			var love=parseInt($(this).parents(".first").find(".loveval").text());
			$.getJSON('main2/love',{"tb":tb,"num":num,"love":love},function(data){
			});
			var color=$(this).css("color");
			if(color!="rgb(51, 122, 183)"){
				$(this).css({
					"font-weight":"bold",
					"color" : "#337ab7"
				});
				love +=1;
			}else{
				$(this).css({
					"font-weight":"normal",
					"color" : "#616770"
				});
				love -=1;
			}
			$(this).parents(".first").find(".loveval").text(love);
		});
	});
</script>
	<div class="loginafter" align="center">
	<div class="list_time">
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
						<li>좋아요 <label class="loveval" style="font-weight: normal;">${vo.love }</label>명</li>
						<li>댓글수</li>
					</ul>
				</div>
				<hr style="margin:0px;padding:0px;">
				<div class="content2" align="left">
					<ul>
						<li>
						<input type="hidden"  value="${vo.tb }" class="tb">
						<input type="hidden"  value="${vo.num }" class="num">
						<c:choose>
							<c:when test="${lovelist.size()>0 }">
								<c:set var="doneLoop" value="false"/>
								<c:forEach var="map" items="${lovelist }">
									<c:if test="${not doneLoop}">
										<c:if test="${map.num==vo.num && map.tb==vo.tb}">
											<a class="c_love" style="font-weight:bold;color:#337ab7">좋아요</a>
											<c:set var="doneLoop" value="true"/>
										</c:if>
									</c:if>
								</c:forEach>
								<a class="c_love">좋아요</a>
							</c:when>
							<c:otherwise>
								<a class="c_love">좋아요</a>
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
</div>
	
	
	
