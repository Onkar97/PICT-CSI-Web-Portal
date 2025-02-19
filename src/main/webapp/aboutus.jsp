<%--
  Created by IntelliJ IDEA.
  User: snehal
  Date: 29/10/18
  Time: 12:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/aboutus.css">
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
                    <h4>Upcoming Workshops</h4>
                    <p>Editor’s pick</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class='card card-profile text-center'>
                <img alt='' class='card-img-top' src='https://unsplash.it/340/160?image=354'>
                <div class='card-block'>
                    <img alt='' class='card-img-profile' src='https://it.gravatar.com/userimage/3434071/205a00fc16ae537b26b56f40790910fe.jpg?size=140'>
                    <h4 class='card-title'>
                        Nicola Pressi
                        <small>Front-end designer</small>
                    </h4>
                    <div class='card-links'>
                        <a class='fa fa-dribbble' href='#'></a>
                        <a class='fa fa-twitter' href='#'></a>
                        <a class='fa fa-facebook' href='#'></a>
                    </div>
                </div>
            </div>


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
                    <h4>Past Workshops</h4>
                    <%--<p>Editor’s pick</p>--%>
                </div>
            </div>
        </div>
        <div class="row">

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