<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link class="include" rel="stylesheet" type="text/css" href="<c:url value='/resources/js/jquery.jqplot.min.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/jqplot/jquery.jqplot.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/jqplot/plugins/jqplot.pieRenderer.min.js'/>"></script>
<script type="text/javascript">
$(function(){
    //1번째 입력값 (그려진 영역의 id값)
    //2번째 입력값 (그래프내에 들어갈 데이터 값)
     $.jqplot ('graph1', [[1,2,3,4,5,300,30]]);
    
     $.jqplot ('graph2', [[['첫번째', 50], ['두번째', 22], ['세번째', 38], ['네번째', 30]]],
    	        {
    	          seriesDefaults: {
    	            //원형으로 렌더링
    	            renderer: $.jqplot.PieRenderer,
    	            //원형상단에 값보여주기(알아서 %형으로 변환)
    	            rendererOptions: {
    	              showDataLabels: true
    	            }
    	          },
    	          //우측 색상별 타이틀 출력
    	          legend: { show:true, location: 'e' }
    	        });
});

	






</script>
<div id="sidebar">
	<ul>
		<li>
			<a href="<c:url value='/notiadmin_list'/>"style="margin-top: 0px;">공지사항</a>
		</li>
		<li>
			<a href="<c:url value='/ader_list'/>"  class="now" >광고관리</a>
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
			<a href="<c:url value='/singoadmin'/>">신고관리</a>
		</li>
	</ul>
</div>
<div id="con_wrap">
	<div id="tab">
		<div style="margin-left: 30px;margin-top: 10px;">
			<label style="font-weight:bold;font-size:25px;">광고관리</label>
		</div>
		<ul>
		    <li><a href="<c:url value='/ader_list'/>" style="margin-left:0px;">광고주목록</a></li>
		    <li><a href="<c:url value='/ader_insert'/>">광고주등록</a></li>
		    <li><a href="<c:url value='/ad_total'/>">광고매출현황</a></li>
		</ul>
	</div>
	
	<div id="con">
		<div align="center">
			
			<div id="graph1" style="width:300px; height:300px; margin-bottom:10px;" ></div>
			<div id="graph2" style="width:400px; height:300px;"></div>
		
		</div>
	</div>
	


	
	
	
</div>

