<%--
  Created by IntelliJ IDEA.
  User: snehal
  Date: 4/10/18
  Time: 12:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: snehal
  Date: 3/10/18
  Time: 7:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>PICT-CSI</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab" rel="stylesheet">
    <style>
        .navbar {
            background: linear-gradient(141deg, #9fb8ad 0%, #1fc8db 51%, #2cb5e8 75%);

        }
        .fonts{
            font-family: 'Roboto Slab', serif;
            opacity: 1;
        }
        body{
            background-image: url("../img/login1.jpg");
            background-repeat:no-repeat;
            background-size:cover;
        }
        .textbox {
            background: rgba(0, 0, 0, 0.43);
            border-radius: 50px;
            border-color: #002E66;
        }

    </style>
    <!-- Latest compiled and minified CSS -->
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">--%>
    <%--<!-- jQuery library -->--%>
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--%>
    <%--<!-- Popper JS -->--%>
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>--%>
    <%--<!-- Latest compiled JavaScript -->--%>
    <%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>--%>
    <jsp:include page="header.jsp"/>

</head>
<body class="bg-light">
<div class="fonts">
    <nav class="navbar navbar-expand-md bg-dark navbar-dark">
        <a class="navbar-brand" href="#">Navbar</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../event_reg.jsp">Event</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">News Feed</a>
                </li>

                <li class="nav-item">

                    <%
                        if (request.getSession().getAttribute("user_name") == null) {
                    %>
                    <a class="nav-link" href="../new_login.jsp">Log In</a>
                    <%
                    } else {
                    %>
                    <a class="nav-link " href="logoutServlet">Log Out</a>
                    <%
                        }
                    %></li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <h3 class="text-center display-4 my-3">Time to Post Some NEWS!!</h3>
        <form class="p-3" action="/admin/addNews" method="post">
            <div class="row " >
                <div class="col-md-3 col-lg-3"></div>

                <div class="col-md-6 col-lg-6">
                    <div class="rounded">
                        <div class="shadow p-3 mb-6 bg-white rounded">
                    <div class="mb-2">
                        <p class="lead " style="color: black;">Title</p>

                        <input type="email" name="title" style="background: rgba(0, 0, 0, 0.43);color: black;" class="form-control text-white " placeholder="Title" />
                    </div>
                    <div class="mb-2">
                        <p class="lead" style="color: black">Description</p>
                        <input name="description" type="text" style="background: rgba(0, 0, 0, 0.43);color: white;" class="form-control text-white "  placeholder="Description" />
                    </div>
                    <div class="mb-2">
                        <p class="lead" style="color: black">Start Date</p>
                        <input type="date" id="start_date" name="start_date"/>

                    </div>
                            <div class="mb-2">
                                <p class="lead" style="color: black">End Date</p>
                                <input type="date" id="end_date" name="end_date"/>
                            </div>

                        </div>
                    </div>
                </div>



                <div class="col-md-3 col-lg-3"></div>
            </div>
            <div class="d-flex flex-wrap justify-content-center">
                <div class="mx-1 my-3">
                    <input type="submit" class="btn btn-primary text-uppercase" value="Post it!" />
                </div>

            </div>
        </form>




    </div>

</div>
</body>
</html>

