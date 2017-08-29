<%-- 
    Document   : Top10
    Created on : Jun 26, 2017, 3:27:55 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!DOCTYPE html>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title></title>

    </head>
    <body style="padding:0px; margin:0px; background-color:#fff;font-family:'Open Sans',sans-serif,arial,helvetica,verdana">
        <% session.setAttribute("userkt", null);%>
        <!-- #region Jssor Slider Begin -->
        <script src="${pageContext.servletContext.contextPath}/resource/js/jssor.slider-25.0.7.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            jssor_1_slider_init = function () {

                var jssor_1_SlideshowTransitions = [
                    {$Duration: 1200, $Opacity: 2}
                ];

                var jssor_1_options = {
                    $AutoPlay: 1,
                    $SlideshowOptions: {
                        $Class: $JssorSlideshowRunner$,
                        $Transitions: jssor_1_SlideshowTransitions,
                        $TransitionsOrder: 1
                    },
                    $ArrowNavigatorOptions: {
                        $Class: $JssorArrowNavigator$
                    },
                    $BulletNavigatorOptions: {
                        $Class: $JssorBulletNavigator$
                    }
                };

                var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);

                /*#region responsive code begin*/
                /*remove responsive code if you don't want the slider scales while window resizing*/
                function ScaleSlider() {
                    var refSize = jssor_1_slider.$Elmt.parentNode.clientWidth;
                    if (refSize) {
                        refSize = Math.min(refSize, 980);
                        jssor_1_slider.$ScaleWidth(refSize);
                    } else {
                        window.setTimeout(ScaleSlider, 30);
                    }
                }
                ScaleSlider();
                $Jssor$.$AddEvent(window, "load", ScaleSlider);
                $Jssor$.$AddEvent(window, "resize", ScaleSlider);
                $Jssor$.$AddEvent(window, "orientationchange", ScaleSlider);
                /*#endregion responsive code end*/
            };
        </script>
        <style>
            /* jssor slider loading skin double-tail-spin css */

            img{
                border: 5px solid #F2B33F;

                border-radius: 100px;
            }


            .text {
                color: #f2f2f2;
                font-size: 30px;
                padding: 8px 12px;
                position: absolute;
                top: 8px;
                width: 100%;
                text-align: left;
                font-weight: bold;
                font-family: sans-serif ;

            }

            /* Number text (1/3 etc) */
            .numbertext {
                color: #f2f2f2;
                font-size: 12px;
                padding: 8px 12px;
                position: absolute;
                top: 0;
            }

            /* The dots/bullets/indicators */
            .dot {
                cursor:pointer;
                height: 13px;
                width: 13px;
                margin: 0 2px;
                background-color: #bbb;
                border-radius: 50%;
                display: inline-block;
                transition: background-color 0.6s ease;
            }

            .active, .dot:hover {
                background-color: #717171;
            }

            /* Fading animation */
            .fade {
                -webkit-animation-name: fade;
                -webkit-animation-duration: 1.5s;
                animation-name: fade;
                animation-duration: 1.5s;
            }


            .jssorl-004-double-tail-spin img {
                animation-name: jssorl-004-double-tail-spin;
                animation-duration: 1.2s;
                animation-iteration-count: infinite;
                animation-timing-function: linear;
            }

            @keyframes jssorl-004-double-tail-spin {
                from {
                    transform: rotate(0deg);
                }

                to {
                    transform: rotate(360deg);
                }
            }


            .jssorb051 .i {position:absolute;cursor:pointer;}
            .jssorb051 .i .b {fill:#fff;fill-opacity:0.5;stroke:#000;stroke-width:400;stroke-miterlimit:10;stroke-opacity:0.5;}
            .jssorb051 .i:hover .b {fill-opacity:.7;}
            .jssorb051 .iav .b {fill-opacity: 1;}
            .jssorb051 .i.idn {opacity:.3;}

            .jssora051 {display:block;position:absolute;cursor:pointer;}
            .jssora051 .a {fill:none;stroke:#fff;stroke-width:360;stroke-miterlimit:10;}
            .jssora051:hover {opacity:.8;}
            .jssora051.jssora051dn {opacity:.5;}
            .jssora051.jssora051ds {opacity:.3;pointer-events:none;}

            ul {
                list-style-type: none;
                margin: 0;
                padding: 0;
                overflow: hidden;
                border: 1px solid #e7e7e7;
                background-color: #f3f3f3;
            }

            li {
                float: left;
            }

            li a {
                display: block;
                color: #666;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
            }

            li a:hover:not(.active) {
                background-color: #ddd;
            }

            li a.active {
                color: white;
                background-color: #4CAF50;
            }

        </style>

        <ul style="margin-bottom: 50px">
            <li><a class="active" href="${pageContext.servletContext.contextPath}/Top10/report.htm">Trang Chủ</a></li>
            <li><a href="#news">Thông Tin</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/Account/Login.htm"><span>Đăng Nhập Hệ Thống</span></a></li>
            <li><a href="${pageContext.servletContext.contextPath}/Top10/vitri.htm"><span>Vị Trí</span></a></li>
        </ul>


        <div id="jssor_1" style="position:relative;margin:0 auto;top:0px;left:0px;width:980px;height:380px;overflow:hidden;visibility:hidden;">
            <!-- Loading Screen -->

            <div data-u="slides" style="cursor:default;position:relative;top:0px;left:0px;width:980px;height:380px;overflow:hidden;">
                <c:set var="b" value="1"/>
                <c:forEach var="a" items="${arrays}"> 

                    <c:if test="${b==1}">
                        <div class="mySlides fade" >
                            <div class="numbertext">1</div>
                            <img src="${pageContext.servletContext.contextPath}/resource/images/cup1.jpg" style="width:96%">
                            <div class="text"><center>Quán Quân Tháng</center><br>              

                                <center> Tổng Thành Tích : ${a[3]}</center>
                                <br>
                                Họ và Tên : ${a[1]} 
                                <br>
                                Mã Số Nhân Viên ${a[0]}
                                <br>
                                Chức Vụ : ${a[2]}
                            </div>

                        </div>

                    </c:if>
                    <c:if test="${b==2}">
                        <div class="mySlides fade">
                            <div class="numbertext">2</div>
                            <img src="${pageContext.servletContext.contextPath}/resource/images/cup2.jpg" style="width:96%">
                            <div class="text"><center>Á Quân </center><br>   
                                <center> Tổng Thành Tích : ${a[3]}</center>
                                <br>
                                Họ và Tên : ${a[1]} 
                                <br>
                                Mã Số Nhân Viên ${a[0]}
                                <br>
                                Chức Vụ : ${a[2]}
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${b==3}">
                        <div class="mySlides fade">
                            <div class="numbertext">3</div>
                            <img src="${pageContext.servletContext.contextPath}/resource/images/cup3_1.jpg" style="width:96%">
                            <div class="text"><center> Quý Quân Tháng</center> <br>
                                <center> Tổng Thành Tích : ${a[3]}</center>
                                <br>
                                Họ và Tên : ${a[1]} 
                                <br>
                                Mã Số Nhân Viên ${a[0]}
                                <br>
                                Chức Vụ : ${a[2]}
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${b>3 and b<6}">
                        <div class="mySlides fade">
                            <div class="numbertext">${b}</div>
                            <img src="${pageContext.servletContext.contextPath}/resource/images/cup4.jpg" style="width:100%">
                            <div class="text"><center> Hang ${b} Tháng</center><br>
                                <center> Tổng Thành Tích : ${a[3]}</center>
                                <br>
                                <center>   Họ và Tên : ${a[1]} 
                                    <br>
                                    Mã Số Nhân Viên ${a[0]}
                                    <br>
                                    Chức Vụ : ${a[2]}
                                    </div>
                                    </div>
                                </c:if>

                                <c:set var="b" value="${b+1}"/>
                            </c:forEach> 
                            <a data-u="any" href="https://www.jssor.com" style="display:none">js slider</a>
                    </div>
                    <!-- Bullet Navigator -->
                    <div data-u="navigator" class="jssorb051" style="position:absolute;bottom:12px;right:12px;" data-autocenter="1" data-scale="0.5" data-scale-bottom="0.75">
                        <div data-u="prototype" class="i" style="width:16px;height:16px;">
                            <svg viewbox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                            <circle class="b" cx="8000" cy="8000" r="5800"></circle>
                            </svg>
                        </div>
                    </div>
                    <!-- Arrow Navigator -->
                    <div data-u="arrowleft" class="jssora051" style="width:55px;height:55px;top:0px;left:25px;" data-autocenter="2" data-scale="0.75" data-scale-left="0.75">
                        <svg viewbox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                        <polyline class="a" points="11040,1920 4960,8000 11040,14080 "></polyline>
                        </svg>
                    </div>
                    <div data-u="arrowright" class="jssora051" style="width:55px;height:55px;top:0px;right:25px;" data-autocenter="2" data-scale="0.75" data-scale-right="0.75">
                        <svg viewbox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                        <polyline class="a" points="4960,1920 11040,8000 4960,14080 "></polyline>
                        </svg>
                    </div>
                </div>
                <script type="text/javascript">jssor_1_slider_init();</script>
                <!-- #endregion Jssor Slider End -->
                <div style="background: #4CAF50;color: #fff;margin-top:50px;height:  100px;text-align: center;line-height: 100px;font-size: 20px ">

                    Editor : Assignment Java 5

                </div>
                </body>
                </html>

