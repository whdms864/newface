<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src='<c:url value="/resources/js/jquery-3.2.1.min.js" />'></script>
<c:forEach var="vo" items="${requestScope.list }" varStatus="status">
	<div id="${vo.item_num }">
		${vo.item_img } <input type="hidden" name="item_num"
			value="${vo.item_num }"> <input type="hidden"
			id="x${vo.item_num }" name="x"> <input type="hidden"
			id="y${vo.item_num }" name="y">
			<input type="button" class="insert" value="추가">
		<input type="hidden" name="mine_num" value="${vo.mine_num }">
	</div>
</c:forEach>
<script>
	$(function(){
		$(".insert").on("click",function(){
			var num=$(this).parent().attr('id');
			$("#"+num).css('position','absolute');
			$("#"+num).css('top','245px');
			$("#"+num).css('left','70px');
			console.log(num);
			$('#'+num).appendTo($(opener.document).find("#formname"));
		});
	});
</script>
