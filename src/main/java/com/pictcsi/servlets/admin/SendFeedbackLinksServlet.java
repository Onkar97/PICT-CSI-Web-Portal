package com.pictcsi.servlets.admin;

import com.pictcsi.database.DatabaseConnection;
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

@WebServlet("/admin/sendFeedbackLinkServlet")
public class SendFeedbackLinksServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String event_id = req.getParameter("event_id");
        try(Connection connection = DatabaseConnection.getConnection()) {
            //language=MySQL
            String sql = "SELECT USER2.email_id FROM EVENT_REG JOIN WEB_USER USER2 on EVENT_REG.user_id = USER2.user_id WHERE event_id = ?";
            PreparedStatement statement = DatabaseConnection.getPreparedStatement(connection, sql);
            statement.setString(1, event_id);

            String feedbackUrl = Misc.getBaseUrl(req) + "/contact.jsp";

            //language=HTML
            String htmlContent = "<html><body>" +
                    "<p>Your feedback is valuable to us!. Please take a moment to leave a feedback!</p>" +
                        "<span><a href='"+feedbackUrl+"'>Click here</a></span>" +
                    "</body></html>";

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()){
                String email_id = resultSet.getString(1);
                EmailHandler.sendMailOnThread(htmlContent, "Feedback for event",email_id);
            }

            req.getSession().setAttribute("error", "Feedback links sent successfully!");
            resp.sendRedirect("/index.jsp");
        }catch (Exception e){
            e.printStackTrace();
            req.getSession().setAttribute("error", "Error sending feedback links!");
            resp.sendRedirect("/index.jsp");
        }


    }
}
