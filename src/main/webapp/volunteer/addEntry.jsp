<%--
  Created by IntelliJ IDEA.
  User: negative0
  Date: 2/22/19
  Time: 1:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.pictcsi.database.DatabaseConnection" %>
<%@ page import="com.pictcsi.models.Event" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>CSI Volunteer | Dashboard</title>

    <%--<!-- Bootstrap core CSS-->--%>
    <%--<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">--%>

    <%--<!-- Custom fonts for this template-->--%>
    <%--<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">--%>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="/vendor/bootstrap/css/bootstrap.min.css">

    <!-- Custom fonts for this template-->
    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <!-- jQuery library -->
    <script src="/vendor/jquery/jquery-3.3.1.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="/vendor/bootstrap/js/bootstrap.min.js"></script>

    <%--<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>--%>

    <!-- Core plugin JavaScript-->
    <script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

    <%--<script src="js/modal-sc.js"></script>--%>

    <link href="/css/sb-admin.min.css" rel="stylesheet">
    <!-- Page level plugin CSS-->
    <link href="../vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">





</head>

<body id="page-top">

<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="#">Dashboard | CSI Volunteer</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
        <i class="fas fa-bars"></i>
    </button>



</nav>

<div id="wrapper">

    <!-- Sidebar -->
    <%--<jsp:include page="/admin/sidebar.jsp"/>--%>
    <jsp:include page="sidebar.jsp"/>

    <div id="content-wrapper">

        <div class="container-fluid">


            <div class="row">
                <div class="col-md-3 col-lg-3"></div>
                <div class="col-md-6 col-lg-6">

                    <%--<div role="document">--%>
                    <h4>You are logged in as <%=request.getSession().getAttribute("user_name")%></h4>

                    <h3 class="modal-title" id="addEventForm1">Register for Event</h3>


                    <form action="addEventResult" id="addEventForm" method="post">

                        <div class="form-group">
                            <label class="form-label-group" for="event_id">Event Name</label>
                            <%--<input class="form-control" placeholder="Enter Event Name" id="e_type" name="e_type" type="">--%>
                            <select class="form-control" name="event_id" id="event_id">
                                <option value="">None</option>
                                <%
                                    try(Connection connection = DatabaseConnection.getConnection()){

                                        //language=MySQL
                                        String sql = "SELECT * FROM EVENT where start_date > CURDATE()";
                                        ResultSet set = DatabaseConnection.getResultSet(connection, sql);
                                        while(set.next()){
                                            Event e = Event.getFromSet(set);

                                            //   session.setAttribute("EventId", set.getInt(1));

                                %>
                                <option value="<%=e.getEvent_id()%>"><%=e.getEvent_name()%></option>
                                <%
                                        }
                                    }catch (SQLException | NullPointerException e){
                                        e.printStackTrace();
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-group">
                            <div class="form-label-group">
                                <input class="form-control" placeholder="Team Name" id="team_name" name="team_name" type="text" required="required" autofocus="autofocus">
                                <label for="team_name">Team Name</label>

                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-label-group">
                                <input class="form-control" placeholder="Team Name" id="points" name="points" type="text" required="required" autofocus="autofocus">
                                <label for="points">Points</label>

                            </div>
                        </div>



                        <div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </form>

                </div>
                <div class="col-md-3 col-lg-3"></div>

            </div>


            <!-- Sticky Footer -->
            <footer class="sticky-footer">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright © PICT CSI</span>
                    </div>
                </div>
            </footer>
        </div>
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
<script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Page level plugin JavaScript-->
<%--<script src="../vendor/chart.js/Chart.min.js"></script>--%>
<script src="/vendor/datatables/jquery.dataTables.js"></script>
<script src="/vendor/datatables/dataTables.bootstrap4.js"></script>
<%--<script src="vendor/chart.js/Chart.min.js"></script>--%>


<!-- Custom scripts for all pages-->
<script src="/js/sb-admin.min.js"></script>
<script src="js/main.js"></script>

<!-- Demo scripts for this page-->
<script src="js/demo/datatables-demo.js"></script>
<%--<script src="js/demo/chart-pie-demo.js"></script>--%>
<%--<script src="js/demo/chart-area-demo.js"></script>--%>

</body>

</html>
