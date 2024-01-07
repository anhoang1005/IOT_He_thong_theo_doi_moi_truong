<%-- 
    Document   : test
    Created on : Nov 2, 2023, 3:55:58 PM
    Author     : Hoang Van An
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width initial-scale=1.0">
        <title>BTL IOT</title>
        
        <!-- GLOBAL MAINLY STYLES-->
        <link href="./assets/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link href="./assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
        <link href="./assets/vendors/themify-icons/css/themify-icons.css" rel="stylesheet" />
        
        <!-- PLUGINS STYLES-->
        <link href="./assets/vendors/jvectormap/jquery-jvectormap-2.0.3.css" rel="stylesheet" />
        <link href="./css/homecss.css" rel="stylesheet" />
        <script src="https://kit.fontawesome.com/d75d72b9b4.js" crossorigin="anonymous"></script>
        
        <!-- THEME STYLES-->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="./assets/js/paho-mqtt-min.js" type="text/javascript"></script>
        <script src="./assets/js/paho-mqtt.js" type="text/javascript"></script>
        <link href="assets/css/main.min.css" rel="stylesheet" />
        
        <!-- PAGE LEVEL STYLES-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <body class="fixed-navbar">
        <div class="page-wrapper">
            <!-- START HEADER-->
            <header class="header">
                <div class="page-brand">
                    <a class="link" href="home.jsp">
                        <span class="brand">Admin Manager</span>
                        <span class="brand-mini">AM</span>
                    </a>
                </div>
                <div class="flexbox flex-1">
                    <!-- START TOP-LEFT TOOLBAR-->
                    <ul class="nav navbar-toolbar">
                        <li>
                            <a class="nav-link sidebar-toggler js-sidebar-toggler"><i class="ti-menu"></i></a>
                        </li>
                        <li>
                            <form class="navbar-search" action="javascript:;">
                                <div class="rel">
                                </div>
                            </form>
                        </li>
                    </ul>
                    <!-- END TOP-LEFT TOOLBAR-->
                    <!-- START TOP-RIGHT TOOLBAR-->
                    <ul class="nav navbar-toolbar">
                        <li class="dropdown dropdown-user">
                            <a class="nav-link dropdown-toggle link" data-toggle="dropdown">
                                <img src="./assets/img/me.jpg" />
                                <span>Hoàng Văn An</span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item" href="profile.jsp"><i class="fa fa-user"></i>Profile</a>
                                <a class="dropdown-item" href="history.jsp"><i class="fa fa-cog"></i>History</a>
                                <a class="dropdown-item" href="data.jsp"><i class="fa fa-support"></i>Data</a>
                                <li class="dropdown-divider"></li>
                            </ul>
                        </li>
                    </ul>
                    <!-- END TOP-RIGHT TOOLBAR-->
                </div>
            </header>
            <!-- END HEADER-->
            <!-- START SIDEBAR-->
            <nav class="page-sidebar" id="sidebar">
                <div id="sidebar-collapse">
                    <div class="admin-block d-flex">
                        <div>
                            <img src="./assets/img/me.jpg"  width="40px" style="border-radius: 50%;"/>
                        </div>
                        <div class="admin-info">
                            <div class="font-strong">Hoàng Văn An</div><small>B20DCCN045</small></div>
                    </div>
                    <ul class="side-menu metismenu">
                        <li>
                            <a class="active" href="home.jsp"><i class="sidebar-item-icon fa-solid fa-house"></i>
                                <span class="nav-label">Home</span>
                            </a>
                        </li>
                        <li class="heading">PAGES</li>
                        <li>
                            <a href="profile.jsp"><i class="sidebar-item-icon fa-solid fa-user"></i>
                                <span class="nav-label">Profile</span></a>
                        </li>
                        <li>
                            <a href="history.jsp"><i class="sidebar-item-icon fa fa-edit"></i>
                                <span class="nav-label">History</span></a>
                        </li>
                        <li>
                            <a href="data.jsp"><i class="sidebar-item-icon fa-solid fa-database"></i>
                                <span class="nav-label">Data</span></a>
                        </li>
                        <li class="heading">ORTHERS</li>
                    </ul>
                </div>
            </nav>
            <!-- END SIDEBAR-->
            <div class="content-wrapper">
                <!-- START PAGE CONTENT-->
                <div class="page-content fade-in-up">
                    <div class="row">
                        <div class="col-lg-3 col-md-6">
                            <div style="background-color: #FF0000" class="ibox color-white widget-stat " id="temperatureWidget">
                                <div class="ibox-body">
                                    <h2 class="m-b-5 font-strong" id="temperatureValue">Đang cập nhật...</h2>
                                    <div class="m-b-5">NHIỆT ĐỘ(ĐỘ C)</div><i class="fa-solid fa-temperature-high widget-stat-icon"></i>
                                    <div><i class="fa-solid fa-clock"></i> <small id="timecontrol1">Trung Bình</small></div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6">
                            <div style="background-color: #0099FF" id="bValue" class="ibox color-white widget-stat">
                                <div class="ibox-body">
                                    <h2 class="m-b-5 font-strong" id="humidityValue">Đang cập nhật...</h2>
                                    <div class="m-b-5">ĐỘ ẨM</div><i class="fa-solid fa-droplet widget-stat-icon"></i>
                                    <div><i class="fa-solid fa-clock"></i> <small id="timecontrol2">Trung Binh</small></div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6">
                            <div style="background-color: #FF9900" id="cValue" class="ibox color-white widget-stat">
                                <div class="ibox-body">
                                    <h2 class="m-b-5 font-strong" id="lightValue">Đang cập nhật...</h2>
                                    <div class="m-b-5">ÁNH SÁNG(lux)</div><i class="fa-regular fa-lightbulb widget-stat-icon"></i>
                                    <div><i class="fa-solid fa-clock"></i> <small id="timecontrol3">Cao</small></div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6">
                            <div style="background-color: #990066" id="dValue" class="ibox color-white widget-stat">
                                <div class="ibox-body">
                                    <h2 class="m-b-5 font-strong" id="nhietValue">Đang cập nhật...</h2>
                                    <div class="m-b-5">KHI GA(%)</div><i class="fa-solid fa-fire-flame-curved widget-stat-icon"></i>
                                    <div><i class="fa-solid fa-clock"></i> <small id="timecontrol4">Cao</small></div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-lg-9 col-md-6">
                            <div class="ibox" id="left-box">
                                <div class="ibox-body">
                                    <div class="flexbox mb-4" style="border-bottom: 1px solid rgba(0,0,0,.1);">
                                        <div>
                                            <h3 class="m-0">Biểu đồ</h3>
                                            <div>Theo dõi giá trị</div>
                                        </div>
                                        <div class="d-inline-flex" >
                                            <div class="px-3" style="border-right: 1px solid rgba(0,0,0,.1);">
                                                <div class="text-danger">Nhiệt độ</div>
                                                <div>
                                                    <span class="text-danger h2 m-0" id="averageTemperature">30.5</span>
                                                    <span class="text-danger ml-2">°C</span>
                                                </div>
                                            </div>
                                            <div class="px-3" style="border-right: 1px solid rgba(0,0,0,.1);">
                                                <div class="text-info">Độ ẩm</div>
                                                <div>
                                                    <span class="text-info h2 m-0" id="averageHumidity">47</span>
                                                    <span class="text-info ml-2">%</span>
                                                </div>
                                            </div>
                                            <div class="px-3" style="border-right: 1px solid rgba(0,0,0,.1);">
                                                <div class="text-warning">Ánh sáng</div>
                                                <div>
                                                    <span class="text-warning h2 m-0" id="averageLight">1240</span>
                                                    <span class="text-warning ml-2">lux</span>
                                                </div>
                                            </div>
                                            <div class="px-3">
                                                <div style="color: violet" >Khí gas</div>
                                                <div>
                                                    <span style="color: violet" class="h2 m-0" id="averageGas">75</span>
                                                    <span style="color: violet" class="ml-2">%</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-lg-6" style="height: 100px;">
                                            <canvas id="weatherChart"></canvas>
                                        </div>
                                        <div class="col-lg-6">
                                            <canvas id="khigaChart"></canvas>
                                        </div>
                                    </div>
                                    
                                    <!-- <div>
                                        <canvas id="weatherChart"></canvas>
                                        <canvas id="khigaChart"></canvas>
                                        
                                    </div> -->
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="ibox" id="right-box">
                                <div class="ibox-head">
                                    <div class="ibox-title">Điều khiển</div>
                                </div>
                                <div class="col-lg-12 col-md-6" >
                                    <div id="flashingDiv1" class="ibox bg-white color-white widget-stat flashing" style="border: 4px solid green">
                                        <div class="ibox-body">
                                            <center>
                                                <div id="quatImage">
                                                    <img style="width: 125px; height: 125px;" src="./assets/img/quat1.webp" alt="Ảnh của bạn">
                                                </div>
                                            </center>
                                            <center><button class="btn btn-success" id="onButtonquat">ON</button> <button class="btn btn-danger" id="offButtonquat">OFF</button></center> 
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-6">
                                    <div id="flashingDiv2" class="ibox bg-white color-white widget-stat flashing" style="border: 4px solid red">
                                        <div class="ibox-body">
                                            <center><img id="lightImage" src="./assets/img/den_tat.png"  width="75px" style="border-radius: 50%;"/></center>
                                            <center><button  class="btn btn-success" id="onButton">ON</button> <button class="btn btn-danger" id="offButton">OFF</button></center>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="col-lg-12 col-md-6">
                                    <div id="flashingDiv"  class="ibox bg-white color-white widget-stat flashing" style="border: 4px solid violet">
                                        <div class="ibox-body">
                                            <center><img id="lightImage1" src="./assets/img/den_tat.png"  width="75px" style="border-radius: 50%;"/></center>
                                            <center><button class="btn btn-success" id="onButton1">ON</button>
                                        </div>
                                    </div>
                                </div> 
                            </div>
                        </div>
                    </div>

                    <script>
                        // Sử dụng JavaScript để đặt chiều cao bằng nhau cho hai thẻ
                        window.addEventListener('load', function () {
                            var leftBox = document.getElementById('left-box');
                            var rightBox = document.getElementById('right-box');

                            var maxHeight = Math.max(leftBox.clientHeight, rightBox.clientHeight);

                            leftBox.style.height = maxHeight + 'px';
                            rightBox.style.height = maxHeight + 'px';
                        });
                    </script>
                </div>
                <!-- END PAGE CONTENT-->
            </div>
        </div>

        <!-- BEGIN PAGA BACKDROPS-->
        <div class="sidenav-backdrop backdrop"></div>
        <div class="preloader-backdrop">
            <div class="page-preloader">Loading</div>
        </div>
        <!-- END PAGA BACKDROPS-->
        <!-- CORE PLUGINS-->
        <script src="./assets/vendors/jquery/dist/jquery.min.js" type="text/javascript"></script> <!-- Dung de load trang-->
        <script src="./assets/vendors/popper.js/dist/umd/popper.min.js" type="text/javascript"></script>
        <script src="./assets/vendors/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="./assets/vendors/metisMenu/dist/metisMenu.min.js" type="text/javascript"></script>
        <script src="./assets/vendors/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <!-- PAGE LEVEL PLUGINS-->

        <script src="./assets/vendors/chart.js/dist/Chart.min.js" type="text/javascript"></script>

        <script src="./assets/vendors/jvectormap/jquery-jvectormap-2.0.3.min.js" type="text/javascript"></script>
        <script src="./assets/vendors/jvectormap/jquery-jvectormap-world-mill-en.js" type="text/javascript"></script>
        <script src="./assets/vendors/jvectormap/jquery-jvectormap-us-aea-en.js" type="text/javascript"></script>
        <!-- CORE SCRIPTS-->
        <script src="assets/js/app.min.js" type="text/javascript"></script>
        <!-- PAGE LEVEL SCRIPTS-->
        <script src="./assets/js/scripts/dashboard_1_demo.js" type="text/javascript"></script>
        <script src="./javascript/home_sensordata.js" type="text/javascript"></script>
        <script src="./javascript/home_imageclick.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="./javascript/home_sendmess1.js" type="text/javascript"></script>            
        
    </body>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
</html>
<style>
    .flashing {
        background-color: red;
        animation: flash 1s infinite;
    }

    @keyframes flash {
        0% {
            opacity: 1;
        }
        50% {
            opacity: 0;
        }
        100% {
            opacity: 1;
        }
    }
</style>
