<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Edit the author</title>
    <link href="<c:url value="/resources/main.css" />" rel="stylesheet">
</head>
<body>

<h1>Edit the author</h1>

<table>
    <tr>
        <th><a href="<c:url  value="/index"/>">Homepage</a></th>
        <th><a href="<c:url  value="/article/show"/>">Show all articles</a></th>
        <th><a href="<c:url  value="/category/show"/>">Show all categories</a></th>
        <th><a href="<c:url  value="/author/show"/>">Show all authors</a></th>
    </tr>
</table>

<%--@elvariable id="author" type=""--%>
<form:form method="post" modelAttribute="author">

    <p>
        Edit First Name:
    </p>
    <form:input path="firstName"/>

    <p>
        Edit Last Name:
    </p>
    <form:input path="lastName"/>

    <p>
        <input type="submit" value="Edit">
    </p>

    <form:errors path="*" cssClass="error"></form:errors>


</form:form>
</body>
</html>
