
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>--%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Show Categories</title>
</head>
<body>
	<h1>Show Categories</h1>
	<a href="<c:url  value="/category/add"/>">Add a category</a>
	<table>
		<tr>
			<th>Name</th>
			<th>Description</th>
			<th>Actions</th>
		</tr>
		<c:forEach items="${categories}" var="c">
			<tr>
				<td>${c.name}</td>
				<td>${c.description}</td>

				<td><a href="<c:url value="/category/edit/${c.id}"/>">Edit</a>
					<a href="<c:url value="/category/delete/${c.id}"/>">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>