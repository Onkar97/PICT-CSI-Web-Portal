<%@ page import="com.pictcsi.database.DatabaseConnection" %>
<%@ page import="com.pictcsi.models.Event" %>
<%@ page import="com.pictcsi.models.NewsFeed" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Base64" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <jsp:include page="header.jsp"/>
    <jsp:include page="counter.jsp"/>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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
                    <input type="search" name="caviarSearch" id="search" placeholder="Search">
                    <input type="submit" class="d-none" value="submit">
                </form>
            </div>
        </div>
    </div>
</div>

<jsp:include page="navbar.jsp"/>

<!-- ***** Welcome Area Start ***** -->
<section class="dorne-welcome-area bg-img bg-overlay" style="background-image: url(img/bg-img/hero-1.jpg);">
    <div class="container h-100">
        <div class="row h-100 align-items-center justify-content-center">
            <div class="col-12 col-md-10">
                <div class="hero-content">
                    <h2>Welcome to PICT CSI</h2>
                    <h4>Run with Technology.</h4>
                </div>
            </div>
        </div>
    </div>
    <!-- Hero Social Btn -->
    <div class="hero-social-btn">
        <div class="social-title d-flex align-items-center">
            <h6>Follow us on Social Media</h6>
            <span></span>
        </div>
        <%--<div class="social-btns">--%>
        <%--<a href="#"><i class="fa fa-linkedin" aria-haspopup="true"></i></a>--%>
        <%--<a href="#"><i class="fa fa-behance" aria-hidden="true"></i></a>--%>
        <%--<a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a>--%>
        <%--<a href="#"><i class="fa fa-twitter" aria-haspopup="true"></i></a>--%>
        <%--<a href="#"><i class="fa fa-facebook" aria-haspopup="true"></i></a>--%>
        <%--</div>--%>
    </div>
</section>
<!-- ***** Welcome Area End ***** -->
<%
    int visitor_count = 0;
    try(Connection connection = DatabaseConnection.getConnection()) {
        //language=MySQL
        String countSql = "SELECT sum(visitor_count) as count from COUNTER";
        ResultSet countResultSet = DatabaseConnection.getResultSet(connection, countSql);
        if(countResultSet.next()){
            visitor_count = countResultSet.getInt("count");
        }
    }catch (SQLException e){
        visitor_count = 0;
    }

%>

<!-- ***** Catagory Area Start ***** -->
<section class="dorne-catagory-area">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="all-catagories">
                    <div class="row">
                        <!-- Single Catagory Area -->
                        <div class="col-12 col-sm-6 col-md">
                            <div class="single-catagory-area wow fadeInUpBig" data-wow-delay="0.2s">
                                <div class="catagory-content">
                                    <h2 style="color: white;">Infinity</h2>
                                    <a href="#">
                                        <h5 style="color: #ffffff">Registrations</h5>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <!-- Single Catagory Area -->
                        <div class="col-12 col-sm-6 col-md">
                            <div class="single-catagory-area wow fadeInUpBig" data-wow-delay="0.4s">
                                <div class="catagory-content">
                                    <h2 style="color: white;"> <%=visitor_count%></h2>
                                    <a href="#">
                                        <h5  style="color: #ffffff">Visitors</h5>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <!-- Single Catagory Area -->
                        <div class="col-12 col-sm-6 col-md">
                            <div class="single-catagory-area wow fadeInUpBig" data-wow-delay="0.6s">
                                <div class="catagory-content">
                                    <img src="img/core-img/icon-3.png" alt="">
                                    <a href="#">
                                        <h6>72 chapter in India </h6>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <!-- Single Catagory Area -->
                        <div class="col-12 col-sm-6 col-md">
                            <div class="single-catagory-area wow fadeInUpBig" data-wow-delay="0.8s">
                                <div class="catagory-content">
                                    <img src="img/core-img/icon-4.png" alt="">
                                    <a href="#">
                                        <h6>511 student branches</h6>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <!-- Single Catagory Area -->
                        <div class="col-12 col-md">
                            <div class="single-catagory-area wow fadeInUpBig" data-wow-delay="1s">
                                <div class="catagory-content">
                                    <%--<img src="img/core-img/icon-3.png" alt="">--%>
                                    <a href="http://www.csi-india.org/">
                                        <h3 style="color: #ffffff">Connect with us </h3>
                                    </a>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</section>
<!-- ***** Catagory Area End ***** -->

<!-- ***** About Area Start ***** -->
<section class="dorne-about-area section-padding-0-100">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="about-content text-center">
                    <h2>Discover technology with <br><span>PICT-CSI</span></h2>
                    <p>The Computer Society of India is a non-profit professional society and meet to exchange views and information learn and share ideas. The wide spectrum of members is committed to the advancement of theory and practice of Computer Engineering and Technology Systems, Science and Engineering, Information Processing and related Arts and Sciences.</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ***** About Area End ***** -->

<!-- ***** Editor Pick Area Start ***** -->
<section class="dorne-editors-pick-area bg-img bg-overlay-9 section-padding-100" style="background-image: url(img/bg-img/hero-2.jpg);">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section-heading text-center">
                    <span></span>
                    <h4>Your goals are no less than ours.</h4>
                    <%--<p>Editor’s pick</p>--%>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12 col-lg-6">
                <div class="single-editors-pick-area wow fadeInUp" data-wow-delay="0.2s">
                    <img src="img/bg-img/editor-1.png" alt="">
                    <div class="editors-pick-info">
                        <div class="places-total-destinations d-flex">
                            <a href="#">Mission</a>
                        </div>
                        <div class="add-more">
                          <span style="color: #FFFFFF; font-size: 27px;">
                               <ul >
                                    <li style="font-size: 20px">...
                           <li style="font-size: 20px"> Facilitate Research, Knowledge Sharing, Learning and Career Enhancement for IT professionals.
                               <li style="font-size: 20px">Inspire, nurture and assist students to integrate into the IT community.
                                  <li style="font-size: 20px">  Percolate benefits of IT advancement to all sections of Indian Society.
                            </ul>

                            </span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-lg-6">
                <%--<div class="single-editors-pick-area wow fadeInUp" data-wow-delay="0.4s">--%>
                <%--<img src="img/bg-img/editor-2.jpg" alt="">--%>
                <%--<div class="editors-pick-info">--%>
                <%--<div class="places-total-destinations d-flex">--%>
                <%--<a href="#">Mission</a>--%>
                <%--</div>--%>

                <%--<span style="color: #FFFFFF; font-size: 22px;">--%>
                <%--Facilitate Research, Knowledge Sharing, Learning and Career Enhancement among all categories of IT professionals.Inspire, nurture and assist students to integrate into the IT community.Percolate benefits of IT advancement to all sections of Indian Society.--%>
                <%--</span>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--<div class="single-editors-pick-area wow fadeInUp" data-wow-delay="0.6s">--%>
                <%--<img src="img/bg-img/editor-3.jpg" alt="">--%>
                <%--<div class="editors-pick-info">--%>
                <%--<div class="places-total-destinations d-flex">--%>
                <%--<a href="#">Vision</a>--%>
                <%--</div>--%>

                <%--<span style="color: #FFFFFF; font-size: 22px;">--%>
                <%--The Computer Society of India is a non-profit professional society and meet to exchange views and information learn and share ideas. The wide spectrum of members is committed to the advancement of theory and practice of Computer Engineering and Technology Systems, Science and Engineering, Information Processing and related Arts and Sciences.--%>
                <%--</span>--%>
                <%--</div>--%>
                <%--</div>--%>

                <div class="single-editors-pick-area wow fadeInUp" data-wow-delay="0.2s">
                    <img src="img/bg-img/editor-1.png" alt="">
                    <div class="editors-pick-info">
                        <div class="places-total-destinations d-flex">
                            <a href="#">Vision</a>
                        </div>
                        <div class="add-more">
                          <span style="color: #FFFFFF; font-size: 27px;">
                               <ul >
                                   <li style="font-size: 20px">...
                           <li style="font-size: 20px"> The Computer Society of India is a non-profit professional society.
                               <li style="font-size: 20px">The wide spectrum of members is committed to Science and Engineering.
                                  <li style="font-size: 20px">  Advancement of theory and practice of Computer Engineering.
                            </ul>

                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ***** Editor Pick Area End ***** -->

<!-- ***** Features Destinations Area Start ***** -->
<section class="dorne-features-destinations-area">

    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="section-heading dark text-center">
                    <span></span>
                    <h4>Upcoming Events</h4>

                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <div class="features-slides owl-carousel">
                    <!-- Single Features Area -->
                    <%
                        try(Connection connection = DatabaseConnection.getConnection()){
                            String sql = "SELECT * FROM EVENT WHERE event_type = 'Event' ORDER BY event_id DESC LIMIT 4";
                            ResultSet set = DatabaseConnection.getResultSet(connection, sql);
                            while(set.next()){
                                Event e = Event.getFromSet(set);

                                //   session.setAttribute("EventId", set.getInt(1));

                    %>
                    <div class="single-features-area">
                        <a href="single-listing.jsp?event_id=<%=e.getEvent_id()%>">

                            <img src="data:image/png;base64,<%=Base64.getEncoder().encodeToString(e.getImage().getBytes(1, (int) e.getImage().length()))%>" alt="">
                            <!-- Price -->
                            <%--<div class="price-start">--%>
                            <%--<p>FROM $59/night</p>--%>
                            <%--</div>--%>
                            <div class="feature-content d-flex align-items-center justify-content-between">
                                <div class="feature-title">
                                    <h5><%=e.getEvent_name()%></h5>
                                    <p><%=e.getDescription()%></p>
                                </div>
                                <div class="feature-favourite">
                                    <span class="no-likes"><%=e.getLikes()%></span>
                                    <a data-event_id="<%=e.getEvent_id()%>" href="#" onclick="likeEvent(this)" data-likes="<%=e.getLikes()%>"><i class="fa fa-heart-o" aria-hidden="true"></i></a>
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

        </div>
    </div>
    <div class="row view-all-div">

        <div class="col-10">
        </div>
        <div class="col-2">
            <a href="listing.jsp" class="btn dorne-btn float-right">View All</a>
        </div>
    </div>
</section>
<!-- ***** Features Restaurant Area End ***** -->

<!-- ***** Features Events Area Start ***** -->
<section id="1" class="dorne-features-events-area bg-img bg-overlay-9 section-padding-100-50" style="background-image: url(img/bg-img/hero-3.jpg)">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section-heading text-center">
                    <span></span>
                    <h4>News !</h4>
                    <%--<p>Editor’s pick</p>--%>
                </div>
            </div>
        </div>

        <div class="row">
            <%
                try(Connection connection = DatabaseConnection.getConnection()) {

                    String checkUserQuery = "SELECT * from NEWS_FEED WHERE end_date > NOW()";
                    PreparedStatement statement = connection.prepareStatement(checkUserQuery);
                    ResultSet resultSet = statement.executeQuery();


                    while(resultSet.next()){
                        NewsFeed c = NewsFeed.getFromSet(resultSet);


            %>

            <div class="col-12 col-lg-6">

                <div class="single-feature-events-area d-sm-flex align-items-center wow fadeInUpBig" data-wow-delay="0.2s">
                    <div class="feature-events-thumb">
                        <img src="img/bg-img/event-1.jpg" alt="">
                        <div class="date-map-area d-flex">
                            <a href="#">26 Nov</a>
                            <%--<a href="#"><img src="img/core-img/map.png" alt=""></a>--%>
                        </div>
                    </div>
                    <div class="feature-events-content">
                        <h5><%=c.getTitle() %></h5>
                        <h6>PICT</h6>
                        <p><%=c.getDescription() %></p>
                    </div>
                    <div class="feature-events-details-btn">
                        <a href="#">+</a>
                    </div>
                </div>
            </div>


            <%

                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </div>
    </div>
</section>
<!-- ***** Features Events Area End ***** -->

<!-- ***** Clients Area Start ***** -->
<%--<div class="dorne-clients-area section-padding-100">--%>
<%--<div class="container-fluid">--%>
<%--<div class="row">--%>
<%--<div class="col-12">--%>
<%--<div class="clients-logo d-md-flex align-items-center justify-content-around">--%>
<%--<img src="img/clients-img/1.png" alt="">--%>
<%--<img src="img/clients-img/2.png" alt="">--%>
<%--<img src="img/clients-img/3.png" alt="">--%>
<%--<img src="img/clients-img/4.png" alt="">--%>
<%--<img src="img/clients-img/5.png" alt="">--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<!-- ***** Clients Area End ***** -->

<jsp:include page="footer.jsp"/>

<jsp:include page="login_modal.jsp"/>
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

<script type="text/javascript">

    function likeEvent(element){
        var $element = $(element);
        var event_id = $element.data('event_id');
        console.log("Here");

        $.ajax({
                url: "../likeEventServlet",
                method: 'get',
                data: {
                    event_id: event_id

                },
                success: function (data) {
                    if(data.isSuccess) {
                        console.log(data);
                        $element.find('.fa').removeClass("fa-heart-o");
                        $element.find('.fa').addClass("fa-heart");
                        $("#likeWrapper").show();
                        $element.parent().find(".no-likes").html(parseInt($element.data("likes")) + 1);
                        $element.data("likes", parseInt($element.data("likes")) + 1);
                        var x = setInterval(function () {
                            clearInterval(x);
                            $("#likeWrapper").hide();
                        }, 5000);
                    }else {
                        alert("Unknown Error Occurred");
                    }
                },
                error: function () {
                    alert("Unknown Error Occurred");
                }
            }
        )
    }
    $(function () {
        //Load on page load
        $("#likeWrapper").click(function () {
            $(this).hide();

        })

    });

</script>

<div class="wrapper" id="likeWrapper" style="display: none">
    <div class="heart x1"></div>
    <div class="heart x2"></div>
    <div class="heart x3"></div>
    <div class="heart x4"></div>
    <div class="heart x5"> </div>
    <div class="altheart x6"></div>
</div>

<!-- The Modal -->
<div class="modal" id="enthusiaModal" style="width: 100%; height: 100%; margin-top: 200px">
    <%--<div class="modal-dialog">--%>
    <div class="modal-content">

        <%--<!-- Modal Header -->--%>
        <%--<div class="modal-header">--%>
        <%--<h1>Enthusia-19</h1>--%>
        <%--<button type="button" class="close" data-dismiss="modal">&times;</button>--%>
        <%--</div>--%>

        <!-- Modal body -->

        <div class="modal-body" >

                <!-- Hero Search Form -->
                <div class="conatiner">
                    <div class="row">
                        <div class="col-3"></div>
                        <div class="col-6">
                            <%--<h1 id="demo" style="font-size:20px" data-aos="zoom-in-up" data-aos-duration="3000"></h1>--%>

                            <%--<img src="img/poster.jpeg" alt="enthusia_poster">--%>
                            <a href="https://docs.google.com/spreadsheets/d/1PC8O80g2C-dSCkI15EHeB0wXMtBDSFvkoYfFwV6T0N8/edit?usp=sharing"><h2>Get the event schedule here!</h2></a>

                          <h3>  The certificates will be distributed on Sunday, 24th Feb 2019 starting at 10 AM.</h3>
                        </div>
                        <div class="col-3"></div>
                    </div>
                    <br>
                </div>



        </div>

        <!-- Modal footer -->
        <div class="modal-footer">
            <a type="button" href="login.jsp"  class="btn dorne-btn">Login</a>

            <button type="button" class="btn dorne-btn" data-dismiss="modal">Close</button>
        </div>

    </div>
    <%--</div>--%>
</div>
<script type="text/javascript">

    $(function () {
        <%
        String payment_done = request.getParameter("payment_done");
        if(payment_done != null && !payment_done.isEmpty()){
            if(payment_done.equals("yes")){
        %>
        swal({
            title: "Good job!",
            text: "Payment Done! Your payment will be verified by admin soon!",
            icon: "success",
            button: "Aww yiss!"
        });
        <%
            }else{
        %>
        swal({
            title: "Payment Error!",
            text: "Payment Error! Please try again!",
            icon: "error",
            button: "Okay!"
        });

        <%
            }

            }else if(request.getSession().getAttribute("user_name") == null || ((String) request.getSession().getAttribute("user_name")).isEmpty()){
        %>
        $("#enthusiaModal").modal('show');
        <%
            }
        %>
    });


    // Set the date we're counting down to
    var countDownDate = new Date("Feb 22, 2019 9:00:00").getTime();

    // Update the count down every 1 second
    var countdownfunction = setInterval(function() {

        // Get todays date and time
        var now = new Date().getTime();

        // Find the distance between now an the count down date
        var distance = countDownDate - now;

        // Time calculations for days, hours, minutes and seconds
        var days = Math.floor(distance / (1000 * 60 * 60 * 24));
        var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((distance % (1000 * 60)) / 1000);

        // Output the result in an element with id="demo"
        document.getElementById("demo").innerHTML = days+"  :     "+ hours+"    :   "+ minutes+ "    :   "+seconds;

        // If the count down is over, write some text
        if (distance < 0) {
            clearInterval(countdownfunction);
            document.getElementById("demo").innerHTML = "EXPIRED";
        }
    }, 1000);
</script>

</body>

</html>