<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div align="center">
		<table class="table" style="width: 70%;margin-top: 20px;">
		  		<tr class="success">
		  			<td>No.${vo.noti_num}</td>
		  			<td>${vo.title}</td>
		  		</tr>
		  		<tr>
		  			<td>작성자 : ${vo.id }</td>
		  			<td>작성일 : ${vo.regdate }</td>
			  	</tr>
			  	<tr>
		  			<td colspan="2" style="height:100px"><textarea rows="25" cols="91" name="content" readonly="readonly" style="border-style:hidden;">${vo.content }</textarea></td>
			  	</tr>
		</table>
	</div>
	
	<div style="position:absolute;top:610px;width: 98%;"align="center">
			<div style="background-color: rgb(224, 224, 224);margin-left:10px;width: 99%; height:1px;"></div>
			<input type="button" value="수정" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
			border-radius: 4px; background-color: rgb(52, 152, 219);width:120px; height:40px;margin-top:10px;" onclick="location.href='/newface/notiadmin_update?noti_num=${vo.noti_num}'">
			<input type="button" value="삭제" style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.4em; 
			border-radius: 4px; background-color: rgb(52, 152, 219);width:120px; height:40px;margin-top:10px;" onclick="location.href='/newface/notiadmin_delete?noti_num=${vo.noti_num}'">
	</div>
	
	<div style="position:absolute;top:210px;width: 100%;"align="center">
		<c:choose>
			<c:when test="${pu.startPageNum>5 }">
				<a href="<c:url value='/noti_getinfo?pageNum=${pu.startPageNum-1 }&noti_num=${vo.noti_num }'/>">
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
					<a href="<c:url value='/noti_getinfo?pageNum=${i }&noti_num=${vo.noti_num }'/>">
						<span data-tooltip="${i }" class="pagination__dot pagination__dot--active"></span>
					</a>
				</c:when>
				<c:otherwise>
					<a href="<c:url value='/noti_getinfo?pageNum=${i }&noti_num=${vo.noti_num }'/>">
						<span data-tooltip="${i }" class="pagination__dot pagination__dot">
						</span>
					</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>	
		</div>
		<c:choose>
			<c:when test="${pu.endPageNum<pu.totalPageCount}">
				<a href="<c:url value='/noti_getinfo?pageNum=${pu.endPageNum+1 }&noti_num=${vo.noti_num }'/>">
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
	