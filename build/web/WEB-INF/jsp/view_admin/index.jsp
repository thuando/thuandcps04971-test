<%-- 
    Document   : index
    Created on : May 28, 2017, 9:11:42 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Shoppy an Admin Panel Category Flat Bootstrap Responsive Website Template | Home :: w3layouts</title>
        <base href="${pageContext.servletContext.contextPath}/">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Shoppy Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <link href="${pageContext.servletContext.contextPath}/resource/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
        <!-- Custom Theme files -->
        <link href="${pageContext.servletContext.contextPath}/resource/css/style.css" rel="stylesheet" type="text/css" media="all"/>
        <!--js-->
        <script src="${pageContext.servletContext.contextPath}/resource/js/jquery-2.1.1.min.js"></script> 
        <!--icons-css-->
        <link href="${pageContext.servletContext.contextPath}/resource/css/font-awesome.css" rel="stylesheet"> 
        <!--Google Fonts-->
        <link href='//fonts.googleapis.com/css?family=Carrois+Gothic' rel='stylesheet' type='text/css'>
        <link href='//fonts.googleapis.com/css?family=Work+Sans:400,500,600' rel='stylesheet' type='text/css'>
        <!--static chart-->
        <script src="${pageContext.servletContext.contextPath}/resource/js/Chart.min.js"></script>
        <script src="${pageContext.servletContext.contextPath}/resource/js/jquery.min.js"></script>
        <link href="${pageContext.servletContext.contextPath}/resource/css/bootstrap.min.css" rel="stylesheet"/>
        <script src="${pageContext.servletContext.contextPath}/resource/js/bootstrap.min.js"></script>
        <!--//charts-->
        <!-- geo chart -->
        <script src="//cdn.jsdelivr.net/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
        <script>window.modernizr || document.write('<script src="lib/modernizr/modernizr-custom.js"><\/script>')</script>
        <!--<script src="lib/html5shiv/html5shiv.js"></script>-->
        <!-- Chartinator  -->
        <script src="${pageContext.servletContext.contextPath}/resource/js/chartinator.js" ></script>
        <script type="text/javascript">
            jQuery(function ($) {

                var chart3 = $('#geoChart').chartinator({
                    tableSel: '.geoChart',

                    columns: [{role: 'tooltip', type: 'string'}],

                    colIndexes: [2],

                    rows: [
                        ['China - 2015'],
                        ['Colombia - 2015'],
                        ['France - 2015'],
                        ['Italy - 2015'],
                        ['Japan - 2015'],
                        ['Kazakhstan - 2015'],
                        ['Mexico - 2015'],
                        ['Poland - 2015'],
                        ['Russia - 2015'],
                        ['Spain - 2015'],
                        ['Tanzania - 2015'],
                        ['Turkey - 2015']],

                    ignoreCol: [2],

                    chartType: 'GeoChart',

                    chartAspectRatio: 1.5,

                    chartZoom: 1.75,

                    chartOffset: [-12, 0],

                    chartOptions: {

                        width: null,

                        backgroundColor: '#fff',

                        datalessRegionColor: '#F5F5F5',

                        region: 'world',

                        resolution: 'countries',

                        legend: 'none',

                        colorAxis: {

                            colors: ['#679CCA', '#337AB7']
                        },
                        tooltip: {

                            trigger: 'focus',

                            isHtml: true
                        }
                    }


                });
            });
        </script>
        <!--geo chart-->

        <!--skycons-icons-->
        <script src="${pageContext.servletContext.contextPath}/js/skycons.js"></script>
        <!--//skycons-icons-->
        <script>
            $(document).ready(function () {
                $("#b1").click(function () {
                    $("#abc1").toggle("slow", function () {});
                })
            })
        </script>
        <script>
            $(document).ready(function () {
                $("#b2").click(function () {
                    $("#abc2").toggle("slow", function () {});
                })
            })
        </script>
    </head>
    <body>
        <!--phần nội dung-->
        <div class="page-container">
            <%@ include file="/WEB-INF/jsp/view_admin/v_header.jsp"%>

            <c:if test="${ktacc == 1}">
                <div class="typography">
                    <div class="grid_3 grid_4">
                        <%@ include file="/WEB-INF/jsp/trangquanly_admin/_quanlytaikhoan.jsp"%>   
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </c:if>

            <c:if test="${ktacc == 2}">
                <div class="typography">

                    <div class="grid_3 grid_4">
                        <center>
                            <p><button id="b1" style="">Quản Lý Phòng Ban</button></p>
                        </center>
                        <div  id="abc1">
                            <%@ include file="/WEB-INF/jsp/trangquanly_admin/_quanlynhansu.jsp"%>   
                        </div>
                    </div>
                    <div class="clearfix"> </div>

                    <div class="grid_3 grid_4">
                        <center>
                            <p><button id="b2" style="">Quản Lý Phòng Ban</button></p>
                        </center>
                        <div  id="abc2">
                            <%@ include file="/WEB-INF/jsp/trangquanly_admin/_quanlynhanvien.jsp"%>   
                        </div>
                    </div>
                    <div class="clearfix"> </div>

                </div>
                <a href="index.jsp"></a>
            </c:if>

            <c:if test="${ktacc == 3}">
                <div class="typography">
                    <div class="grid_3 grid_4">
                        <%@ include file="/WEB-INF/jsp/trangquanly_admin/_DanhGiaGhiNhan.jsp"%>   
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </c:if>

            <c:if test="${ktacc == 4}">
                <div class="typography">
                    <div class="grid_3 grid_4">
                        <%@ include file="/WEB-INF/jsp/trangquanly_admin/_TongHopDanhGia.jsp"%>   

                    </div>
                    <div class="clearfix"> </div>
                </div>
            </c:if>

               <c:if test="${ktacc1 == 1}">
                <div class="typography">
                    <div class="grid_3 grid_4">
                        <% response.sendRedirect("/assfinal_ps04971/record/report.htm");%>

                    </div>
                    <div class="clearfix"> </div>
                </div>
            </c:if>

                   
               
                
            <c:if test="${ktacc == 5}">
                <div class="typography">
                    <div class="grid_3 grid_4">
                        <%@ include file="/WEB-INF/jsp/trangquanly_admin/danhgiathanhcong.jsp"%>   
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </c:if>

            <c:if test="${ktacc == 6}">
                <div class="typography">
                    <div class="grid_3 grid_4">
                        <%@ include file="/WEB-INF/jsp/trangquanly_admin/_DanhGiaNhieuVien.jsp"%>   
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </c:if>
          
        </div>
        <div style="height:500px" class="copyrights">
            <p>© 2016 Shoppy. All Rights Reserved | Design by  <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
        </div>	


    </div>
    <%@ include file="/WEB-INF/jsp/view_admin/v_menu.jsp"%>
</div>

<!--slide bar menu end here-->
<script>
    var toggle = true;

    $(".sidebar-icon").click(function () {
        if (toggle)
        {
            $(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
            $("#menu span").css({"position": "absolute"});
        } else
        {
            $(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
            setTimeout(function () {
                $("#menu span").css({"position": "relative"});
            }, 400);
        }
        toggle = !toggle;
    });
</script>
<!--scrolling js-->
<script src="${pageContext.servletContext.contextPath}/resource/js/jquery.nicescroll.js"></script>
<script src="${pageContext.servletContext.contextPath}/resource/js/scripts.js"></script>
<!--//scrolling js-->
<script src="${pageContext.servletContext.contextPath}/resource/js/bootstrap.js"></script>
<!-- mother grid end here-->

        <script>
            var slideIndex = 1;
            showSlides(slideIndex);

            function plusSlides(n) {
                showSlides(slideIndex += n);
            }

            function currentSlide(n) {
                showSlides(slideIndex = n);
            }

            function showSlides(n) {
                var i;
                var slides = document.getElementsByClassName("mySlides");
                var dots = document.getElementsByClassName("dot");
                if (n > slides.length) {
                    slideIndex = 1
                }
                if (n < 1) {
                    slideIndex = slides.length
                }
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" active", "");
                }
                slides[slideIndex - 1].style.display = "block";
                dots[slideIndex - 1].className += " active";
            }
        </script>

        <script>
            var slideIndex = 0;
            showSlides();

            function showSlides() {
                var i;
                var slides = document.getElementsByClassName("mySlides");
                var dots = document.getElementsByClassName("dot");
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                slideIndex++;
                if (slideIndex > slides.length) {
                    slideIndex = 1
                }
                for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" active", "");
                }
                slides[slideIndex - 1].style.display = "block";
                dots[slideIndex - 1].className += " active";
                setTimeout(showSlides, 3500); // Change image every 2 seconds
            }
        </script>
</body>
</html>                     
