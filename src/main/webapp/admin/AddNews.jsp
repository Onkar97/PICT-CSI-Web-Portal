<%--
  Created by IntelliJ IDEA.
  User: snehal
  Date: 13/10/18
  Time: 1:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>CSI Admin | Dashboard</title>

    <%--<!-- Bootstrap core CSS-->--%>
    <%--<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">--%>

    <%--<!-- Custom fonts for this template-->--%>
    <%--<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">--%>
    <jsp:include page="/admin/header.jsp"/>
    <!-- Page level plugin CSS-->
    <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">


    <!-- Custom styles for this template-->


</head>

<body id="page-top">

<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="../index.jsp">CSI Admin</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
        <i class="fas fa-bars"></i>
    </button>

    <!-- Navbar Search -->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="Search for..." aria-label="Search"
                   aria-describedby="basic-addon2">
            <div class="input-group-append">
                <button class="btn btn-primary" type="button">
                    <i class="fas fa-search"></i>
                </button>
            </div>
        </div>
    </form>

    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
        <li class="nav-item dropdown no-arrow mx-1">
            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown"
               aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-fw"></i>
                <span class="badge badge-danger">9+</span>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
                <a class="dropdown-item" href="#">Action</a>
                <a class="dropdown-item" href="#">Another action</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">Something else here</a>
            </div>
        </li>
        <li class="nav-item dropdown no-arrow mx-1">
            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown"
               aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-envelope fa-fw"></i>
                <span class="badge badge-danger">7</span>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
                <a class="dropdown-item" href="#">Action</a>
                <a class="dropdown-item" href="#">Another action</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">Something else here</a>
            </div>
        </li>
        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
               aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-user-circle fa-fw"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">Settings</a>
                <a class="dropdown-item" href="#">Activity Log</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
            </div>
        </li>
    </ul>

</nav>

<div id="wrapper">

    <!-- Sidebar -->
    <jsp:include page="/admin/sidebar.jsp"/>

    <div id="content-wrapper">
        <div class="row">
            <div class="col-md-3 col-lg-3"></div>
            <div class="col-md-6 col-lg-6">

                <%--<div role="document">--%>

                <h3 class="modal-title" id="addEventForm1"><center>Time to Post NEWS</center></h3>


                <form id="addEventForm" action="/admin/addNews" method="post">
                    <div class="form-group">
                        <div class="form-label-group">
                            <input class="form-control" type="text" name="title" id="title"  placeholder="News Title" required="required" autofocus="autofocus">
                            <label for="title">News Title</label>

                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-label-group">
                            <input required="required" autofocus="autofocus"  class="form-control"  id="description" name="description" type="text"  placeholder="Description"  >
                            <label for="description">Add News Description </label>

                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-label-group">

                            <input type="date" id="start_date" name="start_date" class="form-control"  required="required" autofocus="autofocus">
                            <label >Add Starting Date</label>

                        </div>
                    </div>

                    <div class="form-group">
                        <div class="form-label-group">
                            <input type="date" id="end_date" name="end_date" class="form-control"  required="required" autofocus="autofocus">
                            <label >Add End Date</label>
                        </div>
                    </div>


                    <div >
                        <center>
                            <button type="submit" class="btn btn-primary" >Post it</button>
                        </center>
                    </div>
                </form>

                <%--</div>--%>
            </div>
            <div class="col-md-3 col-lg-3"></div>
        </div>




        <!-- Sticky Footer -->
        <footer class="sticky-footer">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright © Your Website 2018</span>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.content-wrapper -->

</div>
<!-- /#wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>



<!-- Bootstrap core JavaScript-->
<%--<script src="vendor/jquery/jquery.min.js"></script>--%>
<%--<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>--%>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Page level plugin JavaScript-->
<%--<script src="../vendor/chart.js/Chart.min.js"></script>--%>
<script src="vendor/datatables/jquery.dataTables.js"></script>
<script src="vendor/datatables/dataTables.bootstrap4.js"></script>
<%--<script src="vendor/chart.js/Chart.min.js"></script>--%>


<!-- Custom scripts for all pages-->
<script src="js/sb-admin.min.js"></script>

<!-- Demo scripts for this page-->
<script src="js/demo/datatables-demo.js"></script>
<%--<script src="js/demo/chart-pie-demo.js"></script>--%>
<%--<script src="js/demo/chart-area-demo.js"></script>--%>

</body>

</html>
