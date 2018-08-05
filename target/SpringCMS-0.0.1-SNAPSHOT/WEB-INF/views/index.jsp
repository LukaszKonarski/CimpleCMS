<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Homepage</title>
    <link href="<c:url value="/resources/main.css" />" rel="stylesheet">
</head>
<body>
<h1>Latest articles</h1>

<table>
    <tr>
        <th><a href="<c:url  value="/article/show"/>">Show all articles</a></th>
        <th><a href="<c:url  value="/category/show"/>">Show all categories</a></th>
        <th><a href="<c:url  value="/author/show"/>">Show all authors</a></th>
    </tr>
</table>

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

<h3>Show articles by category:</h3>
<ul>
    <c:forEach items="${categoryList}" var="c">
        <li><a href="<c:url value="/article/showByCategory/${c.id}"/>">${c.name}</a></li>
    </c:forEach>
</ul>

<h3><a href="<c:url  value="/article/add"/>">Add an article</a></h3>
<h3><a href="<c:url  value="/author/add"/>">Add an author</a></h3>
<h3><a href="<c:url  value="/category/add"/>">Add a category</a></h3>


</body>
</html>