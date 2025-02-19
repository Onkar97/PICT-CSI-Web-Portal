package com.pictcsi.servlets;

import com.google.gson.Gson;
import com.pictcsi.database.DatabaseConnection;
import com.pictcsi.models.WebUser;
import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;

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

@WebServlet("/addChat")
public class AddChatServlet extends HttpServlet {

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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter writer = resp.getWriter();

        resp.setContentType("application/json");
        resp.setHeader("Cache-control", "no-cache, no-store");
        resp.setHeader("Pragma", "no-cache");
        resp.setHeader("Expires", "-1");
        ResponseObject obj = new ResponseObject();

        try(Connection connection = DatabaseConnection.getConnection()) {
            int user_id = (int) req.getSession().getAttribute("user_id");


            if (user_id > 0) {
                WebUser user = WebUser.getUserById(user_id);
                if(user != null) {

                    String offensiveWord;
                    String message = req.getParameter("chat_message");
                    //Sanitize Message
                    message = html2text(message);
                    if (!message.isEmpty()) {


                        if((offensiveWord = acceptMessage(message)) == null){

                            //language=MySQL
                            String sql = "INSERT INTO CHATS (chat_message, user_id) VALUES(?,?)";
                            PreparedStatement statement = DatabaseConnection.getPreparedStatement(connection, sql);



                            statement.setString(1, message);
                            statement.setInt(2, user.getUser_id());

                            if( statement.executeUpdate() > 0) {
                                obj.isSuccess = true;
                                obj.message = "Chat Added";

                            }else {
                                obj.isSuccess = false;
                                obj.message = "Error";
                            }
                        }else{
                            obj.isSuccess = false;
                            obj.message = "Offensive word " + offensiveWord + " detected. ";
                        }
                    }else {
                        obj.isSuccess = false;
                        obj.message = "Empty message or dangerous html tag detected";
                    }
                }else{
                    obj.isSuccess = false;
                    obj.message = "User not present";
                }
            }else{
                obj.isSuccess = false;
                obj.message = "User ID missing";
            }
        }catch (SQLException| NullPointerException e){
            e.printStackTrace();
            obj.isSuccess = false;
            obj.message = "Unknown Error";
        }

        writer.write(new Gson().toJson(obj));
        writer.flush();
        writer.close();
    }

    private String acceptMessage(String message) throws SQLException{

        //language=MySQL
        String sql = "SELECT * FROM OFFENSIVE_WORDS WHERE word = ?";
        try(Connection connection = DatabaseConnection.getConnection()) {
            PreparedStatement statement = connection.prepareStatement(sql);

            for(String s: message.split(" ")){
                statement.setString(1,s.toLowerCase());
                if(statement.executeQuery().next()){
                    return s;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error creating statement");
        }
        return null;
    }

    public static String html2text(String html) {
        Whitelist whitelist = Whitelist.relaxed();
        whitelist.removeTags("a");
        return Jsoup.clean(html, Whitelist.relaxed());
    }
}
