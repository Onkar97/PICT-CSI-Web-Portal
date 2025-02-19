<%@ page import="com.pictcsi.models.WebUser" %><%--
  Created by IntelliJ IDEA.
  User: negativezero
  Date: 13/10/18
  Time: 2:21 AM
  To change this template use File | Settings | File Templates.
--%>
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="/logoutServlet">Logout</a>
            </div>
        </div>
    </div>
</div>
<!-- Change Password  Modal-->
<div class="modal fade" id="changePasswordModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="changePasswordModalLabel">Enter new Password</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <form action="#" id="changePasswordForm" onsubmit="return handleChangePassword()">
                <div class="modal-body">

                    <input id="changePasswordUserId" name="user_id" type="hidden" value="">
                    <input type="text" placeholder="New Password" name="new_password">

                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary" href="/logoutServlet">Change</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Change Password  Modal-->
<div class="modal fade" id="addAdminModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addAdminModalLabel">Enter new Password</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <form action="#" id="addAdminModalForm" onsubmit="return handleAddAdmin()">
                <div class="modal-body">
                    <div class="form-group">

                            <select class="form-control" name="user_type" id="user_type">
                                <option value="">Select One</option>
                                <option><%=WebUser.USER_ADMIN%></option>
                                <option><%=WebUser.USER_VOLUNTEER%></option>
                                <%--<option>Comp</option>--%>
                                <%--<option>Other</option>--%>
                            </select>
                            <label for="user_type">Name</label>

                    </div>
                    <div class="form-group">
                        <div class="form-label-group">
                            <input type="text" id="inputName" name="name" class="form-control" placeholder="Name" required="required" autofocus="autofocus">
                            <label for="inputName">Name</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-label-group">
                            <input type="email" id="inputEmail" name="email_id" class="form-control" placeholder="Email ID" required="required" autofocus="autofocus">
                            <label for="inputEmail">Email ID</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-label-group">
                            <input type="password" id="inputPassword" name="new_password" class="form-control" placeholder="New Password" autofocus="autofocus">
                            <label for="inputPassword">New Password (Leave empty for random password)</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-label-group">
                            <label for="sendMail">Send Mail?</label>
                            <input type="checkbox" id="sendMail" name="send_mail" class="form-control" placeholder="Send Mail?" required="required" autofocus="autofocus">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary" href="/logoutServlet">Add</button>
                </div>
            </form>
        </div>
    </div>
</div>
