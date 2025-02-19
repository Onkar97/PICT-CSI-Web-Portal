<%@ page import="com.pictcsi.database.DatabaseConnection" %>
<%@ page import="com.pictcsi.models.Event" %>
<%@ page import="com.pictcsi.models.NewsFeed" %>
<%@ page import="com.pictcsi.models.WebUser" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<%
    int user_count = 0;
    int event_count = 0;
    int entries_count = 0;
    int csi_count = 0;

    String statSql = "SELECT * FROM stats where type = ?";

    try (Connection connection = DatabaseConnection.getConnection()) {


        PreparedStatement statement = DatabaseConnection.getPreparedStatement(connection, statSql);
        statement.setString(1, "user_count");
        ResultSet set = statement.executeQuery();
        if (set.next()) {
            user_count = set.getInt(2);
        }

        statement.setString(1, "event_count");
        set = statement.executeQuery();
        if (set.next()) {
            event_count = set.getInt(2);
        }

        statement.setString(1, "entries_count");
        set = statement.executeQuery();
        if (set.next()) {
            entries_count = set.getInt(2);
        }

        statement.setString(1, "csi_count");
        set = statement.executeQuery();
        if (set.next()) {
            csi_count = set.getInt(2);
        }
    }catch (SQLException e){
        e.printStackTrace();
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
    <jsp:include page="/admin/header.jsp"/>
    <!-- Page level plugin CSS-->
    <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">


    <!-- Custom styles for this template-->


</head>

<body id="page-top">

<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="index.jsp">CSI Admin</a>

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

        <div class="container-fluid">

            <%
                String error = (String) request.getSession().getAttribute("error");

                if(error != null){
            %>
            <div id="error_header" class="alert alert-success">
                <strong>INFO:</strong><%=error%>
            </div>
            <script>

                setInterval(function () {
                    $("#error_header").hide();
                }, 5000);
            </script>
            <%
                    request.getSession().setAttribute("error", null);
                }
            %>

            <!-- Breadcrumbs-->
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="#">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">Overview</li>
            </ol>



            <!-- Icon Cards-->
            <div class="row">
                <div class="col-xl-3 col-sm-6 mb-3">
                    <div class="card text-white bg-primary o-hidden h-100">
                        <div class="card-body">
                            <div class="card-body-icon">
                                <i class="fas fa-fw fa-comments"></i>
                            </div>
                            <div class="mr-5"><%=user_count%> users are registered!</div>
                        </div>
                        <a class="card-footer text-white clearfix small z-1" href="#user_table">
                            <span class="float-left">View Details</span>
                            <span class="float-right">
                    <i class="fas fa-angle-right"></i>
                  </span>
                        </a>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 mb-3">
                    <div class="card text-white bg-warning o-hidden h-100">
                        <div class="card-body">
                            <div class="card-body-icon">
                                <i class="fas fa-fw fa-list"></i>
                            </div>
                            <div class="mr-5"><%=event_count%> events registered so far!</div>
                        </div>
                        <a class="card-footer text-white clearfix small z-1" href="#dataTable3">
                            <span class="float-left">View Details</span>
                            <span class="float-right">
                    <i class="fas fa-angle-right"></i>
                  </span>
                        </a>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 mb-3">
                    <div class="card text-white bg-success o-hidden h-100">
                        <div class="card-body">
                            <div class="card-body-icon">
                                <i class="fas fa-fw fa-shopping-cart"></i>
                            </div>
                            <div class="mr-5"><%=entries_count%> total participants!</div>
                        </div>
                        <a class="card-footer text-white clearfix small z-1" href="#">
                            <span class="float-left">View Details</span>
                            <span class="float-right">
                    <i class="fas fa-angle-right"></i>
                  </span>
                        </a>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 mb-3">
                    <div class="card text-white bg-danger o-hidden h-100">
                        <div class="card-body">
                            <div class="card-body-icon">
                                <i class="fas fa-fw fa-life-ring"></i>
                            </div>
                            <div class="mr-5"><%=csi_count%> CSI Members Registered</div>
                        </div>
                        <a class="card-footer text-white clearfix small z-1" href="#">
                            <span class="float-left">View Details</span>
                            <span class="float-right">
                    <i class="fas fa-angle-right"></i>
                  </span>
                        </a>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-4">
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fas fa-chart-pie"></i>
                            Event Response Chart</div>
                        <div class="card-body">
                            <canvas id="myPieChart" width="100%" height="100"></canvas>
                        </div>
                        <div class="card-footer small text-muted">Updated today at <% Date d = new Date();%><%=d.getHours()%>
                            :<%=d.getMinutes()%> Hrs</div>
                    </div>
                </div>

                <div class="col-lg-4">
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fas fa-chart-pie"></i>
                            College Wise Response chart</div>
                        <div class="card-body">
                            <canvas id="collegePieChart" width="100%" height="100"></canvas>
                        </div>
                        <div class="card-footer small text-muted">Updated today at <%=d.getHours()%>
                            :<%=d.getMinutes()%> Hrs</div>
                    </div>
                </div>

                <div class="col-lg-4">
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fas fa-chart-pie"></i>
                            Likes</div>
                        <div class="card-body">
                            <canvas id="likesPieChart" width="100%" height="100"></canvas>
                        </div>
                        <div class="card-footer small text-muted">Updated today at <%=d.getHours()%>
                            :<%=d.getMinutes()%> Hrs</div>
                    </div>
                </div>
            </div>
            <%
                try (Connection connection = DatabaseConnection.getConnection()){
                    String getUsers = "SELECT * FROM WEB_USER;";
                    ResultSet usersSet = DatabaseConnection.getResultSet(connection, getUsers);
            %>
            <!-- DataTables Example -->
            <div class="card mb-3" id="user_table">
                <div class="card-header">
                    <i class="fas fa-table"></i>
                    Registered Users
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
                            <thead>
                            <tr>
                                <th>No.</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Mobile</th>
                                <th>Year of Study</th>
                                <th>Reg Id</th>
                                <th>Branch</th>
                                <th>Ops</th>
                            </tr>
                            </thead>

                            <tbody>
                            <%
                                int i = 1;
                                while (usersSet.next()) {

                                    WebUser user = WebUser.getFromSet(usersSet);
                            %>
                            <tr>
                                <td><%=i++%>.</td>

                                <td><%=user.getFirst_name() + " " + user.getLast_name()%>
                                </td>
                                <td><%=user.getEmail_id()%>
                                </td>
                                <td><%=user.getMobile()%>
                                </td>
                                <td><%=user.getYear_of_study()%>
                                </td>
                                <td><%=user.getReg_id()%>
                                </td>
                                <td><%=user.getBranch()%>
                                </td>
                                <td>
                                    <%--<a  class="btn btn-success">Update</a>--%>
                                    <a data-user_id="<%=user.getUser_id()%>" onclick="changePasswordModal(this)" href="#" class="btn btn-info">Change Password</a>
                                    <a href="/admin/deleteUserServlet?user_id=<%=user.getUser_id()%>" class="btn btn-danger">Delete</a>
                                </td>
                            </tr>
                            <%
                                }

                            %>

                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="card-footer small text-muted">Updated today at <%=d.getHours()%>
                    :<%=d.getMinutes()%> Hrs
                </div>
            </div>
            <%
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            %>

            <%
                try (Connection connection = DatabaseConnection.getConnection()){
                    String getEvents = "SELECT * FROM EVENT";
                    ResultSet usersSet = DatabaseConnection.getResultSet(connection, getEvents);
            %>
            <!-- DataTables Example -->
            <div class="card mb-3" id="user_table">
                <div class="card-header">
                    <i class="fas fa-table"></i>
                    Registered Events
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable2" width="100%" cellspacing="0">
                            <thead>
                            <tr>
                                <th>No.</th>
                                <th>Name</th>
                                <th>Description</th>
                                <th>Start Date</th>
                                <th>End Date</th>
                                <th>Max Seats</th>

                                <th>Attendees</th>
                                <th>Likes</th>
                                <th>Ops</th>

                            </tr>
                            </thead>

                            <tbody>
                            <%
                                int i = 1;
                                while (usersSet.next()) {
                                    Event event = Event.getFromSet(usersSet);
                            %>
                            <tr>
                                <td><%=i++%>.</td>
                                <td><%=event.getEvent_name()%>
                                </td>
                                <td><%=event.getDescription()%>
                                </td>
                                <td><%=event.getStart_date()%>
                                </td>
                                <td><%=event.getEnd_date()%>
                                </td>
                                <td><%=event.getMax_seats()%>
                                </td>
                                <td><%=event.getAttendees()%>
                                </td>
                                <td><%=event.getLikes()%>
                                </td>
                                <td>
                                    <a href="event_details.jsp?event_id=<%=event.getEvent_id()%>" class="btn btn-info">Details</a>
                                    <%--<a href="updateEventServlet?event_id=<%=event.getEvent_id()%>"--%>
                                    <%--class="btn btn-success">Update</a>--%>
                                    <a href="deleteEventServlet?event_id=<%=event.getEvent_id()%>" class="btn btn-danger">Delete</a>
                                </td>
                            </tr>
                            <%
                                }

                            %>

                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="card-footer small text-muted">Updated today at <%=d.getHours()%>
                    :<%=d.getMinutes()%> Hrs
                </div>
            </div>
            <%
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            %>

            <%
                try (Connection connection = DatabaseConnection.getConnection()){
                    String getNews = "SELECT * FROM NEWS_FEED";
                    ResultSet newsSet = DatabaseConnection.getResultSet(connection, getNews);
            %>
            <!-- DataTables Example -->
            <div class="card mb-3" id="user_table">
                <div class="card-header">
                    <i class="fas fa-table"></i>
                    News Feed
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable3" width="100%" cellspacing="0">
                            <thead>
                            <tr>
                                <th>No.</th>
                                <th>Title</th>
                                <th>Description</th>
                                <th>Start Date</th>
                                <th>End Date</th>
                                <th>Ops</th>

                            </tr>
                            </thead>

                            <tbody>
                            <%
                                int i = 1;
                                while (newsSet.next()) {
                                    NewsFeed news = NewsFeed.getFromSet(newsSet);
                            %>
                            <tr>
                                <td><%=i++%>.</td>
                                <td><%=news.getTitle()%></td>
                                <td><%=news.getDescription()%></td>
                                <td><%=news.getStart_date()%></td>
                                <td><%=news.getEnd_date()%></td>

                                <td>
                                    <a href="deleteNewsServlet?id=<%=news.getId()%>"
                                       class="btn btn-success">Delete</a>
                                </td>
                            </tr>
                            <%
                                }

                            %>

                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="card-footer small text-muted">Updated today at <%=d.getHours()%>
                    :<%=d.getMinutes()%> Hrs
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


<script>

    $(function () {
        Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
        Chart.defaults.global.defaultFontColor = '#292b2c';
        <%
        try (Connection connection = DatabaseConnection.getConnection()){
            List<String> eventNames = new ArrayList<>();
            List<Integer> eventParticipants = new ArrayList<>();
            List<String> colors = new ArrayList<>();

            String[] colorsArray = {"#007bff", "#dc3545", "#ffc107", "#28a745"};

            //language=MySQL
                String sql = "SELECT a.event_id, event_name, count(b.event_id) as count FROM EVENT a join EVENT_REG b on a.event_id = b.event_id group by a.event_id, a.event_name";
                ResultSet events = DatabaseConnection.getResultSet(connection, sql);
                int x = 0;
                while (events.next()){

                    eventNames.add(events.getString(2));
                    eventParticipants.add(events.getInt(3));
                    colors.add(colorsArray[x%4]);
                    x++;
                }
        %>

        var nameLabels = [
            <%
                for(int i = 0; i < eventNames.size(); i++){
            %>
            '<%=eventNames.get(i)%>',
            <%
                }
            %>
        ];

        var participants = [
            <%
                for(int i = 0; i < eventParticipants.size(); i++){
            %>
            <%=eventParticipants.get(i)%>,
            <%
                }
            %>
        ];

        var colorsArray = [
            <%
                for(int i = 0; i < colors.size(); i++){
            %>
            '<%=colors.get(i)%>',
            <%
                }
            %>
        ];

        $(function () {


            // Pie Chart Example
            var ctx = document.getElementById("myPieChart");
            var myPieChart = new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: nameLabels,
                    datasets: [{
                        data: participants,
                        backgroundColor: colorsArray,
                    }],
                },
            });
        });



        <%
            }catch (SQLException e){
                e.printStackTrace();
            }
        %>

        <%
        try (Connection connection = DatabaseConnection.getConnection()){
            List<String> collegeNames = new ArrayList<>();
            List<Integer> eventParticipants = new ArrayList<>();
            List<String> colors = new ArrayList<>();

            String[] colorsArray = {"#007bff", "#dc3545", "#ffc107", "#28a745"};

            //language=MySQL
                String sql = "SELECT college_name, count(*) as count from EVENT_REG group by college_name";
                ResultSet events = DatabaseConnection.getResultSet(connection, sql);
                int x = 0;
                while (events.next()){

                    collegeNames.add(events.getString(1));
                    eventParticipants.add(events.getInt(2));
                    colors.add(colorsArray[x%4]);
                    x++;
                }
        %>

        var collegeNames = [
            <%
                for(int i = 0; i < collegeNames.size(); i++){
            %>
            '<%=collegeNames.get(i)%>',
            <%
                }
            %>
        ];

        var collegeParticipants = [
            <%
                for(int i = 0; i < eventParticipants.size(); i++){
            %>
            <%=eventParticipants.get(i)%>,
            <%
                }
            %>
        ];

        var colorsArrayCollege = [
            <%
                for(int i = 0; i < colors.size(); i++){
            %>
            '<%=colors.get(i)%>',
            <%
                }
            %>
        ];


        // Pie Chart Example
        var ctx = document.getElementById("collegePieChart");
        var myPieChart = new Chart(ctx, {
            type: 'pie',
            data: {
                labels: collegeNames,
                datasets: [{
                    data: collegeParticipants,
                    backgroundColor: colorsArrayCollege,
                }],
            },
        });




        <%
            }catch (SQLException e){
                e.printStackTrace();
            }
        %>

        <%
        try (Connection connection = DatabaseConnection.getConnection()){
            List<String> eventNames = new ArrayList<>();
            List<Integer> eventParticipants = new ArrayList<>();
            List<String> colors = new ArrayList<>();

            String[] colorsArray = {"#007bff", "#dc3545", "#ffc107", "#28a745"};

            //language=MySQL
                String sql = "SELECT event_name, likes FROM EVENT a";
                ResultSet events = DatabaseConnection.getResultSet(connection, sql);
                int x = 0;
                while (events.next()){

                    eventNames.add(events.getString(1));
                    eventParticipants.add(events.getInt(2));
                    colors.add(colorsArray[x%4]);
                    x++;
                }
        %>

        var eventNameLabels = [
            <%
                for(int i = 0; i < eventNames.size(); i++){
            %>
            '<%=eventNames.get(i)%>',
            <%
                }
            %>
        ];

        var eventLikes = [
            <%
                for(int i = 0; i < eventParticipants.size(); i++){
            %>
            <%=eventParticipants.get(i)%>,
            <%
                }
            %>
        ];

        var eventColorsArray = [
            <%
                for(int i = 0; i < colors.size(); i++){
            %>
            '<%=colors.get(i)%>',
            <%
                }
            %>
        ];

        $(function () {


            // Pie Chart Example
            var ctx = document.getElementById("likesPieChart");
            var myPieChart = new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: eventNameLabels,
                    datasets: [{
                        data: eventLikes,
                        backgroundColor: eventColorsArray,
                    }]
                }
            });
        });



        <%
            }catch (SQLException e){
                e.printStackTrace();
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
<script src="vendor/chart.js/Chart.min.js"></script>


<!-- Custom scripts for all pages-->
<script src="js/sb-admin.min.js"></script>

<!-- Demo scripts for this page-->
<script src="js/demo/datatables-demo.js"></script>
<%--<script src="js/demo/chart-pie-demo.js"></script>--%>
<%--<script src="js/demo/chart-area-demo.js"></script>--%>

</body>

</html>
