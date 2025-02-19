package com.pictcsi.servlets;

import com.pictcsi.database.DatabaseConnection;
import com.pictcsi.models.WebUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.DatatypeConverter;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {


//    String checkUserQuery = "";

    public LoginServlet() {
        super();

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        String user_name = req.getParameter("user_name");
        String password = req.getParameter("password");

        //TODO: ADD logic for encrypting passwords
        try(Connection connection = DatabaseConnection.getConnection()) {

            String checkUserQuery = "SELECT * from WEB_USER where email_id = ? or mobile = ? limit 1";

            PreparedStatement statement = connection.prepareStatement(checkUserQuery);

            statement.setString(1, user_name);
            statement.setString(2, user_name);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {

                WebUser user = WebUser.getFromSet(resultSet);
                MessageDigest md = MessageDigest.getInstance("MD5");
                md.update(password.getBytes());
                byte[] digest = md.digest();
                String myHash = DatatypeConverter
                        .printHexBinary(digest).toLowerCase();

                if (user.getUser_password().equals(myHash)) {
                    String user_type = resultSet.getString("user_type");
                    if(user_type == null){
                        invalidLogin(req, resp);
                    }else if ( user_type.equals(WebUser.USER_NORMAL)) {
                        req.getSession().setAttribute("user_name", user.getEmail_id());
                        req.getSession().setAttribute("user_id", user.getUser_id());
                        req.getSession().setAttribute("user_type", "normal");
                        resp.sendRedirect("/index.jsp");

                    } else if (user_type.equals(WebUser.USER_ADMIN)) {
                        req.getSession().setAttribute("user_name", user.getEmail_id());
                        req.getSession().setAttribute("user_id", user.getUser_id());
                        req.getSession().setAttribute("user_type", "admin");
                        resp.sendRedirect("/admin");
                    }else if (user_type.equals(WebUser.USER_VOLUNTEER)){
                        req.getSession().setAttribute("user_name", user.getEmail_id());
                        req.getSession().setAttribute("user_id", user.getUser_id());
                        req.getSession().setAttribute("user_type", "volunteer");
                        resp.sendRedirect("/volunteer");
                    }
                    else if(user_type.equals("CSI")){
                        resp.sendRedirect("/404.html");
                    }else{
                        invalidLogin(req,resp);
                    }
                } else {
                    //Invalid User
                    invalidLogin(req, resp);
                }
            } else {
                invalidLogin(req, resp);
            }
        } catch (SQLException | IOException | NoSuchAlgorithmException e) {
            //Return Error
            e.printStackTrace();

            req.getSession().setAttribute("error", "Error Logging in!");
            resp.sendRedirect("login.jsp");
        }


    }

    private void invalidLogin(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        req.getSession().setAttribute("error", "Invalid Login!");
        resp.sendRedirect("/index.jsp");
    }
}
