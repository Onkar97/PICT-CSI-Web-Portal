<%@ page import="com.pictcsi.database.DatabaseConnection" %>
<%@ page import="com.pictcsi.models.Event" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
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


    <!-- Custom styles for this template-->

    <script>
        function changeParticipants(a){
            var $val = $(a).val();

            var i;

            $("#idphone2").hide();


            for(i = 2; i <=4 ; i++){
                $("#idname" + i).hide();
            }

            for(i = 2; i <=$val; i++){
                if(i === 2) {
                    $("#idphone2").show();
                }
                $("#idname" + i).show();
            }

        }

    </script>


</head>

<body id="page-top">

<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="#">Dashboard | CSI Volunteer</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
        <i class="fas fa-bars"></i>
    </button>

    <%--<!-- Navbar Search -->--%>
    <%--<form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">--%>
    <%--<div class="input-group">--%>
    <%--<input type="text" class="form-control" placeholder="Search for..." aria-label="Search"--%>
    <%--aria-describedby="basic-addon2">--%>
    <%--<div class="input-group-append">--%>
    <%--<button class="btn btn-primary" type="button">--%>
    <%--<i class="fas fa-search"></i>--%>
    <%--</button>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</form>--%>



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


                    <form action="registerForEvent" id="addEventForm" method="post">

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
                                <input class="form-control" placeholder="Enter Event Name" id="email_id" name="email_id" type="email" required="required" autofocus="autofocus">
                                <label for="email_id">Email ID</label>

                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-label-group">
                                <input class="form-control" placeholder="Enter Event Name" id="ph_no" name="ph_no" type="text" required="required" autofocus="autofocus">
                                <label for="ph_no">Phone No.</label>

                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-label-group">
                                <input class="form-control" placeholder="Enter Event Name" id="f_name" name="f_name" type="text" required="required" autofocus="autofocus">
                                <label for="f_name">First Name of 1st Participant</label>

                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-label-group">
                                <input class="form-control" placeholder="Enter Event Name" id="l_name" name="l_name" type="text" required="required" autofocus="autofocus">
                                <label for="l_name">Last Name 1st Participant</label>

                            </div>
                        </div>

                        <div class="form-group">
                            <div class="form-label-group">
                                <input class="form-control" placeholder="Enter Event Name" id="college_name" name="college_name" type="text" required="required" autofocus="autofocus">
                                <label for="college_name">College Name</label>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="form-label-group">
                                <input class="form-control" id="no_of_participants" name="no_of_participants" type="number" required="required" autofocus="autofocus" min="1" max="4" value="1" onchange="changeParticipants(this)">
                                <label for="no_of_participants">Number of Participants in this group</label>
                            </div>
                        </div>

                        <div class="form-group" id="idname2"  style="display: none;">
                            <div class="form-label-group">
                                <input class="form-control" id="name2" name="name2" type="text"  autofocus="autofocus">
                                <label for="name2">Second Participant Name</label>

                            </div>
                        </div>
                        <div class="form-group" id="idphone2"  style="display: none;">
                            <div class="form-label-group" >
                                <input class="form-control" placeholder="Enter Event Name" id="phone2" name="phone2" type="text" autofocus="autofocus">
                                <label for="phone2">Phone of 2nd Participant</label>

                            </div>
                        </div>
                        <div class="form-group" id="idname3"  style="display: none;">
                            <div class="form-label-group">
                                <input class="form-control" id="name3" name="name3" type="text" autofocus="autofocus">
                                <label for="name3">Third Participant Name</label>

                            </div>
                        </div>
                        <div class="form-group" id="idname4"  style="display: none;">
                            <div class="form-label-group">
                                <input class="form-control" id="name4" name="name4" type="text" autofocus="autofocus">
                                <label for="name4">Fourth Participant Name</label>

                            </div>
                        </div>




                        <div class="form-group">
                            <label class="form-label-group" for="branch">Branch</label>
                            <%--<input class="form-control" placeholder="Enter Event Name" id="e_type" name="e_type" type="">--%>
                            <select class="form-control" name="branch" id="branch">
                                <option value="">Select One</option>
                                <option>IT</option>
                                <option>EnTC</option>
                                <option>Comp</option>
                                <option>Other</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="form-label-group" for="year">Year</label>
                            <%--<input class="form-control" placeholder="Enter Event Name" id="e_type" name="e_type" type="">--%>
                            <select class="form-control" name="year" id="year">
                                <option value="">Select One</option>
                                <option value="1">FE</option>
                                <option value="2">SE</option>
                                <option value="3">TE</option>
                                <option value="4">BE</option>
                            </select>
                        </div>

                        <%--<div class="form-group">--%>
                        <%--<label class="form-label-group" for="year">Year</label>--%>
                        <%--&lt;%&ndash;<input class="form-control" placeholder="Enter Event Name" id="e_type" name="e_type" type="">&ndash;%&gt;--%>
                        <%--<select class="form-control" name="year" id="year">--%>
                        <%--<option value="">Select One</option>--%>

                        <%--</select>--%>
                        <%--</div>--%>
                        <%--<h4>Payment S</h4>--%>
                        <div class="form-group ml-2">
                            <h4>Summary</h4>
                            <div class="row">
                                Event Name:-  <p class="event_name"></p>
                            </div>
                            <div class="row">
                                <p>Event Fees:-  </p> <p class="event_fees"></p>
                            </div>
                            <div class="row">
                                <p>Amount to be collected:- </p><h3 class="total_fees"></h3>
                            </div>
                            <p>Please collect the amount in full</p>
                        </div>



                        <div class="form-group">
                            <label class="form-label-group" for="year">Payment</label>
                            <%--<input class="form-control" placeholder="Enter Event Name" id="e_type" name="e_type" type="">--%>
                            <%--<select class="form-control" name="year" id="year">--%>
                            <%--<option>Select One</option>--%>
                            <%--<option value="1">FE</option>--%>
                            <%--<option value="2">SE</option>--%>
                            <%--<option value="3">TE</option>--%>
                            <%--<option value="4">BE</option>--%>
                            <%--</select>--%>
                            <br>
                            <input type="radio" name="payment_status" value="0" checked> Not Paid<br>
                            <input type="radio" name="payment_status" value="1"> Paid<br>

                        </div>

                        <div class="form-group">
                            <div class="form-label-group">
                                <input class="form-control" placeholder="Enter Event Name" id="payment_details" name="payment_details" type="text" required="required" autofocus="autofocus">
                                <label for="payment_details">Details</label>
                            </div>
                        </div>

                        <div>
                            <button type="submit" class="btn btn-primary">Register</button>
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
