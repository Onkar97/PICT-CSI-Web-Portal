<%@ page import="com.pictcsi.database.DatabaseConnection" %>
<%@ page import="com.pictcsi.models.Event" %>
<%@ page import="com.pictcsi.models.EventReg" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

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
    String event_id = request.getParameter("event_id");
    Event event = null;
    try{
        if(event_id != null && !event_id.isEmpty()){
            int eventId = Integer.parseInt(event_id);
            event = Event.getById(eventId);
            if(event == null){
                response.sendRedirect("index.jsp");
                return;
            }

        }else{
            response.sendRedirect("index.jsp");
            return;
        }
    }catch (SQLException e){
        e.printStackTrace();
        response.sendRedirect("index.jsp");
        return;
    }
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
    <link href="../vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">


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
                <li class="breadcrumb-item">Events</li>
                <li class="breadcrumb-item active"><%=event.getEvent_name()%></li>
            </ol>

            <!-- Page Content -->
            <h1><%=event.getEvent_name()%></h1>
            <hr>

            <div class="row control-header">
                <div class="col-md-6 col-lg-6">
                    <form action="/admin/sendFeedbackLinkServlet" method="post">
                        <input type="hidden" name="event_id" value="<%=event_id%>">
                        <button type="submit" class="btn btn-info">Send Feedback Links</button>
                    </form>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="float-right">
                        <form action="/admin/endEventServlet" method="post">
                            <input type="hidden" name="event_id" value="<%=event_id%>">
                            <button type="submit" class="btn btn-danger">End Event</button>
                        </form>

                        <%--<button class="btn btn-danger">End Event with email</button>--%>
                    </div>
                </div>
            </div>
            <%
                try (Connection connection = DatabaseConnection.getConnection()){
                    String getEvents = "SELECT * FROM EVENT_REG where event_id = "+ event_id;
                    ResultSet usersSet = DatabaseConnection.getResultSet(connection, getEvents);
            %>
            <!-- DataTables Example -->
            <div class="card mb-3" id="user_table">
                <div class="card-header">
                    <i class="fas fa-table"></i>
                    Participants
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable2" width="100%" cellspacing="0">
                            <thead>
                            <tr>
                                <th>No.</th>
                                <th>Reg id.</th>
                                <th>Name</th>
                                <th>College Name</th>
                                <th>Group</th>
                                <th>Category</th>
                                <th>Payment</th>
                                <th>Ops</th>
                            </tr>
                            </thead>

                            <tbody>
                            <%
                                int i = 1;
                                while (usersSet.next()) {
                                    EventReg e = EventReg.getFromSet(usersSet);
                            %>
                            <tr>
                                <td><%=i++%>.</td>
                                <td><%=e.getId()%>
                                </td>
                                <td><%=e.getParticipant_name()%>
                                </td>
                                <td><%=e.getCollege_name()%>
                                </td>
                                <td><%=e.getGroup_t()%>
                                </td>
                                <td><%=e.getCategory()%>
                                </td>
                                <td>
                                    <%
                                        if(!e.isHas_paid()){
                                    %>
                                    <a href="acceptPayment?reg_id=<%=e.getId()%>&set_status=true&event_id=<%=event.getEvent_id()%>" class="btn btn-info">Accept Payment</a>
                                    <a href="#" class="btn btn-info">Send payment reminder</a>

                                    <%
                                    }else{
                                    %>
                                    <a href="acceptPayment?reg_id=<%=e.getId()%>&set_status=false&event_id=<%=event.getEvent_id()%>" class="btn btn-info">Refund Payment</a>

                                    <%
                                        }
                                    %>
                                </td>
                                <td>

                                    <a href="#" class="btn btn-danger">Cancel</a>
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
