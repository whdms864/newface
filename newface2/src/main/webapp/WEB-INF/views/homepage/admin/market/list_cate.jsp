<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>

<script type="text/javascript">
	$(function(){	
		$("#insert_cate").submit(function(event){
			var name=$("#name").val();
			if(name==""){
				$("#name").focus();
				alert("카테고리명을 입력해주세요");
				event.preventDefault();
			}
		});
	});
</script>
	<div align="center">
		<table class="table table-hover" style="width: 90%;margin-top: 20px;">
			<thead>
		  		<tr class="success">
		  			<th>No.</th>
		  			<th>카테고리</th>
		  		</tr>
		  	</thead>
		  	<tbody>
		  		<c:forEach var="vo" items="${list}">
		  			<tr>
			  			<td>${vo.category_num}</td>
			  			<td>${vo.name}</td>
			  		</tr>
			  	</c:forEach>
			 </tbody>
		</table>
	</div>
	<div align="center" style="position:absolute;top:540px;width: 100%;">
		<!-- <div style="background-color: rgb(224, 224, 224);width:100%; height:1px;"></div>
		 -->
		 페이징
	</div>
	<div style="position:absolute;top:600px;width: 100%;"align="center">
		<div style="background-color: rgb(224, 224, 224);width:100%; height:1px;"></div>
		<form method="post" id="insert_cate" name="f" action="<c:url value='/market/admin/cate/insertok'/>">
			<div style="display: inline-block;margin-top: 20px;">
				<div class="form-group has-success" style="display: inline-block; ">
					<label class="control-label" for="inputWarning1" style="float:left;margin-top: 5px;">카테고리</label>
					<input type="text" name="name" id="name" class="form-control" style="width:520px;float:left;margin-left: 5px;">
					<input type="submit" value="등록" style=" color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
					border-radius: 4px; background-color: rgb(52, 152, 219);width:80px; height:35px;float:left;margin-left: 5px;" > 
				</div>
			</div>
		</form>
	</div>
