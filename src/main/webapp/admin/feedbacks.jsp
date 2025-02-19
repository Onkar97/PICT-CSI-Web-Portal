<%@ page import="com.pictcsi.database.DatabaseConnection" %>
<%@ page import="com.pictcsi.models.FeedBack" %>
<%@ page import="com.pictcsi.util.Misc" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%--
  Created by IntelliJ IDEA.
  User: negativezero
  Date: 12/10/18
  Time: 4:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<%
    SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
%>
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
    <jsp:include page="header.jsp"/>
    <!-- Page level plugin CSS-->
    <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">


    <!-- Custom styles for this template-->

</head>

<body id="page-top">

<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="index.html">CSI Admin</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
        <i class="fas fa-bars"></i>
    </button>

    <!-- Navbar Search -->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
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
            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
    <jsp:include page="sidebar.jsp"/>

    <div id="content-wrapper">

        <div class="container-fluid">

            <!-- Breadcrumbs-->
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="index.html">Dashboard</a>
                </li>
                <li class="breadcrumb-item">Feedback</li>
                <li class="breadcrumb-item active">Overview</li>
            </ol>

            <!-- Page Content -->
            <h1>Feedback</h1>
            <hr>

            <%
                try (Connection connection = DatabaseConnection.getConnection()){
                    String getEvents = "SELECT * FROM FEEDBACK where feedback_answer is null ORDER BY created_date desc ";
                    ResultSet usersSet = DatabaseConnection.getResultSet(connection, getEvents);
            %>
            <!-- DataTables Example -->
            <div class="card mb-3" id="user_table">
                <div class="card-header">
                    <i class="fas fa-table"></i>
                    Unanswered Queries
                </div>
                <span style="padding: 10px 20px; color: #ff0000;">Entries in red indicate pending feedback more than 1 week</span>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable2" width="100%" cellspacing="0">
                            <thead>
                            <tr>
                                <th>No.</th>
                                <th>User Name</th>
                                <th>Email</th>
                                <th>Desciption</th>
                                <th>Query</th>
                                <th>Date Added</th>
                                <th>Answer?</th>


                            </tr>
                            </thead>

                            <tbody>
                            <%
                                int i = 1;
                                Date nowDate = new Date();
                                Calendar c = Calendar.getInstance();
                                c.setTime(nowDate);
                                c.add(Calendar.DAY_OF_MONTH, -7);
                                while (usersSet.next()) {

                                    FeedBack e = FeedBack.getFromSet(usersSet);

                                    Date eventDate = Misc.convertFromSQLDateToJAVADate(e.getCreated_date());

                            %>
                            <tr <%if(eventDate.before(c.getTime())){%> style="background-color: rgba(255,0,0,0.6);"<%}%>>
                                <td><%=i++%>.</td>
                                <td><%=e.getFeed_user_name()%>
                                </td>
                                <td><%=e.getFeed_email()%>
                                </td>
                                <td><%=e.getFeed_description()%>
                                </td>
                                <td><%=e.getFeed_query()%>
                                </td>
                                <td><%=format.format(e.getCreated_date())%></td>
                                <td>
                                    <%
                                        if(e.getFeed_back_answer() == null || e.getFeed_back_answer().isEmpty()){
                                    %>
                                    <form action="replyToContact" method="post">
                                        <input type="hidden" value="<%=e.getFeed_id()%>" name="feedback_id">
                                        <input type="text" name="feedback_answer">
                                        <button class="btn btn-success">
                                            Send
                                        </button>
                                    </form>
                                    <%
                                        }else{
                                    %>
                                    This Question has been answered
                                    <%
                                        }
                                    %>
                                </td>
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
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            %>

            <%
                try (Connection connection = DatabaseConnection.getConnection()){
                    String getEvents = "SELECT * FROM FEEDBACK where feedback_answer is not null ORDER BY created_date desc";
                    ResultSet usersSet = DatabaseConnection.getResultSet(connection, getEvents);
            %>
            <!-- DataTables Example -->
            <div class="card mb-3" id="user_table">
                <div class="card-header">
                    <i class="fas fa-table"></i>
                    Answered Queries
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable3" width="100%" cellspacing="0">
                            <thead>
                            <tr>
                                <th>No.</th>
                                <th>User Name</th>
                                <th>Email</th>
                                <th>Desciption</th>
                                <th>Query</th>
                                <th>Date Added</th>
                                <th>Answer?</th>


                            </tr>
                            </thead>

                            <tbody>
                            <%
                                int i = 1;
                                while (usersSet.next()) {
                                    FeedBack e = FeedBack.getFromSet(usersSet);
                            %>
                            <tr>
                                <td><%=i++%>.</td>
                                <td><%=e.getFeed_user_name()%>
                                </td>
                                <td><%=e.getFeed_email()%>
                                </td>
                                <td><%=e.getFeed_description()%>
                                </td>
                                <td><%=e.getFeed_query()%>
                                </td>
                                <td><%=format.format(e.getCreated_date())%></td>
                                <td>
                                    <%
                                        if(e.getFeed_back_answer() == null || e.getFeed_back_answer().isEmpty()){
                                    %>
                                    <form action="replyToContact" method="post">
                                        <input type="hidden" value="<%=e.getFeed_id()%>" name="feedback_id">
                                        <input type="text" name="feedback_answer">
                                        <button class="btn btn-success">
                                            Send
                                        </button>
                                    </form>
                                    <%
                                    }else{
                                    %>
                                    This Question has been answered
                                    <%
                                        }
                                    %>
                                </td>
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
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            %>
        </div>

        <!-- /.container-fluid -->

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

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="../login.html">Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
<%--<script src="vendor/jquery/jquery.min.js"></script>--%>
<%--<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>--%>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Page level plugin JavaScript-->
<%--<script src="../vendor/chart.js/Chart.min.js"></script>--%>
<script src="vendor/datatables/jquery.dataTables.js"></script>
<script src="vendor/datatables/dataTables.bootstrap4.js"></script>
<script src="vendor/chart.js/Chart.min.js"></script>


<!-- Custom scripts for all pages-->
<script src="js/sb-admin.min.js"></script>

<!-- Demo scripts for this page-->
<script src="js/demo/datatables-demo.js"></script>
<%--<script src="js/demo/chart-pie-demo.js"></script>--%>
<%--<script src="js/demo/chart-area-demo.js"></script>--%>

</body>

</html>
