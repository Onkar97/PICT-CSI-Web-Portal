package com.pictcsi.servlets;

import com.pictcsi.models.FeedBack;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.regex.Pattern;

@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String emailRegex = "(.*@.*\\..*)|(.*@\\..*\\..*)";
        boolean accept = true;
        Pattern emailPattern = Pattern.compile(emailRegex);


        String email = request.getParameter("email");

        String user_name = request.getParameter("name");
        String Subject = request.getParameter("subject");
        String Query = request.getParameter("query");

        try {

            FeedBack fd= new FeedBack();
            fd.setFeed_user_name(user_name);
            fd.setFeed_email(email);
            fd.setFeed_description(Subject);
            fd.setFeed_query(Query);
            fd.pushSelfToDB();
            request.getSession().setAttribute("error", "Thank You!. For your Valuable time. We receive your feedback");
            response.sendRedirect("/index.jsp");


        } catch (SQLException e) {
            e.printStackTrace();
            invalidFeedback(request,response);
        }

    }

    private void invalidFeedback(HttpServletRequest req, HttpServletResponse resp) throws IOException{
        req.getSession().setAttribute("error","Error while giving feedback!");
        resp.sendRedirect("/index.jsp");
    }


}




