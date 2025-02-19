package com.pictcsi.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/logoutServlet")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String user_name = (String) session.getAttribute("user_name");
        if(user_name != null){
            session.setAttribute("user_name", null);
            session.setAttribute("user_id", null);
            session.setAttribute("user_type", null);
        }
        resp.sendRedirect("/index.jsp");
    }
}
