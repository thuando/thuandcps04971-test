<%-- 
    Document   : _quanlynhanvien
    Created on : May 30, 2017, 9:46:33 PM
    Author     : Administrator
--%>

<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">

        <style type="text/css">

            .paging-nav {
                text-align: right;
                padding-top: 2px;
            }

            .paging-nav a {
line-height:30px ;
                text-align: center;
                text-height: 30px;
                padding-top: 20px;
                margin: 10px;
                text-decoration: none;
                display: inline-block;
                padding: 1px 7px;
                background: #68ae00;
                color: white;
                border-radius: 5px;
                width: 30px;
                height: 30px;
            }

            .paging-nav .selected-page {
                background: #68ae00;
                font-weight: bold;

            }

            .paging-nav,
            #tableData {
                width: 1080px;
                margin: 0 auto;
                font-family: Arial, sans-serif;
            }
            .cil{
                cursor:pointer;
                border:outset 1px #ccc;
                background:#68ae00;
                color:#FFF;
                font-weight:bold;
                padding: 1px 2px;
                background:url(link tới ảnh mún làm màu cho Button) repeat-x left top;
            }

            .cil1{
                width: 30px;
                height: 30px;
                cursor:pointer;
                border:outset 1px #ccc;
                background:#FC8213;
                color:#FFF;
                font-weight:bold;
                padding: 1px 2px;
                background:url(link tới ảnh mún làm màu cho Button) repeat-x left top;
            }
        </style>
        <meta charset="utf-8"/>
        <title>Spring MVC - Databinding</title>
        <base href="${pageContext.servletContext.contextPath}/">
        <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.0.min.js"></script>

    </head>
    <body>

    <center><h2>Quản Lý Tài Khoản</h2></center>
    <div style="float: left;margin-left:70px " >
        ${message}
        <img width="200px" height="220px" src="${pageContext.servletContext.contextPath}/resource/images/nhanvien/${img}"/>
    </div>

    <div style="float:left;margin-left: 100px;text-align: center" >
        <form:form action="NhanVien.htm" modelAttribute="danhsach" method="post" enctype="multipart/form-data">
            <div style="float: left; ">
                <div>Mã Nhân Viên</div>
                <form:input path="id" readonly="true" cssClass="form-control"/>
                <div>Tên Nhân Viên</div>
                <form:input path="name" cssClass="form-control" />
                <div>Giới Tính</div>
                <form:radiobuttons path="gioitinh" items="${GioiTinh}" />
                <div>Ngày Sinh</div>
                <form:input path="sinhnhat"  type="date" data-date-format="DD MMMM YYYY" cssClass="form-control"/>
                <div>Hình Ảnh</div>
                <input  type="file" name="image" cssClass="form-control" />

            </div>
            <div style="float: left;margin-left: 20px;width: 280px">
                <div>Tài Khoản Email</div>
                <form:input path="email" cssClass="form-control"/>
                <div>Điện Thoại</div>
                <form:input path="sdt" cssClass="form-control"/>
                <div>Lương</div>
                <form:input path="luong" cssClass="form-control"/>
                <div>Ghi Chú</div>
                <form:input path="chuy" cssClass="form-control"/>
                <div>Phòng Ban</div>
                <form:select path="mpb" items="${phongban}"
                             itemValue="id" itemLabel="name"  cssClass="form-control"/>
            </div>


            <div style="clear: both"></div>

            <div style="margin-top: 20px">
                <center>
                    <button name="btnInsert" class="cil"><img width="30px" height="30px" src="${pageContext.servletContext.contextPath}/resource/images/new.png" alt="">Thêm</button>
                    <button style="margin-left: 20px" name="btnUpdate" class="cil"><img width="30px" height="30px" src="${pageContext.servletContext.contextPath}/resource/images/update.png" alt="">Cập nhật</button>         
                </center>
            </div>
        </form:form>
    </div>

    <br>     


    <div style="clear: both"></div>
    <br>
    <table id="tableData" border="1"  class="table table-hover">
        <tr >
            <th style="text-align:center;background:#68ae00;font-weight: bold;color: #fff;line-height: 30px ">Mã Nhân Viên</th>
            <th style="text-align:center;background:#68ae00;font-weight: bold;color: #fff">Tên Nhân Viên</th>
            <th style="text-align:center;background:#68ae00;font-weight: bold;color: #fff;line-height: 30px  ">Giới Tính</th>
            <th style="text-align:center;background:#68ae00;font-weight: bold;color: #fff;line-height: 30px  ">Ngày Sinh</th>
            <th style="text-align:center;background:#68ae00;font-weight: bold;color: #fff;line-height: 50px  ">Hình Ảnh</th>
            <th style="text-align:center;background:#68ae00;font-weight: bold;color: #fff;line-height: 50px  ">Tài Khoản Email</th>
            <th style="text-align:center;background:#68ae00;font-weight: bold;color: #fff;line-height: 50px  ">Điện Thoại</th>
            <th style="text-align:center;background:#68ae00;font-weight: bold;color: #fff;line-height: 50px  ">Lương</th>
            <th style="text-align:center;background:#68ae00;font-weight: bold;color: #fff;line-height: 30px  ">Ghi Chú</th>
            <th style="text-align:center;background:#68ae00;font-weight: bold;color: #fff;line-height: 30px ">Phòng Ban</th>
            <th style="text-align:center;background:#68ae00;font-weight: bold;color: #fff;line-height: 50px  ">Edit</th>
            <th style="text-align:center;background:#68ae00;font-weight: bold;color: #fff;line-height: 50px ">Delete</th>
        </tr>
        <c:forEach var="rows" items="${listacc1}">
            <form action="NhanVien.htm" method="post">
                <tr>
                    <td>${rows.id}</td>
                    <td>${rows.name}</td>
                    <td>
                        <c:if test="${rows.gioitinh == 1}" >Nam</c:if>
                        <c:if test="${rows.gioitinh == 0}" >Nữ</c:if>
                        </td>
                        <td>${rows.sinhnhat}</td>
                    <td>${rows.anh}</td>
                    <td>${rows.email}</td>
                    <td>${rows.sdt}</td>
                    <td>${rows.luong}</td>
                    <td>${rows.chuy}</td>
                    <td>${rows.mpb}</td>
                    <td> <input type="hidden" name="id2" value="${rows.id}"/>
                        <input type="hidden" name="name" value="${rows.name}"/>
                        <input type="hidden" name="gioitinh" value="${rows.gioitinh}"/>
                        <input type="hidden" name="sinhnhat" value="${rows.sinhnhat}"/>
                        <input type="hidden" name="anh" value="${rows.anh}"/>
                        <input type="hidden" name="email" value="${rows.email}"/>
                        <input type="hidden" name="sdt" value="${rows.sdt}"/>
                        <input type="hidden" name="luong" value="${rows.luong}"/>
                        <input type="hidden" name="chuy" value="${rows.chuy}"/>
                        <input type="hidden" name="mpb" value="${rows.mpb}"/>

                        <button name="Edit" class="cil1"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>
                    </td>
                    <td>

                        <input type="hidden" name="id2" value="${rows.id}"/>

                        <button  name="Delete" class="cil1"><i class="fa fa-times" aria-hidden="true"></i></button>

                    </td>
                </tr>
            </form>
        </c:forEach>    
    </table>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> 
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${pageContext.servletContext.contextPath}/resource/js/paging.js"></script> 
    <script type="text/javascript">
        $(document).ready(function () {
            $('#tableData').paging({limit: 15});
        });
    </script>
    <script type="text/javascript">

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-36251023-1']);
        _gaq.push(['_setDomainName', 'jqueryscript.net']);
        _gaq.push(['_trackPageview']);

        (function () {
            var ga = document.createElement('script');
            ga.type = 'text/javascript';
            ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore(ga, s);
        })();

    </script>
</body>
</html>
