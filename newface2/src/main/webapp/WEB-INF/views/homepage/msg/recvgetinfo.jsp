<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="margin-top:50px;">
	<table>
		<tr>
			<td>보낸사람</td>
			<td>${msgrecv_getinfo.sender }</td>
		</tr>
		<tr>
			<td>보낸시간</td>
			<td>${msgrecv_getinfo.regdate }</td>
		</tr>
		
		
		<tr>
			<td colspan="2">
				<textarea>${msgrecv_getinfo.content }</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="button" value="답장" onclick="location.href='/newface/msg_reply?msg_num=${msgrecv_getinfo.msg_num}'">&nbsp;&nbsp;
			<input type="button" value="삭제" onclick="location.href='/newface/msgrecv_delete?msg_num=${msgrecv_getinfo.msg_num }'">
		</tr>
	</table>
</div>