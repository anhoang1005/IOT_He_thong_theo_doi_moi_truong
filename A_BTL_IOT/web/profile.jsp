 <%-- 
    Document   : profile.jsp
    Created on : Sep 3, 2023, 3:40:49 PM
    Author     : Hoang Van An
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width initial-scale=1.0">
    <title>Profile</title>
    <!-- GLOBAL MAINLY STYLES-->
    <link href="./assets/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="./assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link href="./assets/vendors/themify-icons/css/themify-icons.css" rel="stylesheet" />
    <!-- PLUGINS STYLES-->
    <link href="./assets/vendors/jvectormap/jquery-jvectormap-2.0.3.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/d75d72b9b4.js" crossorigin="anonymous"></script>
    <!-- THEME STYLES-->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/css/bootstrap4-toggle.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>

    <link href="assets/css/main.min.css" rel="stylesheet" />
    <!-- PAGE LEVEL STYLES-->

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body class="fixed-navbar sidebar-mini">
    <div class="page-wrapper">
        <!-- START HEADER-->
        <header class="header">
            <div class="page-brand">
                <a class="link" href="home.jsp">
                    <span class="brand">Admin manager</span>
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
                            <a class="dropdown-item" href="login.jsp"><i class="fa fa-power-off"></i>Logout</a>
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
                        <a href="home.jsp"><i class="sidebar-item-icon fa-solid fa-house"></i>
                            <span class="nav-label">Home</span>
                        </a>
                    </li>
                    <li class="heading">PAGES</li>
                    <li>
                        <a class="active" href="profile.jsp"><i class="sidebar-item-icon fa-solid fa-user"></i>
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
            <div class="page-heading">
                <h1 class="page-title">Profile</h1>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="home.jsp"><i class="la la-home font-20"></i></a>
                    </li>
                    <li class="breadcrumb-item">Profile</li>
                </ol>
            </div>
            <div class="page-content fade-in-up">
                <div class="row">
                    <div class="col-lg-3 col-md-4">
                        <div class="ibox">
                            <div class="ibox-body text-center">
                                <div class="m-t-20">
                                    <img class="img-circle" src="./assets/img/me.jpg" />
                                </div>
                                <h5 class="font-strong m-b-10 m-t-10">Hoàng Văn An</h5>
                                <div class="m-b-20 text-muted">B20DCCN045</div>
                                <div class="profile-social m-b-20">
                                    <a href="https://www.facebook.com/duyvu.hoang.5682"><i class="fa fa-twitter"></i></a>
                                    <a href="https://www.facebook.com/duyvu.hoang.5682"><i class="fa fa-facebook"></i></a>
                                    <a href="https://www.facebook.com/duyvu.hoang.5682"><i class="fa fa-instagram"></i></a>
                                    <a href="https://www.facebook.com/duyvu.hoang.5682"><i class="fa fa-user"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9 col-md-8">
                        <div class="ibox">
                            <div class="ibox-body">
                                <ul class="nav nav-tabs tabs-line">
                                    <li class="nav-item">
                                        <a class="nav-link active" href="#tab-1" data-toggle="tab"><i class="ti-bar-chart"></i> Overview</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#tab-2" data-toggle="tab"><i class="ti-settings"></i> Settings</a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane fade show active" id="tab-1">
                                        <div class="row">
                                            <div class="col-md-6" style="border-right: 1px solid #eee;">
                                                <h5 class="text-info m-b-20 m-t-10"><i class="fa fa-bar-chart"></i> Thông tin sinh viên</h5>
                                              <!--   <div class="h2 m-0">$12,400<sup>.60</sup></div>
                                                <div><small>Month income</small></div>
                                                <div class="m-t-20 m-b-20">
                                                    <div class="h4 m-0">120</div>
                                                    <div class="d-flex justify-content-between"><small>Thong tin</small>
                                                        <span class="text-success font-12"><i class="fa fa-level-up"></i> +24%</span>
                                                    </div>
                                                    <div class="progress m-t-5">
                                                        <div class="progress-bar progress-bar-success" role="progressbar" style="width:50%; height:5px;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                                <div class="m-b-20">
                                                    <div class="h4 m-0">86</div>
                                                    <div class="d-flex justify-content-between"><small>Month income</small>
                                                        <span class="text-warning font-12"><i class="fa fa-level-down"></i> -12%</span>
                                                    </div>
                                                    <div class="progress m-t-5">
                                                        <div class="progress-bar progress-bar-warning" role="progressbar" style="width:50%; height:5px;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                </div> -->
                                                <ul class="list-group list-group-full list-group-divider">
                                                    <li class="list-group-item"><strong>Name:</strong>
                                                        <span class="pull-right color-green">Hoàng Văn An</span>
                                                    </li>
                                                    <li class="list-group-item"><strong>ID:</strong>
                                                        <span class="pull-right color-green">B20DCCN045</span>
                                                    </li>
                                                    <li class="list-group-item"><strong>Class:</strong>
                                                        <span class="pull-right color-green">D20CQCN09-B</span>
                                                    </li>
                                                    <li class="list-group-item"><strong>Group:</strong>
                                                        <span class="pull-right color-green">09</span>
                                                    </li>
                                                    <li class="list-group-item"><strong>Tel:</strong>
                                                        <span class="pull-right color-green">0867865001</span>
                                                    </li>
                                                    <li class="list-group-item"><strong>Email:</strong>
                                                        <span class="pull-right color-green">vananhoang10052002@gmail.com</span>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="col-md-6">
                                                <h5 class="text-info m-b-20 m-t-10"><i class="fa fa-user-plus"></i>Thông tin cá nhân</h5>
                                                <ul class="media-list media-list-divider m-0">
                                                    <li class="media">
                                                        
                                                        <div class="media-body">
                                                            <div class="media-heading">Ngay sinh: <small class="float-right text-muted">*</small></div>
                                                            <div class="font-13">10/05/2002</div>
                                                        </div>
                                                    </li>
                                                    <li class="media">
                                                        <!--<a class="media-img" href="javascript:;">
                                                            <img class="img-circle" src="./assets/img/users/u1.jpg" width="40" />
                                                        </a>-->
                                                        <div class="media-body">
                                                            <div class="media-heading">Quê quán:<small class="float-right text-muted">*</small></div>
                                                            <div class="font-13">Thị Trấn Thiệu Hóa, Thiệu Hóa, Thanh Hóa</div>
                                                        </div>
                                                    </li>
                                                    <li class="media">
                                                        
                                                        <div class="media-body">
                                                            <div class="media-heading">So CMND: <small class="float-right text-muted">*</small></div>
                                                            <div class="font-13">038202020499</div>
                                                        </div>
                                                    </li>
                                                    <li class="media">
                                                        
                                                        <div class="media-body">
                                                            <div class="media-heading">Cơ quan: <small class="float-right text-muted">*</small></div>
                                                            <div class="font-13">Học viện Công nghệ Bưu chính Viễn thông</div>
                                                        </div>
                                                    </li>
                                                    <li class="media">
                                                        
                                                        <div class="media-body">
                                                            <div class="media-heading">Dân tộc: <small class="float-right text-muted">*</small></div>
                                                            <div class="font-13">Kinh</div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END PAGE CONTENT-->
            <!--<footer class="page-footer">
                <div class="font-13">2018 © <b>AdminCAST</b> - All rights reserved.</div>
                <a class="px-4" href="http://themeforest.net/item/adminca-responsive-bootstrap-4-3-angular-4-admin-dashboard-template/20912589" target="_blank">BUY PREMIUM</a>
                <div class="to-top"><i class="fa fa-angle-double-up"></i></div>
            </footer>-->
        </div>
    </div>
    <!-- BEGIN PAGA BACKDROPS-->
    <div class="sidenav-backdrop backdrop"></div>
    <div class="preloader-backdrop">
        <div class="page-preloader">Loading</div>
    </div>
    <!-- END PAGA BACKDROPS-->
    <!-- CORE PLUGINS-->
    <script src="./assets/vendors/jquery/dist/jquery.min.js" type="text/javascript"></script>
    <script src="./assets/vendors/popper.js/dist/umd/popper.min.js" type="text/javascript"></script>
    <script src="./assets/vendors/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="./assets/vendors/metisMenu/dist/metisMenu.min.js" type="text/javascript"></script>
    <script src="./assets/vendors/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- PAGE LEVEL PLUGINS-->
    <script src="./assets/vendors/chart.js/dist/Chart.min.js" type="text/javascript"></script>
    <!-- CORE SCRIPTS-->
    <script src="assets/js/app.min.js" type="text/javascript"></script>
    <!-- PAGE LEVEL SCRIPTS-->
    <script src="./assets/js/scripts/profile-demo.js" type="text/javascript"></script>
</body>
</html>
<style>
    a{
        text-decoration: none;
    }
    .profile-social a {
        font-size: 16px;
        margin: 0 10px;
        color: #999;
    }

    .profile-social a:hover {
        color: #485b6f;
    }

    .profile-stat-count {
        font-size: 22px
    }
</style>
