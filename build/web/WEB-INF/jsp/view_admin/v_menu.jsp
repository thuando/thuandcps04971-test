<%-- 
    Document   : v_menu
    Created on : May 28, 2017, 10:01:31 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        <!--slider menu-->
        <div class="sidebar-menu">
            <div class="logo"> <a href="http://localhost:8084<%= request.getAttribute("javax.servlet.forward.request_uri")  %>#" class="sidebar-icon"> <span class="fa fa-bars"></span> </a> <a href="#"> <span id="logo" ></span> 
                    <!--<img id="logo" src="" alt="Logo"/>--> 
                </a> </div>		  
            <div class="menu">
                <ul id="menu" >
                    <li id="menu-home" ><a href="${pageContext.servletContext.contextPath}/record/report.htm"<i class="fa fa-tachometer"></i><span>Trang Quản Lý</span></a></li>
                    <li><a href="${pageContext.servletContext.contextPath}/Account/quanlyacc.htm"><i class="fa fa-sign-in"></i><span>Quản Lý Tài Khoản</span></a></li>
                    <li><a href="${pageContext.servletContext.contextPath}/nhansu/quanlyns.htm"><i class="fa fa-bar-chart"></i><span>Quản Lý Nhân Sự</span></a></li>
                    <li><a href="#"><i class="fa fa-envelope"></i><span>Mailbox</span><span class="fa fa-angle-right" style="float: right"></span></a>
                        <ul id="menu-academico-sub" >
                            <li id="menu-academico-avaliacoes" ><a href="inbox.html">Inbox</a></li>
                            <li id="menu-academico-boletim" ><a href="inbox-details.html">Feedback</a></li>
                        </ul>
                    </li>
                    <li><i class="fa fa-map-marker"></i><span>Đánh Giá Nhân Viên</span><span class="fa fa-angle-right" style="float: right"></span>
                        <ul id="menu-academico-sub" >
                            <li id="menu-academico-avaliacoes" ><a href="${pageContext.servletContext.contextPath}/record/insert.htm">Đánh Giá 1 Nhân Viên</a></li>
                            <li id="menu-academico-boletim" ><a href="${pageContext.servletContext.contextPath}/record/DGNNV.htm">Đánh Giá Nhiều Nhân Viên</a></li>
                        </ul>
                    </li>
                    
                </ul>
            </div>
        </div>
        <div class="clearfix"> </div>
    </div>
    <!--slide bar menu end here-->
</body>
</html>
