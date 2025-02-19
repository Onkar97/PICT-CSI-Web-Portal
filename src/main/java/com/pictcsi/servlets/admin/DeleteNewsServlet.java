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

@WebServlet("/admin/deleteNewsServlet")
public class DeleteNewsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try(Connection connection = DatabaseConnection.getConnection()) {
            String id = req.getParameter("id");

            int num_id = Integer.parseInt(id);

            //language=MySQL
            String sql = "DELETE FROM NEWS_FEED where id= ?";
            PreparedStatement statement = DatabaseConnection.getPreparedStatement(connection, sql);

            statement.setInt(1, num_id);
            if(statement.execute()){
                req.getSession().setAttribute("error", "News deleted successfully!");

            }
        }catch (SQLException e){
            e.printStackTrace();
            req.getSession().setAttribute("error", "Error Creating Event");
            resp.sendRedirect("/admin/");
        }
        resp.sendRedirect("/admin");
    }
}
