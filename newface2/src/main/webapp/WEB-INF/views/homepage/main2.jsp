<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/homepage/timeline.css?ver=75'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				var startrow = 0;
				var endrow = 20;
				/* $(window).scroll(function() { 
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
								+						"<td colspan='2'style='width: 100%;padding-top:10px;padding-left:5px;'>"
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
				}); */

				$(".c_love").click(function() {
					var tb = $(this).closest("li").find(".tb").val();
					var num = $(this).closest("li").find(".num").val();
					var love = parseInt($(this).parents(".first").find(".loveval").text());
					$.getJSON('main2/love', {
						"tb" : tb,
						"num" : num,
						"love" : love
					}, function(data) {
					});
					var color = $(this).css("color");
					if (color != "rgb(51, 122, 183)") {
						$(this).css({
							"font-weight" : "bold",
							"color" : "#337ab7"
						});
						love += 1;
					} else {
						$(this).css({
							"font-weight" : "normal",
							"color" : "#616770"
						});
						love -= 1;
					}
					$(this).parents(".first").find(".loveval").text(love);
				});
				$(".singo").click(function() {
					var tb = $(this).parents(".first").find(".tb").val();
					var num =$(this).parents(".first").find(".num").val();
					var singo =$(this).parents(".first").find(".singo_val").val();
					$.getJSON('main2/singo', {
						"tb" : tb,
						"num" : num,
						"singo" : singo
					}, function(data) {
					});
					var color = $(this).css("color");
					if (color != "rgb(255, 0, 0)") {
						$(this).css({
							"font-weight" : "bold",
							"color" : "red"
						});
					} else {
						$(this).css({
							"font-weight" : "normal",
							"color" : "#616770"
						});
					}
				});
				
				/* 취소버튼클릭 */
				$(".btn-default").click(function() {
					$(".gong_wrap").css("display","none");
				});
				/* 닫기 클릭 */
				$(".end_btn").click(function() {
					$(".gong_wrap").css("display","none");
				});
				/*공유하기클릭*/
				$(".gongU").click(function() {
					var tb = $(this).parents(".timeline").find(".tb").val();
					var num = $(this).parents(".timeline").find(".num").val();
					/*폴더가져오기*/
					$(".folder_sel").html("");//옵션 삭제
					if(tb=='photo'){
						$.getJSON('main2/folder/plist', {"tb" : tb}, function(data) {
							for(var i=0;i<data.length;i++){
								$(".folder_sel").append("<option value="+data[i].photo_folder_num+">"+data[i].photo_folder_num+"</option>");
							}
						});
					}else if(tb=='diary'){
						$.getJSON('main2/folder/dlist', {"tb" : tb}, function(data) {
							for(var i=0;i<data.length;i++){
								$(".folder_sel").append("<option value="+data[i].diary_folder_num+">"+data[i].fname+"</option>");
							}
						});
					}
					$(this).parents(".timeline").find(".gong_wrap").css("display","block");
				});
				var startrow_com = 0;
				var endrow_com = 20;
				/*댓글달기클릭*/
				$(".com_in").click(function() {
					var tb = $(this).parents(".timeline").find(".tb").val();
					var num = $(this).parents(".timeline").find(".num").val();
					$.getJSON('main2/com/list', {
						"tb" : tb,
						"num2" : num
					}, function(data) {
						for(var i=0;i<data.length;i++){
							var html="<tbody>"
									+	"<tr>"
									+		"<td rowspan='2' style='padding-top: 5px;'>";
							if(data[i].save_name!=null){
								html +="<img src='/newface/resources/upload/"+data[i].save_name +"' class='img-circle'>";
							}else{
								html +=	"<img src='/newface/resources/images/homepage/싸이_가상화폐.png' class='img-circle'>";
							}
								html +="</td>"
									+		"<td style='width: 94%; padding-left: 10px; height: 30px;'>"
									+			data[i].content+" · "+data[i].regdate+"</td>";
									+	"</tr>"
									+	"<tr>"
									+		"<td>"
									+			"<ul>"
									+				"<li><a style='margin: 0px;'>좋아요</a></li>"
									+				"<li><a>답글달기</a></li>"
									+			"</ul>"
									+		"</td>"
									+	"</tr>"
									+"</tbody>";
							$(".com_main1").append(html);
						}
					});
					$(this).parents(".timeline").find(".timecom").css("display","block");
				});
				/*댓글더보기클릭*/
				$(".com_a").click(function() {
					startrow_com +=20;
					endrow_com +=20;
					var tb = $(this).parents(".timeline").find(".tb").val();
					var num = $(this).parents(".timeline").find(".num").val();
					$.getJSON('main2/com/list', {
						"tb" : tb,
						"num2" : num,
						"startrow_com" : startrow_com,
						"endrow_com" : endrow_com
					}, function(data) {
						for(var i=0;i<data.length;i++){
							alert(data.length);
							var html="<tbody>"
									+	"<tr>"
									+		"<td rowspan='2' style='padding-top: 5px;'>";
							if(data[i].save_name!=null){
								html +="<img src='/newface/resources/upload/"+data[i].save_name +"' class='img-circle'>";
							}else{
								html +=	"<img src='/newface/resources/images/homepage/싸이_가상화폐.png' class='img-circle'>";
							}
								html +="</td>"
									+		"<td style='width: 94%; padding-left: 10px; height: 30px;'>"
									+			data[i].content+" · "+data[i].regdate+"</td>";
									+	"</tr>"
									+	"<tr>"
									+		"<td>"
									+			"<ul>"
									+				"<li><a style='margin: 0px;'>좋아요</a></li>"
									+				"<li><a>답글달기</a></li>"
									+			"</ul>"
									+		"</td>"
									+	"</tr>"
									+"</tbody>";
							$(".com_main1").append(html);
						}
					});
				});
				/*댓글쓰기*/
				$(".text").keypress(function(event){
					if(event.keyCode==13){
						var text=$(".text").val();
						var tb = $(this).parents(".timeline").find(".tb").val();
						var num2 = $(this).parents(".timeline").find(".num").val();
						if(text==""){
							$("#text").focus();
							alert("검색할 내용을 입력해주세요");
						}else{
							$.getJSON('main2/com/insert', {
								"tb" : tb,
								"num2" : num2,
								"content" : text,
								"startrow_com" : startrow_com,
								"endrow_com" : endrow_com
							}, function(data) {
								$(".com_main1").html("");
								var text=$(".text").val("");
								for(var i=0;i<data.length;i++){
									var html="<tbody>"
											+	"<tr>"
											+		"<td rowspan='2' style='padding-top: 5px;'>";
									if(data[i].save_name!=null){
										html +="<img src='/newface/resources/upload/"+data[i].save_name +"' class='img-circle'>";
									}else{
										html +=	"<img src='/newface/resources/images/homepage/싸이_가상화폐.png' class='img-circle'>";
									}
										html +="</td>"
											+		"<td style='width: 94%; padding-left: 10px; height: 30px;'>"
											+			data[i].content+" · "+data[i].regdate+"</td>";
											+	"</tr>"
											+	"<tr>"
											+		"<td>"
											+			"<ul>"
											+				"<li><a style='margin: 0px;'>좋아요</a></li>"
											+				"<li><a>답글달기</a></li>"
											+			"</ul>"
											+		"</td>"
											+	"</tr>"
											+"</tbody>";
									$(".com_main1").append(html);
								}
							});
						}
					}
				});
			});
</script>
<div class="loginafter" align="center">
	<div class="list_time">
		<c:forEach var="vo" items="${list }">
			<div class="timeline">
				<div class="first" align="center">
					<div align="left" style="margin-left: 5px;">
						<table style="padding: 0px; margin: 0px;">
							<tr>
								<td rowspan="2"><c:choose>
										<c:when test="${vo.save_name!=null }">
											<img
												src="<c:url value='/resources/upload/${vo.save_name }'/>"
												class="img-circle">
										</c:when>
										<c:otherwise>
											<img
												src="<c:url value='/resources/images/homepage/싸이_가상화폐.png'/>"
												class="img-circle">
										</c:otherwise>
									</c:choose></td>
								<td
									style="width: 94%; padding-left: 10px; height: 20px; margin-top: 5px; font-weight: bold; color: #365899;">
									${vo.name }</td>
							</tr>
							<tr>
								<td
									style="width: 94%; padding-left: 10px; height: 20px; color: #90949c;">
									${vo.regdate }</td>
							</tr>
							<tr>
								<td colspan="2" style="width: 100%;padding-top:10px;padding-left:5px;">
									<p style="margin-left: 5px;">${vo.title }</p>
								</td>
							</tr>
						</table>
					</div>
					<div class="content1" align="left">${vo.content }</div>
					<div class="content3" align="left">
						<ul>
							<li>좋아요 <label class="loveval" style="font-weight: normal;">${vo.love }</label>명
							</li>
							<li>댓글수</li>
						</ul>
					</div>
					<hr style="margin: 0px; padding: 0px;">
					<div class="content2" align="left">
						<ul>
							<li>
								<input type="hidden" value="${vo.tb }" class="tb">
								<input type="hidden" value="${vo.num }" class="num"> 
								<c:choose>
									<c:when test="${lovelist.size()>0 }">
										<c:set var="doneLoop" value="false" />
										<c:forEach var="map" items="${lovelist }">
											<c:if test="${not doneLoop}">
												<c:if test="${map.num==vo.num && map.tb==vo.tb}">
													<a class="c_love" style="font-weight: bold; color: #337ab7">좋아요</a>
													<c:set var="doneLoop" value="true" />
												</c:if>
											</c:if>
										</c:forEach>
										<c:if test="${doneLoop==false}">
											<a class="c_love">좋아요</a>
										</c:if>
									</c:when>
									<c:otherwise>
										<a class="c_love">좋아요</a>
									</c:otherwise>
								</c:choose>
							</li>
							<li><a class="com_in">댓글달기</a></li>
							<li><a class="gongU">공유하기</a></li>
							<c:if test="${loginid!=vo.id }">
								<li style="float:right;">
									<input type="hidden" value="${vo.singo }" class="singo_val"> 
									<c:choose>
										<c:when test="${singolist.size()>0 }">
											<c:set var="doneLoop" value="false" />
											<c:forEach var="map" items="${singolist }">
												<c:if test="${not doneLoop}">
													<c:if test="${map.num==vo.num && map.tb==vo.tb}">
														<a class="singo" style="font-weight: bold; color: red">신고</a>
														<c:set var="doneLoop" value="true" />
													</c:if>
												</c:if>
											</c:forEach>
											<c:if test="${doneLoop==false}">
												<a class="singo">신고</a>
											</c:if>
										</c:when>
										<c:otherwise>
											<a class="singo">신고</a>
										</c:otherwise>
									</c:choose>
								</li>
							</c:if>
						</ul>
					</div>
				</div>
				<div class="timecom" align="center">
					<div>
						<c:choose>
							<c:when test="${pro_img!=null }">
								<img src="<c:url value='/resources/upload/${pro_img}'/>"
									class="img-circle">
							</c:when>
							<c:otherwise>
								<img
									src="<c:url value='/resources/images/homepage/싸이_가상화폐.png'/>"
									class="img-circle">
							</c:otherwise>
						</c:choose>
					</div>
					<input type="text" class="form-control text" placeholder="댓글을 입력하세요">
					<%-- <img class="input-icon" src="<c:url value='/resources/images/homepage/icon/photo-camera.png'/>" > --%>
					<div class="com_main">
						<table style="padding: 0px; margin: 0px;" class="com_main1">
						</table>
						<a class="com_a">댓글 더보기</a>
					</div>
				</div>
				<div class="gong_wrap">
					<form method="post" action="main2/gongU">
						<div class="gong_content">
							<div class="gong_folder">
								<div class="g_f_left" >
									폴더 :
									<select class="folder_sel" name="fnum">
									</select>
								</div>
								<div class="g_f_right">
									<img src="<c:url value='/resources/images/homepage/icon/delete-button (2).png'/>" alt="닫기" class="end_btn">
								</div>
							</div>
							<div class="content_wrap">
								<c:if test="${loginid!=vo.id }">
									<div class="add_title" style="font-weight: bold;height: 20px;color:#e91e63;" >
										<input type="text" value="[ ${vo.name }님의 게시글 공유 ]" class="add_title_i" readonly="readonly" name="title1">
									</div>
								</c:if>
								<div class="add_title">
									<input type="text" placeholder="제목을 입력하세요" class="add_title_i" name="title2">
								</div>
								<div class="add_con">
									<textarea rows="5" cols="10"  placeholder="하고 싶은 말을 남겨주세요...." class="add_con_i" name="add_con"></textarea>
									
								</div>
								<div class="content1" align="left">${vo.content }</div>
								<input type="hidden" value="${vo.tb }" name="tb">
								<input type="hidden" value="${vo.num }" name="num">
							</div>
							<div class="gong_folder">
								<div class="g_f_right">
									<select class="secret_sel" name="secret">
										<option value="전체공개">전체공개</option>
										<option value="일촌공개">일촌공개</option>
										<option value="나만보기">나만보기</option>
									</select>
									<input type="button" class="btn btn-default" style="margin-bottom: 5px;" value="취소">
									<input type="submit" class="btn btn-primary" style="margin-bottom: 5px;" value="게시">
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</c:forEach>
	</div>
</div>



