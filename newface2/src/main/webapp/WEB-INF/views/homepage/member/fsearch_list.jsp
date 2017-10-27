<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resources/css/paging_style_user.css?ver=4'/>">
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
		
		$(document).on("click",".link_name",function() {
			var id=$(this).parents("table").find(".id_val_search").text();
			
			var hompy_num=0;
			$.getJSON('main2/hompynum', {"id" : id}, function(data) {
				
				window.open("<c:url value='/minihome?hompy_num='/>"+data,"_minihome"," width=1024,height=592,left=100,top=100"); 
			});
		});
		$(document).on("click",".link_name_i",function() {
			var loginid=$("#loginid").val();
			window.open("<c:url value='/minihome'/>","_minihome"," width=1024,height=592,left=100,top=100"); 
		});
		
		
	});
</script>	

<div id="tab">
	<div style="margin-left: 30px;margin-top: 10px;">
		<label style="font-weight:bold;font-size:25px;">'${text }'&nbsp;검색결과</label>
	</div>
	
</div>
<div id="con" align="center">
	  		
	  			  		
	  		<%-- <div style="width:460px; height:150px; background-color: blue;">
	  			<div style="width:460px; height:70px; background-color: red; ">
		  			<div style="width:130px; height:60px; float:left;">
		  				<span style="font-weight: bold; font-size: 14px;">아이디</span><br> <span>${vo.id}</span>
		  			</div>
		  			
		  			<div style="width:130px; height:60px; float:left;">
		  				<span style="font-weight: bold; font-size: 14px;">이름</span><br><span>${vo.name}</span>
		  			</div>
		  			
		  			<div style="width:190px; height:60px; float:left;">
		  				<span style="font-weight: bold; font-size: 14px;">이메일</span><br> <span>${vo.email}</span>
		  			</div>
	  			</div>
	  			
	  			<div style="width:460px; height:70px">
		  			<div style="width:230px; height:60px; float:left;">
		  				<span style="font-weight: bold; font-size: 14px;">지역</span><br><span>${vo.addr}</span>
		  			</div>
		  			
		  			<div style="width:230px; height:60px; float:left;">
		  				<span style="font-weight: bold; font-size: 14px;">학교</span><br><span>${vo.school}</span>
		  			</div>
		  		</div>
	  		</div> --%>
	<c:choose>
		<c:when test="${fsearch_list.size()==0 }">
					<label style="font-weight:bold;font-size: 30px; position: absolute;top:150px;left: 135px;"> 
						검색 결과가 없습니다.
					</label>
		</c:when>
		<c:otherwise>
			<c:forEach var="vo" items="${fsearch_list}">
				<table style="width: 460px; margin-top: 30px; border: 2px solid black;">
					<tr>
						<td rowspan="6" style="width:153px; border:2px solid black; align-content: center;">
							<c:choose>
								<c:when test="${vo.save_name==null }">
									<img src="<c:url value='/resources/images/minihome/profile.PNG'/>">			
								</c:when>
								<c:otherwise>
									<img style="max-width: 153px; max-height: 153px; margin-left: auto; margin-right: auto; display: block;" src="<c:url value='/resources/upload/${vo.save_name }'/>">
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td style="text-align: center; border-top: 2px solid black; width:80px;">아이디</td>
						<td style="border-top: 2px solid black;" class="id_val_search">${vo.id }</td>
					</tr>
		
					<tr>
						<td style="text-align: center; width:80px;">이름</td>
						<c:choose>
							<c:when test="${loginid!=vo.id }">
								<td><a class="link_name">${vo.name }</a></td>
							</c:when>
							<c:otherwise>
								<td><a class="link_name_i">${vo.name }</a></td>
							</c:otherwise>
						</c:choose>
					</tr>
		
					<tr>
						<td style="text-align: center; width:80px;">학교</td>
						<td>${vo.school }</td>
					</tr>
					
					<tr>
						<td style="text-align: center; width:80px;">주소</td>
						<td>${vo.addr }</td>
					</tr>
					
					<tr>
						<td style="text-align: center; width:80px;">이메일</td>
						<td>${vo.email }</td>
					</tr>
					
				</table>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>

<div style="position:absolute;top:700px;width: 100%;"align="center">
	<c:choose>
		<c:when test="${pu.startPageNum>5 }">
			<a href="<c:url value='/fsearch_list?pageNum=${pu.startPageNum-1 }&text=${text }'/>">
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
				<a href="<c:url value='/fsearch_list?pageNum=${i }&text=${text }'/>">
					<span data-tooltip="${i }" class="pagination__dot pagination__dot--active"></span>
				</a>
			</c:when>
			<c:otherwise>
				<a href="<c:url value='/fsearch_list?pageNum=${i }&text=${text }'/>">
					<span data-tooltip="${i }" class="pagination__dot pagination__dot">
					</span>
				</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>	
	</div>
	<c:choose>
		<c:when test="${pu.endPageNum<pu.totalPageCount}">
			<a href="<c:url value='/fsearch_list?pageNum=${pu.endPageNum+1 }&text=${text }'/>">
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
