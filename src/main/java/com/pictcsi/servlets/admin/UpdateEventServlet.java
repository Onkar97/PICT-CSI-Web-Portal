package com.pictcsi.servlets.admin;

import com.pictcsi.database.DatabaseConnection;
import com.pictcsi.models.Event;

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

@WebServlet("/admin/updateEventServlet")
public class UpdateEventServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int eventId = Integer.parseInt(req.getParameter("event_id"));

        System.out.println("Event ID: "+ eventId);

//        req.setAttribute("event_id", eventId);
        req.setAttribute("is_edit", true);

        String sql = "SELECT * FROM EVENT WHERE event_id = ? limit 1";


        try(Connection connection = DatabaseConnection.getConnection()) {
            PreparedStatement statement = DatabaseConnection.getPreparedStatement(connection, sql);

            if (statement != null) {
                statement.setInt(1, eventId);
                ResultSet set = statement.executeQuery();
                if(set.next()) {
                    Event event = Event.getFromSet(set);
                    req.setAttribute("event", event);
                }else {
                    System.out.println("Invalid Event");
                }
            } else {
                throw new RuntimeException("Statement is Null");
            }
            req.getRequestDispatcher("admin_event_reg.jsp").forward(req, resp);

        }catch (SQLException e){
            e.printStackTrace();
        }

    }
}
