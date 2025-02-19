package com.pictcsi.servlets.admin;

import com.pictcsi.database.DatabaseConnection;

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

@WebServlet("/admin/changePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String user_id = req.getParameter("user_id");
        String new_password = req.getParameter("new_password");
        PrintWriter writer = resp.getWriter();
        //language=MySQL
        String sql = "UPDATE WEB_USER SET user_password = MD5(?) where user_id = ?";

        try(Connection connection = DatabaseConnection.getConnection()) {

            PreparedStatement statement = DatabaseConnection.getPreparedStatement(connection, sql);

            if (statement != null) {

                try {
                    statement.setString(1, new_password);
                    statement.setString(2, user_id);

                    statement.execute();
                    writer.write("Success");

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
