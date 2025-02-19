<%--
  Created by IntelliJ IDEA.
  User: snehal
  Date: 29/10/18
  Time: 12:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.mysql.jdbc.CallableStatement" %>
<%@ page import="com.pictcsi.database.DatabaseConnection" %>
<%@ page import="com.pictcsi.models.Event" %>
<%@ page import="com.pictcsi.models.WebUser" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Types" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <script src="https://unpkg.com/jspdf@latest/dist/jspdf.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>

    <jsp:include page="header.jsp"/>

</head>
<style>
    .ghost{

        display: none;
    }
</style>
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
                    <input type="search" name="caviarSearch" id="search" placeholder="Search Your  Events">
                    <input type="submit" class="d-none" value="submit">
                </form>
            </div>
        </div>
    </div>
</div>

<jsp:include page="navbar.jsp"/>

<!-- ***** Header Area Start ***** -->

<!-- ***** Header Area End ***** -->

<!-- ***** Breadcumb Area Start ***** -->
<%--<form action="/EventRegServlet" method="post">--%>
<%
    //Connection c = DatabaseConnection.getDatabaseConnection();

    //String sql = "SELECT event_name,description,image,start_date,end_date,event_fee FROM EVENT ORDER BY event_id DESC LIMIT 4";
    //int ID= (int) session.getAttribute("event_id");

    try (Connection connection = DatabaseConnection.getConnection()){

        String eid=request.getParameter("event_id");
        int ID =Integer.parseInt(eid);



        String sql = "SELECT * FROM EVENT WHERE  event_type = 'Seminar' AND event_id="+ID;
        ResultSet set = DatabaseConnection.getResultSet(connection, sql);
        WebUser user = null;
        if(set.next()){
            Event e = Event.getFromSet(set);
            try {

                int user_id = (int) request.getSession().getAttribute("user_id");
                user = WebUser.getUserById(user_id);
            }catch (NullPointerException ex){

            }
//            WebUser user= WebUser.getUserById(userID);

            request.setAttribute("EventID",e.getEvent_id());

%>
<%
    if(set.getBytes(5) != null){
%>


<%
    }
%>
<div class="breadcumb-area height-700 bg-img bg-overlay" style="background-image: url(img/bg-img/breadcumb.jpg)">
    <div class="container">
        <div class="row">
            <div class="col-12">
            </div>
        </div>
    </div>
</div>
<!-- ***** Breadcumb Area End ***** -->

<!-- ***** Single Listing Area Start ***** -->
<section class="dorne-single-listing-area section-padding-100">
    <div class="container">
        <div class="row justify-content-center">
            <!-- Single Listing Content -->


            <%--<%--%>
            <%--//Connection c = DatabaseConnection.getDatabaseConnection();--%>

            <%--//String sql = "SELECT event_name,description,image,start_date,end_date,event_fee FROM EVENT ORDER BY event_id DESC LIMIT 4";--%>
            <%--//int ID= (int) session.getAttribute("EventId");--%>
            <%--//--%>
            <%--//                    String eid=request.getParameter("EventId");--%>
            <%--//                    int ID =Integer.parseInt(eid);--%>



            <%--String sql = "SELECT event_name,start_date,max_seats,description,image,end_date,event_fee FROM EVENT WHERE event_id=1022";--%>
            <%--ResultSet set = DatabaseConnection.getResultSet(sql);--%>
            <%--while(set.next()){--%>
            <%--%>--%>
            <div class="col-12 col-lg-6">
                <div class="single-listing-content">

                    <div class="listing-title">
                        <h1><%=e.getEvent_name()%></h1>
                        <h6>START DATE ::<%=e.getStart_date()%> </h6>
                        <h6>END DATE ::<%=e.getEnd_date()%>  </h6>
                        <h6>Max Seats ::<%=e.getMax_seats()%>  </h6
                        <h6>Event Fees ::<%=e.getEvent_fee()%>  </h6>
                    </div>



                    <div class="overview-content mt-50" id="overview">
                        <p><%=e.getDescription()%></p>
                    </div>

                    <div class="location-on-map mt-50" id="lomap">
                        <h4>Location on map</h4>
                        <div class="location-map">
                            <div id="locationMap"></div>
                        </div>
                    </div>

                </div>
            </div>

            <!-- Listing Sidebar -->
            <div class="col-12 col-md-8 col-lg-6">
                <div class="listing-sidebar">

                    <!-- Book A Table Widget -->

                    <!-- Opening Hours Widget -->


                    <!-- Author Widget -->


                    <!-- Contact Form -->
                    <%
                        if(user != null){
                    %>
                    <div class="contact-form contact-form-widget mt-50" style="color: white">
                        <h6 style="color: white;align-content: center">Found it Interesting then</h6>
                        <h6 style="color: white;align-content: center">Register here</h6>
                        <form action="/EventRegServlet" method="post">
                            <input type="hidden"  name="EventID" value='<%=e.getEvent_id()%>'>
                            <div class="row">
                                <div class="col-12">
                                    Participant Name:
                                    <input type="text" name="participant_name" class="form-control" placeholder="Your Name" value='<%=user.getFirst_name() + " " + (user.getLast_name() != null ? user.getLast_name() : "")%>'>
                                </div>
                                <div class="col-12">
                                    Event Name:
                                    <input type="text" name="event_name" class="form-control" placeholder="Event Name" value='<%=e.getEvent_name()%>'>
                                </div>
                                <div class="col-12">
                                    Event Type:
                                    <input type="text" name="event_type" class="form-control" placeholder="Event Name" value='<%=e.getEvent_type()%>'>
                                </div>
                                <div class="col-12">
                                    Fees:
                                    <input type="text" name="fees_name" class="form-control" placeholder="Fees" value='<%=e.getEvent_fee()%>'>
                                </div>
                                <div class="col-12">
                                    Category:
                                    <div class="form-check">
                                        <label class="form-check-label">
                                            <input class="form-check-input" name="category" id="r1" value="junior" checked="" type="radio">
                                            Junior <span style="margin-left:70px;">
                                                 <input class="form-check-input" name="category" id="r2" value="senior" type="radio">
                                                  Senior
                                                  </span>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-12"></div>
                                <div class="col-12"></div>
                                <div class="col-12"></div>

                                <div class="col-12">&nbsp;</div>
                                <div class="col-3"></div>
                                <div class="col-6">
                                    <button type="submit" id="cmd" class="btn dorne-btn">SUBMIT</button>
                                </div>
                                <div class="col-3"></div>

                                <%--<div class="col-3">--%>
                                    <%--<h4><a href="#" style="color: whitesmoke" data-toggle="modal" data-target="#loginModal">Login</a></h4>--%>
                                <%--</div>--%>
                                <%--<div class="col-6"></div>--%>
                                <%--<div class="col-3">--%>
                                    <%--<h4><a href="#" style="color: whitesmoke"  data-toggle="modal" data-target="#loginModal">New User?</a></h4>--%>
                                <%--</div>--%>

                            </div>

                        </form>
                    </div>
                    <%
                    }else{
                    %>
                    <a href="#" style="color: #000;" data-toggle="modal" data-target="#loginModal">Sign in to register for event</a>
                    <%
                        }
                    %>
                    <div class="opening-hours-widget mt-50">
                        <h6>Currents Seats Available</h6>
                        <ul class="opening-hours">
                            <li>
                                <h3 style="color: whitesmoke"> <p><%=e.getEvent_name()%></p></h3>
                                <%

                                    try {
                                        CallableStatement cstmt = (CallableStatement) DatabaseConnection.getPreparedCall(connection, "{call getRemainingSeats(?, ?)}");
                                        cstmt.setInt(1, e.getEvent_id());
                                        cstmt.registerOutParameter(2, Types.INTEGER);
                                        cstmt.execute();
                                %>

                                <p>Only <%=cstmt.getInt(2)%> Seats Remaining</p>
                                <%
                                    }
                                    catch (Exception p) {
                                        p.printStackTrace();
                                    }

                                %>

                            </li>
                            <!--<li>-->
                            <!--<p>Tuesday</p>-->
                            <!--<p>9 AM - 1 PM</p>-->
                            <!--</li>-->
                        </ul>
                    </div>

                </div>
            </div>


            <%--<%--%>
            <%--}--%>
            <%--%>--%>
        </div>

    </div>
</section>
<jsp:include page="login_modal.jsp"/>
<!-- ***** Single Listing Area End ***** -->
<%--</div>--%>
<%--<div id="pdf" class="ghost">--%>
<%--<center>--%>

<%--<h1>CSI Registration Receipt</h1>--%>
<%--<h4>Welcome to PICT-CSI Students Chapter 2018-2019 </h4>--%>
<%--</center>--%>
<%--<hr width="80%">--%>


<%--<h3>--%>
<%--<p style="padding-top: 25px;padding-left: 35%; ">--%>
<%--User Name::&nbsp;&nbsp;<%=user.getFirst_name()%>--%>
<%--<br>--%>

<%--Email ID::&nbsp;&nbsp; <%=user.getEmail_id()%>--%>
<%--<br>--%>
<%--College::&nbsp;&nbsp;<%=user.getCollege_name()%>--%>
<%--<br>--%>
<%--Event Name::&nbsp;&nbsp;<%=user.getCollege_name()%>--%>
<%--<br>--%>

<%--<br>--%>

<%--<b><i>Let`s meet in the event!!!!<br></i></b>--%>
<%--Thanks for registering!!!!--%>
<%--</p>--%>
<%--</h3>--%>
<%--<hr width="80%"><br>--%>
<%--<center>copyright@pict-csi18-19</center>--%>
<%--<br>--%>
<%--</div >--%>

<%
    if(user != null){
%>
<div id="pdf" class="ghost">

    CSI Registration Receipt
    Welcome to PICT-CSI Students Chapter 2018-2019

    User Name:: <%=user.getFirst_name()%>
    <br>
    Email ID:: <%=user.getEmail_id()%>
    <br>
    College:: <%=user.getCollege_name()%>
    <br>
    Event Name:: <%=e.getEvent_name()%>
    <br>
    Let`s meet in the event!!!!
    Thanks for registering!!!!


</div >
<%
    }
%>
<%
        }
    }catch (SQLException | NullPointerException e){
        e.printStackTrace();
    }
%>
<%--</form>--%>

<!-- ****** Footer Area Start ****** -->
<jsp:include page="footer.jsp"/>
<!-- ****** Footer Area End ****** -->
<script>
    var doc = new jsPDF();
    var specialElementHandlers = {
        '#editor': function (element, renderer) {
            return true;
        }
    };

    $('#cmd').click(function () {
        doc.fromHTML($('#pdf').html(), 15, 15, {
            'width': 170,
            'elementHandlers': specialElementHandlers
        });
        doc.save('sample-file.pdf');

    });


</script>


<!-- jQuery-2.2.4 js -->
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<!-- Popper js -->
<script src="js/bootstrap/popper.min.js"></script>
<!-- Bootstrap-4 js -->
<script src="js/bootstrap/bootstrap.min.js"></script>
<!-- All Plugins js -->
<script src="js/others/plugins.js"></script>
<!-- Google Maps js -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDk9KNSL1jTv4MY9Pza6w8DJkpI_nHyCnk"></script>
<script src="js/google-map/location-map-active.js"></script>
<!-- Active JS -->
<script src="js/active.js"></script>
</body>

</html>