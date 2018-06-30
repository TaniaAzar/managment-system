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
<a href=".../.../index.jsp">Назад в меню</a>
<br/>
<br/>

<h1>Employee list</h1>

<c:if test="${!empty listEmployees}">
  <table class="tg">
    <tr>
        <th width="80">id</th>
        <th width="120">name</th>
        <th width="120">surname</th>
        <th width="120">position</th>
        <th width="120">salary</th>
        <th width="60">edit</th>
        <th width="60">delete</th>
    </tr>
      <c:forEach items="${listEmployees}" var="employee">
      <tr>
          <td>${employee.id}</td>
          <td>${employee.name}</td>
          <td>${employee.surname}</td>
          <td>${employee.position}</td>
          <td>${employee.salary}</td>
          <td><a href="<c:url value='/edit/${employee.id}'/>">">edit</a></td>
          <td><a href="<c:url value='/remove/${employee.id}'/>">">delete</a></td>
      </tr>
      </c:forEach>
  </table>
</c:if>


<h1>Добавить сотрудника</h1>
<c:url var="addAction" value="/employees/add">
    <form:form action="${addAction}" commandName="employee">
        <table>
            <c:if test="${!empty employee.name}">
                <tr>
                    <td>
                        <form:label path="id">
                            <spring:message text="id"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="id" readonly="true" size="8" disabled="true"/>
                        <form:hidden path="id"/>
                    </td>
                </tr>
            </c:if>
            <tr>
                <td>
                    <form:label path="name">
                        <spring:message text="name"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="name"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="surname">
                        <spring:message text="surname"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="surname"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="position">
                        <spring:message text="position"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="position"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="salary">
                        <spring:message text="salary"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="salary"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <c:if test="${!empty employee.name}">
                        <input type="submit"
                               value="<spring:message text="Edit Employee"/>"/>
                    </c:if>
                    <c:if test="${empty employee.name}">
                        <input type="submit"
                               value="<spring:message text="Add Employee"/>"/>
                    </c:if>
                </td>
            </tr>
        </table>
    </form:form>
</c:url>
</body>
</html>
