<%@ page import="com.pictcsi.database.DatabaseConnection" %>
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

    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            background: #000;
            overflow: hidden;
        }

        .pyro > .before, .pyro > .after {
            position: absolute;
            width: 5px;
            height: 5px;
            border-radius: 50%;
            box-shadow: 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff;
            -moz-animation: 1s bang ease-out infinite backwards, 1s gravity ease-in infinite backwards, 5s position linear infinite backwards;
            -webkit-animation: 1s bang ease-out infinite backwards, 1s gravity ease-in infinite backwards, 5s position linear infinite backwards;
            -o-animation: 1s bang ease-out infinite backwards, 1s gravity ease-in infinite backwards, 5s position linear infinite backwards;
            -ms-animation: 1s bang ease-out infinite backwards, 1s gravity ease-in infinite backwards, 5s position linear infinite backwards;
            animation: 1s bang ease-out infinite backwards, 1s gravity ease-in infinite backwards, 5s position linear infinite backwards;
        }

        .pyro > .after {
            -moz-animation-delay: 1.25s, 1.25s, 1.25s;
            -webkit-animation-delay: 1.25s, 1.25s, 1.25s;
            -o-animation-delay: 1.25s, 1.25s, 1.25s;
            -ms-animation-delay: 1.25s, 1.25s, 1.25s;
            animation-delay: 1.25s, 1.25s, 1.25s;
            -moz-animation-duration: 1.25s, 1.25s, 6.25s;
            -webkit-animation-duration: 1.25s, 1.25s, 6.25s;
            -o-animation-duration: 1.25s, 1.25s, 6.25s;
            -ms-animation-duration: 1.25s, 1.25s, 6.25s;
            animation-duration: 1.25s, 1.25s, 6.25s;
        }

        @-webkit-keyframes bang {
            to {
                box-shadow: 222px -48.6666666667px #00f2ff, -144px -252.6666666667px #00ffb7, 85px -228.6666666667px deepskyblue, 33px -195.6666666667px #0095ff, 4px -110.6666666667px #00aeff, -82px -79.6666666667px #bbff00, 205px -321.6666666667px #9100ff, -31px -234.6666666667px #00d0ff, -143px -145.6666666667px #0900ff, 234px -171.6666666667px #ff9500, -140px -130.6666666667px #1e00ff, 207px 60.3333333333px #ff0051, -151px 70.3333333333px #ff1100, 128px -259.6666666667px #6fff00, 124px -221.6666666667px #ffd500, 111px -302.6666666667px #5900ff, 232px -396.6666666667px #2fff00, -206px -331.6666666667px #0091ff, -37px -260.6666666667px #0033ff, 141px 22.3333333333px #e1ff00, -52px -355.6666666667px #ff8400, 116px -111.6666666667px #ff0033, 8px -263.6666666667px #0011ff, 72px -302.6666666667px #c4ff00, -64px 82.3333333333px #00ffb7, 47px -142.6666666667px #b7ff00, 101px -302.6666666667px #00ffcc, 124px -104.6666666667px #ff6200, 220px -283.6666666667px #00ff95, 132px -268.6666666667px #55ff00, 101px 45.3333333333px #5500ff, 58px -275.6666666667px #a600ff, 207px -285.6666666667px #ff00ee, 55px -392.6666666667px #ff00e6, -204px -67.6666666667px #ae00ff, -150px -317.6666666667px #51ff00, -115px -282.6666666667px #0084ff, 127px -353.6666666667px #ff00d5, -77px -161.6666666667px #ff0095, 116px 70.3333333333px #ff005e, -114px -407.6666666667px #00ff40, 80px -38.6666666667px #00ffa2, -229px -394.6666666667px #eaff00, -175px -177.6666666667px #ff009d, -121px -278.6666666667px #ff0080, 176px -148.6666666667px #00bbff, -226px -19.6666666667px #00ff09, 105px -140.6666666667px #002fff, 124px -39.6666666667px #22ff00, 130px -235.6666666667px #00d9ff, 130px -86.6666666667px #aeff00;
            }
        }
        @-moz-keyframes bang {
            to {
                box-shadow: 222px -48.6666666667px #00f2ff, -144px -252.6666666667px #00ffb7, 85px -228.6666666667px deepskyblue, 33px -195.6666666667px #0095ff, 4px -110.6666666667px #00aeff, -82px -79.6666666667px #bbff00, 205px -321.6666666667px #9100ff, -31px -234.6666666667px #00d0ff, -143px -145.6666666667px #0900ff, 234px -171.6666666667px #ff9500, -140px -130.6666666667px #1e00ff, 207px 60.3333333333px #ff0051, -151px 70.3333333333px #ff1100, 128px -259.6666666667px #6fff00, 124px -221.6666666667px #ffd500, 111px -302.6666666667px #5900ff, 232px -396.6666666667px #2fff00, -206px -331.6666666667px #0091ff, -37px -260.6666666667px #0033ff, 141px 22.3333333333px #e1ff00, -52px -355.6666666667px #ff8400, 116px -111.6666666667px #ff0033, 8px -263.6666666667px #0011ff, 72px -302.6666666667px #c4ff00, -64px 82.3333333333px #00ffb7, 47px -142.6666666667px #b7ff00, 101px -302.6666666667px #00ffcc, 124px -104.6666666667px #ff6200, 220px -283.6666666667px #00ff95, 132px -268.6666666667px #55ff00, 101px 45.3333333333px #5500ff, 58px -275.6666666667px #a600ff, 207px -285.6666666667px #ff00ee, 55px -392.6666666667px #ff00e6, -204px -67.6666666667px #ae00ff, -150px -317.6666666667px #51ff00, -115px -282.6666666667px #0084ff, 127px -353.6666666667px #ff00d5, -77px -161.6666666667px #ff0095, 116px 70.3333333333px #ff005e, -114px -407.6666666667px #00ff40, 80px -38.6666666667px #00ffa2, -229px -394.6666666667px #eaff00, -175px -177.6666666667px #ff009d, -121px -278.6666666667px #ff0080, 176px -148.6666666667px #00bbff, -226px -19.6666666667px #00ff09, 105px -140.6666666667px #002fff, 124px -39.6666666667px #22ff00, 130px -235.6666666667px #00d9ff, 130px -86.6666666667px #aeff00;
            }
        }
        @-o-keyframes bang {
            to {
                box-shadow: 222px -48.6666666667px #00f2ff, -144px -252.6666666667px #00ffb7, 85px -228.6666666667px deepskyblue, 33px -195.6666666667px #0095ff, 4px -110.6666666667px #00aeff, -82px -79.6666666667px #bbff00, 205px -321.6666666667px #9100ff, -31px -234.6666666667px #00d0ff, -143px -145.6666666667px #0900ff, 234px -171.6666666667px #ff9500, -140px -130.6666666667px #1e00ff, 207px 60.3333333333px #ff0051, -151px 70.3333333333px #ff1100, 128px -259.6666666667px #6fff00, 124px -221.6666666667px #ffd500, 111px -302.6666666667px #5900ff, 232px -396.6666666667px #2fff00, -206px -331.6666666667px #0091ff, -37px -260.6666666667px #0033ff, 141px 22.3333333333px #e1ff00, -52px -355.6666666667px #ff8400, 116px -111.6666666667px #ff0033, 8px -263.6666666667px #0011ff, 72px -302.6666666667px #c4ff00, -64px 82.3333333333px #00ffb7, 47px -142.6666666667px #b7ff00, 101px -302.6666666667px #00ffcc, 124px -104.6666666667px #ff6200, 220px -283.6666666667px #00ff95, 132px -268.6666666667px #55ff00, 101px 45.3333333333px #5500ff, 58px -275.6666666667px #a600ff, 207px -285.6666666667px #ff00ee, 55px -392.6666666667px #ff00e6, -204px -67.6666666667px #ae00ff, -150px -317.6666666667px #51ff00, -115px -282.6666666667px #0084ff, 127px -353.6666666667px #ff00d5, -77px -161.6666666667px #ff0095, 116px 70.3333333333px #ff005e, -114px -407.6666666667px #00ff40, 80px -38.6666666667px #00ffa2, -229px -394.6666666667px #eaff00, -175px -177.6666666667px #ff009d, -121px -278.6666666667px #ff0080, 176px -148.6666666667px #00bbff, -226px -19.6666666667px #00ff09, 105px -140.6666666667px #002fff, 124px -39.6666666667px #22ff00, 130px -235.6666666667px #00d9ff, 130px -86.6666666667px #aeff00;
            }
        }
        @-ms-keyframes bang {
            to {
                box-shadow: 222px -48.6666666667px #00f2ff, -144px -252.6666666667px #00ffb7, 85px -228.6666666667px deepskyblue, 33px -195.6666666667px #0095ff, 4px -110.6666666667px #00aeff, -82px -79.6666666667px #bbff00, 205px -321.6666666667px #9100ff, -31px -234.6666666667px #00d0ff, -143px -145.6666666667px #0900ff, 234px -171.6666666667px #ff9500, -140px -130.6666666667px #1e00ff, 207px 60.3333333333px #ff0051, -151px 70.3333333333px #ff1100, 128px -259.6666666667px #6fff00, 124px -221.6666666667px #ffd500, 111px -302.6666666667px #5900ff, 232px -396.6666666667px #2fff00, -206px -331.6666666667px #0091ff, -37px -260.6666666667px #0033ff, 141px 22.3333333333px #e1ff00, -52px -355.6666666667px #ff8400, 116px -111.6666666667px #ff0033, 8px -263.6666666667px #0011ff, 72px -302.6666666667px #c4ff00, -64px 82.3333333333px #00ffb7, 47px -142.6666666667px #b7ff00, 101px -302.6666666667px #00ffcc, 124px -104.6666666667px #ff6200, 220px -283.6666666667px #00ff95, 132px -268.6666666667px #55ff00, 101px 45.3333333333px #5500ff, 58px -275.6666666667px #a600ff, 207px -285.6666666667px #ff00ee, 55px -392.6666666667px #ff00e6, -204px -67.6666666667px #ae00ff, -150px -317.6666666667px #51ff00, -115px -282.6666666667px #0084ff, 127px -353.6666666667px #ff00d5, -77px -161.6666666667px #ff0095, 116px 70.3333333333px #ff005e, -114px -407.6666666667px #00ff40, 80px -38.6666666667px #00ffa2, -229px -394.6666666667px #eaff00, -175px -177.6666666667px #ff009d, -121px -278.6666666667px #ff0080, 176px -148.6666666667px #00bbff, -226px -19.6666666667px #00ff09, 105px -140.6666666667px #002fff, 124px -39.6666666667px #22ff00, 130px -235.6666666667px #00d9ff, 130px -86.6666666667px #aeff00;
            }
        }
        @keyframes bang {
            to {
                box-shadow: 222px -48.6666666667px #00f2ff, -144px -252.6666666667px #00ffb7, 85px -228.6666666667px deepskyblue, 33px -195.6666666667px #0095ff, 4px -110.6666666667px #00aeff, -82px -79.6666666667px #bbff00, 205px -321.6666666667px #9100ff, -31px -234.6666666667px #00d0ff, -143px -145.6666666667px #0900ff, 234px -171.6666666667px #ff9500, -140px -130.6666666667px #1e00ff, 207px 60.3333333333px #ff0051, -151px 70.3333333333px #ff1100, 128px -259.6666666667px #6fff00, 124px -221.6666666667px #ffd500, 111px -302.6666666667px #5900ff, 232px -396.6666666667px #2fff00, -206px -331.6666666667px #0091ff, -37px -260.6666666667px #0033ff, 141px 22.3333333333px #e1ff00, -52px -355.6666666667px #ff8400, 116px -111.6666666667px #ff0033, 8px -263.6666666667px #0011ff, 72px -302.6666666667px #c4ff00, -64px 82.3333333333px #00ffb7, 47px -142.6666666667px #b7ff00, 101px -302.6666666667px #00ffcc, 124px -104.6666666667px #ff6200, 220px -283.6666666667px #00ff95, 132px -268.6666666667px #55ff00, 101px 45.3333333333px #5500ff, 58px -275.6666666667px #a600ff, 207px -285.6666666667px #ff00ee, 55px -392.6666666667px #ff00e6, -204px -67.6666666667px #ae00ff, -150px -317.6666666667px #51ff00, -115px -282.6666666667px #0084ff, 127px -353.6666666667px #ff00d5, -77px -161.6666666667px #ff0095, 116px 70.3333333333px #ff005e, -114px -407.6666666667px #00ff40, 80px -38.6666666667px #00ffa2, -229px -394.6666666667px #eaff00, -175px -177.6666666667px #ff009d, -121px -278.6666666667px #ff0080, 176px -148.6666666667px #00bbff, -226px -19.6666666667px #00ff09, 105px -140.6666666667px #002fff, 124px -39.6666666667px #22ff00, 130px -235.6666666667px #00d9ff, 130px -86.6666666667px #aeff00;
            }
        }
        @-webkit-keyframes gravity {
            to {
                transform: translateY(200px);
                -moz-transform: translateY(200px);
                -webkit-transform: translateY(200px);
                -o-transform: translateY(200px);
                -ms-transform: translateY(200px);
                opacity: 0;
            }
        }
        @-moz-keyframes gravity {
            to {
                transform: translateY(200px);
                -moz-transform: translateY(200px);
                -webkit-transform: translateY(200px);
                -o-transform: translateY(200px);
                -ms-transform: translateY(200px);
                opacity: 0;
            }
        }
        @-o-keyframes gravity {
            to {
                transform: translateY(200px);
                -moz-transform: translateY(200px);
                -webkit-transform: translateY(200px);
                -o-transform: translateY(200px);
                -ms-transform: translateY(200px);
                opacity: 0;
            }
        }
        @-ms-keyframes gravity {
            to {
                transform: translateY(200px);
                -moz-transform: translateY(200px);
                -webkit-transform: translateY(200px);
                -o-transform: translateY(200px);
                -ms-transform: translateY(200px);
                opacity: 0;
            }
        }
        @keyframes gravity {
            to {
                transform: translateY(200px);
                -moz-transform: translateY(200px);
                -webkit-transform: translateY(200px);
                -o-transform: translateY(200px);
                -ms-transform: translateY(200px);
                opacity: 0;
            }
        }
        @-webkit-keyframes position {
            0%, 19.9% {
                margin-top: 10%;
                margin-left: 40%;
            }
            20%, 39.9% {
                margin-top: 40%;
                margin-left: 30%;
            }
            40%, 59.9% {
                margin-top: 20%;
                margin-left: 70%;
            }
            60%, 79.9% {
                margin-top: 30%;
                margin-left: 20%;
            }
            80%, 99.9% {
                margin-top: 30%;
                margin-left: 80%;
            }
        }
        @-moz-keyframes position {
            0%, 19.9% {
                margin-top: 10%;
                margin-left: 40%;
            }
            20%, 39.9% {
                margin-top: 40%;
                margin-left: 30%;
            }
            40%, 59.9% {
                margin-top: 20%;
                margin-left: 70%;
            }
            60%, 79.9% {
                margin-top: 30%;
                margin-left: 20%;
            }
            80%, 99.9% {
                margin-top: 30%;
                margin-left: 80%;
            }
        }
        @-o-keyframes position {
            0%, 19.9% {
                margin-top: 10%;
                margin-left: 40%;
            }
            20%, 39.9% {
                margin-top: 40%;
                margin-left: 30%;
            }
            40%, 59.9% {
                margin-top: 20%;
                margin-left: 70%;
            }
            60%, 79.9% {
                margin-top: 30%;
                margin-left: 20%;
            }
            80%, 99.9% {
                margin-top: 30%;
                margin-left: 80%;
            }
        }
        @-ms-keyframes position {
            0%, 19.9% {
                margin-top: 10%;
                margin-left: 40%;
            }
            20%, 39.9% {
                margin-top: 40%;
                margin-left: 30%;
            }
            40%, 59.9% {
                margin-top: 20%;
                margin-left: 70%;
            }
            60%, 79.9% {
                margin-top: 30%;
                margin-left: 20%;
            }
            80%, 99.9% {
                margin-top: 30%;
                margin-left: 80%;
            }
        }
        @keyframes position {
            0%, 19.9% {
                margin-top: 10%;
                margin-left: 40%;
            }
            20%, 39.9% {
                margin-top: 40%;
                margin-left: 30%;
            }
            40%, 59.9% {
                margin-top: 20%;
                margin-left: 70%;
            }
            60%, 79.9% {
                margin-top: 30%;
                margin-left: 20%;
            }
            80%, 99.9% {
                margin-top: 30%;
                margin-left: 80%;
            }
        }


    </style>
</head>

<body id="page-top">

<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="../index.jsp">CSI Volunteer</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
        <i class="fas fa-bars"></i>
    </button>


</nav>

<div id="wrapper">
    <div class="pyro">
        <div class="before"></div>
        <div class="after"></div>
    </div>
    <jsp:include page="sidebar.jsp"/>

    <div id="content-wrapper">
        <div class="container-fluid">
            <%--<%--%>
            <%--String error = (String) request.getSession().getAttribute("Error");--%>
            <%--if(error != null){--%>
            <%--%>--%>
            <%--<h4><%=error%></h4>--%>

            <%--<%--%>

            <%--request.getSession().setAttribute("Error", null);--%>
            <%--}--%>
            <%--%>--%>
            <%--<br>--%>

            <div class="row mt-5">
                <div class="col-md-3 col-lg-4 col-sm-12"></div>
                <%
                    try (Connection connection = DatabaseConnection.getConnection()) {

                        //language=MySQL
                        String sql = "SELECT WEB_USER.*, count(ER.id) as reg_count from WEB_USER " +
                                "left join EVENT_REG ER on WEB_USER.user_id = ER.volunteer_id and has_paid = 1 group by WEB_USER.user_id " +
                                "having user_type='VOLUNTEER' order by reg_count desc limit 3";

                        ResultSet usersSet = DatabaseConnection.getResultSet(connection, sql);
                %>
                <!-- DataTables Example -->

                <div class="card mb-3 col-lg-4 col-md-6 col-sm-12" id="user_table">
                    <div class="card-header">
                        <i class="fas fa-table"></i>
                        Leader Board
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable2" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <td>Rank</td>
                                    <td>Name</td>
                                    <td>Registrations</td>

                                </tr>
                                </thead>

                                <tbody>
                                <%
                                    int i = 1;
                                    while (usersSet.next()) {
//                                    Event event = Event.getFromSet(usersSet);
                                %>
                                <tr>
                                    <td><%=i++%>
                                    </td>
                                    <td><%=usersSet.getString("first_name")%>
                                    </td>
                                    <td><%=usersSet.getInt("reg_count")%>
                                    </td>
                                </tr>
                                <%
                                    }

                                %>

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <%--<div class="card-footer small text-muted">Updated today at <%=d.getHours()%>--%>
                    <%--:<%=d.getMinutes()%> Hrs--%>
                    <%--</div>--%>
                </div>
                <%
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                %>
                <div class="col-md-3 col-sm-12"></div>

            </div>

            <%--<table>--%>

            <%--<thead>--%>
            <%--<tr>--%>
            <%--<td>Rank</td>--%>
            <%--<td>Name</td>--%>
            <%--<td>Registrations</td>--%>
            <%--</tr>--%>
            <%--</thead>--%>
            <%--<tbody>--%>

            <%--<%--%>
            <%--try(Connection connection = DatabaseConnection.getConnection()) {--%>
            <%--//language=MySQL--%>
            <%--String sql = "SELECT WEB_USER.*, count(ER.id) as reg_count from WEB_USER\n" +--%>
            <%--"left join EVENT_REG ER on WEB_USER.user_id = ER.volunteer_id group by WEB_USER.user_id\n" +--%>
            <%--"having user_type='VOLUNTEER' OR user_type='ADMIN' order by reg_count limit 3";--%>

            <%--Statement statement = DatabaseConnection.getStatement(connection);--%>

            <%--ResultSet resultSet = statement.executeQuery(sql);--%>
            <%--int i = 0;--%>
            <%--while(resultSet.next()){--%>

            <%--%>--%>


            <%--<tr>--%>
            <%--<td><%=i++%></td>--%>
            <%--<td><%=resultSet.getInt("first_name")%></td>--%>
            <%--<td><%=resultSet.getString("reg_count")%></td>--%>
            <%--</tr>--%>


            <%--<%--%>

            <%--}--%>
            <%--}catch (SQLException e){--%>
            <%--e.printStackTrace();--%>
            <%--}--%>
            <%--%>--%>
            <%--</tbody>--%>
            <%--</table>--%>


            <%--<!-- /.content-wrapper -->--%>
            <%--<div class="row">--%>
            <%--<a class="btn btn-success" href="index.jsp">New Registration</a>--%>
            <%--</div>--%>
            <%--<div class="row">--%>
            <%--<a class="btn btn-danger" href="/logoutServlet">Logout</a>--%>
            <%--</div>--%>
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
