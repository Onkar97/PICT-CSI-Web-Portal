<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Feedback</title>

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link href="css/style.css" rel="stylesheet">

    <!-- Responsive CSS -->
    <link href="css/responsive/responsive.css" rel="stylesheet">

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
    <!-- ***** Header Area End ***** -->

    <!-- ***** Breadcumb Area Start ***** -->
    <div class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/hero-1.jpg)">
    </div>
    <!-- ***** Breadcumb Area End ***** -->

    <!-- Explore Area -->
    <section class="dorne-explore-area d-md-flex">
        <!-- Explore Search Area -->
        <div class="row">
            <!-- Explore Search Form -->
            <div class="explore-search-form">
                <h6>RATE us to get one month extended membership!</h6>
                <!-- Tabs -->
                <div class="nav nav-tabs" id="heroTab" role="tablist">
                    <a class="nav-item nav-link active" id="nav-places-tab" data-toggle="tab" href="#nav-places" role="tab" aria-controls="nav-places" aria-selected="true">Events</a>
                    <%--<a class="nav-item nav-link" id="nav-events-tab" data-toggle="tab" href="#nav-events" role="tab" aria-controls="nav-events" aria-selected="false">Workshops</a>--%>
                </div>
                <!-- Tabs Content -->
                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="nav-places" role="tabpanel" aria-labelledby="nav-places-tab">
                        <form action="#" method="get">
                            <select class="custom-select" id="destinations">
                                <option selected>How interesting were our Events?</option>
                                <option value="1">1-3</option>
                                <option value="2">4-7</option>
                                <option value="3">8-10</option>
                            </select>
                            <select class="custom-select" id="catagories">
                                <option selected>How well did our Volunteers help you?</option>
                                <option value="1">1-3</option>
                                <option value="2">4-7</option>
                                <option value="3">8-10</option>
                            </select>
                            <select class="custom-select" id="price-range">
                                <option selected> How was the Organization and Management?</option>
                                <option value="1">1-3</option>
                                <option value="2">4-7</option>
                                <option value="3">8-10</option>
                            </select>
                            <select class="custom-select" id="proximity">
                                <option selected>Were your queries answered?</option>
                                <option value="1">Yes</option>
                                <option value="2">No</option>
                                <option value="3">A few</option>
                            </select>
                            <div class="nav nav-tabs" id="heroTab" role="tablist">
                                <a class="nav-item nav-link active" id="nav-places-tab" data-toggle="tab" href="#nav-places" role="tab" aria-controls="nav-places" aria-selected="true">Check the facilities you used in PICT.</a>
                                <%--<a class="nav-item nav-link" id="nav-events-tab" data-toggle="tab" href="#nav-events" role="tab" aria-controls="nav-events" aria-selected="false">Workshops</a>--%>
                            </div>

                            <div class="row mt-md-5 mt-0">
                                <div class="col-12 col-xl-6">
                                    <label class="custom-control custom-checkbox mb-3">
                                        <input type="checkbox" class="custom-control-input">
                                        <span class="custom-control-indicator"></span>
                                        <span class="custom-control-description">Drinking Water</span>
                                    </label>
                                </div>
                                <div class="col-12 col-xl-6">
                                    <label class="custom-control custom-checkbox mb-3">
                                        <input type="checkbox" class="custom-control-input">
                                        <span class="custom-control-indicator"></span>
                                        <span class="custom-control-description">Bike Parking</span>
                                    </label>
                                </div>
                                <div class="col-12 col-xl-6">
                                    <label class="custom-control custom-checkbox mb-3">
                                        <input type="checkbox" class="custom-control-input">
                                        <span class="custom-control-indicator"></span>
                                        <span class="custom-control-description">Wireless Internet</span>
                                    </label>
                                </div>
                                <div class="col-12 col-xl-6">
                                    <label class="custom-control custom-checkbox mb-3">
                                        <input type="checkbox" class="custom-control-input">
                                        <span class="custom-control-indicator"></span>
                                        <span class="custom-control-description">Canteen</span>
                                    </label>
                                </div>
                                <div class="col-12 col-xl-6">
                                    <label class="custom-control custom-checkbox mb-3">
                                        <input type="checkbox" class="custom-control-input">
                                        <span class="custom-control-indicator"></span>
                                        <span class="custom-control-description">Washrooms</span>
                                    </label>
                                </div>
                                <div class="col-12 col-xl-6">
                                    <label class="custom-control custom-checkbox mb-3">
                                        <input type="checkbox" class="custom-control-input">
                                        <span class="custom-control-indicator"></span>
                                        <span class="custom-control-description">Game Zone</span>
                                    </label>
                                </div>
                                <div class="col-12 col-xl-6">
                                    <label class="custom-control custom-checkbox mb-3">
                                        <input type="checkbox" class="custom-control-input">
                                        <span class="custom-control-indicator"></span>
                                        <span class="custom-control-description">Wheelchair</span>
                                    </label>
                                </div>
                                <div class="col-12 col-xl-6">
                                    <label class="custom-control custom-checkbox mb-3">
                                        <input type="checkbox" class="custom-control-input">
                                        <span class="custom-control-indicator"></span>
                                        <span class="custom-control-description">Stationary</span>
                                    </label>
                                </div>
                            </div>
                            <button type="submit" class="btn dorne-btn mt-50 bg-white text-dark"> SUBMIT</button>
                        </form>
                    </div>
                    <%--</div>--%>
                </div>
            </div>

            <!-- Explore Search Result -->
            <div class="explore-search-result">
                <%--<div id="exploreGoogleMap"</div>--%>
            </div>
        </div>
        <!-- Explore Map Area -->
        <%--<div class="explore-map-area">--%>
            <%--<div id="exploreGoogleMap"></div>--%>
        <%--</div>--%>
    </section>

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
    <!-- Google Maps js -->
    <%--<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDk9KNSL1jTv4MY9Pza6w8DJkpI_nHyCnk"></script>--%>
    <script src="js/google-map/explore-map-active.js"></script>
    <!-- Active JS -->
    <script src="js/active.js"></script>
</body>

</html>