<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div style="background-color: rgba(224, 224, 224, 0.78);margin-left:20px;width: 95%;height: 800px;">
	<div style="margin-left: 30px;">
		<label style="font-weight:bold;font-size:25px;">마켓</label>
		<select name="type" style="height:25px;margin-left: 392px;">
			<option value="스킨">스킨</option>
			<option value="미니미">미니미</option>
			<option value="bgm">bgm</option>
		</select>
	</div>
	<div style="border-radius: 2px; box-shadow: rgba(0, 0, 0, 0.227451) 3px 3px 8px 0px; background-color: rgb(250, 250, 250); 
		width:90%; height:90%;margin-left:30px;padding-top: 10px;" align="center">
		<div align="center" style="display: inline-block;margin-top:10px;">
			<div style="width:140px; height:140px; background-color: rgb(224, 224, 224);padding: 5px;margin-left:10px;float: left;"align="center">
				<div style="width:85%; height:80%; background-color:rgb(255, 255, 255);"></div>
				<div style="font-size:14px;margin-top: 5px;">가격 1000</div>
			</div>
			<div style="width:140px; height:140px; background-color: rgb(224, 224, 224);padding: 5px;margin-left:10px;float: left;"align="center">
				<div style="width:85%; height:80%; background-color:rgb(255, 255, 255);"></div>
				<div style="font-size:14px;margin-top: 5px;">가격 1000</div>
			</div>
			<div style="width:140px; height:140px; background-color: rgb(224, 224, 224);padding: 5px;margin-left:10px;float: left;"align="center">
				<div style="width:85%; height:80%; background-color:rgb(255, 255, 255);"></div>
				<div style="font-size:14px;margin-top: 5px;">가격 1000</div>
			</div>
		</div>

		<div style="position:absolute;top:700px;width: 85%;"align="center">
			<div style="background-color: rgba(224, 224, 224, 0.78);width: 490px; height:1px;"></div>
			페이징
		</div>
	</div>
</div>