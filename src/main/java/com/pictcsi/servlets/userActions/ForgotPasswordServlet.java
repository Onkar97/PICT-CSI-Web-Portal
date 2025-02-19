package com.pictcsi.servlets.userActions;


import com.pictcsi.database.DatabaseConnection;
import com.pictcsi.models.WebUser;
import com.pictcsi.util.EmailHandler;
import com.pictcsi.util.Misc;
import com.sun.istack.internal.NotNull;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.UUID;

@WebServlet("/user/forgotPassword")
public class ForgotPasswordServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doGet(req, resp);
        String email_id = req.getParameter("email_id");
        try(Connection connection = DatabaseConnection.getConnection()) {
            WebUser user = WebUser.getUserByEmail(email_id);

            if(user != null){
                String unique_key = UUID.randomUUID().toString();
                String sql = "UPDATE WEB_USER set forgot_password_uid = ? where email_id = ?";

                PreparedStatement statement = DatabaseConnection.getPreparedStatement(connection, sql);

                statement.setString(1, unique_key);
                statement.setString(2, email_id);
                statement.execute();


                //Send Mail
                sendMail(user.getEmail_id(), unique_key, req);
                req.getSession().setAttribute("error", "Please check your mail for further instructions");
                resp.sendRedirect("/index.jsp");
            }else{
                //Invalid User
                req.getSession().setAttribute("error", "Invalid or expired link");
                resp.sendRedirect("/index.jsp");
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    void sendMail(@NotNull String email_id, String uid, HttpServletRequest request){
        String content = String.format("<a href='%s/userActions/forgotPassword.jsp?uid=%s'><h3>Click to reset your password</h3></a>", Misc.getBaseUrl(request), uid);
        System.out.println(content);
        EmailHandler.sendMailOnThread(content, "Forgot Password", email_id);
    }
}
