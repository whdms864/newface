<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>   
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/minihome/setup/setup_miniroom.css?ver=34'/>"> 
<script type="text/javascript" src="/newface/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/newface/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/newface/resources/js/jquery.serializeObject.min.js"></script>
<script type="text/javascript" src="/newface/resources/js/jquery.serializeObject.js"></script>
<script>
	$(function(){	
		$("#wallpaper").change(function(){
			var item_num=$("#wallpaper").find(":selected").val();
			$.getJSON("<c:url value='/setup/item_img'/>",{"item_num":item_num},function(data){
				$("#miniroom").html("<span class='add1' style='position: relative;'>" + data.item_img + "</span>");
			});
		});
		$("#btn").click(function(){
			var item_num=$("#wallpaper").find(":selected").val();
			$.getJSON("<c:url value='/setup/room_posi'/>",{"item_num":item_num},function(data){
				if(data.n>0){
					alert("미니룸 변경이 완료되었습니다");
				}else{
					alert("오류로 인하여 미니룸 변경을 하지 못했습니다");
				}
			});
		});
	    $('.miniroom p img').dblclick(function(){
	    	var dbnum=$(this).parent().parent().attr('id');
	    	var css=$(this).css('top');
	    	var css1=css.split('-');
	    	$(this).css({'top':0, 'left':0});
	    	$('#x'+dbnum).val('');
	    	$('#y'+dbnum).val('');
	    });
		$("#mini").click(function(){
			console.log("dfsdf");
		});
		$('#item_select').click(function(){
			window.open("<c:url value='/setup/miniroom_decorate'/>",""," width=445,height=390,left=100,top=100")
		});
	});
</script>
<div id="setup_miniroom_back">
<h3 id="first">미니룸</h3>
	<hr>
	<div class="miniroom_back">
	<select id="wallpaper">
		<option>벽지를 선택하세요</option>
	<c:forEach var="vo" items="${requestScope.wallpaper }">
		<option class="choice" value="${vo.item_num }">${vo.name }</option>
	</c:forEach>
	</select>
	<input type="button" id="btn" value="적용">
		<div class="miniroom">
		
			<c:forEach var="miniVo" items="${requestScope.mini }" varStatus="status">
				${miniVo.item_img }
			</c:forEach>
		<form name="formname" id="formname">
			<c:forEach var="vo" items="${requestScope.list }" varStatus="status">
			<div id="${vo.item_num }">
				${vo.item_img }
			<input type="hidden" name="item_num" value="${vo.item_num }">
			x:<input type="text" id="x${vo.item_num }" name="x">
			y:<input type="text" id="y${vo.item_num }" name="y">
			</div>
			<input type="hidden" name="mine_num" value="${vo.mine_num }">
			</c:forEach>
			<input type="button" id="item_select" value="미니룸 가져오기">
			<input type="button" id="submit" value="미니룸 저장">
		</form>
		</div>
	</div>
</div>
	<script type="text/javascript">	
	    $(document).on("click",".miniroom p img",function(){
			$( '.miniroom p img' )
			  .draggable({
			      containment : '.miniroom' // 부모요소 안에 종속
			 });
			$(".miniroom p img").mouseup(function(){
				var x=$(this).offset().left;
				var y=$(this).offset().top;
				var num=$(this).parent().parent().attr('id');
				$('#x'+num).val(x);
				$('#y'+num).val(y);
				console.log(x);
				console.log(y);
			});
			$('.insert').remove();
	    })
		$(document).on("click","#submit",function(){
				var ex1 = JSON.stringify($("#formname").serializeObject());
				var ex2 = $("#formname").serializeObject();
				console.log(ex1);
				console.log(ex2);
				$.ajax({
			        url: "<c:url value='/setup/miniroom_insert'/>",
			        type: 'POST',
			        data:JSON.stringify(ex2),
			        dataType: 'json',
			        contentType : "application/json; charset=UTF-8",
			        success: function (result) {
			            if (result){
			            	var url="<c:url value='/minihome'/>"
			                $(location).attr("href",url);
			            }
			        }
			    });
			});
	</script>
