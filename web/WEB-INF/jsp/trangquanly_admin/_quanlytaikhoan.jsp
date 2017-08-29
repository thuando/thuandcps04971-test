<%-- 
    Document   : _quanlytaikhoan
    Created on : May 29, 2017, 2:32:28 AM
    Author     : Administrator
--%>

<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <title>Spring MVC - Databinding</title>
        <base href="${pageContext.servletContext.contextPath}/">
    </head>
    <body>
        <h2>Quản Lý Tài Khoản</h2>

        <form:form action="Account.htm" modelAttribute="dautien">
            <div>Tên Tài Khoản</div>
            <form:input path="name" />
            <div>Mật Khẩu</div>
            <form:input path="pass"/>
            <div>Họ và tên</div>
            <form:input path="full"/>
            <div>
                <button name="btnInsert">Thêm</button>
                <button name="btnUpdate">Cập nhật</button>         
            </div>
        </form:form>
        <br>            


        <table border="1" class="table table-hover">
            <tr>
                <td>Tên Tài Khoản</td>
                <td>Mật Khẩu</td>
                <td>Họ và tên</td>
                <td>Edit</td>
                <td>Delete</td>
            </tr>
            <c:forEach var="rows" items="${listacc}">
                <form action="Account.htm" method="post">
                    <tr>
                        <td>${rows.name}</td>
                        <td>${rows.pass}</td>
                        <td>${rows.full}</td>
                        <td>
                            <input type="hidden" name="name" value="${rows.name}"/>
                            <input type="hidden" name="pass" value="${rows.pass}"/>
                            <input type="hidden" name="full" value="${rows.full}"/>
                            <input type="submit" name="Edit" value="Edit"/>
                        </td>
                        <td>
                            <input type="hidden" name="name" value="${rows.name}"/>
                            <input type="submit" name="Delete" value="Delete"/>
                        </td>
                    </tr>
                </form>
            </c:forEach>    
        </table>
    </body>
</html>
