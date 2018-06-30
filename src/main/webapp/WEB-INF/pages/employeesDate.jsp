<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Title</title>
</head>
<style type="text/css">
    .tg{
        border-collapse: collapse;
        border-spacing: 0;
        border-color: #ccc;
    }
    .tg td{
        font-family: Arial, sans-serif;
        font-size: 14px;
        padding: 10px 5px;
        border-style: solid;
        border-width: 1px;
        overflow: hidden;
        word-break: normal;
        border-color: #ccc;
        color: #333;
        background-color: #fff;
    }
    .tg th{
        font-family: Arial, sans-serif;
        font-size: 14px;
        font-weight: normal;
        padding: 10px 5px;
        border-style: solid;
        border-width: 1px;
        overflow: hidden;
        word-break: normal;
        border-color: #ccc;
        color: #333;
        background-color: #f0f0f0;
    }
    .tg .tg-4eph{
        background-color: #f9f9f9;
    }
</style>
<body>
<h1>Список рядовых сотрудников</h1>

<table class="tg">
    <tr>
        <th width="80">id</th>
        <th width="120">name</th>
        <th width="120">surname</th>
        <th width="120">position</th>
        <th width="120">salary</th>
    </tr>
    <c:forEach items="${listEmployees}" var="employee">
        <tr>
            <td>${employee.id}</td>
            <td>${employee.name}</td>
            <td>${employee.surname}</td>
            <td>${employee.position}</td>
            <td>${employee.salary}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
