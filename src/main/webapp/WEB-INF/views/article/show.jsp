<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Show Articles</title>
</head>
<body>
<h1>Show Articles</h1>
<a href="<c:url  value="/article/add"/>">Add an article</a>
<table>
    <tr>
        <th>Title</th>
        <th>Created</th>
        <th>Article</th>
        <th>Actions</th>
    </tr>
    <c:forEach items="${articles}" var="a">
        <tr>
            <td>${a.title}</td>
            <td>${a.created}</td>
            <td>${a.content}</td>
            <td><a href="<c:url value="/article/edit/${a.id}"/>">Edit</a>
                <a href="<c:url value="/article/delete/${a.id}"/>">Delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>