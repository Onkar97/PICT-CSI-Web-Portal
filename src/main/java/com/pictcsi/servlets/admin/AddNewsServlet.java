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

@WebServlet("/admin/addNews")
public class AddNewsServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        String description = req.getParameter("description");

        String start_date = req.getParameter("start_date");

        String end_date = req.getParameter("end_date");

        Integer user_id = (Integer) req.getSession().getAttribute("user_id");


        //language=MySQL
        String sql = "INSERT INTO NEWS_FEED VALUES (NULL,?,?,?,?,?)";

        try(Connection connection = DatabaseConnection.getConnection()) {
            PreparedStatement statement = DatabaseConnection.getPreparedStatement(connection, sql);
            statement.setString(1, title);
            statement.setString(2, description);
            statement.setString(3, start_date);
            statement.setString(4, end_date);
            statement.setInt(5, user_id);
            statement.execute();
            resp.sendRedirect("/admin");
        }catch (SQLException e){
            e.printStackTrace();
        }


    }
}
