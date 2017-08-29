<%-- 
    Document   : _TongHopDanhGia
    Created on : Jun 17, 2017, 8:19:38 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <base href="${pageContext.servletContext.contextPath}/">
        <link href="resources/css/bootstrap.min.css" rel="stylesheet">
        <link href="resources/css/bootstrap.css" rel="stylesheet">
        <link href="resources/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <style>
            * {
                box-sizing: border-box;
            }

            #myInput {
                background-image: url('/css/searchicon.png');
                background-position: 10px 10px;
                background-repeat: no-repeat;
                width: 100%;
                font-size: 16px;
                padding: 12px 20px 12px 40px;
                border: 1px solid #ddd;
                margin-bottom: 12px;
            }

            #myTable {
                border-collapse: collapse;
                width: 100%;
                border: 1px solid #ddd;
                font-size: 18px;
            }

            #myTable th, #myTable td {
                text-align: left;
                padding: 12px;
            }

            #myTable tr {
                border-bottom: 1px solid #ddd;
            }

            #myTable tr.header, #myTable tr:hover {
                background-color: #f1f1f1;
            }

            .paging-nav {
                text-align: right;
                padding-top: 2px;
            }

            .paging-nav a {
                margin: auto 2px;
                text-decoration: none;
                display: inline-block;
                padding: 1px 7px;
                background: #91b9e6;
                color: white;
                border-radius: 3px;
            }

            .paging-nav .selected-page {
                background: #187ed5;
                font-weight: bold;
            }

            .paging-nav,
            #tableData {
                width: 1080px;
                margin: 0 auto;
                font-family: Arial, sans-serif;
            }

        </style>
    </head>
    <body>
        <div  style="margin-top: 20px;">

            <h1>Xem Đánh Giá</h1>
            <table id="myTable" class="table table-hover">
                <tr > 
                    <th style="background: green;color: white">Mã NV</th>
                    <th style="background: green;color: white">Tổng thành tích</th> 
                    <th style="background: green;color: white">Tổng kỷ luật</th>
                    <th style="background: green;color: white">Tổng kết</th>
                </tr> 
                <c:forEach var="a" items="${arrays}"> 
                    <c:if test="${a[1] - a[2]<0}">
                        <tr style="background: red">  
                        <td>${a[0]}</td>  
                        <td>${a[1] }</td> 
                        <td>${a[2]}</td>  
                        <td>${a[1] - a[2]}</td>
                    </tr> 
                    </c:if>
                    <c:if test="${a[1] - a[2]>0}">
                    <tr style="color: green;font-weight: bold">  
                        <td>${a[0]}</td>  
                        <td>${a[1] }</td> 
                        <td>${a[2]}</td>  
                        <td>${a[1] - a[2]}</td>
                    </tr> 
                    </c:if>
                      <c:if test="${a[1] - a[2]==0}">
                    <tr style="background: yellow">  
                        <td>${a[0]}</td>  
                        <td>${a[1] }</td> 
                        <td>${a[2]}</td>  
                        <td>${a[1] - a[2]}</td>
                    </tr> 
                    </c:if>
                </c:forEach> 
            </table>

        </div>

        <script>
            function myFunction() {
                var input, filter, table, tr, td, i;
                input = document.getElementById("myInput");
                filter = input.value.toUpperCase();
                table = document.getElementById("myTable");
                tr = table.getElementsByTagName("tr");
                for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[0];
                    if (td) {
                        if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                        } else {
                            tr[i].style.display = "none";
                        }
                    }
                }
            }
        </script>

        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> 
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
        <script type="text/javascript" src="${pageContext.servletContext.contextPath}/resource/js/paging.js"></script> 
        <script type="text/javascript">
            $(document).ready(function () {
                $('#myTable').paging({limit: 10});
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
