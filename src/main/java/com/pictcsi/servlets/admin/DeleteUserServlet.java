package com.pictcsi.servlets.admin;

import com.pictcsi.database.DatabaseConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/admin/deleteUserServlet")
public class DeleteUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String user_id = req.getParameter("user_id");
        try(Connection connection = DatabaseConnection.getConnection()) {
        //language=MySQL
        String sql = "DELETE FROM WEB_USER where user_id = ?";

        PreparedStatement statement = DatabaseConnection.getPreparedStatement(connection, sql);
            if (statement != null) {
                statement.setString(1, user_id);
                statement.execute();
                resp.sendRedirect("/admin");
            }else {
                throw new RuntimeException("Statement is Null");
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
}
