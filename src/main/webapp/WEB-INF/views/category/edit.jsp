
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Edit the category</title>
</head>
<body>
<h1>Edit the category</h1>

<%--@elvariable id="category" type=""--%>
<form:form method="post" modelAttribute="category">
    <form:input path="name"/>
    <form:input path="description"/>
    <input type="submit" value="Edit">

</form:form>
</body>
</html>
