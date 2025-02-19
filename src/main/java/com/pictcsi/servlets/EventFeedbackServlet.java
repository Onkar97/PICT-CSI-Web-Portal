package com.pictcsi.servlets;

import com.pictcsi.database.DatabaseConnection;
import com.pictcsi.models.Event;
import com.pictcsi.models.EventReg;
import com.pictcsi.models.WebUser;
import com.pictcsi.util.EmailHandler;
import com.pictcsi.util.Misc;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/eventFeedback")
public class EventFeedbackServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doPost(req, resp);
        String event_id = req.getParameter("event_id");

        try(Connection connection = DatabaseConnection.getConnection()) {
            if (event_id != null && !event_id.isEmpty()) {
                Event event = Event.getById(Integer.parseInt(event_id));
                if(event != null){
                    //language=MySQL
                    String sql = "SELECT * FROM EVENT_REG WHERE event_id = ?";
                    PreparedStatement statement = DatabaseConnection.getPreparedStatement(connection, sql);

                    statement.setInt(1,event.getEvent_id());
                    ResultSet set = statement.executeQuery();

                    while (set.next()){
                        EventReg reg = EventReg.getFromSet(set);
                        WebUser user = WebUser.getUserById(reg.getUser_id());
                        if(user != null && user.getEmail_id() != null && !user.getEmail_id().isEmpty()) {

                            //language=html
                            String mailContent = "<h2>Thank you for your presence at "+event.getEvent_name()+"</h2>" +
                                    "<p>We hope you liked it<br>Your feedback is valuable to us. Please give your feedback on the following link:</p>" +
                                    "<a href='"+ Misc.getBaseUrl(req) +"/contact.jsp'>Here!</a> " +
                                    "<p>Please do not reply to this email</p>";
                            EmailHandler.sendMailOnThread(mailContent, "Thank You! You are the best", user.getEmail_id());
                        }

                    }
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }


    }
}
