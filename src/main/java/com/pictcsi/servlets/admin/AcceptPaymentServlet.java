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

@WebServlet("/admin/acceptPayment")
public class AcceptPaymentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String reg_id = req.getParameter("reg_id");
        String set_status = req.getParameter("set_status");
        String event_id = req.getParameter("event_id");
        boolean setStatusPaid = set_status!=null && !set_status.isEmpty() && set_status.equals("true");
        try(Connection connection = DatabaseConnection.getConnection()) {

            if (reg_id != null && !reg_id.isEmpty()) {
                //language=MySQL
                String sql = "UPDATE EVENT_REG SET has_paid = ? where id = ?";
                PreparedStatement statement = DatabaseConnection.getPreparedStatement(connection, sql);
                if (setStatusPaid) {
                    statement.setInt(1, 1);
                } else {
                    statement.setInt(1, 0);
                }
                statement.setString(2, reg_id);
                statement.executeUpdate();
            }
        }catch (SQLException | NullPointerException e){
            e.printStackTrace();
        }
        resp.sendRedirect("event_details.jsp?event_id="+event_id);
    }

}
