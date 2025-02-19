package com.pictcsi.servlets.volunteer;

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

@WebServlet("/volunteer/addEventResult")
public class AddEventResult extends HttpServlet {

    //language=MySQL
    String sql = "INSERT INTO EVENT_RESULTS (team_name, points, event_id, volunteer_id) values (?,?,?,?)";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String team_name = req.getParameter("team_name");
        String points = req.getParameter("points");
        String event_id = req.getParameter("event_id");

        int volunteer_id = (int) req.getSession().getAttribute("user_id");

        try (Connection connection = DatabaseConnection.getConnection()){
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, team_name);
            statement.setString(2, points);
            statement.setString(3, event_id);
            statement.setInt(   4, volunteer_id);

            statement.executeUpdate();

            resp.sendRedirect("addEntry.jsp");
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

}
