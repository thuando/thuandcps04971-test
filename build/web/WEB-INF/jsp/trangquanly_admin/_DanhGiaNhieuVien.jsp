<%-- 
    Document   : _DanhGiaNhieuVien
    Created on : Jun 25, 2017, 6:27:05 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>jQuery UI Autocomplete - Categories</title>

        <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resource/css/jquery-ui.css">
        <style>
            .ui-autocomplete-category {
                font-weight: bold;
                padding: .2em .4em;
                margin: .8em 0 .2em;
                line-height: 1.5;    
            }
        </style>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>

        <script>
            var data = [
            <c:forEach var="rows" items="${listacc}">

                {
                    label: "${rows.name}||${rows.id}",
                                category: "${rows.tenchucvu}"
                            },
            </c:forEach>
                        ];
                        $(function () {
                            // Set Variables
                            var cats = [],
                                    labels = {},
                                    sel = $("#categories"),
                                    search = $("#search");

                            // Sift out specific Categories
                            $.each(data, function (k, v) {
                                if (v.category !== "") {
                                    cats.push(v.category);
                                    console.log("Found Cat: " + v.category);
                                }
                            });
                            $.unique(cats);
                            console.log("All Cats: ", cats);

                            // Set Categories into Select element
                            $.each(cats, function (k, v) {
                                sel.append("<option value='" + v + "'>" + v + "</option>");
                            });

                            // Create Object of various data
                            labels.none = [];
                            $.each(cats, function (k, v) {
                                labels[v] = [];
                            });
                            for (var i = 0; i < data.length; i++) {
                                $.each(cats, function (k, v) {
                                    if (data[i].category == "") {
                                        labels.none.push(data[i].label);
                                    }
                                    if (data[i].category == v) {
                                        labels[v].push(data[i].label);
                                    }
                                });
                            }
                            $.each(labels, function (k, v) {
                                $.unique(labels[k]);
                            });
                            console.log("All Labels: ", labels);

                            // Set Autocomplete with variable data based on category selection
                            search.autocomplete({
                                delay: 0,
                                source: function (req, res) {
                                    var cat = sel.val();
                                    var data = labels[cat];
                                    var results = [];
                                    $.each(data, function (k, v) {
                                        if (v.indexOf(req.term) == 0) {
                                            results.push(v);
                                        }
                                    });
                                    res(results);
                                }
                            });
                        });

        </script>
    </head>
    <body>

        <label>Search:</label>
        <form action="danhgianhiu.htm" method="post">
            <select id="categories">
                <option value="none"></option>
            </select>

            <input id="search" name="name">
            <button name="table"><img width="20px" height="20px" src="${pageContext.servletContext.contextPath}/resource/images/123.png" alt=""></button>
        </form>

        <form action="danhgianhiu/insert.htm"  method="post"> 
            <table id="myTable" border="1"  class="table table-hover">
                <tr>
                    <th>Tên Nhân Viên</th>

                </tr>
                <c:forEach var="a" items="${a}"> 

                    <tr>
                        <td><input type="hidden"  cssClass="form-control" value="${a.id}"/>${a.name} ||${a.id}</td>

                    </tr>

                </c:forEach>
            </table>
           <div style="margin-left: 100px">
            <div style="float: left;margin-left: 20px">
                Thành Tích
                <br><input type="radio" name="radio" value="1" label="Thành tích"/>  
            </div>

            <div style="float: left;margin-left: 20px">
                Kỉ Luật
                <br><input type="radio" name="radio" value="0" label="Kỷ luật"/>   

            </div>
           
            <div style="float: left;margin-left: 20px">
                 Ghí Chú <br>
                <textarea  name="reason" rows="3" cssClass="form-control"></textarea>

            </div>
            <div style="clear: both" ></div>
            
            <div style="margin-left: 10px">
                <button  class="btn btn-primary">Insert</button> 
                 ${message}
            </div>
           </div>

        </form> 
       
    </body>
</html>
