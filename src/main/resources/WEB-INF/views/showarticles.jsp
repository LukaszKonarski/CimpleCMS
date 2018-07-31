
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>List books</h1>
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
				<c:set var="content" value="blabla"/>
				<td>fn:substring(content, 0, 4)</td>
	<%----%>
				<%--<td><a href="<c:url value="/book/edit/${b.id}"/>">Edytuj</a>--%>
					<%--<a href="<c:url value="/book/delete/${b.id}"/>">Usuń</a></td>--%>
			</tr>
		</c:forEach>
	</table>
</body>
</html>