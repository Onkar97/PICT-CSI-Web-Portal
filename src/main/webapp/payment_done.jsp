<%--
  Created by IntelliJ IDEA.
  User: negative0
  Date: 2/9/19
  Time: 11:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <jsp:include page="header.jsp"/>

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


<section>


</section>







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

        });

        swal({
            title: "Good job!",
            text: "Payment Done! Your payment will be verified by admin soon!",
            icon: "success",
            button: "Aww yiss!",
        });

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

<script type="text/javascript">

</script>

</body>

</html>