
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Latest articles</title>
</head>
<body>
	<h1>Latest articles</h1>
	<%--<a href="<c:url   value="/book/add"/>">Dodaj książkę</a>--%>
	<table>
		<tr>
			<th>Title</th>
			<th>Created</th>
			<th>Article</th>
		</tr>
		<c:forEach items="${articles}" var="a">
			<tr>
				<td>${a.title}</td>
				<td>${a.created}</td>
                <c:set var="content" value="${a.content}"/>
                <c:set var="content200characters" value="${fn:substring(content, 1, 200)}"/>
                <td>${content200characters}</td>

			</tr>
		</c:forEach>
	</table>
</body>
</html>