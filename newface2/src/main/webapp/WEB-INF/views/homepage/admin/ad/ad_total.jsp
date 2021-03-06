<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link class="include" rel="stylesheet" type="text/css" href="<c:url value='/resources/js/jquery.jqplot.min.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/jqplot/jquery.jqplot.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/jqplot/plugins/jqplot.pieRenderer.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/plugins/jqplot.barRenderer.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
	    //1번째 입력값 (그려진 영역의 id값)
	    //2번째 입력값 (그래프내에 들어갈 데이터 값)
		$.jqplot ('graph1', [[1,2,200,4,100,350,30]]);
	    
		$.jqplot ('graph2', [[['DB컴퍼니', 70], ['조은컴퍼니', 90]]],
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
		
		$.jqplot('graph3', [[['첫번째', 70], ['두번째', 22], ['세번째', 38], ['네번째', 30]]], {
		      title: '막대형그래프',
		      series:[{renderer:$.jqplot.BarRenderer}],
		      axes: {
		        xaxis: {
		          renderer: $.jqplot.CategoryAxisRenderer,
		          label: "회사이름"
		        },
		        yaxis: {
		          label: ""
		        }
		      }
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
		    <li><a href="<c:url value='/ad_total'/>" class="hover_a">광고매출현황</a></li>
		</ul>
	</div>
	
	<div id="con">
		<div>
			<div id="graph1" style="width:250px; height:250px; float:left; margin-left:40px; margin-top:50px;"></div>
			<div id="graph2" style="width:350px; height:250px; float:left; margin-left:45px; margin-top:50px;"></div><br>
			<div id="graph3" style="width:240px; height:250px; margin-top:320px; margin-left:45px;"></div>
		</div>
	</div>
	
	<c:forEach items="${total_income }">
		<input type="hidden" id="total_income" value="">
	</c:forEach>

	
	
	
</div>

