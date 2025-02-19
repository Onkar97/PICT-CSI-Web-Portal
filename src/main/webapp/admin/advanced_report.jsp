<%--
  Created by IntelliJ IDEA.
  User: snehal
  Date: 13/10/18
  Time: 1:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="com.pictcsi.database.DatabaseConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.ResultSetMetaData" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
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
    <link href="/admin/codeMirror/codemirror.css" rel="stylesheet">


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

    <%
        List<String> tableNames = new ArrayList<>();
        try (Connection connection = DatabaseConnection.getConnection()){
            //language=MySQL
            String sql = "SHOW TABLES";
            ResultSet set = DatabaseConnection.getResultSet(connection, sql);
            while (set.next()) {
                tableNames.add(set.getString(1));
            }
        } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
        }
    %>

    <div id="content-wrapper">
        <div class="row">
            <div class="col-md-1 col-lg-1"></div>
            <div class="col-md-5 col-lg-5">

                <%--<div role="document">--%>

                <h3 class="modal-title" id="addEventForm1">
                    <center>Advanced Reports</center>
                </h3>


                <form id="addEventForm" action="/admin/generateReport" method="post">
                    <div class="form-group">
                        <h6>SQL Compatible Query</h6>
                        <div class="form-label-group">
                            <textarea name="query" id="queryArea" cols="30" rows="5"></textarea>
                            <%--<label for="queryArea">SQL Compatible query</label>--%>

                        </div>
                    </div>


                    <div>
                        <center>
                            <button type="submit" class="btn btn-primary">Generate Report</button>
                        </center>
                    </div>
                </form>

                <%--</div>--%>
            </div>
            <div class="col-md-5 col-lg-5">
                <div class="card mb-3">
                    <a onclick="$(this).parent().find('.card-body').toggle();">
                        <div class="card-header" onclick="">
                            <i class="fas fa-table"></i>
                            Get Reg. Report
                            <form action="/admin/generateReport" method="post">
                                <input type="hidden" name="query" value="SELECT EVENT_REG.*, WU.first_name as vol_name FROM EVENT_REG join WEB_USER WU on EVENT_REG.volunteer_id = WU.user_id;">
                                <button type="submit" class="btn btn-primary">Get All</button>
                            </form>
                        </div>
                    </a>
                </div>


                <%
                    try (Connection connection = DatabaseConnection.getConnection()){
                        for (String name : tableNames) {
                            String sql = "desc " + name;
                            ResultSet set = DatabaseConnection.getResultSet(connection, sql);
                            ResultSetMetaData setMetaData = set.getMetaData();
                            int colCount = setMetaData.getColumnCount();
                %>
                <!-- DataTables Example -->
                <div class="card mb-3">
                    <a onclick="$(this).parent().find('.card-body').toggle();">
                        <div class="card-header" onclick="">
                            <i class="fas fa-table"></i>
                            <%=name%>
                            <form action="/admin/generateReport" method="post">
                                <input type="hidden" name="query" value="SELECT * FROM <%=name%>">
                                <button type="submit" class="btn btn-primary">Get All</button>
                            </form>
                        </div>
                    </a>
                    <div class="card-body " style="display: none">
                        <div class="table-responsive">
                            <table class="table table-bordered table_desc" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <%
                                        for (int i = 1; i < colCount; i++) {
                                    %>
                                    <th><%=setMetaData.getColumnName(i)%>
                                    </th>
                                    <%
                                        }
                                    %>
                                </tr>
                                </thead>

                                <tbody>

                                <%
                                    while (set.next()) {
                                %>
                                <tr>
                                    <%
                                        for (int i = 1; i < colCount; i++) {
                                    %>
                                    <td><%=set.getString(i)%></td>
                                    <%
                                        }
                                    %>
                                </tr>
                                <%
                                    }


                                %>


                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
                <%
                    }

                %>
                <%
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                %>

            </div>
            <div class="col-md-1 col-lg-1"></div>


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

<script type="text/javascript">

    $(function () {
        var editor = CodeMirror.fromTextArea(document.getElementById("queryArea"), {
            lineNumbers: true,
            mode: 'mysql'
        });

        $(".table_desc").DataTable();

        <%
            String error = request.getParameter("error");
            if(error!= null && !error.isEmpty()){
        %>
        $("#errorModal").modal('show');
        $("#currentError").html("<%=error%>");
        // window.location = window.location.split("?")[0];
        <%
            }
        %>

    });
</script>

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
<script src="/admin/codeMirror/codemirror.js"></script>

<%--<script src="js/demo/chart-pie-demo.js"></script>--%>
<%--<script src="js/demo/chart-area-demo.js"></script>--%>
<div class="modal fade" id="errorModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body" id="currentError"></div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Ok</button>

            </div>
        </div>
    </div>
</div>


</body>

</html>
