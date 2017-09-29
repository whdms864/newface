<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div align="center">
		<table class="table" style="width: 90%;margin-top: 20px;">
		  		<tr class="success">
		  			<td>No.${vo.noti_num}</td>
		  			<td>${vo.title}</td>
		  		</tr>
		  		<tr>
		  			<td>작성자 : ${vo.id }</td>
		  			<td>작성일 : ${vo.regdate }</td>
			  	</tr>
			  	<tr>
		  			<td colspan="2" style="height:350px">
				  		<textarea rows="17" cols="65" name="content" readonly="readonly" style="border-style:hidden; resize:none;">${vo.content }</textarea>
					</td>
			  	</tr>
		</table>
		<div style="position:absolute;top:450px; width:98%;"align="center">
			<div style="background-color: rgb(224, 224, 224);margin-left:8px;width: 99%; height:1px;"></div>
		</div>
		
		<div style="background-color: rgb(239, 238, 238);width: 95%;height:225px; position:absolute; bottom:5px; left:13px">
			<form method="post" action="<c:url value='/noti_com_insert'/>">
			
			<div style="display: inline-block;">
				<div class="form-group has-success" style="display: inline-block; height:35px ">
					<input type="text" name="content" id="content" class="form-control" style="width:400px;float:left; height:30px; position:absoulte; right:80px; top:5px;">
					<input type="submit" value="등록" style=" color: rgb(255, 255, 255); text-align: center; 
					border-radius: 4px; background-color: white;width:60px; height:27px;float:left;margin-left: 5px;">
					<div style="width:95%; height:160px; background-color: white; position:absolute; top:40px; right:12px;">
						<table border="1" style="width:100%; height:160px;">
							<c:forEach var="noti_com_list" items="${noti_com_list }">
							<tr>
								<td style="width:22%; height:20%" >${noti_com_list.id }</td><td style="width:60%; height:32px;">${noti_com_list.content }</td><td style="width:18%; height:20%">${noti_com_list.regdate }</td>
							</tr>
							</c:forEach>
						</table>
						<input type="hidden" name="id" value="${sessionScope.loginid }">
						<input type="hidden" name="noti_num" value="${vo.noti_num}">
					</div> 
				</div>
			</div>
			</form>
		</div>
		
	</div>
	
	
