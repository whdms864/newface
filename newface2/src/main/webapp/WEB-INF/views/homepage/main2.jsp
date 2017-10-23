<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/homepage/timeline.css?ver=80'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				var startrow = 0;
				var endrow = 10;
				$(window).scroll(function() { 
					if ($(window).scrollTop() == $(document).height() - $(window).height()) { 
						var text=$("#text_s").val();
						startrow +=10;
						$.getJSON('main2/list',{"startrow":startrow,"endrow":endrow,"text":text},function(data){
							var list=data.list;
							var cntlist=data.cntlist;
							var lovelist=data.lovelist;
							var singolist=data.singolist;
							var pro_img=data.pro_img;
							var text=data.text;
							var loginid=$("#loginid").val();
				 			var html="";
							for(var i=0;i<list.length;i++){
								html +=	"<div class='timeline'>"
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
									+							"<input type='hidden' value='"+list[i].id+"' class='vo_id'>";
								if(loginid!=list[i].id){	
									html +=							"<a class='link_name'>" +list[i].name+"</a>";
								}else{
									html +=							"<a class='link_name_i'>"+list[i].name+"</a>";
								}
								html +=						"</td>"
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
									+					"<li>댓글 ";
								
								if(cntlist.length>0){
									var code="0개";
									for(var j=0;j<cntlist.length;j++){
										if(cntlist[j].num==list[i].num && cntlist[j].tb==list[i].tb){
											code =	"<label class='cntval' style='font-weight:normal;'>"+cntlist[j].cnt+"</label>개";
											break;
										}
									}
									html +=code;
								}else{
									html +="0개";
								}	
								html +=	"</li>"
									+				"</ul>"
									+			"</div>"
									+			"<hr style='margin:0px;padding:0px;'>"
									+			"<div class='content2' align='left'>"
									+				"<ul>"
									+					"<li>"
									+					"<input type='hidden' value='"+list[i].tb+"' class='tb'>"
									+					"<input type='hidden' value='"+list[i].num+"' class='num'>";
								if(lovelist.length>0){
									var code="<a class='c_love'>좋아요</a>";
									for(var j=0;j<lovelist.length;j++){
										if(lovelist[j].num==list[i].num && lovelist[j].tb==list[i].tb){
											code =	"<a class='c_love' style='font-weight: bold; color: #337ab7'>좋아요</a>";
											break;
										}
									}
									html +=code;
								}else{
									html +="<a class='c_love'>좋아요</a>";
								}
								html +=					"</li>"
									+					"<li><a class='com_in'>댓글달기</a></li>"
									+					"<li><a class='gongU'>공유하기</a></li>";
								if(loginid!=list[i].id){
									html +=	"<li style='float:right;'>"
										+		"<input type='hidden' value="+list[i].singo+" class='singo_val'>";
									if(singolist.length>0){
										var code="<a class='singo'>신고</a>";
										for(var j=0;j<singolist.length;j++){
											if(singolist[j].num==list[i].num && singolist[j].tb==list[i].tb){
												code =	"<a class='singo' style='font-weight: bold; color: red'>신고</a>";
												break;
											}
										}
										html +=code;
									}else{
										html +="<a class='singo'>신고</a>";
									}
									html +="</li>";
								}
								html +=				"</ul>"
									+			"</div>"
									+		"</div>"
									+	"<div class='timecom' align='center'>"
									+		"<div>";
								if(pro_img!=null){
									html +="<img src='/newface/resources/upload/"+pro_img+"' class='img-circle'>";
								}else{
									html +=	"<img src='/newface/resources/images/homepage/싸이_가상화폐.png' class='img-circle'>";
								}
								html +=		"</div>"
									+		"<input type='text' class='form-control text' placeholder='댓글을 입력하세요'>"
									+			"<div class='com_main'>"
									+				"<table style='padding:0px; margin: 0px;'>"
									+					"<tbody class='com_main1'></tbody>"
									+				"</table>"
									+				"<div class='com_a_wrap'></div>"
									+			"</div>"
									+		"</div>"
									+	"<div class='gong_wrap'>"
									+		"<form method='post' action='main2/gongU'>"
									+			"<div class='gong_content'>"
									+				"<div class='gong_folder'>"
									+					"<div class='g_f_left' >"
									+						"폴더 : "
									+						"<select class='folder_sel' name='fnum'>"
									+						"</select>"
									+					"</div>"
									+					"<div class='g_f_right'>"
									+						"<img src='/newface/resources/images/homepage/icon/delete-button (2).png' alt='닫기' class='end_btn'>"
									+					"</div>"
									+				"</div>"
									+				"<div class='content_wrap'>";
									
								if(loginid!=list[i].id){
									html +=			"<div class='add_title' style='font-weight: bold;height: 20px;color:#e91e63;' >"
										+				"<input type='text' value='[ "+list[i].name+"님의 게시글 공유 ]' class='add_title_i' readonly='readonly' name='title1'>"
										+			"</div>";
								}
								html +=					"<div class='add_title'>"
									+						"<input type='text' placeholder='제목을 입력하세요' class='add_title_i' name='title2'>"
									+					"</div>"
									+					"<div class='add_con'>"
									+						"<textarea rows='5' cols='10'  placeholder='하고 싶은 말을 남겨주세요....' class='add_con_i' name='add_con'></textarea>"
									+					"</div>"
									+					"<div class='content1' align='left'>"+list[i].content+"</div>"
									+					"<input type='hidden' value='"+list[i].tb+"' name='tb'>"
									+					"<input type='hidden' value='"+list[i].num+"' name='num'>"
									+				"</div>"
									+				"<div class='gong_folder'>"
									+					"<div class='g_f_right'>"
									+						"<select class='secret_sel' name='secret'>"
									+							"<option value='전체공개'>전체공개</option>"
									+							"<option value='일촌공개'>일촌공개</option>"
									+							"<option value='나만보기'>나만보기</option>"
									+						"</select>"
									+						"<input type='button' class='btn btn-default' style='margin-bottom: 5px;' value='취소'>"
									+						"<input type='submit' class='btn btn-primary' style='margin-bottom: 5px;' value='게시'>"
									+					"</div>"
									+				"</div>"
									+			"</div>"
									+		"</form>"
									+	"</div>"
									+"</div>";
							}
							$(".list_time").append(html);
						});
					}
				});

				/*좋아요클릭*/
				$(document).on("click",".c_love",function() {
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
				
				/*신고클릭*/
				$(document).on("click",".singo",function() {
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
						singo += 1;
					} else {
						$(this).css({
							"font-weight" : "normal",
							"color" : "#616770"
						});
						singo -=1;
					}
					var singo =$(this).parents(".first").find(".singo_val").val(singo);
				});
				
				/*게시글 작성자 클릭시*/
				$(document).on("click",".link_name",function() {
					var id=$(this).parents(".timeline").find(".vo_id").val();
					var hompy_num=0;
					$.getJSON('main2/hompynum', {"id" : id}, function(data) {
						window.open("<c:url value='/minihome?hompy_num='/>"+data,"_minihome"," width=1024,height=594,left=100,top=100"); 
					});
				});
				$(document).on("click",".link_name_i",function() {
					var loginid=$("#loginid").val();
					window.open("<c:url value='/minihome'/>","_minihome"," width=1024,height=594,left=100,top=100"); 
				});
				
				/* 취소버튼클릭 */
				$(document).on("click",".btn-default",function() {
					$(".gong_wrap").css("display","none");
				});
				/* 닫기 클릭 */
				$(document).on("click",".end_btn",function() {
					$(".gong_wrap").css("display","none");
				});
				/*공유하기클릭*/
				$(document).on("click",".gongU",function() {
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
				var endrow_com = 5;
				
				/*댓글달기클릭*/
				$(document).on("click",".com_in",function() {
					var tb = $(this).parents(".timeline").find(".tb").val();
					var num = $(this).parents(".timeline").find(".num").val();
					var com =$(this).parents(".timeline").find(".com_main1");
					var com_a=$(this).parents(".timeline").find(".com_a_wrap");
					var loginid=$("#loginid").val();
					com.html("");
					$.getJSON('main2/com/list', {
						"tb" : tb,
						"num2" : num
					}, function(data) {
						var list=data.list;
						var add=data.add;
						for(var i=0;i<list.length;i++){
							var html="<tr>"
									+		"<td rowspan='2' style='padding-top: 5px;'>";
							if(list[i].save_name!=null){
								html +="<img src='/newface/resources/upload/"+list[i].save_name +"' class='img-circle'>";
							}else{
								html +=	"<img src='/newface/resources/images/homepage/싸이_가상화폐.png' class='img-circle'>";
							}
							html +="</td>"
								+		"<td style='width: 94%; padding-left: 10px; height: 30px;'>"
								+ 		"<input type='hidden' value='"+list[i].num+"' class='com_num'>"
								+ 		"<input type='hidden' value='"+list[i].id+"' class='com_id'>"
								+		"<a class='click_name' style='font-weight: bold;'>"+list[i].name+"</a>&nbsp;"
								+			list[i].content+" · "+list[i].regdate+" ";
							if(list[i].id==loginid){
								html += "<img src='/newface/resources/images/minihome/del.png' class='del'>"
							}	
							html +="<div class='name_box'>"
								+ 	"<ul>"
								+		"<li>"
								+			"<a class='hompy_open'>미니홈피가기</a>"
								+		"</li>"
								+		"<li>"
								+			"<a class='msg_open'>쪽지보내기</a>"
								+		"</li>"
								+ 	"</ul>"
								+	"</div>"
								+	"</td>"
								+	"</tr>"
								+	"<tr>"
								+		"<td>"
								+			"<ul>"
								+				"<li><a style='margin: 0px;'>좋아요</a></li>"
								+				"<li><a>답글달기</a></li>"
								+			"</ul>"
								+		"</td>"
								+	"</tr>";
							com.append(html);
						}
						if(add=='yes'){
							com_a.html("<a class='com_a'>댓글 더보기</a>");
						}else{
							com_a.html("");
						}
					});
					$(this).parents(".timeline").find(".timecom").css("display","block");
				});
				/*이름클릭시 이름옆에박스*/
				$(document).on("click",".click_name",function() {
					var com_id =$(this).parents("td").find(".com_id").val();
					var loginid=$("#loginid").val();
					if(com_id!=loginid){
						$except = $(this).parent().find(".name_box");
						$(".name_box").not($except).css("display","none");
						$except.toggle();
					}else{
						window.open("<c:url value='/minihome'/>","_minihome"," width=1024,height=594,left=100,top=100"); 
					}
				});
				
				$(document).on("click",".hompy_open",function() {
					var com_id =$(this).parents("td").find(".com_id").val();
					var hompy_num=0;
					$.getJSON('main2/hompynum', {"id" : com_id}, function(data) {
						$(".name_box").css("display","none");
						window.open("<c:url value='/minihome?hompy_num='/>"+data,"_minihome"," width=1024,height=594,left=100,top=100"); 
					});
				});
				
				$(document).on("click",".msg_open",function() {
					var com_id =$(this).parents("td").find(".com_id").val();
					window.open("<c:url value='/msg_reply?id='/>"+com_id,"_msg"," width=445,height=390,left=100,top=100");  
				});
				/*댓글쓰기*/
				$(document).on("keypress",".text",function(event) {
					if(event.keyCode==13){
						var text=$(this);
						var tb = $(this).parents(".timeline").find(".tb").val();
						var num2 = $(this).parents(".timeline").find(".num").val();
						var com =$(this).parents(".timeline").find(".com_main1");
						var com_a=$(this).parents(".timeline").find(".com_a_wrap");
						var cntval=$(this).parents(".timeline").find(".cntval");
						var cnt=parseInt(cntval.text());
						var loginid=$("#loginid").val();
						if(text.val()==""){
							text.focus();
							alert("댓글을 입력해주세요");
						}else{
							$.getJSON('main2/com/insert', {
								"tb" : tb,
								"num2" : num2,
								"content" : text.val(),
								"startrow_com" : startrow_com,
								"endrow_com" : endrow_com
							}, function(data) {
								com.html("");
								text.val("");
								cnt +=1;
								cntval.text(cnt);
								var list=data.list;
								var add=data.add;
								for(var i=0;i<list.length;i++){
									var html="<tr>"
											+		"<td rowspan='2' style='padding-top: 5px;'>";
									if(list[i].save_name!=null){
										html +="<img src='/newface/resources/upload/"+list[i].save_name +"' class='img-circle'>";
									}else{
										html +=	"<img src='/newface/resources/images/homepage/싸이_가상화폐.png' class='img-circle'>";
									}
										html +="</td>"
											+		"<td style='width: 94%; padding-left: 10px; height: 30px;'>"
											+ "<input type='hidden' value='"+list[i].num+"' class='com_num'>"
											+ 		"<input type='hidden' value='"+list[i].id+"' class='com_id'>"
											+		"<a class='click_name' style='font-weight: bold;'>"+list[i].name+"</a>&nbsp;"
											+			list[i].content+" · "+list[i].regdate+" ";
										if(list[i].id==loginid){
											html += "<img src='/newface/resources/images/minihome/del.png' class='del'>"
										}	
										
										html +="<div class='name_box'>"
											+ 	"<ul>"
											+		"<li>"
											+			"<a class='hompy_open'>미니홈피가기</a>"
											+		"</li>"
											+		"<li>"
											+			"<a class='msg_open'>쪽지보내기</a>"
											+		"</li>"
											+ 	"</ul>"
											+	"</div>"
											+	"</tr>"
											+	"<tr>"
											+		"<td>"
											+			"<ul>"
											+				"<li><a style='margin: 0px;'>좋아요</a></li>"
											+				"<li><a>답글달기</a></li>"
											+			"</ul>"
											+		"</td>"
											+	"</tr>";
										com.append(html);
								}
								if(add=='yes'){
									com_a.html("<a class='com_a'>댓글 더보기</a>");
								}else{
									com_a.html("");
								}
							});
						}
					}
				});
				/*댓글 삭제*/
				$(document).on("click",".del",function() {
					var tb = $(this).parents(".timeline").find(".tb").val();
					var num2 = $(this).parents(".timeline").find(".num").val();
					var com =$(this).parents(".timeline").find(".com_main1");
					var com_a=$(this).parents(".timeline").find(".com_a_wrap");
					var com_num=$(this).parent().find(".com_num").val();
					var cntval=$(this).parents(".timeline").find(".cntval");
					var cnt=parseInt(cntval.text());
					var loginid=$("#loginid").val();
					$.getJSON('main2/com/delete', {
						"tb" : tb,
						"num2" : num2,
						"num" : com_num,
						"startrow_com" : startrow_com,
						"endrow_com" : endrow_com
					}, function(data) {
						com.html("");
						cnt -=1;
						cntval.text(cnt);
						var list=data.list;
						var add=data.add;
						for(var i=0;i<list.length;i++){
							var html="<tr>"
									+		"<td rowspan='2' style='padding-top: 5px;'>";
							if(list[i].save_name!=null){
								html +="<img src='/newface/resources/upload/"+list[i].save_name +"' class='img-circle'>";
							}else{
								html +=	"<img src='/newface/resources/images/homepage/싸이_가상화폐.png' class='img-circle'>";
							}
								html +="</td>"
									+		"<td style='width: 94%; padding-left: 10px; height: 30px;'>"
									+ "<input type='hidden' value='"+list[i].num+"' class='com_num'>"
									+ 		"<input type='hidden' value='"+list[i].id+"' class='com_id'>"
									+		"<a class='click_name' style='font-weight: bold;'>"+list[i].name+"</a>&nbsp;"
									+			list[i].content+" · "+list[i].regdate+" ";
								if(list[i].id==loginid){
									html += "<img src='/newface/resources/images/minihome/del.png' class='del'>"
								}	
								
								html +="<div class='name_box'>"
									+ 	"<ul>"
									+		"<li>"
									+			"<a class='hompy_open'>미니홈피가기</a>"
									+		"</li>"
									+		"<li>"
									+			"<a class='msg_open'>쪽지보내기</a>"
									+		"</li>"
									+ 	"</ul>"
									+	"</div>"
									+	"</tr>"
									+	"<tr>"
									+		"<td>"
									+			"<ul>"
									+				"<li><a style='margin: 0px;'>좋아요</a></li>"
									+				"<li><a>답글달기</a></li>"
									+			"</ul>"
									+		"</td>"
									+	"</tr>";
								com.append(html);
						}
						if(add=='yes'){
							com_a.html("<a class='com_a'>댓글 더보기</a>");
						}else{
							com_a.html("");
						}
					});
				});
				/*댓글더보기클릭*/
				$(document).on("click",".com_a",function() {
					startrow_com +=5;
					var tb = $(this).parents(".timeline").find(".tb").val();
					var num = $(this).parents(".timeline").find(".num").val();
					var com =$(this).parents(".timeline").find(".com_main1");
					var com_a=$(this).parents(".timeline").find(".com_a_wrap");
					var loginid=$("#loginid").val();
					$.getJSON('main2/com/list', {
						"tb" : tb,
						"num2" : num,
						"startrow_com" : startrow_com,
						"endrow_com" : endrow_com
					}, function(data) {
						var list=data.list;
						var add=data.add;
						for(var i=0;i<list.length;i++){
							var html="<tr>"
									+		"<td rowspan='2' style='padding-top: 5px;'>";
							if(list[i].save_name!=null){
								html +="<img src='/newface/resources/upload/"+list[i].save_name +"' class='img-circle'>";
							}else{
								html +=	"<img src='/newface/resources/images/homepage/싸이_가상화폐.png' class='img-circle'>";
							}
							html +="</td>"
								+		"<td style='width: 94%; padding-left: 10px; height: 30px;'>"
								+ "<input type='hidden' value='"+list[i].num+"' class='com_num'>"
								+ 		"<input type='hidden' value='"+list[i].id+"' class='com_id'>"
								+		"<a class='click_name' style='font-weight: bold;'>"+list[i].name+"</a>&nbsp;"
								+			list[i].content+" · "+list[i].regdate;
							if(list[i].id==loginid){
								html += "<img src='/newface/resources/images/minihome/del.png' class='del'>"
							}	
							
							html +="<div class='name_box'>"
								+ 	"<ul>"
								+		"<li>"
								+			"<a class='hompy_open'>미니홈피가기</a>"
								+		"</li>"
								+		"<li>"
								+			"<a class='msg_open'>쪽지보내기</a>"
								+		"</li>"
								+ 	"</ul>"
								+	"</div>"
								+	"</tr>"
								+	"<tr>"
								+		"<td>"
								+			"<ul>"
								+				"<li><a style='margin: 0px;'>좋아요</a></li>"
								+				"<li><a>답글달기</a></li>"
								+			"</ul>"
								+		"</td>"
								+	"</tr>";
							com.append(html);
						}
						if(add=='yes'){
							com_a.html("<a class='com_a'>댓글 더보기</a>");
						}else{
							com_a.html("");
						} 
					});
				});
			});
</script>
<div class="loginafter" align="center">
	<input type="hidden" value="${loginid }" id="loginid">
	<input type="hidden" id="text_s" value="${text }">
	<div class="list_time">
		<c:forEach var="vo" items="${list }">
			<div class="timeline">
				<div class="first" align="center">
					<div align="left" style="margin-left: 5px;">
						<table style="padding: 0px; margin: 0px;">
							<tr>
								<td rowspan="2">
									<c:choose>
											<c:when test="${vo.save_name!=null }">
												<img src="<c:url value='/resources/upload/${vo.save_name }'/>" class="img-circle">
											</c:when>
											<c:otherwise>
												<img
													src="<c:url value='/resources/images/homepage/싸이_가상화폐.png'/>"
													class="img-circle">
											</c:otherwise>
										</c:choose>
								</td>
								<td style="width: 94%; padding-left: 10px; height: 20px; margin-top: 5px; font-weight: bold; color: #365899;">
									<input type="hidden" value="${vo.id }" class="vo_id">
									<c:choose>
										<c:when test="${loginid!=vo.id }">
											<a class="link_name">${vo.name }</a>
										</c:when>
										<c:otherwise>
											<a class="link_name_i">${vo.name }</a>
										</c:otherwise>
									</c:choose>
								</td>
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
							<li>댓글 
								<c:choose>
									<c:when test="${cntlist.size()>0 }">
										<c:set var="doneLoop" value="false" />
										<c:forEach var="map" items="${cntlist }">
											<c:if test="${not doneLoop}">
												<c:if test="${map.num==vo.num && map.tb==vo.tb}">
													<label class="cntval" style="font-weight: normal;">${map.cnt }</label>개
													<c:set var="doneLoop" value="true" />
												</c:if>
											</c:if>
										</c:forEach>
										<c:if test="${doneLoop==false}">0개</c:if>
									</c:when>
									<c:otherwise>0개</c:otherwise>
								</c:choose>
							</li>
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
						<table style="padding: 0px; margin: 0px;">
							<tbody class="com_main1"></tbody>
						</table>
						<div class="com_a_wrap">
						</div>
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



