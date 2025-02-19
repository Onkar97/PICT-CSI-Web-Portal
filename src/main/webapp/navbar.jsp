<!-- ***** Header Area Start ***** -->

<%@page session="true"%>
<header class="header_area" id="header">

    <div class="container-fluid h-100">
        <div class="row h-100">
            <div class="col-12 h-100">
                <nav class="h-100 navbar navbar-expand-lg">
                    <%--<a class="navbar-brand" href="index.jsp"><img src="img/core-img/logo.png" alt=""></a>--%>
                    <%--<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#dorneNav" aria-controls="dorneNav" aria-expanded="false" aria-label="Toggle navigation"><span class="fa fa-bars"></span></button>--%>
                    <%--<!-- Nav -->--%>
                    <div class="collapse navbar-collapse" id="dorneNav">
                        <ul class="navbar-nav mr-auto" id="dorneMenu">
                            <li class="nav-item  ">
                                <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item  ">
                                <a class="nav-link" href="Enthusia-19/index.html">Enthusia -19</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="listing.jsp">Events</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="workshop-listing.jsp">Workshops </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="seminar-listing.jsp">Seminar</a>
                            </li>
                            <%--<li class="nav-item">--%>
                                <%--<a class="nav-link" href="otherEventListing.jsp">Something New <span class="sr-only">(current)</span></a>--%>
                            <%--</li>--%>

                            <%--<li class="nav-item ">--%>
                                <%--<a class="nav-link" href="index.jsp#1">News <span class="sr-only">(current)</span></a>--%>
                            <%--</li>--%>
                            <%
                                if (request.getSession().getAttribute("user_name") != null) {
                            %>
                            <li class="nav-item ">
                                <a class="nav-link" href="chats.jsp">Chat <span class="sr-only">(current)</span></a>
                            </li>

                            <%
                                }
                            %>

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">More <i class="fa fa-angle-down" aria-hidden="true"></i></a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown2">
                                    <%--<a class="dropdown-item" href="explore.jsp">Event Feedback</a>--%>
                                    <a class="dropdown-item" href="contact.jsp">Feedback</a>

                                <a class="dropdown-item" href="otherEventListing.jsp">Something New <span class="sr-only">(current)</span></a>
                                        <a class="dropdown-item" href="index.jsp#1">News <span class="sr-only">(current)</span></a>

                                </div>
                            </li>
                            <%--<li class="nav-item">--%>
                            <%--<a class="nav-link" href="contact.jsp">Contact</a>--%>
                            <%--</li>--%>
                        </ul>
                        <!-- Search btn -->

                        <div class="dorne-search-btn">
                            <a id="search-btn" href="#"><i class="fa fa-search" aria-hidden="true"></i> Search</a>
                        </div>
                        <%--<div class="dorne-search-btn">--%>
                        <%
                            if (request.getSession().getAttribute("user_name") == null) {
                        %>
                        <a href="#" class="nav-account-item" data-toggle="modal" data-target="#loginModal">Sign in  or Register</a>

                        <%
                        } else {
                            String uname= (String) request.getSession().getAttribute("user_name");
                        %>
                        <a href="#" class="nav-account-item" data-toggle="modal" data-target="#loginModal"></a>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle nav-account-item" href="#" id="navbarDropdown3" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><%=uname%> <i class="fa fa-angle-down" aria-hidden="true"></i></a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown2">
                                <%
                                    if( (request.getSession().getAttribute("user_type")).equals("admin")){
                                %>
                                <a class="dropdown-item" href="/admin">Goto Admin console</a>
                                <%
                                    }
                                %>
                                <a class="dropdown-item" href="myRegistration.jsp">My registration</a>

                                <%--<a class="dropdown-item" href="#" data-toggle="modal" data-target="#loginModal">Profile</a>--%>
                                <a class="dropdown-item" href="/logoutServlet" >Log Out</a>

                            </div>
                        </li>
                        <%
                            }
                        %>
                    </div>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#dorneNav" aria-controls="dorneNav" aria-expanded="false" aria-label="Toggle navigation"><span class="fa fa-bars"></span></button>
                </nav>
            </div>
        </div>
    </div>
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
</header>

<jsp:include page="login_modal.jsp"/>

<!-- ***** Header Area End ***** -->