<%--
  Created by IntelliJ IDEA.
  User: negativezero
  Date: 11/10/18
  Time: 1:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<script type="text/javascript">

    function validateReg()
    {

        if( document.regForm.first_name.value == "" )
        {
            alert( "Please provide your First name!" );
            document.regForm.first_name.focus() ;
            return false;
        }

        if( document.regForm.last_name.value == "" )
        {
            alert( "Please provide your Last name!" );
            document.regForm.last_name.focus() ;
            return false;
        }

        if( document.regForm.email_id.value == "" )
        {
            alert( "Please provide your Email!" );
            document.regForm.email_id.focus() ;
            return false;
        }else {

            var NumLetter="(.*@.*\\..*)|(.*@\\..*\\..*)";
            if(! document.regForm.email_id.value.match(NumLetter)){
                alert( "Please enter valid E-Mail ID !!" );
                document.regForm.email_id.focus() ;
                return false;
            }

        }

        if( document.regForm.mobile.value == "" ||
            isNaN( document.regForm.mobile.value )
           )
        {
            //out.println("mobile length "+document.regForm.mobile.value.length);
            // System.out.print(document.regForm.mobile.value.length);
            alert( "Please provide only digit in mobile number" );
            document.regForm.mobile.focus() ;
            return false;
        }
        // else{
        //     if(document.regForm.mobile.length!=10)
        //     {
        //
        //         alert(" Your Mobile Number must be 1 to 10 Integers");
        //         document.regForm.mobile.select();
        //         return false;
        //     }
        //
        // }

        if( document.regForm.password.value == "" )
        {
            alert( "Please enter your password!" );
            document.regForm.password.focus() ;
            return false;
        }
        if( document.regForm.password_repeat.value == "" )
        {
            alert( "Please re-enter your password!" );
            document.regForm.password_repeat.focus() ;
            return false;
        }
        if( document.regForm.branch.value == "" )
        {
            alert( "Please select your branch" );
            document.regForm.branch.focus() ;
            return false;
        }


        if( document.regForm.year.value == "" )
        {
            alert( "Please select your acadamic year" );
            document.regForm.year.focus() ;
            return false;
        }


        if( document.regForm.college_name.value == "" )
        {
            alert( "Please enter your college name !!" );
            document.regForm.college_name.focus() ;
            return false;
        }else{
            var allLetter=/^[a-zA-Z]+$/;
            if(! document.regForm.college_name.value.match(allLetter)){
                alert( "Please enter only letters in college name !!" );
                document.regForm.college_name.focus() ;
                return false;
            }

        }

        if( document.regForm.reg_id.value == "" )
        {
            alert( "Please enter your college registration ID !!" );
            document.regForm.reg_id.focus() ;
            return false;
        }else {
            var NumLetter=/^[0-9a-zA-Z]+$/;
            if(! document.regForm.college_name.value.match(NumLetter)){
                alert( "Please enter letters and numbers in Reg. ID !!" );
                document.regForm.college_name.focus() ;
                return false;
            }

        }

        return( true );
    }

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

<!-- The Modal -->
<div class="modal" id="loginModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <%--<div class="modal-header">--%>
            <%--<h4 class="modal-title">Modal Heading</h4>--%>
            <%--<button type="button" class="close" data-dismiss="modal">&times;</button>--%>
            <%--</div>--%>

            <!-- Modal body -->
            <div class="modal-body">
                <!-- Hero Search Form -->
                <div class="hero-search-form">
                    <!-- Tabs -->
                    <div class="nav nav-tabs" id="heroTab" role="tablist">
                        <a class="nav-item nav-link active" id="nav-places-tab" data-toggle="tab" href="#nav-places" role="tab" aria-controls="nav-places" aria-selected="true">Login</a>
                        <a class="nav-item nav-link" id="nav-events-tab" data-toggle="tab" href="#nav-events" role="tab" aria-controls="nav-events" aria-selected="false">Register</a>
                    </div>
                    <!-- Tabs Content -->
                    <div class="tab-content" id="nav-tabContent">
                        <div class="tab-pane fade show active" id="nav-places" role="tabpanel" aria-labelledby="nav-places-tab">
                            <h6>Login</h6>
                            <form action="loginServlet" method="post" name="loginForm" onsubmit="return(validateLogin());">
                                <div class="container-fluid">
                                    <div class="row">
                                        <input type="email" name="user_name" id="inputEmailID" class="custom-form-input" required placeholder="Email ID">
                                    </div>
                                    <div class="row">
                                        <input type="password" name="password" id="inputPassword" class="custom-form-input" required placeholder="Password">
                                    </div>

                                    <div class="row">
                                        <button type="submit" class="btn dorne-btn"><i class="fa fa-sign-in pr-2" aria-hidden="true"></i> Login</button>
                                        <a href="userActions/forgot-password.jsp">Forgot Password?</a>
                                    </div>

                                </div>
                            </form>
                        </div>
                        <div class="tab-pane fade" id="nav-events" role="tabpanel" aria-labelledby="nav-events-tab">
                            <h6>Register</h6>

                                <form action="registerServlet" name="regForm" method="post" onsubmit="return(validateReg());">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-sm-6 col-lg-6">
                                                <input type="text" name="first_name" id="registerFirstName" class="custom-form-input" placeholder="First Name">
                                            </div>
                                            <div class="col-sm-6 col-lg-6">
                                                <input type="text" name="last_name" id="registerLastName" class="custom-form-input" placeholder="Last Name">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6 col-lg-6">
                                                <input type="email" name="email_id" class="custom-form-input" placeholder="Email ID">
                                            </div>
                                            <div class="col-sm-6 col-lg-6">
                                                <input type="text" name="mobile" class="custom-form-input" placeholder="Mobile No">
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6 col-lg-6">
                                                <input type="password" name="password" class="custom-form-input" placeholder="Password">
                                            </div>
                                            <div class="col-sm-6 col-lg-6">
                                                <input type="password" name="password_repeat" class="custom-form-input" placeholder="Password">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6 col-lg-6">
                                                <select class="custom-select" name="branch">
                                                    <option>Select One</option>
                                                    <option>IT</option>
                                                    <option>EnTC</option>
                                                    <option>Comp</option>
                                                    <option>Other</option>
                                                </select>
                                            </div>
                                            <div class="col-sm-6 col-lg-6">
                                                <select class="custom-select" name="year">
                                                    <option>Select One</option>
                                                    <option value="1">FE</option>
                                                    <option value="2">SE</option>
                                                    <option value="3">TE</option>
                                                    <option value="4">BE</option>
                                                    <%--<option value="0">NA</option>--%>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6 col-lg-6">
                                                <input type="text" name="college_name" class="custom-form-input" placeholder="College Name">
                                            </div>
                                            <div class="col-sm-6 col-lg-6">
                                                <input type="text" name="reg_id" class="custom-form-input" placeholder="CSI ID">
                                            </div>

                                        </div>

                                        <div class="row">
                                            <button type="submit" class="btn dorne-btn"><i class="fa fa-sign-in pr-2" aria-hidden="true"></i> Register</button>

                                        </div>

                                    </div>
                                </form>

                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn dorne-btn" data-dismiss="modal">Close</button>
            </div>

        </div>
    </div>
</div>
