<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Show Articles</title>
    <style>
        body {
            font-family: "Helvetica Neue";
        }
    </style>
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
            <c:set var="content" value="${a.content}"/>
            <c:set var="content100characters" value="${fn:substring(content, 1, 100)}"/>
            <td>${content100characters}</td>
            <td><a href="<c:url value="/article/edit/${a.id}"/>">Edit</a>
                <a href="<c:url value="/article/delete/${a.id}"/>">Delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>