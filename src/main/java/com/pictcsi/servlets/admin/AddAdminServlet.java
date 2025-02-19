package com.pictcsi.servlets.admin;

import com.pictcsi.database.DatabaseConnection;
import com.pictcsi.models.WebUser;
import com.pictcsi.util.EmailHandler;
import com.pictcsi.util.Misc;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/admin/addAdmin")
public class AddAdminServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try(Connection connection = DatabaseConnection.getConnection()) {

            String name = req.getParameter("name");
            String email_id = req.getParameter("email_id");
            String password = req.getParameter("new_password");
            String user_type = req.getParameter("user_type");

            //language=MySQL
            String sql = "INSERT INTO WEB_USER (first_name, email_id, user_password, user_type) VALUES (?,?,MD5(?),?)";

            PreparedStatement statement = DatabaseConnection.getPreparedStatement(connection, sql);



            PrintWriter writer = resp.getWriter();

            if (statement != null) {

                try {

                    if(password == null || password.trim().isEmpty()){
                        password = Misc.getRandomPassword();
                    }

                    statement.setString(1,name);
                    statement.setString(2,email_id);
                    statement.setString(3,password);


                    if(user_type.equals(WebUser.USER_ADMIN))
                        statement.setString(4, WebUser.USER_ADMIN);
                    else if(user_type.equals(WebUser.USER_VOLUNTEER))
                        statement.setString(4, WebUser.USER_VOLUNTEER);
                    else {
                        writer.write("Failed");
                    }

                    if(statement.executeUpdate() > 0) {
                        writer.write("Success");

                        EmailHandler.sendMailOnThread("<html><body><h3>You are now registered as "+ user_type  +" on PICT CSI</h3><br><p>UserName: "+email_id + "</p><br><p>Password: "+password+"</p><br><p>Login here:<a href='"+Misc.getBaseUrl(req) + "/login.jsp"+"'>Login here</a></p><br>The details should not be disclosed to anyone!</body></html> ", "Welcome!", email_id);
                    }else{
                        writer.write("Failed");
                    }

                } catch (SQLException e) {
                    e.printStackTrace();
                    writer.write("Failed");

                }

            } else {
                throw new RuntimeException("Statement is null");
            }

            writer.flush();

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error creating statement");
        }





    }
}
