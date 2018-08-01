
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Edit the article</title>
</head>
<body>
<h1>Edit the article</h1>

<%--@elvariable id="article" type=""--%>
<form:form method="post" modelAttribute="article">
    <form:input path="title"/>
    <form:hidden path="created"/>
    <form:textarea path="content" cols="30" rows="20"/>
    <input type="submit" value="Edit">

</form:form>
</body>
</html>
