<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Add an article</title>
    <link href="<c:url value="/resources/main.css" />" rel="stylesheet">

</head>
<body>
<h1>Add an article</h1>

<table>
    <tr>
        <th><a href="<c:url  value="/index"/>">Homepage</a></th>
        <th><a href="<c:url  value="/article/show"/>">Show all articles</a></th>
        <th><a href="<c:url  value="/category/show"/>">Show all categories</a></th>
        <th><a href="<c:url  value="/author/show"/>">Show all authors</a></th>
    </tr>
</table>

<%--@elvariable id="article" type=""--%>
<form:form method="post" modelAttribute="article" action="/article/add">

    <p>Title:</p>
    <form:input path="title"/>

    <p>Author:</p>
    <form:radiobuttons itemLabel="lastName" itemValue="id" path="author.id" items="${authors}"/>

    <p>Category(press and hold shift to choose more than one):</p>
    <form:select itemLabel="name" itemValue="id" path="categories" items="${categoryList}" multiple="true"/>

    <p>Content:</p>
    <form:textarea path="content" cols="30" rows="20"/>

    <p>
        <input type="submit" value="Add">
    </p>

    <form:errors path="*" cssClass="error"></form:errors>

</form:form>
</body>
</html>
