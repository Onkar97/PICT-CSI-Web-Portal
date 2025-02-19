<%--
  Created by IntelliJ IDEA.
  User: snehal
  Date: 13/10/18
  Time: 12:17 AM
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

    <title>CSI Volunteer | Done</title>

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


    <!-- Custom styles for this template-->


</head>

<body id="page-top">

<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="../index.jsp">CSI Volunteer</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
        <i class="fas fa-bars"></i>
    </button>



</nav>

<div id="wrapper">

    <jsp:include page="sidebar.jsp"/>

    <div id="content-wrapper">
        <div class="container-fluid">
            <%
                String error = (String) request.getSession().getAttribute("Error");
                if(error != null){
            %>
            <h4><%=error%></h4>

            <%

                    request.getSession().setAttribute("Error", null);
                }
            %>
            <br>
            <%--<%--%>
            <%--try(Connection connection = DatabaseConnection.getConnection()) {--%>
            <%--//language=MySQL--%>
            <%--String sql = "SELECT p.* FROM\n" +--%>
            <%--"                (SELECT WEB_USER.*, count(ER.id) as reg_count, @curRank := @curRank + 1 as c_rank from WEB_USER\n" +--%>
            <%--"                  left join EVENT_REG ER on WEB_USER.user_id = ER.volunteer_id group by WEB_USER.user_id\n" +--%>
            <%--"                  having user_type='VOLUNTEER' OR user_type='ADMIN') p,\n" +--%>
            <%--"                (SELECT @curRank := 0) q where" +--%>
            <%--" user_id = ? order by p.reg_count desc ;";--%>

            <%--PreparedStatement statement = DatabaseConnection.getPreparedStatement(connection, sql);--%>
            <%--int user_id = (int) request.getSession().getAttribute("user_id");--%>
            <%--statement.setInt(1,user_id );--%>

            <%--ResultSet resultSet = statement.executeQuery();--%>
            <%--if(resultSet.next()){--%>
            <%--int c_rank = resultSet.getInt("c_rank");--%>
            <%--%>--%>
            <%--Your current rank is :<%=c_rank%>--%>
            <%--<br>--%>
            <%--Registrations:<%=resultSet.getInt("reg_count")%>--%>
            <%--<%--%>

            <%--}--%>
            <%--}catch (SQLException e){--%>
            <%--e.printStackTrace();--%>
            <%--}--%>
            <%--%>--%>



            <!-- /.content-wrapper -->
            <div class="row">
                <a class="btn btn-success" href="index.jsp">New Registration</a>
            </div>
            <div class="row">
                <a class="btn btn-danger" href="/logoutServlet">Logout</a>
            </div>

        </div>


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
