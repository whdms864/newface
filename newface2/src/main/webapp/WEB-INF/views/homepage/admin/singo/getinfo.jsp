<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resources/css/paging_style.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#insert").submit(function(event){
			var content=$("#in_content").val();
			if(content==""){
				$("#in_content").focus();
				alert("관리자 확인란에 내용을 입력해주세요");
				event.preventDefault();
			}
		});
	});
</script>
<style>
p {
    max-height: 270px;
    overflow: auto;
}
</style>
<div id="sidebar">
	<ul>
		<li>
			<a href="<c:url value='/notiadmin_list'/>"style="margin-top: 0px;">공지사항</a>
		</li>
		<li>
			<a href="<c:url value='/ader_list'/>" >광고관리</a>
		</li>
		<li>
			<a href="<c:url value='/qna11/admin/list'/>">1:1문의</a>
		</li>
		<li>
			<a href="<c:url value='/market/admin/item/list'/>">마켓관리</a>
		</li>
		<li>
			<a href="<c:url value='/memadmin'/>" >회원관리</a>
		</li>
		<li>
			<a href="<c:url value='/singoadmin'/>"  class="now">신고관리</a>
		</li>
	</ul>
</div>
<div id="con_wrap">
	<div id="tab">
		<div style="margin-left: 30px;margin-top: 10px;">
			<label style="font-weight:bold;font-size:25px;">신고관리</label>
		</div>
		<ul>
		    <li><a href="<c:url value='/singoadmin'/>"style="margin-left:0px;" class="hover_a">목록</a></li>
		</ul>
	</div>
	<div id="con">	
		<div align="center">
			<table class="table" style="width: 90%;margin-top: 20px;border: 1px solid #ddd;">
			  		<tr class="danger">
			  			<td>No.${vo.num}</td>
			  			<td colspan="2">${vo.title}</td>
			  		</tr>
			  		<tr>
			  			<td>신고횟수 : ${vo.singo }</td>
			  			<td>작성일 : ${vo.regdate }</td>
			  			<td>작성자 : ${vo.id }</td>
				  	</tr>
				  	<tr>
			  			<td colspan="3" style="height:300px">
			  			${vo.content }
			  			</td>
				  	</tr>
			</table>
			<div style="background-color: rgb(224, 224, 224);margin-top:10px;margin-left:10px;width: 97%; height:1px;"></div>
			<form method="post" id="insert" action="<c:url value='/singo/admin/update'/>">
				<div style="width: 93%;height:33%;padding: 10px 10px 0px 10px;">
						<div class="form-group has-error" style="display: inline-block; ">
							<div style="display: inline-block;">
								<label class="control-label" for="inputWarning1">[ 관리자 확인 ]</label>
								<label class="control-label" for="inputWarning1" style="margin-left: 130px;color: black;">회원상태 : </label>
								<select name="type" class="control-label" style="font-weight: bold;height: 25px;">
										<option value="회원" ${type == '회원' ? 'selected="selected"' : '' }>회원</option>
										<option value="1회경고" ${type == '1회경고' ? 'selected="selected"' : '' }>1회경고</option>
										<option value="2회경고" ${type == '2회경고' ? 'selected="selected"' : '' }>2회경고</option>
										<option value="3회경고" ${type == '3회경고' ? 'selected="selected"' : '' }>3회경고</option>
										<option value="탈퇴" ${type == '탈퇴' ? 'selected="selected"' : '' }>탈퇴</option>
								</select>
								<label class="control-label" for="inputWarning1" style="margin-left: 130px;color: black;">  블라인드 : </label>
								<select name="blind" class="control-label" style="font-weight: bold;height: 25px;">
									<option value="0" ${vo.blind == 0 ? 'selected="selected"' : '' }>일반</option>
									<option value="1" ${vo.blind == 1 ? 'selected="selected"' : '' }>블라인드</option>
								</select>
							</div>
							<br>
							<input type="hidden" name="tb" value="${vo.tb }">
							<input type="hidden" name="num2" value="${vo.num }">
							<input type="hidden" name="writer" value="${vo.id }">
							<textarea rows="6" cols="91" name="content" id="in_content" class="form-control" style="resize: none;" placeholder="작성폼  = [게시글 제목 - 작성자] : 사유">${content }</textarea>
						</div>
				</div>
				<div style="position:absolute;top:600px;width: 98%;"align="center">
					<div style="background-color: rgb(224, 224, 224);margin-left:15px;width: 99%; height:1px;"></div>
						<input type="submit" value="등록 및 수정" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
							border-radius: 4px; background-color: rgb(52, 152, 219);width:120px; height:40px;margin-top:10px;"> 
				</div>
			</form>
		</div>
	</div>
</div>