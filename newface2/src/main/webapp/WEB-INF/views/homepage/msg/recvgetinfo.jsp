<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<div style="margin-top:20px; width:442px; height:313px;">
	<div style="width:380px; height:310px; margin:auto; margin-top:30px; box-shadow: 0 2px 10px rgba(121, 118, 118, 0.25);">
		<table style="width:100%; height:100%;" class="table table-condensed">
			<tr class="info">
				<th colspan="2" >받은쪽지함</th>
			</tr>
			<tr>
				<th style="width:19%;" align="center">보낸사람:</th>
				<th >${msgrecv_getinfo.sender }&nbsp;(&nbsp;${msgrecv_getinfo.regdate }&nbsp;)</th>
				
			</tr>
			<tr>
				<td colspan="2" align="center" style="height:205px;">
					<textarea rows='8' cols='45' style="width:100%; height:100%; resize: none;">${msgrecv_getinfo.content }</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="200000" align="center">
					<button type="button" class="btn btn-info btn-sm" onclick="location.href='/newface/msg_reply?msg_num=${msgrecv_getinfo.msg_num}'">답장</button>&nbsp;&nbsp;
					<button type="button" class="btn btn-info btn-sm" onclick="location.href='/newface/msgrecv_delete?msg_num=${msgrecv_getinfo.msg_num }'">삭제</button>
				</td>
			</tr>
		</table>
	</div>
</div>