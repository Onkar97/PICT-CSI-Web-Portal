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

@WebServlet("/admin/deleteEventServlet")
public class DeleteEventServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String event_id = req.getParameter("event_id");


        try(Connection connection = DatabaseConnection.getConnection()) {
            String sql = "DELETE FROM EVENT WHERE event_id = ?";

            PreparedStatement statement = DatabaseConnection.getPreparedStatement(connection, sql);
            if (statement != null) {
                statement.setString(1, event_id);
                statement.execute();
            } else {
                throw new RuntimeException("Statement is null");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        resp.sendRedirect("/admin/");

    }
}
