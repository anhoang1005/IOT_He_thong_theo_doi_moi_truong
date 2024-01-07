<%-- 
    Document   : data.jsp
    Created on : Sep 3, 2023, 3:40:25 PM
    Author     : Hoang Van An
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.ThongSo"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width initial-scale=1.0">
        <title>Data</title>
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
                            <a href="profile.jsp"><i class="sidebar-item-icon fa-solid fa-user"></i>
                                <span class="nav-label">Profile</span></a>
                        </li>
                        <li>
                            <a href="history.jsp"><i class="sidebar-item-icon fa fa-edit"></i>
                                <span class="nav-label">History</span></a>
                        </li>
                        <li>
                            <a class="active" href="data.jsp"><i class="sidebar-item-icon fa-solid fa-database"></i>
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
                    <h1 class="page-title">Data</h1>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="home.jsp"><i class="la la-home font-20"></i></a>
                        </li>
                        <li class="breadcrumb-item">Data</li>
                    </ol>
                </div>
                <div class="page-content fade-in-up">
                    <div class="row">
                        <div class="col-lg-12 col-md-8">
                            <div class="ibox">
                                <div class="ibox-body">
                                    <div class="search-container">
                                        <div class="search-left">
                                            <input type="text" name="search" id="searchInput" class="search-input" placeholder="Tìm kiếm..." />
                                            <button id="sub-search" class="btn btn-success search-button">Tìm kiếm</button>
                                        </div>
                                        <div class="search-right">
                                            <select id="filterValue" name="filter">
                                                <option value="allfilter" selected>All</option>
                                                <option value="idfilter">Mã số</option>
                                                <option value="timefilter">Thời gian</option>
                                                <option value="doamfilter">Độ ẩm</option>
                                                <option value="nhietdofilter">Nhiệt độ</option>
                                                <option value="lightfilter">Ánh sáng</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="ibox-body">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th scope="col" class="text-center">STT 
                                                    <a id="id-up-link"><i class="fa-solid fa-chevron-up"></i></a>
                                                    <a id="id-down-link"><i class="fa-solid fa-chevron-down"></i></a>
                                                </th>
                                                <th scope="col" class="text-center">Thời gian 
                                                    <a id="time-up-link"><i class="fa-solid fa-chevron-up"></i></a>
                                                    <a id="time-down-link"><i class="fa-solid fa-chevron-down"></i></a>
                                                </th>
                                                <th scope="col" class="text-center">Nhiệt độ 
                                                    <a id="nhietdo-up-link" ><i class="fa-solid fa-chevron-up"></i></a>
                                                    <a id="nhietdo-down-link" ><i class="fa-solid fa-chevron-down"></i></a>
                                                </th>
                                                <th scope="col" class="text-center">Độ ẩm 
                                                    <a id="doam-up-link" ><i class="fa-solid fa-chevron-up"></i></a>
                                                    <a id="doam-down-link" ><i class="fa-solid fa-chevron-down"></i></a>
                                                </th>
                                                <th scope="col" class="text-center">Ánh sáng 
                                                    <a id="light-up-link" ><i class="fa-solid fa-chevron-up"></i></a>
                                                    <a id="light-down-link" ><i class="fa-solid fa-chevron-down"></i></a>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody id="data-table">
                                            <!-- Dữ liệu sẽ được cập nhật bằng AJAX -->
                                        </tbody>
                                        <!-- <c:forEach items="${listT}" var="thongso">
                                            <tr>
                                                <td class="text-center">${thongso.id}</td>
                                                <td class="text-center">${thongso.time}</td>
                                                <td class="text-center">${thongso.nhietdo}</td><!-- comment -->
                                                <td class="text-center">${thongso.doam}</td><!-- comment -->
                                                <td class="text-center">${thongso.anhsang}</td>
                                            </tr>
                                        </c:forEach> -->
                                    </table>
                                    
                                    <div id="searchResults">
                                        <!-- Kết quả tìm kiếm sẽ được hiển thị ở đây -->
                                    </div>
                                    
                                    <button >Truoc</button>
                                    <select id="pageSelect">
                                        
                                        <!-- Thêm các tùy chọn trang khác tại đây -->
                                    </select>
                                    <button >Sau</button>
                                    
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
        
        <script src="./javascript/datajs.js" type="text/javascript"></script>

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


    table {
        font-family: Arial, sans-serif;
        border-collapse: collapse;
        width: 100%;
        margin-bottom: 20px;
    }

    th, td {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
    }

    th {
        background-color: #f2f2f2;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    tr:hover {
        background-color: #ddd;
    }
    
    .search-container {
        display: flex;
        align-items: center;
    }

    .search-input {
        /*flex: 1; /* Phần input sẽ mở rộng để lấp đầy phần còn lại của container */
        padding: 5px; /* Điều chỉnh padding cho độ rộng của input */
        margin-right: 10px; /* Khoảng cách giữa input và button */
    }

    .search-button {
        min-width: 100px; /* Điều chỉnh kích thước của button */
    }

    .search-container {
        display: flex;
        justify-content: space-between;
    }

    .search-left {
        flex: 1;
        display: flex;
        align-items: center;
    }

    .search-right {
        flex: 1;
        display: flex;
        align-items: center;
        justify-content: flex-end;
    }
    
    
    .disabled-button {
        opacity: 0.2; /* Thiết lập độ mờ */
        pointer-events: none; /* Vô hiệu hóa các sự kiện click */
        cursor: not-allowed; /* Đổi con trỏ chuột thành dấu cản trở */
    }

</style>