package com.pictcsi.servlets.userActions;

import com.pictcsi.database.DatabaseConnection;
import com.pictcsi.models.WebUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/user/changePassword")
public class ChangeForgotPassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uid = req.getParameter("uid");
        String new_password = req.getParameter("new_password");
        try(Connection connection = DatabaseConnection.getConnection()) {
            if (uid != null && !uid.isEmpty()) {
                WebUser user = WebUser.getUserByForgotPasswordUid(uid);

                if(user != null){

                    //language=MySQL
                    String selectSql = "SELECT * FROM AUDIT_PASSWORD WHERE id = ? && (new_passwd = MD5(?) || old_passwd = MD5(?))";
                    PreparedStatement preparedStatement = DatabaseConnection.getPreparedStatement(connection, selectSql);
                    preparedStatement.setInt(1, user.getUser_id());
                    preparedStatement.setString(2, new_password);
                    preparedStatement.setString(3, new_password);

                    ResultSet resultSet = preparedStatement.executeQuery();


                    if(!resultSet.next() ) {

                        //language=MySQL
                        String sql = "UPDATE WEB_USER SET user_password = MD5(?), forgot_password_uid = null where user_id = ?";
                        PreparedStatement statement = DatabaseConnection.getPreparedStatement(connection, sql);
                        statement.setString(1, new_password);
                        statement.setInt(2, user.getUser_id());

                        statement.execute();
                        req.getSession().setAttribute("error", "New password set!");
                        resp.sendRedirect("/index.jsp");
                    }else{
                        req.getSession().setAttribute("error", "Your new password cannot be your old password!");
                        resp.sendRedirect("/index.jsp");
                    }


                }else {
                    //User does not exist
                    resp.sendRedirect("/index.jsp");
                }

            } else {
                resp.sendRedirect("/index.jsp");
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    private boolean isDuplicate(){
        return false;
    }
}
