<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Show Authors</title>
    <link href="<c:url value="/resources/main.css" />" rel="stylesheet">
</head>
<body>

<h1>Show Authors</h1>

<table>
    <tr>
        <th><a href="<c:url  value="/index"/>">Homepage</a></th>
        <th><a href="<c:url  value="/article/show"/>">Show all articles</a></th>
        <th><a href="<c:url  value="/category/show"/>">Show all categories</a></th>
        <th><a href="<c:url  value="/author/show"/>">Show all authors</a></th>
    </tr>
</table>

<table>
    <tr>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Action</th>
    </tr>
    <c:forEach items="${authors}" var="a">
        <tr>
            <td>${a.firstName}</td>
            <td>${a.lastName}</td>
            <td><a href="<c:url value="/author/edit/${a.id}"/>">Edit</a>
                <a href="<c:url value="/author/delete/${a.id}"/>">Delete</a></td>
        </tr>
    </c:forEach>
</table>

<h3><a href="<c:url  value="/author/add"/>">Add an author</a></h3>

</body>
</html>