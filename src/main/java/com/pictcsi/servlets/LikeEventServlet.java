package com.pictcsi.servlets;

import com.google.gson.Gson;
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

@WebServlet("/likeEventServlet")
public class LikeEventServlet extends HttpServlet {

    private class ResponseObject {
        boolean isSuccess;
        String message;

        public boolean isSuccess() {
            return isSuccess;
        }

        public void setSuccess(boolean success) {
            isSuccess = success;
        }

        public String getMessage() {
            return message;
        }

        public void setMessage(String message) {
            this.message = message;
        }
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PrintWriter writer = resp.getWriter();

        resp.setContentType("application/json");
        resp.setHeader("Cache-control", "no-cache, no-store");
        resp.setHeader("Pragma", "no-cache");
        resp.setHeader("Expires", "-1");

        String event_id = req.getParameter("event_id");

        //language=MySQL
        String sql = "UPDATE EVENT SET likes = likes + 1 where event_id = ?";

        try(Connection connection = DatabaseConnection.getConnection()) {
            PreparedStatement statement = DatabaseConnection.getPreparedStatement(connection, sql);
            statement.setString(1, event_id);
            ResponseObject obj = new ResponseObject();
            if(statement.executeUpdate() > 0){

                obj.setSuccess(true);
//                obj.setNewCount(1);
                obj.setMessage("Liked!");
            }else{
                obj.setSuccess(false);
                obj.setMessage("Invalid Event ID");
            }

            writer.write(new Gson().toJson(obj));
        }catch (SQLException e){
            e.printStackTrace();

        }
        writer.flush();
        writer.close();

    }
}
