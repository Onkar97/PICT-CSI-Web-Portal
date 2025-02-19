package com.pictcsi.servlets.volunteer;


import com.google.gson.Gson;
import com.pictcsi.models.Event;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/volunteer/eventDetailsAjaxServlet")
public class EventDetailsAjaxServlet extends HttpServlet {

    private class ResponseObject{
        Event mEvent;
        boolean isValid;
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String event_id = req.getParameter("event_id");

        int num_event_id = 0;
        PrintWriter writer = resp.getWriter();

        resp.setContentType("application/json");
        resp.setHeader("Cache-control", "no-cache, no-store");
        resp.setHeader("Pragma", "no-cache");
        resp.setHeader("Expires", "-1");
        ResponseObject obj = new ResponseObject();

        try {
            if (event_id != null && !event_id.trim().isEmpty()) {
                num_event_id = Integer.parseInt(event_id);

                obj.mEvent = Event.getById(num_event_id);

                obj.isValid = true;

            }else{
                obj.isValid = false;

            }

        }catch (NumberFormatException | SQLException e){
            e.printStackTrace();
            obj.isValid = false;
        }


        writer.write(new Gson().toJson(obj));
        writer.flush();
        writer.close();

    }
}
