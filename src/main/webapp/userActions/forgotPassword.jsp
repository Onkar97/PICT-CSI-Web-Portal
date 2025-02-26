<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Forgot password</title>

    <%--<!-- Bootstrap core CSS-->--%>
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <%--<!-- Custom fonts for this template-->--%>
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <%--<!-- Custom styles for this template-->--%>
    <link href="../css/sb-admin.css" rel="stylesheet">
    <%--<jsp:include page="/admin/header.jsp"/>--%>

</head>

<body class="bg-dark">

<div class="container">
    <div class="card card-login mx-auto mt-5">
        <div class="card-header">Reset Password</div>
        <div class="card-body">
            <form action="/user/changePassword">
                <input name="uid" type="hidden" value="<%=request.getParameter("uid")%>">


                <div class="form-group">
                    <div class="form-label-group">
                        <input type="password" id="inputPassword" name="new_password" class="form-control" placeholder="New Password" required="required" autofocus="autofocus">
                        <label for="inputPassword">New Password</label>
                    </div>
                </div>

                <button type="submit" class="btn btn-primary btn-block" href="index.html">Reset Password</button>
            </form>
        </div>
    </div>
</div>

<%--<!-- Bootstrap core JavaScript-->--%>
<%--<script src="../vendor/jquery/jquery.min.js"></script>--%>
<%--<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>--%>

<%--<!-- Core plugin JavaScript-->--%>
<%--<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>--%>

</body>

</html>
