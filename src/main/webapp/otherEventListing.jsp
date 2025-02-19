<%--
  Created by IntelliJ IDEA.
  User: snehal
  Date: 29/10/18
  Time: 12:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: snehal
  Date: 29/10/18
  Time: 12:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.pictcsi.database.DatabaseConnection" %>
<%@ page import="com.pictcsi.models.Event" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Base64" %>
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
            var session=request.getSession(false);
            if(session.getAttribute("user_name")==null)
            {
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
                    <input type="search" name="caviarSearch" id="search" placeholder="Search Your Desire Destinations or Events">
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
                    <h4>Upcoming New Features</h4>
                    <p>Editor’s pick</p>
                </div>
            </div>
        </div>
        <div class="row">
            <!-- Single Features Area -->
            <%
                try(Connection connection = DatabaseConnection.getConnection()){

                    String sql = "SELECT * FROM EVENT where event_type = 'Other' AND end_date > NOW() ORDER BY event_id";
                    ResultSet set = DatabaseConnection.getResultSet(connection, sql);
                    while(set.next()){
                        Event e = Event.getFromSet(set);

            %>

            <div class="col-12 col-sm-6 col-lg-4">
                <a href="otherEventReg.jsp?event_id=<%=e.getEvent_id()%>" onclick="return(checking());">

                    <div class="single-features-area mb-50">
                        <img src="data:image/png;base64,<%=Base64.getEncoder().encodeToString(e.getImage().getBytes(1, (int) e.getImage().length()))%>" alt="">
                        <!-- Price -->
                        <div class="price-start">
                            <p>FROM Rs.<%=e.getEvent_fee()%></p>
                        </div>
                        <div class="feature-content d-flex align-items-center justify-content-between">
                            <div class="feature-title">
                                <h5><%=e.getEvent_name()%></h5>
                                <p><%=e.getDescription()%></p>
                            </div>
                            <div class="feature-favourite">
                                <i class="fa fa-heart-o" aria-hidden="true"></i>
                            </div>
                        </div>
                    </div>

                </a>
            </div>

            <%
                    }
                }catch (SQLException | NullPointerException e){
                    e.printStackTrace();
                }
            %>

        </div>
    </div>
</section>
<!-- ***** Listing Destinations Area End ***** -->

<section class="dorne-listing-destinations-area section-padding-100-50">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section-heading dark text-center">
                    <span></span>
                    <h4>Past Features</h4>
                    <%--<p>Editor’s pick</p>--%>
                </div>
            </div>
        </div>
        <div class="row">
            <!-- Single Features Area -->
            <%
                try(Connection connection = DatabaseConnection.getConnection()){

                    String sql = "SELECT * FROM EVENT where event_type ='Other' AND end_date < NOW() ORDER BY event_id";
                    ResultSet set = DatabaseConnection.getResultSet(connection, sql);
                    while(set.next()){
                        Event e = Event.getFromSet(set);

            %>

            <div class="col-12 col-sm-6 col-lg-4">
                <%--<a href="single-listing.jsp?event_id=<%=e.getEvent_id()%>" onclick="return(checking());">--%>

                <div class="single-features-area mb-50">
                    <img src="data:image/png;base64,<%=Base64.getEncoder().encodeToString(e.getImage().getBytes(1, (int) e.getImage().length()))%>" alt="">
                    <!-- Price -->
                    <div class="price-start">
                        <p>FROM Rs.<%=e.getEvent_fee()%></p>
                    </div>
                    <div class="feature-content d-flex align-items-center justify-content-between">
                        <div class="feature-title">
                            <h5><%=e.getEvent_name()%></h5>
                            <p><%=e.getDescription()%></p>
                        </div>
                        <div class="feature-favourite">
                            <i class="fa fa-heart-o" aria-hidden="true"></i>
                        </div>
                    </div>
                </div>

                <%--</a>--%>
            </div>

            <%
                    }
                }catch (SQLException | NullPointerException e){
                    e.printStackTrace();
                }
            %>

        </div>
    </div>
</section>
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