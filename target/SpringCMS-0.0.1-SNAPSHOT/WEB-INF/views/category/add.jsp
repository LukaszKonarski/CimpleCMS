
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Add a category</title>
</head>
<body>
<h1>Add a category</h1>

<%--@elvariable id="category" type=""--%>
<form:form method="post" modelAttribute="category">
    <p>Name:</p>
    <form:input path="name"/>
    <form:errors path = "name" cssClass="error"/>
    <p>Description:</p>
    <form:input path="description"/>
    <input type="submit" value="Add">

</form:form>
</body>
</html>
