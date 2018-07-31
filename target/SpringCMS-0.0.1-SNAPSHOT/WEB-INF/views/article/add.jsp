<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Add an article</title>
</head>
<body>
<h1>Add an article</h1>

<%--@elvariable id="article" type=""--%>
<form:form method="post" modelAttribute="article">

    <p>Title:</p>
    <form:input path="title"/>

    <p>Author:</p>
    <form:radiobuttons itemLabel="lastName" itemValue="id" items="${authors}" path="author.id"/>

    <p>Category:</p>
    <form:select itemLabel="name" itemValue="id" path="categories" items="${categoryList}" multiple="true"/>

    <p>Content:</p>
    <form:textarea path="content" cols="30" rows="20"/>

    <input type="submit" value="Add">

</form:form>
</body>
</html>
