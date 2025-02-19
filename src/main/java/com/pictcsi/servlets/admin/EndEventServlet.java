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

@WebServlet("/admin/endEventServlet")
public class EndEventServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doPost(req, resp);
        String event_id = req.getParameter("event_id");

        //language=MySQL
        String sql = "UPDATE EVENT SET has_ended = 1 where event_id = ?";


        try(Connection connection = DatabaseConnection.getConnection()) {
            PreparedStatement statement = DatabaseConnection.getPreparedStatement(connection, sql);
            statement.setString(1, event_id);
            if (statement.executeUpdate() > 0) {
                req.getSession().setAttribute("error","Event Updated");
                resp.sendRedirect("/admin/");
            }else {
                req.getSession().setAttribute("error","Error occurred");
                resp.sendRedirect("/admin/");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            req.getSession().setAttribute("error","Error occurred");
            resp.sendRedirect("/admin/");
        }

    }
}
