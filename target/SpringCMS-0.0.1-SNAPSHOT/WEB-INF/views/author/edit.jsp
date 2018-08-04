<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Edit the article</title>
    <link href="<c:url value="/resources/main.css" />" rel="stylesheet">
</head>
<body>

<h1>Edit the article</h1>

<table>
    <tr>
        <th><a href="<c:url  value="/index"/>">Homepage</a></th>
        <th><a href="<c:url  value="/article/show"/>">Show all articles</a></th>
        <th><a href="<c:url  value="/category/show"/>">Show all categories</a></th>
        <th><a href="<c:url  value="/author/show"/>">Show all authors</a></th>
    </tr>
</table>

<%--@elvariable id="article" type=""--%>
<form:form method="post" modelAttribute="article">

    <p>Edit title:</p>
    <form:input path="title"/>

    <p>Edit author:</p>
    <form:radiobuttons itemLabel="lastName" itemValue="id" path="author.id" items="${authors}"/>

    <p>Edit category:</p>
    <form:select itemLabel="name" itemValue="id" path="categories" items="${categoryList}" multiple="true"/>

    <p>Edit content:</p>
    <form:textarea path="content" cols="50" rows="20"/>

    <form:hidden path="created"/>
    <p><input type="submit" value="edit">
    </p>

</form:form>
</body>
</html>
