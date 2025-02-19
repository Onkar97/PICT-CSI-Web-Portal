<%@ page import="com.pictcsi.database.DatabaseConnection" %>
<%@ page import="com.pictcsi.models.EventJoinReg" %>
<%@ page import="com.pictcsi.models.WebUser" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->

    <title>PICT CSI</title>

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link href="css/style.css" rel="stylesheet">

    <!-- Responsive CSS -->
    <link href="css/responsive/responsive.css" rel="stylesheet">
    <script>
        function checking() {
            var session = request.getSession(false);
            if (session.getAttribute("user_name") == null) {
                response.sendRedirect("index.jsp");
                return false;
            }
            return true;
        }
    </script>
</head>

<body>
<!-- Preloader -->
<div id="preloader">
    <div class="dorne-load"></div>
</div>

<!-- ***** Search Form Area ***** -->
<div class="dorne-search-form d-flex align-items-center">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="search-close-btn" id="closeBtn">
                    <i class="pe-7s-close-circle" aria-hidden="true"></i>
                </div>
                <form action="#" method="get">
                    <input type="search" name="caviarSearch" id="search"
                           placeholder="Search Your Desire Destinations or Events">
                    <input type="submit" class="d-none" value="submit">
                </form>
            </div>
        </div>
    </div>
</div>

<jsp:include page="navbar.jsp"/>

<!-- ***** Breadcumb Area Start ***** -->

<div class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/hero-1.jpg)"></div>
<!-- ***** Breadcumb Area End ***** -->
/
<!-- ***** Listing Destinations Area Start ***** -->
<section class="dorne-listing-destinations-area section-padding-100-50">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section-heading dark text-center">
                    <span></span>
                    <h4>My Registrations</h4>
                </div>
            </div>
        </div>
        <div class="row">
            <!-- Single Features Area -->
            <%
                try (Connection connection = DatabaseConnection.getConnection()){
                    WebUser user = null;

                    try {

                        int UserId= (int) request.getSession().getAttribute("user_id");
                        user = WebUser.getUserById(UserId);
//
//
//                        event.event_type=set.getString("event_type");
//                        event.event_name = set.getString("event_name");
//                        event.start_date = set.getDate("start_date");
//                        event.description = set.getString("description");R.participant_name,
//                        event.end_date = set.getDate("end_date");
//                        event.event_fee = set.getFloat("event_fee");
//                        event.likes = set.getInt("likes");
//
//                        //  event.reg_id = set.getInt("id");
//                        event.participant_name = set.getString("participant_name");
//                        event.college_name = set.getString("college_name");
//                        event.group_t = set.getString("group_t");
//                        event.category = set.getString("category");
//                        event.user_id = set.getInt("user_id");
//                        event.has_paid = set.getBoolean("has_paid");

                        String sql = "SELECT * FROM MY_REGISTRATIONS where user_id =" + UserId + ";";
                        ResultSet set = DatabaseConnection.getResultSet(connection, sql);
                        while(set.next()){
                            EventJoinReg e = EventJoinReg.getFromSet(set);

            %>

            <div class="col-12 col-sm-12 col-lg-12">

                <div class="single-features-area mb-50">
                    <!-- Price -->
                    <div class="feature-content d-flex align-items-center justify-content-between">
                        <div class="feature-title">
                            <h4><%=e.getEvent_name()%> </h4>
                            <h6>Event type:&nbsp;&nbsp;&nbsp;<%=e.getEvent_type()%><br>
                                Group:&nbsp;&nbsp;&nbsp;<%=e.getGroup_t()%><br>
                                College:&nbsp;&nbsp;&nbsp;<%=e.getCollege_name()%><br>
                                Paid:&nbsp;&nbsp;&nbsp;<%=e.isHas_paid()%></h6>
                        </div>
                    </div>
                </div>


            </div>

            <%
                        }

                    }
                    catch (NullPointerException ex){

                    }
                }catch (SQLException | NullPointerException e){
                    e.printStackTrace();
                }
            %>

        </div>
    </div>
</section>
<!-- ***** Listing Destinations Area End ***** -->
<!-- ***** Listing Destinations Area End ***** -->

<!-- ****** Footer Area Start ****** -->
<jsp:include page="footer.jsp"/>
<!-- ****** Footer Area End ****** -->

<!-- jQuery-2.2.4 js -->
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<!-- Popper js -->
<script src="js/bootstrap/popper.min.js"></script>
<!-- Bootstrap-4 js -->
<script src="js/bootstrap/bootstrap.min.js"></script>
<!-- All Plugins js -->
<script src="js/others/plugins.js"></script>
<!-- Active JS -->
<script src="js/active.js"></script>
</body>

</html>