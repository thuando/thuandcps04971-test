<%-- 
    Document   : _quanlynhansu
    Created on : May 30, 2017, 7:37:14 PM
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
        <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.0.min.js"></script>

    </head>
    <body>
        <h2>Quản Lý Tài Khoản</h2>

        <form:form action="nhansu.htm" modelAttribute="nhanvien">
            <div>Mã Phòng Ban</div>
            <form:input path="id" />
            <div>Tên Phòng Ban</div>
            <form:input path="name" />
            <div>
                <button name="btnInsert">Thêm</button>
                <button name="btnUpdate">Cập nhật</button>         
            </div>
        </form:form>
        <br>            


        <table border="1" class="table table-hover">
            <tr>
                <td>Mã Phòng Ban</td>
                <td>Tên Phòng Ban</td>
                <td>Edit</td>
                <td>Delete</td>
            </tr>
            <c:forEach var="rows" items="${listacc}">
                <form action="nhansu.htm" method="post">
                    <tr>
                        <td>${rows.id}</td>
                        <td>${rows.name}</td>
                        <td>
                            <input type="hidden" name="id1" value="${rows.id}"/>
                            <input type="hidden" name="name" value="${rows.name}"/>
                            <input type="submit" name="Edit" value="Edit"/>
                        </td>
                        <td>
                            <input type="hidden" name="id1" value="${rows.id}"/>
                            <input type="submit" name="Delete" value="Delete"/>
                        </td>
                    </tr>
                </form>
            </c:forEach>    
        </table>

    </body>
</html>

