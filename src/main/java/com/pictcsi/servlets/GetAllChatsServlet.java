package com.pictcsi.servlets;

import com.google.gson.Gson;
import com.pictcsi.database.DatabaseConnection;
import com.pictcsi.models.Chats;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/getAllChats")
public class GetAllChatsServlet extends HttpServlet {

    private class ResponseObject {
        boolean isSuccess;
        List<Chats> chats = new ArrayList<>();

        public boolean isSuccess() {
            return isSuccess;
        }

        public void setSuccess(boolean success) {
            isSuccess = success;
        }

        public List<Chats> getChats() {
            return chats;
        }

        public void setChats(List<Chats> chats) {
            this.chats = chats;
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PrintWriter writer = resp.getWriter();

        resp.setContentType("application/json");
        resp.setHeader("Cache-control", "no-cache, no-store");
        resp.setHeader("Pragma", "no-cache");
        resp.setHeader("Expires", "-1");

        ResponseObject object = new ResponseObject();

        int getNos = Integer.parseInt(req.getParameter("lastMessage"));


        try (Connection connection = DatabaseConnection.getConnection()){

            //language=MySQL
            String sql;

            if(getNos == -1)
                sql = "SELECT * FROM VIEW_CHATS order by id limit 100";
            else
                sql = "SELECT * FROM VIEW_CHATS where id > "+getNos+" order by id limit 100";

            ResultSet set = DatabaseConnection.getResultSet(connection, sql);

            while (set.next()){
                Chats chat = new Chats();
                chat.setId(set.getInt("id"));
                chat.setUser_id(set.getInt("user_id"));
                chat.setChat_message(set.getString("chat_message"));
                chat.setUser_name(set.getString("first_name"));
                chat.setEmail_id(set.getString("email_id"));
                chat.setCreated_date(set.getDate("created_date"));

                object.getChats().add(chat);
            }
            object.setSuccess(true);
        }catch (SQLException e){
            e.printStackTrace();
        }

        writer.write(new Gson().toJson(object));
        writer.flush();

        writer.close();


    }
}
