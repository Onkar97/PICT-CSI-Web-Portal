<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <script src="https://unpkg.com/jspdf@latest/dist/jspdf.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>

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

    <script type="text/javascript">

        function validateFeedBack()
        {

            if( document.conForm.name.value == "" )
            {
                alert( "Please provide your name!" );
                document.conForm.name.focus() ;
                return false;
            }

            if( document.conForm.email.value == "" )
            {
                alert( "Please provide your Email ID!" );
                document.conForm.email.focus() ;
                return false;
            }else {

                var emailVal="(.*@.*\\..*)|(.*@\\..*\\..*)";
                if(! document.conForm.email.value.match(emailVal)){
                    alert( "Please enter valid E-Mail ID !!" );
                    document.conForm.email.focus() ;
                    return false;
                }

            }


            if( document.conForm.subject.value == "" )
            {
                alert( "Please enter subject of FeedBack!" );
                document.conForm.subject.focus() ;
                return false;
            }



            return( true );
        }



    </script>

<style>
    .ghost{

        /*visibility: hidden;*/
        display: none;
    }
</style>
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
    <!-- ***** Header Area Start ***** -->
    <!--<header class="header_area" id="header">-->
        <!--<div class="container-fluid h-100">-->
            <!--<div class="row h-100">-->
                <!--<div class="col-12 h-100">-->
                    <!--<nav class="h-100 navbar navbar-expand-lg">-->
                        <!--<a class="navbar-brand" href="index.jsp"><img src="img/core-img/hero-3.jpg" alt=""></a>-->
                        <!--<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#dorneNav" aria-controls="dorneNav" aria-expanded="false" aria-label="Toggle navigation"><span class="fa fa-bars"></span></button>-->
                        <!--&lt;!&ndash; Nav &ndash;&gt;-->
                        <!--<div class="collapse navbar-collapse" id="dorneNav">-->
                            <!--<ul class="navbar-nav mr-auto" id="dorneMenu">-->
                                <!--<li class="nav-item">-->
                                    <!--<a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>-->
                                <!--</li>-->
                                <!--<li class="nav-item dropdown">-->
                                    <!--<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Explore <i class="fa fa-angle-down" aria-hidden="true"></i></a>-->
                                    <!--<div class="dropdown-menu" aria-labelledby="navbarDropdown">-->
                                        <!--<a class="dropdown-item" href="index.jsp">Home</a>-->
                                        <!--<a class="dropdown-item" href="explore.jsp">Explore</a>-->
                                        <!--<a class="dropdown-item" href="listing.jsp">Listing</a>-->
                                        <!--<a class="dropdown-item" href="single-listing.jsp">Single Listing</a>-->
                                        <!--<a class="dropdown-item" href="contact.jsp">Contact</a>-->
                                    <!--</div>-->
                                <!--</li>-->
                                <!--<li class="nav-item dropdown">-->
                                    <!--<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Listings <i class="fa fa-angle-down" aria-hidden="true"></i></a>-->
                                    <!--<div class="dropdown-menu" aria-labelledby="navbarDropdown2">-->
                                        <!--<a class="dropdown-item" href="index.jsp">Home</a>-->
                                        <!--<a class="dropdown-item" href="explore.jsp">Explore</a>-->
                                        <!--<a class="dropdown-item" href="listing.jsp">Listing</a>-->
                                        <!--<a class="dropdown-item" href="single-listing.jsp">Single Listing</a>-->
                                        <!--<a class="dropdown-item" href="contact.jsp">Contact</a>-->
                                    <!--</div>-->
                                <!--</li>-->
                                <!--<li class="nav-item active">-->
                                    <!--<a class="nav-link" href="contact.jsp">Contact</a>-->
                                <!--</li>-->
                            <!--</ul>-->
                            <!--&lt;!&ndash; Search btn &ndash;&gt;-->
                            <!--<div class="dorne-search-btn">-->
                                <!--<a id="search-btn" href="#"><i class="fa fa-search" aria-hidden="true"></i> Search</a>-->
                            <!--</div>-->
                            <!--&lt;!&ndash; Signin btn &ndash;&gt;-->
                            <!--<div class="dorne-signin-btn">-->
                                <!--<a href="#">Sign in  or Register</a>-->
                            <!--</div>-->
                            <!--&lt;!&ndash; Add listings btn &ndash;&gt;-->
                            <!--<div class="dorne-add-listings-btn">-->
                                <!--<a href="#" class="btn dorne-btn">+ Add Listings</a>-->
                            <!--</div>-->
                        <!--</div>-->
                    <!--</nav>-->
                <!--</div>-->
            <!--</div>-->
        <!--</div>-->
    <!--</header>-->
    <!-- ***** Header Area End ***** -->

    <!-- ***** Breadcumb Area Start ***** -->
    <div class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/hero-1.jpg)">
    </div>

    <div id="pdf">
        <%--<p><font size="3" color="red">print this to pdf</font></p>--%>
        <p class="ghost">This is hidden content</p>
    </div>
    <%--<button id="cmd">Generate PDF of your Profile</button>--%>
    <!-- ***** Breadcumb Area End ***** -->

    <!-- ***** Contact Area Start ***** -->
    <div class="dorne-contact-area d-md-flex" id="contact">
        <!-- Contact Form Area -->
        <div class="contact-form-area equal-height">
            <div class="contact-text">
                <h4>Hello, Get in touch with us</h4>
                <img src="img/bg-img/team.jpg" alt="CSI-2018-2019 Team">
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam ac nibh sed mi ullamcorper rhoncus. Curabitur pulvinar vel augue sit amet vestibulum. Proin tempus lacus porta lorem blandit aliquam eget quis ipsum. </p>
                <div class="contact-info d-lg-flex">
                    <div class="single-contact-info">
                        <h6><i class="fa fa-map-signs" aria-hidden="true"></i> PICT,Dhankawadi, Pune</h6>
                        <h6><i class="fa fa-map-signs" aria-hidden="true"></i> Survey No. 27</h6>
                    </div>
                    <div class="single-contact-info">
                        <h6><i class="fa fa-envelope-o" aria-hidden="true"></i> umeshgaikwad@gmail.com</h6>
                        <h6><i class="fa fa-phone" aria-hidden="true"></i> +91 9874512475</h6>
                    </div>
                </div>
            </div>
            <div class="contact-form">
                <div class="contact-form-title">
                    <h6>FeedBack Form</h6>
                </div>

                <%--onsubmit="return(validateFeedBack());"--%>
                <%----%>
                <form action="/ContactServlet" method="post" name="conForm" onsubmit="return validateFeedBack()" >
                    <div class="row">
                        <div class="col-12 col-md-6">
                            <input type="text" name="name" class="form-control" placeholder="Your Name" required>
                        </div>
                        <div class="col-12 col-md-6">
                            <input type="email" name="email" class="form-control" placeholder="Email Address" required>
                        </div>
                        <div class="col-12">
                            <textarea name="subject" class="form-control" id="Message" cols="30" rows="10" placeholder="Your Message" required></textarea>
                        </div>
                        <div class="col-12">
                            <input type="text" name="query" class="form-control" placeholder="Add your query here !? (optional)">
                        </div>
                        <div class="col-12">
                            <button type="submit" id="cmd" class="btn dorne-btn">Submit</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- Map Area -->
        <div class="dorne-map-area equal-height">
            <div id="googleMap"></div>
        </div>
    </div>
    <!-- ***** Contact Area End ***** -->

    <!-- ****** Footer Area Start ****** -->
    <jsp:include page="footer.jsp"/>
    <!-- ****** Footer Area End ****** -->

    <%--<script>--%>
        <%--var doc = new jsPDF();--%>
        <%--var specialElementHandlers = {--%>
            <%--'#editor': function (element, renderer) {--%>
                <%--return true;--%>
            <%--}--%>
        <%--};--%>

        <%--$('#cmd').click(function () {--%>
            <%--doc.fromHTML($('#pdf').html(), 15, 15, {--%>
                <%--'width': 170,--%>
                <%--'elementHandlers': specialElementHandlers--%>
            <%--});--%>
            <%--doc.save('sample-file.pdf');--%>

        <%--});--%>





    <%--</script>--%>

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
    <script src="js/google-map/map-active.js"></script>
    <!-- Active JS -->
    <script src="js/active.js"></script>


</body>

</html>