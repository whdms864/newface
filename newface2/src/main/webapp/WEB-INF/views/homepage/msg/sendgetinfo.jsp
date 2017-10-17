<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="margin-top:50px;">
	<table>
		<tr>
			<td>받은사람</td>
			<td>${msgsend_getinfo.receiver }</td>
		</tr>
		
		<tr>
			<td>보낸시간</td>
			<td>${msgsend_getinfo.regdate }</td>
		</tr>
		<tr>
			<td colspan="2">
				<textarea>${msgsend_getinfo.content }</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="삭제" onclick="location.href='/newface/msgsend_delete?msg_num=${msgsend_getinfo.msg_num }'">
			</td>
		</tr>
		
		
	</table>
</div>