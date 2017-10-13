<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resources/css/paging_style_user.css'/>">
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
		$("#select_cate").change(function(){
			var category_num=$(this).val();
			location.href='list?category_num='+category_num;
		});
		$(".item_getinfo").click(function(){
			var item_num=$(this).find(".item_num_val").val();
			window.open("<c:url value='/market/item/getinfo?item_num="+item_num+"'/>","_item_getinfo","width=500,height=500");
		});
		$("#search").click(function(event){
			var text=$("#text").val();
			var category_num=$("#select_cate").val();
			if(text==""){
				$("#text").focus();
				alert("검색할 내용을 입력해주세요");
				event.preventDefault();
			}else{
				location.href='list?category_num='+category_num+'&text='+text;
			}
		});
		$("#text").keypress(function(event){
			if(event.keyCode==13){
				var text=$("#text").val();
				var category_num=$("#select_cate").val();
				if(text==""){
					$("#text").focus();
					alert("검색할 내용을 입력해주세요");
				}else{
					location.href='list?category_num='+category_num+'&text='+text;
				}
			}
		});
	});
</script>
<style>
.item_list img{
	width: 100px;
	height: 100px;
}
</style>
<div style="background-color: rgba(224, 224, 224, 0.78);margin-left:20px;width: 95%;height: 800px;">
	<div style="margin-left: 30px;">
		<label style="font-weight:bold;font-size:25px;margin-top: 10px;">마켓</label>
		<select name="category_num" id="select_cate" style="height:25px;right:35px;top:15px;position:absolute;">
			<c:forEach var="vo" items="${list_cate }">
				<option value="${vo.category_num}" ${vo.category_num == category_num ? 'selected="selected"' : '' }>${vo.name}</option>
			</c:forEach>
		</select>
	</div>
	<div style="border-radius: 2px; box-shadow: rgba(0, 0, 0, 0.227451) 3px 3px 8px 0px; background-color: rgb(250, 250, 250); 
		width:90%; height:90%;margin-left:30px;padding-top: 10px;" align="center">
		<div align="center" style="display: inline-block;">
			<c:set var="i" value="0"/>
			<c:forEach var="vo" items="${list}">
				<c:set var="i" value="${i + 1}"/>
				<div style="width:140px; height:140px; background-color: rgb(224, 224, 224);padding: 5px;margin-left:10px;margin-top:10px;float: left;"align="center">
					<div  class="item_list" style="width:85%; height:80%; background-color:rgb(255, 255, 255);font-size: 10px;">
					${vo.item_img}
					</div>
					<div style="font-size:13px;margin-top: 5px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;max-width: 100px;">
						<a class="item_getinfo" style="cursor:pointer;">
						<input type="hidden" value="${vo.item_num }" class="item_num_val">
						${vo.name}
						</a>
					</div>
				</div>
				<c:if test="${i%3==0 }">
				<br>
				</c:if>
			</c:forEach>
		</div>
		<div style="position:absolute;top:665px;width: 85%;"align="center">
			<c:choose>
			<c:when test="${pu.startPageNum>5 }">
				<a href="<c:url value='/market/item/list?pageNum=${pu.startPageNum-1 }&text=${text}&category_num=${category_num }'/>">
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
					<a href="<c:url value='/market/item/list?pageNum=${i }&text=${text}&category_num=${category_num }'/>">
						<span data-tooltip="${i }" class="pagination__dot pagination__dot--active"></span>
					</a>
				</c:when>
				<c:otherwise>
					<a href="<c:url value='/market/item/list?pageNum=${i }&text=${text}&category_num=${category_num }'/>">
						<span data-tooltip="${i }" class="pagination__dot pagination__dot">
						</span>
					</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>	
		</div>
		<c:choose>
			<c:when test="${pu.endPageNum<pu.totalPageCount}">
				<a href="<c:url value='/market/item/list?pageNum=${pu.endPageNum+1 }&text=${text}&category_num=${category_num }'/>">
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
		<div style="position:absolute;top:710px;width: 85%;"align="center">
			<div style="display: inline-block;margin-top: 20px;">
				<div class="form-group has-success" style="display: inline-block; ">
					<input type="text" name="text" id="text" class="form-control" placeholder="검색할 상품명을 입력하세요" value="${text }" style="width:350px;float:left;margin-left: 5px;height: 25px;">
					<input type="button" id="search" value="검색" style=" color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
					border-radius: 4px; background-color: rgb(52, 152, 219);width:50px; height:25px;float:left;margin-left: 5px;font-size: 13px;" > 
				</div>
			</div>
		</div>
	</div>
</div>