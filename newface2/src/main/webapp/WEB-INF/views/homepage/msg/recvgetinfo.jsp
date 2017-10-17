<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
	<table>
		<tr>
			<td>보낸사람</td>
			<td>${msgrecv_getinfo.sender }</td>
		</tr>
		<tr>
			<td colspan="2">
				<textarea>${msgrecv_getinfo.content }</textarea>
			</td>
		</tr>
	
	
	</table>
</div>