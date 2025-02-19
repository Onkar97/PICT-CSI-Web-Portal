package com.pictcsi.servlets.admin;

import com.pictcsi.database.DatabaseConnection;
import com.pictcsi.models.FeedBack;
import com.pictcsi.util.EmailHandler;

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

@WebServlet("/admin/replyToContact")
public class ReplyToContactServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String feedback_id = req.getParameter("feedback_id");
        String feedback_answer = req.getParameter("feedback_answer");
        try(Connection connection = DatabaseConnection.getConnection()) {
            if (feedback_id != null && !feedback_id.isEmpty() && feedback_answer != null && !feedback_answer.isEmpty()) {
                //language=MySQL
                String feedSql = "SELECT * FROM FEEDBACK WHERE feed_id = ? LIMIT 1";
                PreparedStatement statement = DatabaseConnection.getPreparedStatement( connection, feedSql);
                statement.setString(1,feedback_id);
                ResultSet set = statement.executeQuery();
                if(set.next()){
                    FeedBack feedBack = FeedBack.getFromSet(set);

                    //language=MySQL
                    String sql = "UPDATE FEEDBACK set feedback_answer = ? where feed_id = ?";

                    statement = DatabaseConnection.getPreparedStatement(connection, sql);

                    statement.setString(1, feedback_answer);
                    statement.setString(2, feedback_id);
                    if(statement.executeUpdate()>0){
                        //language=html
                        String mailContent = "<h2>PICT CSI: Admin replied to your query </h2>" +
                                "<p><strong>Question: </strong>"+feedBack.getFeed_query()+"</p>" +
                                "<p><strong>Answer: </strong>"+feedback_answer+"</p>" +
                                "<p>Thank you for contacting us!</p>"+
                                "<p>Please do not reply to this email</p>";
                        EmailHandler.sendMailOnThread(mailContent, "Admin answered your query", feedBack.getFeed_email());
                    }
                }
            }
        }catch (SQLException | NullPointerException e){
            e.printStackTrace();
            resp.sendRedirect("feedbacks.jsp");
        }
        resp.sendRedirect("feedbacks.jsp");
    }
}
