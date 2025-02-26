<%--
  Created by IntelliJ IDEA.
  User: negative0
  Date: 2/10/19
  Time: 4:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="header.jsp"/>
    <jsp:include page="counter.jsp"/>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
        function validateLogin()
        {

            if( document.loginForm.user_name.value == "" )
            {
                alert( "Please provide user name!" );
                document.loginForm.user_name.focus() ;
                return false;
            }

            if( document.loginForm.password.value == "" )
            {
                alert( "Please provide user name!" );
                document.loginForm.user_name.focus() ;
                return false;
            }


            return( true );
        }
    </script>
</head>
<!-- This snippet uses Font Awesome 5 Free as a dependency. You can download it at fontawesome.io! -->

<body>
<div class="container">
    <div class="row">
        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card card-signin my-5">
                <div class="card-body">
                    <h5 class="card-title text-center">Sign In</h5>
                    <form class="form-signin" action="loginServlet" method="post" name="loginForm" onsubmit="return(validateLogin());">
                        <div class="form-label-group">
                            <input type="email" id="inputEmail" class="form-control" placeholder="Email address" name="user_name" required autofocus>
                            <label for="inputEmail">Email address</label>
                        </div>

                        <div class="form-label-group">
                            <input type="password" id="inputPassword" class="form-control" placeholder="Password" name="password" required>
                            <label for="inputPassword">Password</label>
                        </div>

                        <%--<div class="custom-control custom-checkbox mb-3">--%>
                            <%--<input type="checkbox" class="custom-control-input" id="customCheck1">--%>
                            <%--<label class="custom-control-label" for="customCheck1">Remember password</label>--%>
                        <%--</div>--%>
                        <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Sign in</button>
                        <hr class="my-4">
                        <%--<button class="btn btn-lg btn-google btn-block text-uppercase" type="submit"><i class="fab fa-google mr-2"></i> Sign in with Google</button>--%>
                        <%--<button class="btn btn-lg btn-facebook btn-block text-uppercase" type="submit"><i class="fab fa-facebook-f mr-2"></i> Sign in with Facebook</button>--%>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

</html>
